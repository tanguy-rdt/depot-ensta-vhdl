library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

entity test_1 is
  port(
    reset_n : in std_logic;
    clk : in std_logic;
    a , b : in unsigned(7 downto 0);
    f1 , f2 : out unsigned(7 downto 0)
  );
end entity;

architecture rtl of test_1 is
  signal aa,bb : unsigned(7 downto 0);
  signal b_c : unsigned(7 downto 0);
begin

  process(reset_n,clk)
  begin
    if reset_n='0'then
      aa <= to_unsigned(0,8);
      bb <= to_unsigned(0,8);
    elsif rising_edge(clk) then
      aa <= a;
      bb <= b_c;
    end if;
  end process;

  p1 : process(a,aa,b)
  begin
    b_c <= to_unsigned(42,0);
    if b < aa then
      b_c <= b + bb;
    elsif b > 23 then
      b_c <= a * aa;
    end if;
  end process;

  f1 <= b_c;
  f2 <= b_c + a;

end rtl;
