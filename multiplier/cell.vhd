library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

entity cell is
  port(
    x, y, sum_in, cin: in std_logic;
    cout, sum_out: out std_logic
  );
end entity;

architecture arch of cell is
 signal val: std_logic;
begin
  val <= x and y;

  fa_inst: entity work.fa
    port map(
      a => sum_in, 
      b => val,
      ci => cin,
      s => sum_out,
      co => cout
    );
end arch;
