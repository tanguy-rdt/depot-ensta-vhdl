library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

entity circuit is 
port (
    a, b, c: in std_logic;
    f: out std_logic
);

architecture arch of circuit is 
    signal f1: std_logic;
begin 
    or2_inst: entity work.and2 
    port map (
        a => a,
        b => b,
        f => f1
    );

    and2_inst: entity work.or2
    port map (
        a => f1,
        b => c, 
        f => f
    );
end arch;