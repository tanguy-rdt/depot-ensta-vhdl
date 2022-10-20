library ieee;
use ieee.std_logic_1164.all;

entity fa is
  port(
    a, b, cin : in  std_logic;
    sum, cout : out std_logic
    );
end entity fa;


architecture archi of fa is
  signal sum_1, cout_1, cout_2 : std_logic;
begin  -- architecture logic

  ha_1 : entity work.ha
    port map (
      a    => b,
      b    => cin,
      sum  => sum_1,
      cout => cout_1);

  ha_2 : entity work.ha
    port map (
      a    => a,
      b    => sum_1,
      sum  => sum,
      cout => cout_2);

  cout <= cout_1 or cout_2;


end architecture archi;
