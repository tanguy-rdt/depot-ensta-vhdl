library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

entity cross_center_controler is
  port(
    clk, reset_n: in std_logic;
    u, d, l, r, c: in std_logic;
    center_dx: out integer range 0 to 639;
    center_dy: out integer range 0 to 479;
  );
end entity;

architecture arch of cross_center_controler is

begin
  process(reset_n, clk, u, d, l, r, c)
    begin 
      if rising_edge(clk) then 
        if u = '1' then 
          center_dx = center_dx + 1;
        else if d = '1' then 
          center_dx = center_dx - 1;
        else if l = '1' then 
          center_dy = center_dy - 1;
        else if r = '1' then 
          center_dy = center_dy + 1;
        else if c = '1' then 
          center_dx = 640/2;
          center_dy <= 480/2;
        end if;
      end if;
    end process;
end arch;
