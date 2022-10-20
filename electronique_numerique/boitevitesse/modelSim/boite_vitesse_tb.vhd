

-------------------------------------------------------------------------------

library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

-------------------------------------------------------------------------------

entity boite_vitesse_tb is
end boite_vitesse_tb;

-------------------------------------------------------------------------------

architecture bhe of boite_vitesse_tb is

signal s_clef  : std_logic ;
signal s_clear  : std_logic ;
signal s_frein   : std_logic ; 
signal s_avancer : std_logic ;

signal s_ten_seg 		              :  std_logic_vector(6 downto 0);  -- affichage dizaines
signal s_one_seg 		              : std_logic_vector(6 downto 0);  -- affichage unit?es
-----------------
constant HALF_PERIOD : time := 20 ns;
signal s_clk: std_logic :='0';
signal running  : boolean :=true;
-----------------
begin  
  
  DUT: entity work.boite_vitesse(archi)
    
    port map (
      CLK        => s_clk,
      CLEF       => s_clef,  
      FREIN      => s_frein,  
      AVANCER    => s_avancer,
      CLEAR      => s_clear,
      TEN_SEG    => s_ten_seg,
      ONE_SEG    => s_one_seg
      );
	
  s_clk  <= not(s_clk) after HALF_PERIOD when running else '0'; 
  s_clef <= '1', '0' after 75 ns; 
  s_avancer  <= '1', '0' after 135 ns; 
  
test: process
begin
  
end process;
end bhe;
