
--Reset_n is mapped on switch[0] (up is reset_n='1'). should be up for running

library ieee;
use ieee.std_logic_1164.all;

entity top is
  port (
    reset_n    : in std_logic;
    clk100     : in std_logic;
    rx         : in std_logic;
    tx         : out std_logic;
    leds       : out std_logic_vector(7 downto 0)
  );
end entity;

architecture structural of top is
  signal tick       : std_logic;
  signal byte       : std_logic_vector(7 downto 0);
  signal byte_valid : std_logic;
  signal rx_t1,rx_t2 : std_logic;
begin
  --------------------------------------------------------
  -- CDC for rx
  --------------------------------------------------------
  cdc:process(reset_n,clk100)
  begin
    if reset_n='0' then
      rx_T1 <= '1';
      rx_T2 <= '1';
    elsif rising_edge(clk100) then
      rx_T1 <= rx;
      rx_T2 <= rx_T1;
    end if;
  end process;
  --------------------------------------------------------
  -- generation of ticks according to baud rate 19200 b/s
  --------------------------------------------------------
  tick_gen_i: entity work.tick_gen
  port map(
    reset_n => reset_n,
    clk100  => clk100,
    tick    => tick);
  -------------------------------------------------------
  -- receiver
  -------------------------------------------------------
  rcvr_i : entity work.receiver
  port map(
    reset_n    => reset_n,
    clk100     => clk100,
    tick       => tick,
    rx         => rx_t2,
    byte       => byte,
    byte_valid => byte_valid
  );
  -------------------------------------------------------
  -- Display on LEDs
  -------------------------------------------------------
  display: process(reset_n,clk100)
  begin
    if reset_n='0' then
      leds <= "10101010";
    elsif rising_edge(clk100) then
      if byte_valid='1' then
        leds <= byte;
      end if;
    end if;
  end process;

end structural;
