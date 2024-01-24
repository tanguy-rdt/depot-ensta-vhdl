library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

library work;
use work.vga_constants.all;

entity vga_controler is
  port (
    reset_n  : in std_logic;
    clk_100   : in std_logic;
    tick25   : in std_logic;
    hsync    : out std_logic;
    vsync    : out std_logic;
    video_on : out std_logic;
    pixel_x  : out unsigned(9 downto 0);--sufficient for 640
    pixel_y  : out unsigned(9 downto 0) --sufficient for 480
  );
end entity;

architecture arch of vga_controler is

  signal tick_25 : std_logic;
  signal hsync_c,hsync_r : std_logic;
  signal vsync_c,vsync_r : std_logic;
  signal count   : unsigned(3 downto 0);
  signal hcount  : unsigned(9 downto 0);
  signal vcount  : unsigned(9 downto 0);
  signal h_video_on,v_video_on : std_logic;
  signal start_line : std_logic;
begin

  hscan_p: process(reset_n,clk_100)
  begin
    if reset_n='0' then
      hcount <= to_unsigned(0,10);
      hsync_r <= '0';
    elsif rising_edge(clk_100) then
      if tick25='1' then
        hsync_r <= hsync_c;
        if hcount=H_PERIOD-1 then
          hcount <= to_unsigned(0,10);
        else
          hcount <= hcount + 1;
        end if;
      end if;
    end if;
  end process;

  hsync_p :process(hcount)
  begin
    hsync_c <= '1';
    if hcount >= FRAME_WIDTH+H_FRONT_PORCH  then
      hsync_c <= '0';
    end if;
    if hcount >= FRAME_WIDTH+H_FRONT_PORCH + H_RETRACE_WIDTH then
      hsync_c <= '1';
    end if;
  end process;

  hvideo_on_p:process(hcount)
  begin
    h_video_on <= '1';
    if hcount >=  FRAME_WIDTH then
      h_video_on <= '0';
    end if;
  end process;

  start_line <= '1' when (hsync_r='0' and hsync_c='1') else '0';

  -- Vertical stuff
  vscan_p: process(reset_n,clk_100)
  begin
    if reset_n='0' then
      vcount <= to_unsigned(0,10);
      vsync_r <= '0';
    elsif rising_edge(clk_100) then
      if tick25='1' then
        vsync_r <= vsync_c;
        if start_line='1' then
          if vcount=V_PERIOD-1 then
            vcount <= to_unsigned(0,10);
          else
            vcount <= vcount + 1;
          end if;
        end if;
      end if;
    end if;
  end process;

  vsync_p :process(vcount)
  begin
    vsync_c <= '1';
    if vcount >  FRAME_HEIGHT + V_FRONT_PORCH then
      vsync_c <= '0';
    end if;
    if vcount >  FRAME_HEIGHT + V_FRONT_PORCH + V_RETRACE_WIDTH then
      vsync_c <= '1';
    end if;
  end process;

  v_video_on_p:process(vcount)
  begin
    v_video_on <= '1';
    if vcount >  FRAME_HEIGHT then
      v_video_on <= '0';
    end if;
  end process;
  --
  hsync <= hsync_r;
  vsync <= vsync_r;
  video_on <= v_video_on and h_video_on;
  pixel_x <= hcount;
  pixel_y <= vcount;

end architecture;
