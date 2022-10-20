library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

entity compteur is
  port(
    reset_n : in std_logic;
    clk : in std_logic;
    sreset : in std_logic;
    incr : in std_logic;
    cpt : out std_logic_vector(7 downto 0)
  );
end compteur;

architecture rtl of compteur is
  signal cpt_i : unsigned(7 downto 0);
begin
  process(reset_n,clk)
  begin
    if reset_n='0' then
      cpt_i <= to_unsigned(0,8);--x"00" (others=>'0')
    elsif rising_edge(clk) then
      if sreset='1' then
        cpt_i <= to_unsigned(0,8);
      elsif incr='1' then
        cpt_i <= cpt_i + 1;
      end if;
    end if;
  end process;

  cpt <= std_logic_vector(cpt_i);
end rtl;
