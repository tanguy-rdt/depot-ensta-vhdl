library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

entity ha is
  port(
    a, b: in std_logic;
    s, co: out std_logic
  );
end entity;

architecture arch of ha is
begin
  process(a, b)
    begin 
        s <= a xor b;
        co <= a and b;
    end process;
end arch;
