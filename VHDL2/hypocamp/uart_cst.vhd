library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

package uart_cst is

  -- TESTING : OK
  -- define number of sampling ticks for a single transmitted bit
  -- 10^8/(19200*16) = 325
  -- each bit sampled 16 times
  --constant NB_100HZ_CLOCK_CYCLES_FOR_TICK : natural := 325;

  -- TESTING : OK
  -- define number of sampling ticks for a single transmitted bit
  -- 10^8/(38400*16) = 162
  -- each bit sampled 16 times
  --constant NB_100HZ_CLOCK_CYCLES_FOR_TICK : natural := 162;

  -- TESTING : OK
  -- define number of sampling ticks for a single transmitted bit
  -- 10^8/(57600*16) = 108
  -- each bit sampled 16 times
  --constant NB_100HZ_CLOCK_CYCLES_FOR_TICK : natural := 108;

  -- TESTING : OK
  -- define number of sampling ticks for a single transmitted bit
  -- 10^8/(115200*16) = 54
  -- each bit sampled 16 times
  --constant NB_100HZ_CLOCK_CYCLES_FOR_TICK : natural := 54;

  -- TESTING : OK
  -- define number of sampling ticks for a single transmitted bit
  -- 10^8/(230400*16) = 27
  -- each bit sampled 16 times
  --constant NB_100HZ_CLOCK_CYCLES_FOR_TICK : natural := 27;

  -- TESTING :
  -- define number of sampling ticks for a single transmitted bit
  -- 10^8/(460800*16) = 13
  -- each bit sampled 16 times
  constant NB_100HZ_CLOCK_CYCLES_FOR_TICK : natural := 6;

end package;
