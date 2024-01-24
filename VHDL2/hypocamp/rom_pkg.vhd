library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

library hypo_lib;
use hypo_lib.core_pkg.all;

package rom_pkg is
  constant ROM : code_memory_type :=(
    0 => x"a000",--receive 
    1 => x"3001",--store 1
    2 => x"a000",--receive 
    3 => x"3003",--store 3
    4 => x"a000",--receive 
    5 => x"3002",--store 2
    6 => x"6001",--mul 1
    7 => x"4003",--add 3
    8 => x"3000",--store 0
    9 => x"a000",--receive 
    10 => x"3002",--store 2
    11 => x"6001",--mul 1
    12 => x"4003",--add 3
    13 => x"3000",--store 0
    14 => x"a000",--receive 
    15 => x"3002",--store 2
    16 => x"6001",--mul 1
    17 => x"4003",--add 3
    18 => x"3000",--store 0
    19 => x"900e",--jump Label
    20 => x"0000",--halt 
    others => x"0000"
  );
end rom_pkg;
