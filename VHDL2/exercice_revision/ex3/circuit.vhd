library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

entity circuit is 
port (
    reset_n, clk: in std_logic;
    a, b: in std_logic_vector(7 downto 0);
    f: out std_logic_vector(7 downto 0)
);

architecture arch of circuit is 
    signal b_mul, f_mul, a_sum: std_logic_vector(7 downto 0);
begin 
    registers: process(reset_n, clk)
    begin 
        if reset_n = '0' then 
            b_mul <= to_unsigned(0, 8);
            a_sum <= to_unsigned(0, 8);
        elsif rising_edge(clk) then 
            b_mul <= b;
            a_sum <= f_mul;
        end if;
    end process;

    combinatoire: process()
    begin 
        f_mul <= a * b_mul;
        f <= f_mul + b;
    end process;
end arch;