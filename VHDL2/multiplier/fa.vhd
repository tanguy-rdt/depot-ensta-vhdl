library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

entity fa is
  port(
    a, b, ci: in std_logic;
    s, co: out std_logic
  );
end entity;

architecture arch of fa is
  signal sum1: std_logic;
  signal cout1 : std_logic;
  signal cout2 : std_logic;
begin
  ha_inst: entity work.ha
    port map(
      a => b, 
      b => ci,
      s => sum1,
      co => cout1
    );

  ha_inst2: entity work.ha
    port map(
      a => a, 
      b => sum1,
      s => s,
      co => cout2
    );

  co <= cout1 or cout2;
end arch;
