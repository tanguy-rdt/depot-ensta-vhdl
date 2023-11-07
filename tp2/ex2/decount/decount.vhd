library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

entity decount is
  port(
    reset_n, clk, tick, forced: in std_logic;
    level : out std_logic_vector(1 downto 0)
  );
end entity;

architecture arch of decount is
  signal cpt : unsigned(7 downto 0);
begin
  cpt_p: process(reset_n, clk)
    begin 
        if reset_n = '0' then
            cpt <= to_unsigned(255, 8);
        elsif rising_edge(clk) then 
            if forced = '1' then 
                cpt <= to_unsigned(43, 8);
            elsif tick = '1' then 
                cpt <= cpt-1;
            end if;
        end if;
    end process;

  level <= "00" when cpt < 85 else 
           "01" when cpt < 170 else 
           "10";

end arch;
