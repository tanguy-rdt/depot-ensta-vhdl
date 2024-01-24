library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

entity or2 is
port(
    a, b: in std_logic;
    f: out std_logic
)

architecture arch of or2 is 
begin 
    f <= a or b;
end arch;