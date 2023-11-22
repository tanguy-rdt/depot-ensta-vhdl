library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

entity tick_generator is
  port(
    clk, reset_n: in std_logic;
    tick_output: out std_logic
  );
end entity;

architecture arch of tick_generator is
  signal counter: unsigned(9 downto 0);
  signal tick: std_logic;
begin
  process(reset_n, clk)
    begin 
      if rising_edge(clk) then 
        if counter =  to_unsigned(325, 9) then 
          counter <= to_unsigned(0, 9)
          tick <= '1';
        else 
          counter <= counter + 1;
          tick <= '0';
        end if;
      elsif reset_n='0' then 
        counter <= to_unsigned(0, 9);
        tick <= '0';
      end if;
    end process;

    tick_output <= tick;
end arch;
