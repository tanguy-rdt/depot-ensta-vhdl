library IEEE;
use IEEE.STD_LOGIC_1164.ALL;


entity tri_state  is
port(e_1 :in std_logic_vector (3 downto 0);
     sel :in std_logic;
     sort :out std_logic_vector (3 downto 0));
end tri_state;


architecture archi of tri_state is
begin
sort <= e_1 when sel='0' else "ZZZZ";
end archi;