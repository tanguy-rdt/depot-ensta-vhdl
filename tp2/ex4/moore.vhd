library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

entity decount is
  port(
    reset_n, clk, e: in std_logic;
    f1, f2 : out std_logic_vector(1 downto 0)
  );
end entity;

architecture arch of decount is
  type state type is (A, B);
  signal state_r, state_c: state_type;
begin
  process(reset_n, clk)
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
end arch;
