library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

entity lut is
  port(
    push, clk, reset_n, bitsream, a, b: in std_logic;
    f: out std_logic
  );
end entity;

architecture arch of lut is
signal q: std_logic_vector(3 downto 0);
begin
  process(push, clk)
    begin 
        if reset_n='0' then 
          q <= "0000";
        elsif rising_edge(clk) then 
          if push='1' then 
            q(0) <= bitsream;
            q(1) <= q(0);
            q(2) <= q(1);
            q(3) <= q(2);
          end if;
        end if; 
    end process;

    f <= q(0) when (a='0' and b='0') else
         q(1) when (a='0' and b='1') else
         q(2) when (a='1' and b='0') else
         q(3);
        
end arch;
