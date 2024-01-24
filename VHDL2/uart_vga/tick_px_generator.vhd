library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

entity tick_px_generator is
  port(
    clk, reset_n: in std_logic;
    tick_output: out std_logic
  );
end entity;

architecture arch of tick_px_generator is
  signal counter: integer range 0 to 4;
  signal tick: std_logic;
begin
  process(reset_n, clk)
    begin 
      if rising_edge(clk) then 
        if counter = 4 then 
          counter <= 0;
          tick <= '1';
        else 
          counter <= counter + 1;
          tick <= '0';
        end if;
      elsif reset_n='0' then 
        counter <= 0;
        tick <= '0';
      end if;
    end process;

    tick_output <= tick;
end arch;
