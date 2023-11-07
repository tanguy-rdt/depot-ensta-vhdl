library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

entity circuit is
  port(
    a, b, c : in std_logic_vector(3 downto 0);
    f : out std_logic_vector(3 downto 0)
  );
end entity;

architecture connectique of circuit is
  signal f1 : std_logic_vector(3 downto 0);
begin
  and2_inst: entity work.and2
    port map(
      a => a, 
      b => b,
      f => f1
    );

  or2_inst: entity work.or2
    port map(
      a => f1, 
      b => c,
      f => f
    );
end connectique;
