library ieee;
use ieee.std_logic_1164.all;

entity ha is
  port(
    a, b      : in  std_logic;
    sum, cout : out std_logic
    );
end entity ha;


architecture logic of ha is

begin  -- architecture logic

  sum  <= a xor b;                      --ordre indifferent !
  cout <= a and b;

end architecture logic;
