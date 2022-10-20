library ieee;
use ieee.std_logic_1164.all;

entity fsm is
  port(
    reveil, greve, panne, bug, clk, reset          : in  std_logic;
    state_of_metro, state_of_boulot, state_of_dodo : out std_logic
    );
end entity fsm;


architecture rtl of fsm is
type state_type is (METRO, BOULOT, DODO);
signal my_state: state_type;
signal next_state: state_type;
begin  -- architecture logic
    state: process(clk, reset)
    begin
        if reset = '0' then 
            my_state <= DODO;
        elsif (rising_edge(clk)) then
            my_state <= next_state;
        end if;
    end process;

    next_state_logic: process(my_state, reveil, greve, panne, bug)
    begin 
        next_state <= my_state;
        case my_state is 
            when DODO =>
                if reveil = '1' then 
                    next_state <= METRO;
                end if;
            when METRO => 
                if greve = '0' and panne = '0' then 
                    next_state <= BOULOT;
                elsif greve = '1' or panne = '1' then
                    next_state <= METRO;
                end if;
            when BOULOT => 
                if bug = '0' then 
                    next_state <= DODO;
                end if;
            when others => 
                null;
        end case;
    end process; 

    output_logic: process(my_state)
    begin 
        if my_state = DODO then
            state_of_dodo <= '1';
            state_of_metro <= '0';
            state_of_boulot <= '0';
        elsif my_state = METRO then
            state_of_dodo <= '0';
            state_of_metro <= '1';
            state_of_boulot <= '0';
        elsif my_state = BOULOT then 
            state_of_dodo <= '0';
            state_of_metro <= '0';
            state_of_boulot <= '1';
        end if;
    end process;
end architecture rtl;