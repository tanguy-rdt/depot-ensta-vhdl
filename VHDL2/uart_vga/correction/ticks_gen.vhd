library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

entity ticks_gen is
  port (
    reset_n      : in std_logic;
    clk_100       : in std_logic;
    tick_25_mhz  : out std_logic;
    tick_50_mhz  : out std_logic;
    tick_20_hz   : out std_logic
  );
end entity;

architecture arch of ticks_gen is
  signal count_25_mhz : unsigned(1 downto 0);
  signal count_50_mhz_i : std_logic;
  constant NB_BITS_HZ : natural := 23;--2^23=8.10^6
  signal count_20_hz   : unsigned(NB_BITS_HZ-1 downto 0);
  signal tick_50_mhz_i : std_logic;
begin

  generate_25mhz : process(clk_100,reset_n)
  begin
    if reset_n='0' then
      count_25_mhz <= to_unsigned(0,2);
    elsif rising_edge(clk_100) then
      count_25_mhz <= count_25_mhz + 1;
      tick_25_mhz <= '0';
      if count_25_mhz=0 then
        tick_25_mhz <= '1';
      end if;
    end if;
  end process;

  generate_50mhz : process(clk_100,reset_n)
  begin
    if reset_n='0' then
      tick_50_mhz_i <= '0';
    elsif rising_edge(clk_100) then
      tick_50_mhz_i <= not(tick_50_mhz_i);
    end if;
  end process;
  tick_50_mhz <= tick_50_mhz_i;

  generate_20_hz : process(clk_100,reset_n)
  begin
    if reset_n='0' then
      count_20_hz <= to_unsigned(0,NB_BITS_HZ);
    elsif rising_edge(clk_100) then
      count_20_hz <= count_20_hz + 1;
      tick_20_hz <= '0';
      if count_20_hz=5_000_000 then
        count_20_hz <= to_unsigned(0,NB_BITS_HZ);
        tick_20_hz <= '1';
      end if;
    end if;
  end process;




end architecture;
