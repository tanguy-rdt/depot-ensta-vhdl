library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

library datapath_lib;
use datapath_lib.datapath_pkg.all;

entity datapath is
  port (
    reset_n      : in std_logic;
    clk          : in std_logic;
    enable_instr : in std_logic;
    instruction  : in std_logic_vector(15 downto 0);
    reg_1, reg_2, reg_3, reg_4 : out std_logic_vector(31 downto 0)
  );
end entity;

architecture arch of datapath is

  type reg_array_t is array(0 to 3) of signed(31 downto 0);
  constant REG_INIT : reg_array_t :=(others => to_signed(0,32));
  signal reg : reg_array_t;

  signal src_1, src_2, dest : integer range 0 to 3;
  signal opcode : std_logic_vector(3 downto 0);
  signal imm_val : signed(7 downto 0);
  signal result_alu : signed(31 downto 0);

begin

  -- decode instruction
  opcode <=                     instruction(15 downto 12);
  src_1  <= to_integer(unsigned(instruction(11 downto 10)));
  src_2  <= to_integer(unsigned(instruction( 3 downto  2)));
  imm_val<=              signed(instruction( 9 downto  2));
  dest   <= to_integer(unsigned(instruction( 1 downto  0)));

  alu : process(opcode,src_1,src_2,imm_val)
  begin
    result_alu <= to_signed(0,32);
    case opcode is
      when OP_ADD  =>
        result_alu <= reg(src_1) + reg(src_2);
      when OP_ADDI =>
        result_alu <= reg(src_1) + imm_val;
      when OP_SUB  =>
        result_alu <= reg(src_1) - reg(src_2);
      when OP_SUBI =>
        result_alu <= reg(src_1) - imm_val;
      when OP_MUL  =>
        result_alu <= resize(reg(src_1) * reg(src_2),32);
      when OP_MULI =>
        result_alu <= resize(reg(src_1) * imm_val,32);
      when others =>
        null;
    end case;
  end process;

  regs_bk: process(reset_n,clk)
  begin
    if reset_n='0' then
      reg <= reg_init;
    elsif rising_edge(clk) then
      if enable_instr='1' then
        reg(dest) <= result_alu;
      end if;
    end if;
  end process;

end architecture;
