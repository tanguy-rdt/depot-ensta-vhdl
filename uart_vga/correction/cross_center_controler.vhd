library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

entity cross_center_controler is
  port (
    reset_n   : in std_logic;
    clk       : in std_logic;
    tick_20_hz : in std_logic;
    button_c  : in std_logic;
    button_u  : in std_logic;
    button_d  : in std_logic;
    button_l  : in std_logic;
    button_r  : in std_logic;
    center_dx : out unsigned(9 downto 0);
    center_dy : out unsigned(9 downto 0)
  );
end entity;

architecture arch of cross_center_controler is
  signal center_dx_r : unsigned(9 downto 0);
  signal center_dy_r : unsigned(9 downto 0);
begin

  process(reset_n,clk)
  begin
    if reset_n='0' then
      center_dx_r <= to_unsigned(0,10);
      center_dy_r <= to_unsigned(0,10);
    elsif rising_edge(clk) then
      if tick_20_hz='1' then
        if button_c='1' then
          center_dx_r <= to_unsigned(0,10);
          center_dy_r <= to_unsigned(0,10);
        else
          if button_u='1' then
            center_dy_r <= center_dy_r + 1;
          end if;
          if button_d='1' then
            center_dy_r <= center_dy_r - 1;
          end if;
          if button_l='1' then
            center_dx_r <= center_dx_r + 1;
          end if;
          if button_r='1' then
            center_dx_r <= center_dx_r - 1;
          end if;
        end if;
      end if;
    end if;
  end process;

  center_dx <= center_dx_r;
  center_dy <= center_dy_r;


end architecture;
