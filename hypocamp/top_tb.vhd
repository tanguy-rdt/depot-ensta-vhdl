--------------------------------------------------------------------------------
-- this file was generated automatically by Vertigo Ruby utility
-- date : (d/m/y h:m) 06/01/2022 14:37
-- author : Jean-Christophe Le Lann - 2014
--------------------------------------------------------------------------------

library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

library uart_lib;
use uart_lib.uart_cst.NB_100HZ_CLOCK_CYCLES_FOR_TICK;

entity top_tb is
end entity;

architecture bhv of top_tb is
  constant HALF_PERIOD : time :=5 ns;

  signal clk100 : std_logic := '0';
  signal reset_n : std_logic := '0';

  signal running : boolean := true;

  procedure wait_cycles(n : natural) is
  begin
    for i in 0 to n-1 loop
      wait until rising_edge(clk100);
    end loop;
  end procedure;

  procedure toggle(signal s : inout std_logic) is
  begin
    wait until rising_edge(clk100);
    s <=not(s);
    wait until rising_edge(clk100);
    s <=not(s);
  end procedure;

  procedure emit(signal s : inout std_logic; val : std_logic) is
  begin
    s <= val;
    wait_cycles(16*NB_100HZ_CLOCK_CYCLES_FOR_TICK);--21*
  end procedure;

  procedure send_byte(signal s : inout std_logic; byte: std_logic_vector(7 downto 0)) is
  begin
    emit(s, '0');--start bit
    for i in 0 to 7 loop
      emit(s, byte(i));
    end loop;
    emit(s, '1');--stop bit
  end procedure;

  signal switches  : std_logic_vector( 1 downto 0):="00";
  signal rx,rx_1t  : std_logic;
  signal tx        : std_logic :='1';
  signal rx_byte   : std_logic_vector( 7 downto 0) :="UUUUUUUU";
  signal info     : std_logic_vector(7 downto 0);

  procedure retreive(variable v : inout std_logic) is
  begin
    wait_cycles(16*NB_100HZ_CLOCK_CYCLES_FOR_TICK);
    v := rx;
  end procedure;

  procedure receive_byte(signal byte: inout std_logic_vector(7 downto 0)) is
    variable start_b_v,stop_b_v : std_logic;
    variable byte_v : std_logic_vector(7 downto 0);
  begin
    -- mind that stop bit sampling requires only 8 ticks
    wait_cycles(8*NB_100HZ_CLOCK_CYCLES_FOR_TICK);
    start_b_v:= rx;
    report "start bit is : " & to_string(start_b_v);
    -- for actual data bits, iterate with 16 ticks each
    for i in 0 to 7 loop
      retreive(byte_v(i));--lsb first
      --report "bit " & to_string(i) & " is : " & to_string(byte_v(i));
    end loop;
    retreive(stop_b_v);
    byte <= byte_v;
    -- ???
    --wait_cycles(8*NB_100HZ_CLOCK_CYCLES_FOR_TICK);
    wait_cycles(1);
  end procedure;

begin
  --------------------------------------------------------------------------------
  -- clock and reset
  --------------------------------------------------------------------------------
  clk100 <= not(clk100) after HALF_PERIOD when running else clk100;
  --------------------------------------------------------------------------------
  -- Design Under Test
  --------------------------------------------------------------------------------
  dut : entity work.top
    port map (
      reset_n => reset_n,
      clk100  => clk100 ,
      switches => switches,
      rx      => tx     , -- mind the swap
      tx      => rx     ,
      info   => info
    );
  --------------------------------------------------------------------------------
  -- sequential stimuli
  --------------------------------------------------------------------------------
  control_ip : process
  begin
    wait_cycles(20);
    report "desactivating asynchronous reset_n";
    switches(0) <= '1';
    wait_cycles(20);
    report "about to control Hypocampe";
    report "(switch 1 UP) -> go!";
    switches(1) <= '1';
    report "now Hypocampe running !";
    report "end of control sequence";
    report "calculating : ax+b";
    report "with a=3 and b=7";
    report "sending a";
    send_byte(tx,x"03");
    wait_cycles(100);
    send_byte(tx,x"00");
    report "sending b";
    send_byte(tx,x"07");
    wait_cycles(100);
    send_byte(tx,x"00");
    for i in 1 to 9 loop
      report "sending x=" & integer'image(i);
      send_byte(tx,std_logic_vector(to_unsigned(i,8)));
      wait_cycles(10);
      send_byte(tx,x"00");
    end loop;
    wait_cycles(2000);
    running <= false;
    wait;
  end process;

  reset_n <= switches(0);

  delay_p : process(reset_n,clk100)
  begin
    if reset_n='0' then
      rx_1t <='0';
    elsif rising_edge(clk100) then
      rx_1t <= rx;
    end if;
  end process;

  receiving : process
  begin
    report "waiting for asynchronous reset";
    wait until reset_n='1';
    report "listening UART...";
    while running loop
      wait_cycles(1);
      if rx='0' and rx_1t='1' then
        receive_byte(rx_byte);
        report "received " & to_string(rx_byte) & " = " & to_string(to_integer(unsigned(rx_byte)));
      end if;
    end loop;
    -- never happens
    wait_cycles(100);
    report "stop listening UART";
    wait;
  end process;
end bhv;
