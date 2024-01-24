library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

entity controler is 
port (
    clk, reset_n: in std_logic;
    go: in std_logic;
    state: in state_type;
    done: out std_logic;
    controler: out std_logic_vector (6 downto 0)
);

architecture arch of controler is
begin 
    if reset_n = '0' then 
        controler(0) <= '0';
        controler(1) <= '0';
        controler(2) <= '0';
        controler(3) <= '0';
        controler(4) <= '0';
        controler(5) <= '0';
        controler(6) <= '0';
        done <= '0';
    elsif rising_edge(clk) then
        case state is 
            when S0 => 
                


