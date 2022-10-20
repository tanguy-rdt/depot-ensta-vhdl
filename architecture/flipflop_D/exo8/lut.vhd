library ieee;
use ieee.std_logic_1164.all;

entity basculeD is
  port(
    d1, d2, d3, d4, clk, async_reset  : in  std_logic;
    q1, q2, q3, q4                    : out std_logic
    );
end entity basculeD;


architecture archi of basculeD is
signal s_async_reset: std_logic;
signal s_d1: std_logic;
signal s_d2: std_logic;
signal s_d3: std_logic;
signal s_d4: std_logic;
signal s_q1: std_logic;
signal s_q2: std_logic;
signal s_q3: std_logic;
signal s_q4: std_logic;
begin  -- architecture logic
    s_d1 <= d1;
    s_d2 <= d2;
    s_d3 <= d3;
    s_d4 <= d4;
    s_q1 <= q1;
    s_q2 <= q2;
    s_q3 <= q3;
    s_q4 <= q4;

    process(clk, async_reset)
    begin 
        s_async_reset <= async_reset;
        if(s_async_reset='1') then 
            q1 <= '0';
            q2 <= '0';
            q3 <= '0';
            q4 <= '0';
        elsif(rising_edge(clk)) then
            s_q1 <= s_d1; 
            s_d2 <= s_q1;
            s_q2 <= s_d2; 
            s_d3 <= s_q2;
            s_q3 <= s_d3; 
            s_d4 <= s_q3;
        end if;      
    end process;  
end architecture archi;