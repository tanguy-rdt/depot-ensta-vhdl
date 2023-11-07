library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

entity solution3 is
  port(
    reset_n, a, b, clk: in std_logic;
    y : out std_logic
  );
end entity;

architecture arch of solution3 is
begin
  process(clk)
  begin
    if rising_edge(clk) then
      b_reg <= b;
    end if;
  end process;

  process(clk)
  begin
    if rising_edge(clk) then
      mult.reg <= A * b_reg;
  end if;
  end process;


  y <= B + mul_reg;
end arch;
