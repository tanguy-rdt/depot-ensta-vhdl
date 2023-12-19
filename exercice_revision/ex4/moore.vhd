library ieee;
use ieee.std_logic_1164.all;
use ieee.std_logic.all;

entity moore is 
port (
    reset_n, clk, e: in std_logic;
    f1: out std_logic;
    f2: out std_logic_vector(1 downto 0)
);

architecture arch of moore is 
    type state_type is (A, B);
    signal state_c, state_r: state_type;
    --
    f1_c, f1_r: std_logic;
    f2_c, f2_r: std_logic_vector(1 downto 0);
begin 
    registers: process(clk, reset_n)
    begin 
        if reset_n = '0' then 
            state_r <= A; 
            f1_r <= '0';
            f2_r <= "00";
        elsif rising_edge(clk) then 
            state_r <= state_c;
            f1_r <= f1_c;
            f2_r <= f2_c;
        end if 
    end process;

    fsm: process(e)
    begin 
        --
        state_c <= state_r;
        f1_c <= f1_r;
        f2_c <= f2_r;
        --
        case state_r is 
            when A => 
                f1 = '1';
                f2 = "00";
                if e = '1' then 
                    state_c <= B;
                end if;
            when B => 
                f1 = '0';
                f2 = "01";
                if e = '0' then 
                    state_c <= A;
                elsif e = '1' then 
                    state_c <= B;
                end if;
            when others =>
                null
        end case; 
    end process;
end arch;

