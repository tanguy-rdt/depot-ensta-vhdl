-----------------------------------------------------------------
-- This file was generated automatically by vhdl_tb Ruby utility
-- date : (d/m/y) 02/03/2020 17:48
-- Author : Jean-Christophe Le Lann - 2014
-----------------------------------------------------------------
library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

entity soustractor_tb is
end entity;

architecture bhv of soustractor_tb is

  constant HALF_PERIOD : time := 5 ns;

  signal clk     : std_logic := '0';
  signal reset_n : std_logic := '0';
  signal sreset  : std_logic := '0';
  signal running : boolean   := true;

  procedure wait_cycles(n : natural) is
   begin
     for i in 1 to n loop
       wait until rising_edge(clk);
     end loop;
   end procedure;

  signal a : std_logic_vector(7 downto 0);
  signal b : std_logic_vector(7 downto 0);
  signal f : std_logic_vector(7 downto 0);
  signal cout : std_logic;
  signal cmd : std_logic;

  signal error_sig : std_logic;

begin
  -------------------------------------------------------------------
  -- clock and reset
  -------------------------------------------------------------------
  reset_n <= '0','1' after 123 ns;

  clk <= not(clk) after HALF_PERIOD when running else clk;

  --------------------------------------------------------------------
  -- Design Under Test
  --------------------------------------------------------------------
  dut : entity work.soustractor(structural)
        port map (
          a => a,
          b => b,
          sum => f,
          cout => cout,
          cmd => cmd
        );
  --------------------------------------------------------------------
  -- sequential stimuli
  --------------------------------------------------------------------
  stim : process
   variable va,vb,expected,actual : integer;
   variable nb_errors : integer := 0;
   begin
     report "running testbench for soustractor(structural)";
     report "waiting for asynchronous reset";
     wait until reset_n='1';
     wait_cycles(10);
     report "applying single stimuli...(just to show)";
     cmd <= '0';
     a <= "01110110";
     b <= "00011101";
     wait until rising_edge(clk);
     if cmd = '1' then
      expected := to_integer(unsigned(a))-to_integer(unsigned(b));
      actual:=to_integer(unsigned(f));
     elsif cmd = '0' then
      expected := to_integer(unsigned(a))+to_integer(unsigned(b));
      actual:=to_integer(unsigned(f));
     end if;
     if actual /= expected then
      va:=to_integer(unsigned(a));
      vb:=to_integer(unsigned(b));
      report "error for (a,b)=(" & integer'image(va)&","&integer'image(vb)&". Expecting " & integer'image(expected) &". Got " & integer'image(actual);
      error_sig <= '1';
      nb_errors:=nb_errors+1;
     else
      if cmd = '1' then
        report "good result for " & integer'image(to_integer(unsigned(a))) &" - " & integer'image(to_integer(unsigned(b))) & ". Expecting " & integer'image(expected) &". Got " & integer'image(actual);
      elsif cmd = '0' then
        report "good result for " & integer'image(to_integer(unsigned(a))) &" + " & integer'image(to_integer(unsigned(b))) & ". Expecting " & integer'image(expected) &". Got " & integer'image(actual);
      end if;
      error_sig <= '0';
     end if;

     -- wait_cycles(10);
     -- for aa in 0 to 255 loop
     --   for bb in 0 to 255 loop
     --     a <= std_logic_vector(to_unsigned(aa,8));
     --     b <= std_logic_vector(to_unsigned(bb,8));
     --     wait until rising_edge(clk);
     --     expected := (aa + bb) ;-- mod 256; -- dont forget this modulo (or try without) !
     --     actual   := to_integer(unsigned(f));
     --     if actual /= expected then
     --       report "error for (a,b)=(" & integer'image(aa)&","&integer'image(bb)&"). Expecting " & integer'image(expected) &". Got " & integer'image(actual) severity failure;
     --       nb_errors:=nb_errors+1;
     --       error_sig <= '1';
     --     else
     --       error_sig <= '0';
     --     end if;
     --   end loop;
     -- end loop;
     report "end of simulation";
     report "#errors = " & integer'image(nb_errors);
     running <=false;
     wait;
   end process;

end bhv;
