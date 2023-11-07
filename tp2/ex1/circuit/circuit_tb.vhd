--------------------------------------------------------------------------------
-- this file was generated automatically by Vertigo Ruby utility
-- date : (d/m/y h:m) 06/11/2023 14:47
-- author : Jean-Christophe Le Lann - 2014
--------------------------------------------------------------------------------
 
library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;
 
entity circuit_tb is
end entity;
 
architecture bhv of circuit_tb is
  constant HALF_PERIOD : time :=5 ns;
 
  signal clk : std_logic := '0';
  signal reset_n : std_logic := '0';
 
  signal running : boolean := true;
 
  procedure wait_cycles(n : natural) is 
  begin
    for i in 0 to n-1 loop
      wait until rising_edge(clk);
    end loop;
  end procedure;
 
  procedure toggle(signal s : inout std_logic) is
  begin
    wait until rising_edge(clk);
    s <=not(s);
    wait until rising_edge(clk);
    s <=not(s);
  end procedure;
 
  signal a : std_logic_vector(3 downto 0);
  signal b : std_logic_vector(3 downto 0);
  signal c : std_logic_vector(3 downto 0);
  signal f : std_logic_vector(3 downto 0);
begin
  --------------------------------------------------------------------------------
  -- clock and reset
  --------------------------------------------------------------------------------
  reset_n <= '0','1' after 123 ns;
   
  clk <= not(clk) after HALF_PERIOD when running else clk;
  --------------------------------------------------------------------------------
  -- Design Under Test
  --------------------------------------------------------------------------------
  dut : entity work.circuit(connectique)
    port map (
      a => a,
      b => b,
      c => c,
      f => f
    );
  --------------------------------------------------------------------------------
  -- sequential stimuli
  --------------------------------------------------------------------------------
  stim : process
  begin
    report "running testbench for circuit(connectique)";
    report "waiting for asynchronous reset";
    wait until reset_n='1';
    a <= "1101";
    b <= "0101";
    c <= "1001";
    wait_cycles(10);
    if ((a and b) or c) /= f then 
      report "error";
    else 
      report "so far so good !";
    end if;
    wait_cycles(200);
    report "end of simulation";
    running <= false;
    wait;
  end process;
end bhv;
