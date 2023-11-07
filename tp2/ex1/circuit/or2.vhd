library ieee;
use ieee.std_logic_1164.all;

entity or2 is
  port(
    a, b : in std_logic_vector(3 downto 0);
    f : out std_logic_vector(3 downto 0)
  );
end entity;

architecture logic of or2 is
begin
    f <= a or b;
end logic;
