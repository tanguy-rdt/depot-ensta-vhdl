library ieee;
use ieee.std_logic_1164.all;

entity basculeD is
  port(
    d, clk, async_reset  : in  std_logic;
    q       : out std_logic
    );
end entity basculeD;


architecture archi of basculeD is
signal s_async_reset: std_logic;
begin  -- architecture logic
    process(clk, async_reset)
    begin 
        s_async_reset <= async_reset;
        if(s_async_reset='1') then 
            q <= '0';
        elsif(rising_edge(clk)) then
            q <= d; 
        end if;      
    end process;  
end architecture archi;
