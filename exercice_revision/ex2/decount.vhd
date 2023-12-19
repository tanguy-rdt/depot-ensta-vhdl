library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

entity decount is 
port (
    clk, reset_n, tick, forced : in std_logic;
    level: out std_logic_vector(1 downto 0);
);

architecture arch of decount is 
    signal cnt: unsigned(7 downto 0);
begin 
    process(clk, reset_n, tick, forced)
    begin 
        if reset_n = '0' then 
            cnt <= to_unsigned(255, 8);
        elsif rising_edge(clk) then 
            if forced = '1' then 
                cnt <= to_unsigned(42, 8);
            elsif tick = '1' then 
                cnt <= cnt - 1;
            end if;
        end if;
    end process;

    level <= "00" when cnt < 85 else
             "01" when cnt < 170 else 
             "01";
end arch;