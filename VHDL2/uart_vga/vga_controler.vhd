library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

entity vga_controler is
  port(
    clk, reset_n: in std_logic;
    pixel_x: out integer range 0 to 639;
    pixel_y: out integer range 0 to 479;
    h_sync, v_sync: out std_logic
    h_video_on, v_video_on: out std_logic;
  );
end entity;

architecture arch of vga_controler is
  signal pixel_x_cnt: integer range 0 to 847
  signal pixel_y_cnt: integer range 0 to 557

  constant X_INIT_INDEX: natural := 0
  constant X_LEFT_BORDER_INDEX: natural := 48
  constant X_DISPLAY_INDEX: natural := 640
  constant X_RIGHT_BORDER_FP_INDEX: natural := 16
  constant X_RETRACE_INDEX: natural := 96
  constant X_LEFT_BORDER_BP_INDEX: natural := 48

  constant Y_INIT_INDEX: natural := 0
  constant Y_TOP_BORDER_INDEX: natural := 33
  constant Y_DISPLAY_INDEX: natural := 480
  constant Y_BOTTOM_BORDER_FP_INDEX: natural := 10
  constant Y_RETRACE_INDEX: natural := 2
  constant Y_TOP_BORDER_BP_INDEX: natural := 33


  type x_state_t is (X_IDLE, X_LEFT_BORDER, X_DISPLAY, X_RIGHT_BORDER_FP, X_RETRACE, X_LEFT_BORDER_BP);
  type y_state_t is (Y_IDLE, Y_TOP_BORDER, Y_DISPLAY, Y_BOTTOM_BORDER_FP, Y_RETRACE, Y_TOP_BORDER_BP);

  signal x_state: x_state_t;
  signal y_state: y_state_t;

begin

  process(reset_n, clk, pixel_x_cnt, pixel_y_cnt)
  begin 
    if rising_edge(clk) then 
      pixel_x_cnt <= pixel_x_cnt + 1;
      pixel_y_cnt <= pixel_y_cnt + 1;
    elsif reset_n = '0' then 
      pixel_x_cnt <= 0;
      pixel_y_cnt <= 0;
      h_sync = '0';
      h_video_on = '0';
      v_sync = '0';
      v_video_on = '0';
      x_state = X_IDLE;
      y_state = Y_IDLE;
    end if;
  end process;

  process(reset_n, clk, pixel_x_cnt, x_state)
  begin 
    if rising_edge(clk) then 
      if (pixel_x_cnt => X_INIT_INDEX) and (pixel_x_cnt < X_LEFT_BORDER_INDEX) then 
        x_state <= X_IDLE;
      else if (pixel_x_cnt => X_LEFT_BORDER_INDEX) and (pixel_x_cnt < X_DISPLAY_INDEX) then 
        x_state <= X_LEFT_BORDER;
      else if (pixel_x_cnt => X_DISPLAY_INDEX) and (pixel_x_cnt < X_RIGHT_BORDER_FP_INDEX) then 
        x_state <= X_DISPLAY;
      else if (pixel_x_cnt => X_RIGHT_BORDER_FP_INDEX) and (pixel_x_cnt < X_RETRACE_INDEX) then 
        x_state <= X_RIGHT_BORDER_FP;
      else if (pixel_x_cnt => X_RETRACE_INDEX) and (pixel_x_cnt < X_LEFT_BORDER_BP_INDEX) then 
        x_state <= X_RETRACE;
      else if (pixel_x_cnt => X_LEFT_BORDER_BP_INDEX) then 
        x_state <= X_LEFT_BORDER_BP;
    end if;
  end process;

  process(reset_n, clk, pixel_y_cnt, y_state)
  begin 
    if rising_edge(clk) then 
      if (pixel_y_cnt => Y_INIT_INDEX) and (pixel_y_cnt < Y_TOP_BORDER_INDEX) then 
        y_state <= Y_IDLE;
      else if (pixel_y_cnt => Y_TOP_BORDER_INDEX) and (pixel_y_cnt < Y_DISPLAY_INDEX) then 
        y_state <= Y_TOP_BORDER;
      else if (pixel_y_cnt => Y_DISPLAY_INDEX) and (pixel_y_cnt < Y_BOTTOM_BORDER_FP_INDEX) then 
        y_state <= Y_DISPLAY;
      else if (pixel_y_cnt => Y_BOTTOM_BORDER_FP_INDEX) and (pixel_y_cnt < Y_RETRACE_INDEX) then 
        y_state <= Y_BOTTOM_BORDER_FP;
      else if (pixel_y_cnt => Y_RETRACE_INDEX) and (pixel_y_cnt < Y_TOP_BORDER_BP_INDEX) then 
        y_state <= Y_RETRACE;
      else if (pixel_y_cnt => Y_TOP_BORDER_BP_INDEX) then 
        y_state <= Y_TOP_BORDER_BP;
    end if;
  end process;

  state_x: process(x_state, pixel_x_cnt)
  begin
    case x_state is 
      when X_IDLE =>
        h_sync     <= '0';
        h_video_on <= '0';
        pixel_x    <= 0;
      when X_LEFT_BORDER =>
        h_sync     <= '1';
        h_video_on <= '0';
        pixel_x    <= 0;
      when X_DISPLAY => 
        h_sync     <= '1';
        h_video_on <= '1';
        pixel_x    <= pixel_x_cnt - X_INIT_INDEX - X_LEFT_BORDER_INDEX;
      when X_RIGHT_BORDER_FP => 
        h_sync     <= '1';
        h_video_on <= '0';
        pixel_x    <= 639;
      when X_RETRACE => 
        h_sync     <= '0';
        h_video_on <= '0';
        pixel_x    <= 639;
      when X_LEFT_BORDER_BP => 
        h_sync     <= '1';
        h_video_on <= '0';
        pixel_x    <= 639;
      when others =>
        null;
    end case 
  end process

  state_y: process(y_state)
  begin
    case y_state is 
      when Y_IDLE =>
        v_sync     <= '0';
        v_video_on <= '0';
        pixel_y    <= 0;
      when Y_TOP_BORDER =>
        v_sync     <= '1';
        v_video_on <= '0';
        pixel_y    <= 0;
      when Y_DISPLAY => 
        v_sync     <= '1';
        v_video_on <= '1';
        pixel_y    <= pixel_y_cnt - Y_INIT_INDEX - Y_TOP_BORDER_INDEX;
      when Y_BOTTOM_BORDER_FP => 
        v_sync     <= '1';
        v_video_on <= '0';
        pixel_y    <= 479;
      when Y_RETRACE => 
        v_sync     <= '0';
        v_video_on <= '0';
        pixel_y    <= 479;
      when Y_TOP_BORDER_BP => 
        v_sync     <= '1';
        v_video_on <= '0';
        pixel_y    <= 479;
      when others =>
        null;
    end case 
  end process
end arch;
