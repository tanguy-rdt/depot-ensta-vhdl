-------------------------------------------------------------------------------

library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

-------------------------------------------------------------------------------

entity tri_tb is
end tri_tb;

-------------------------------------------------------------------------------

architecture bhe of tri_tb is

  --constant N  : natural := 4;
signal s_e_1: std_logic_vector (3 downto 0);
signal s_sel: std_logic ;
signal s_sort: std_logic_vector (3 downto 0);

-----------------
--constant HALF_PERIOD : time := 20 ns;
--signal s_clk: std_logic :='0';
--signal running  : boolean :=true;
-----------------
begin  
  
  DUT: entity work.tri_state(archi)
    --generic map (N => N)
    port map (
      E_1   => s_e_1,
      SEL => s_sel,
      SORT=> s_sort
      );
  
	s_e_1  <= "0011", "1100" after 100 ns, X"F" after 300 ns;
	s_sel  <= '0', '1' after 50 ns, '0' after 120 ns;
	
	
--s_clk <= not(s_clk) after HALF_PERIOD when running else '0'; 

--test: process
--variable i : integer range 0 to 4;
--begin
--wait until rising_edge(s_clk);
--s_a  <= X"3";
--s_b  <= X"F" ;
--s_sel  <= '0';
--wait until rising_edge(s_clk);
--s_a  <= X"4";
--s_b  <= X"E" ;
--wait until rising_edge(s_clk);
--s_a  <= X"5";
--s_b  <= X"D" ;
--s_sel  <= '1';
--wait until rising_edge(s_clk);
----s_d <= '0';
--for i in 0 to 2 loop
--  wait until rising_edge(s_clk);
--s_a  <= X"0";
--s_b  <= X"0" ;
--end loop;
--i:=0;
--for i in 0 to 3 loop
--  wait until rising_edge(s_clk);
--end loop;
--running <= false;
--wait;
--end process;
end bhe;