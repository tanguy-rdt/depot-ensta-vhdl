library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

package vga_constants is

  constant FRAME_WIDTH                    : natural := 640;
  constant FRAME_HEIGHT                   : natural := 480;
  --
  constant H_FRONT_PORCH                  : natural := 16;
  constant H_RETRACE_WIDTH                : natural := 96;
  constant H_BACK_PORCH                   : natural := 48;
  constant H_PERIOD                       : natural := 800;
  --
  constant V_FRONT_PORCH                  : natural := 33;
  constant V_BACK_PORCH                   : natural := 10;
  constant V_RETRACE_WIDTH                : natural := 2;
  constant V_PERIOD                       : natural := 525;

end package;
