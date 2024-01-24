library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

library hypo_lib;
use hypo_lib.core_pkg.all;
use hypo_lib.rom_pkg.all;

entity core is
  port(
    reset_n : in std_logic;
    clk : in std_logic;
    --
    go : in std_logic;

    -- UART access
    uart_send_ready : in std_logic;
    uart_send_push  : out std_logic;
    uart_send_byte  : out std_logic_vector(7 downto 0);
    --
    uart_recv_avail : in  std_logic;
    uart_recv_pop   : out std_logic;
    uart_recv_byte  : in  std_logic_vector(7 downto 0);
    info            : out std_logic_vector(7 downto 0)
  );
end entity;

architecture rtl of core is

  type fsm_state_type is (
    IDLE,DECODE_EXEC, LOAD_WAIT_CYCLE,
    SENDING_BYTE_L, SENDING_BYTE_WAIT, SENDING_BYTE_H,
    RECEIVING_BYTE_L, RECEIVING_BYTE_WAIT, RECEIVING_BYTE_H,
    HALTED );

  signal state : fsm_state_type;
  signal code : code_memory_type := ROM;
  signal data : data_memory_type;
  signal pc : unsigned(CODE_MEM_NBITS-1 downto 0);
  signal ir : std_logic_vector(15 downto 0);
  signal accu : signed(15 downto 0);
  signal mem_data_out_reg : std_logic_vector(15 downto 0);

begin

  FSM : process(reset_n,clk)
    variable opcode : std_logic_vector(3 downto 0);
    variable argument : std_logic_vector(11 downto 0);--12 bits
    variable operand : signed(15 downto 0);
    variable pc_comb : unsigned(CODE_MEM_NBITS-1 downto 0);
    variable opcode_name : op_name_t;
  begin
    if reset_n='0' then
      state <= IDLE;
      pc <= to_unsigned(0,CODE_MEM_NBITS);
      ir <= (others =>'0');
      accu <= to_signed(0,16);
      info <= "11111111";
      uart_send_byte <= (others =>'0');
      uart_send_push <= '0';
      uart_recv_pop <= '0';
      data <= (others=>(others=>'0'));
    elsif rising_edge(clk) then
      uart_send_push <= '0';
      uart_recv_pop  <= '0';
      case state is
        when IDLE =>
          info(BIT_IDLE) <= '1';
          pc <= to_unsigned(0,CODE_MEM_NBITS);
          if go='1' then
            state <= DECODE_EXEC;
            ir <= code(to_integer(pc));
            pc <= pc+1;
          end if;
        when DECODE_EXEC =>
          info(BIT_DECODE_EXEC) <= '1';
          opcode   := ir(15 downto 12);
          argument := ir(11 downto  0);
          operand  := signed(data(to_integer(unsigned(argument))));
          -- synthesis off
          opcode_name := get_name(opcode);
          report "HYPO : " & op_name_t'image(opcode_name) & " " & integer'image(to_integer(unsigned(operand)));
          -- synthesis on
          case opcode is
            when OP_HALT =>
              state <= HALTED;
            when OP_SET =>
              accu <= resize(signed(argument),16);
              pc <= pc+1;
              ir <= code(to_integer(pc));
            when OP_LOAD =>
              accu <= signed(data(to_integer(unsigned(argument))));
              pc <= pc+1;
              ir <= code(to_integer(pc));
            when OP_STORE =>
              data(to_integer(unsigned(argument))) <= std_logic_vector(accu);
              pc <= pc+1;
              ir <= code(to_integer(pc));
            when OP_ADD =>
              accu <= accu + operand;
              pc <= pc+1;
              ir <= code(to_integer(pc));
            when OP_SUB =>
              accu <= accu - operand;
              pc <= pc+1;
              ir <= code(to_integer(pc));
            when OP_MUL =>
              accu <= resize(accu * operand,16);
              pc <= pc+1;
              ir <= code(to_integer(pc));
            when OP_DIV =>
              accu <= resize(accu / operand,16);
              pc <= pc+1;
              ir <= code(to_integer(pc));
            when OP_JMP =>
              pc_comb := resize(unsigned(argument),CODE_MEM_NBITS);
              pc <= pc_comb + 1;
              ir <= code(to_integer(pc_comb));
            when OP_JMPZ =>
              if accu=x"00" then
                pc_comb := resize(unsigned(argument),CODE_MEM_NBITS);
                pc <= pc_comb + 1;
                ir <= code(to_integer(pc_comb));
              else
                pc <= pc+1;
                ir <= code(to_integer(pc));
              end if;
            when OP_RECEIVE =>
                state <=RECEIVING_BYTE_L;
            when OP_SEND =>
                state <=SENDING_BYTE_L;
            when others =>
              null;
          end case;
        when RECEIVING_BYTE_L =>
          if uart_recv_avail='1' then
            accu(7 downto 0) <= signed(uart_recv_byte);
            uart_recv_pop <= '1';
            state <= RECEIVING_BYTE_WAIT;
          end if;
        when RECEIVING_BYTE_WAIT =>
          state <= RECEIVING_BYTE_H;
        when RECEIVING_BYTE_H =>
          if uart_recv_avail='1' then
            accu(15 downto 8) <= signed(uart_recv_byte);
            uart_recv_pop <= '1';
            state <= DECODE_EXEC;
            pc <= pc+1;
            ir <= code(to_integer(pc));
          end if;
        when SENDING_BYTE_L =>
          if uart_send_ready='1' then
            uart_send_push <='1';
            uart_send_byte <= std_logic_vector(accu(7 downto 0));
            state <= SENDING_BYTE_WAIT;
          end if;
        when SENDING_BYTE_WAIT =>
          state <= SENDING_BYTE_H;
        when SENDING_BYTE_H =>
          if uart_send_ready='1' then
            uart_send_push <='1';
            uart_send_byte <= std_logic_vector(accu(15 downto 8));
            state <= DECODE_EXEC;
          end if;
        when HALTED =>
           info(BIT_HALTED) <= '1';
        when others =>
          null;
      end case;
    end if;
  end process;
end rtl;
