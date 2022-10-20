-----------------------------------------------------------------
-- This file was generated automatically by vhdl_tb Ruby utility
-- date : (d/m/y) 02/03/2020 17:48
-- Author : Jean-Christophe Le Lann - 2014
-----------------------------------------------------------------
library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

entity adder8_tb is
end entity;

architecture bhv of adder8_tb is

  constant HALF_PERIOD : time := 5 ns;

  signal clk     : std_logic := '0';
  signal reset : std_logic := '0';
  signal sreset  : std_logic := '0';
  signal running : boolean   := true;

  procedure wait_cycles(n : natural) is
   begin
     for i in 1 to n loop
       wait until rising_edge(clk);
     end loop;
   end procedure;

  signal reveil           : std_logic;
  signal greve            : std_logic;
  signal bug              : std_logic;
  signal panne            : std_logic;
  signal clk              : std_logic;
  signal reset            : std_logic;
  signal state_of_metro   : std_logic;
  signal state_of_boulot  : std_logic;
  signal state_of_dodo    : std_logic;
begin
  -------------------------------------------------------------------
  -- clock and reset
  -------------------------------------------------------------------
  reset <= '0','1' after 123 ns;
  clk <= not(clk) after HALF_PERIOD when running else clk;

  --------------------------------------------------------------------
  -- Design Under Test
  --------------------------------------------------------------------
  dut : entity work.fsm
    port map (
        reveil => 0;
        greve => 0;
        panne => 0;
        bug => 0;
        state_of_metro => 0;
        state_of_boulot => 0;
        state_of_dodo => 0;
    );
  --------------------------------------------------------------------
  -- sequential stimuli
  --------------------------------------------------------------------
  stim : process
   variable va,vb,expected,actual : integer;
   variable nb_errors : integer := 0;
   begin
     report "running testbench for adder8(structural)";
     report "waiting for asynchronous reset";
     wait until reset_n='1';
     wait_cycles(10);
     report "applying single stimuli...(just to show)";
     a <= "01110110";
     b <= "00011101";
     wait until rising_edge(clk);
     expected := to_integer(unsigned(a))+to_integer(unsigned(b));
     actual:=to_integer(unsigned(f));
     if actual /= expected then
      va:=to_integer(unsigned(a));
      vb:=to_integer(unsigned(b));
      report "error for (a,b)=(" & integer'image(va)&","&integer'image(vb)&". Expecting " & integer'image(expected) &". Got " & integer'image(actual);
      error_sig <= '1';
      nb_errors:=nb_errors+1;
     else
      report "good result for " & integer'image(to_integer(unsigned(a))) &" + " & integer'image(to_integer(unsigned(b))) & ". Expecting " & integer'image(expected) &". Got " & integer'image(actual);
      error_sig <= '0';
     end if;

     report "end of simulation";
     report "#errors = " & integer'image(nb_errors);
     running <=false;
     wait;
   end process;

end bhv;
