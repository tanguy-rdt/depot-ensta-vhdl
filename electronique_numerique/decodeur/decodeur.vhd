library IEEE;
use IEEE.STD_LOGIC_1164.ALL;


entity decodeur is
port(
val_in	:in std_logic_vector (3 downto 0);
display:out std_logic_vector(6 downto 0)
);
end decodeur;
architecture archi of decodeur is
begin
proc1:process(val_in)
begin
case val_in is
when "0000" => display <= "1000000";
when "0001" => display <= "1111001";
when "0010" => display <= "0100100";
when "0011" => display <= "0110000";
when "0100" => display <= "0011001";
when "0101" => display <= "0010010";
when "0110" => display <= "0000010";
when "0111" => display <= "1111000";
when "1000" => display <= "0000000";
when "1001" => display <= "0010000";
when others => display <= "0000000";
end case;
end process;
end archi;

