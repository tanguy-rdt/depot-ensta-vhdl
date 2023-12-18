--------------------------------------------------------------------------------
-- this file was generated automatically by Vertigo Ruby utility
-- date : (d/m/y h:m) 07/11/2022 14:52
-- author : Jean-Christophe Le Lann - 2014
--------------------------------------------------------------------------------

library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

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

  signal rx      : std_logic;
  signal tx      : std_logic;
  signal leds    : std_logic_vector(7 downto 0);
begin
  --------------------------------------------------------------------------------
  -- clock and reset
  --------------------------------------------------------------------------------
  reset_n <= '0','1' after 123 ns;

  clk100 <= not(clk100) after HALF_PERIOD when running else clk100;
  --------------------------------------------------------------------------------
  -- Design Under Test
  --------------------------------------------------------------------------------
  dut : entity work.top(structural)
    port map (
      reset_n => reset_n,
      clk100  => clk100 ,
      rx      => tx     , --WARNING !
      tx      => rx     ,
      leds    => leds
    );
  --------------------------------------------------------------------------------
  -- sequential stimuli
  --------------------------------------------------------------------------------
  stim : process

    constant START_BIT : std_logic := '0';
    constant STOP_BIT  : std_logic := '1';

    procedure send_bit(b : std_logic) is
    begin
      wait until rising_edge(clk100);
      tx <= b;
      wait_cycles(325*16);
    end procedure;

    procedure send_message( msg : integer) is

      variable msg_u : unsigned(7 downto 0);
    begin
      msg_u := to_unsigned(msg,8);
      send_bit(START_BIT);
      for i in 0 to 7 loop
        report "sending " & to_string(msg_u(i));
        send_bit(msg_u(i));
      end loop;
      send_bit(STOP_BIT);
    end procedure;

  begin
    report "running testbench for top(structural)";
    report "waiting for asynchronous reset";
    wait until reset_n='1';
    send_bit(STOP_BIT);

    wait_cycles(100);

    send_message(42);

    wait_cycles(200);
    report "end of simulation";
    running <= false;
    wait;
  end process;
end bhv;
