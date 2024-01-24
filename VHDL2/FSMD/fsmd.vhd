library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

entity fsmd is 
port (
    reset_n, clk, go: in std_logic;
    a0, a1, a2, a3, x: in std_logic;
    px: out std_logic
);
end entity;

architecture arch of fsmd is
    type state_type is (CS0, CS1, CS2, CS3);
    signal state_c, state_r: state_type;
    --
    signal regs_c, regs_r: std_logic_vector(4 downto 0);
begin
    registers: process(clk, reset_n)
    begin 
        if reset_n = '0' then 
            state_r <= CS0; 
            regs_r(0) <= '0';
            regs_r(1) <= '0';
            regs_r(2) <= '0';
            regs_r(3) <= '0';
            regs_r(4) <= '0';
        elsif rising_edge(clk) then 
            state_r <= state_c;
            regs_r(0) <= regs_c(0);
            regs_r(1) <= regs_c(1);
            regs_r(2) <= regs_c(2);
            regs_r(3) <= regs_c(3);
            regs_r(4) <= regs_c(4);
        end if;
    end process;

    fsm: process(go)
    begin 
        --
        state_c <= state_r;
        --
        case state_r is 
            when CS0 => 
                if go = '1' then 
                    state_c <= CS1;
                end if;
            when CS1 => 
                state_c <= CS2;
            when CS2 =>
                state_c <= CS3;
            when others => 
                null;
        end case;
    end process;

    datapath: process(a0, a1, a2, a3, x)
    begin 
        --
        regs_c(0) <= regs_r(0);
        regs_c(1) <= regs_r(1);
        regs_c(2) <= regs_r(2);
        regs_c(3) <= regs_r(3);
        regs_c(4) <= regs_r(4);
        --
        if state_r = CS0 then 
            regs_c(0) <= a0;
            regs_c(1) <= a1;
            regs_c(2) <= a2;
            regs_c(3) <= a3;
            regs_c(4) <= x;
        elsif state_r = CS1 then 
            regs_c(2) <= (regs_r(3) * regs_r(4)) + regs_r(2);
        elsif state_r = CS2 then 
            regs_c(1) <= (regs_r(2) * regs_r(4)) + regs_r(1);
        elsif state_r = CS3 then 
            regs_c(0) <= (regs_r(1) * regs_r(4)) + regs_r(0);
        end if;
    end process;

    px <= regs_r(0);
end arch;
