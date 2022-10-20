

library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

-------------------------------------------------------------------------------

entity decodeur_tb is
end decodeur_tb;

-------------------------------------------------------------------------------

architecture bhe of decodeur_tb is

  --constant N  : natural := 4;
signal s_val: std_logic_vector (3 downto 0);
signal s_display: std_logic_vector (6 downto 0);

-----------------
begin  
  
  DUT: entity work.decodeur(archi)
    --generic map (N => N)
    port map (
      VAL_IN   => s_val,
      DISPLAY   => s_display
    
      );
  
	s_val  <= "0011", X"F" after 100 ns, X"5" after 200 ns;

end bhe;