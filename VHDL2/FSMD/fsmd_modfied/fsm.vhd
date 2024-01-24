library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

entity fsm is 
port ( 
    clk, reset_n: in std_logic;
    state: out state_type
);

architecture arch of fsm is
    type state_type is (S0, S1, S2, S3);
    signal state_c, state_r: state_type;
begin 
    process(clk, reset_n)
    begin 
        if reset_n = '0' then 
            state_r <= S0;
        elsif rising_edge(clk) then 
            state_r <= state_c;
        end if;
    end process;