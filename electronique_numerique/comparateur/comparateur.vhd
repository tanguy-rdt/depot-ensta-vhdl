library IEEE;
use IEEE.STD_LOGIC_1164.ALL;


entity comparateur  is
port(
     bus_a :in std_logic_vector (3 downto 0);
     bus_b :in std_logic_vector (3 downto 0);
     --clk: in std_logic;
     bus_min :out std_logic
     );
end comparateur;


architecture archi of comparateur is
--constant compa:std_logic_vector:="0110";
--possibilite de comparer a une constante
begin
--proc1:process(bus_a,bus_b) 
--begin
--if clk'event and clk='1' then
--if rising_edge(clk) then
--   	if bus_a > bus_b then bus_min <= '1';-- util d'op relationnels
--  	else bus_min <= '0';
--  	end if;
--else null;
--end if;
--end process;

bus_min     <= 	'1'	when (bus_b> bus_a) else      
		        '0';		

end archi;