library ieee;
use ieee.std_logic_1164.all;

entity and2 is
  port(
    a, b : in std_logic_vector(3 downto 0);
    f : out std_logic_vector(3 downto 0)
  );
end entity;

architecture logic of and2 is
begin
    f <= a and b;
end logic;
