------------------------------------------------
-- copyright JC Le Lann 2021.
-- jean-christophe.le_lann@ensta-bretagne.fr
------------------------------------------------
library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

entity soc is
  port (
    reset_n    : in std_logic; --mapped on CPU reset
    clk_100   : in std_logic;
    ---------------------------------------------------------
		-- switches & buttons
		---------------------------------------------------------
		button_c   : in std_logic;
    button_u   : in std_logic;
    button_d   : in std_logic;
    button_l   : in std_logic;
    button_r   : in std_logic;
    ---------------------------------------------------------
		--VGA
		---------------------------------------------------------
		vga_hsync : out std_logic;
		vga_vsync : out std_logic;
		vga_r     : out std_logic_vector(3 downto 0);
		vga_g     : out std_logic_vector(3 downto 0);
		vga_b     : out std_logic_vector(3 downto 0)
  );
end entity;

architecture rtl of soc is

  signal tick_25_mhz : std_logic;
  signal tick_20_hz  : std_logic;

  signal hsync       : std_logic;
  signal vsync       : std_logic;
  signal video_on    : std_logic;
  signal pixel_x     : unsigned(9 downto 0);--sufficient for 640
  signal pixel_y     : unsigned(9 downto 0); --sufficient for 480
  signal center_dx   : unsigned(9 downto 0);--sufficient for 640
  signal center_dy   : unsigned(9 downto 0); --sufficient for 480

  signal img_r,img_g,img_b : std_logic_vector(3 downto 0);

  type mode_type is (CROSS_TEST, DISPL_TEST, VGA_TEST);

  signal mode : mode_type;

begin
  ----------------------------------------------
  -- tick pixel
  ----------------------------------------------
  ticks_gen_e : entity work.ticks_gen
  port map(
    reset_n       => reset_n,
    clk_100       => clk_100,
    tick_25_mhz   => tick_25_mhz,
    tick_50_mhz   => open,
    tick_20_hz    => tick_20_hz
  );
  ----------------------------------------------
  -- VGA signaling
  ----------------------------------------------
  controler : entity work.vga_controler
  port map(
    reset_n  => reset_n     ,
    clk_100   => clk_100    ,
    tick25   => tick_25_mhz ,
    hsync    => vga_hsync   ,
    vsync    => vga_vsync   ,
    video_on => video_on    ,
    pixel_x  => pixel_x     ,
    pixel_y  => pixel_y
  );
  ----------------------------------------------
  -- cross center controled by push buttons
  ----------------------------------------------
  center_ctrl : entity work.cross_center_controler
  port map (
    reset_n    => reset_n,
    clk        => clk_100,
    tick_20_hz => tick_20_hz,
    button_c   => button_c,
    button_u   => button_u,
    button_d   => button_d,
    button_l   => button_l,
    button_r   => button_r,
    center_dx  => center_dx,
    center_dy  => center_dy
  );
  ----------------------------------------------
	-- test pixel generation
	----------------------------------------------
	pixel_gen:process(reset_n,clk_100)
	 variable rgb : std_logic_vector(11 downto 0);
	begin
    if reset_n='0' then
      img_r <= "0000";
      img_g <= "0000";
      img_b <= "0000";
    elsif rising_edge(clk_100) then
			img_r <= "0000";
			img_g <= "0000";
			img_b <= "1111";
			if pixel_x+center_dx > 640/2-10 and pixel_x+center_dx < 640/2+10 then
				img_r <= "1111";
				img_g <= "0000";
				img_b <= "0000";
			end if;
			if pixel_y+center_dy > 480/2-10 and pixel_y+center_dy < 480/2+10 then
				img_r <= "1111";
				img_g <= "0000";
				img_b <= "0000";
			end if;
    end if;
	end process;

	----------------------------------------------
	-- final routing
	----------------------------------------------
	vga_r     <= img_r when video_on='1' else "0000";
	vga_g     <= img_g when video_on='1' else "0000";
	vga_b     <= img_b when video_on='1' else "0000";

end architecture;
