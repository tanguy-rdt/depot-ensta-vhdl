--===================================================================
-- This file has been automatically generated by Synthae HLS Tool
-- Copyright Modae Technologies 2011
-- Generated : 03/05/2012 (D/M/Y) at 16:14:02PM 
-- Contact : jean-christophe.le_lann@modae-tech.com
-- ==================================================================
library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

entity FIFO is
  generic(size : natural :=4
  );
  port (
    reset_n : in  std_logic;
    clk     : in  std_logic;
    reset   : in  std_logic;
    push    : in  std_logic;
    din     : in  std_logic_vector(15 downto 0);
    pop     : in  std_logic; 
    dout    : out std_logic_vector(15 downto 0);
    empty   : out std_logic;
    full    : out std_logic;
    level   : out integer range 0 to 16);
end FIFO;

architecture DFF of FIFO is

  type reg_file_type is array(0 to size-1) of std_logic_vector(15 downto 0);
  signal array_reg : reg_file_type;
  signal level_i   : integer range 0 to size;

begin

  process (clk, reset_n)
  begin
    if reset_n = '0' then
      level_i <= 0;
      for i in 0 to size-1 loop 
        array_reg(i) <= (others=>'0');
      end loop;
    elsif (rising_edge(clk)) then
      if reset = '1' then
        level_i <= 0;
        for i in 0 to size-1 loop
          array_reg(i) <=  (others=>'0');
        end loop;
      else
        if push = '1' and level_i < size then
          array_reg(level_i) <= din;
          level_i            <= level_i + 1;
        end if;
        if pop = '1' and level_i > 0 then
          for i in 0 to size-2 loop
            array_reg(i) <= array_reg(i+1);
          end loop;
          array_reg(size-1) <= (others=>'0');
          level_i             <= level_i - 1;
        end if;
        if level_i < size and level_i > 0 then
          if push = '1' and pop = '1' then
            for i in 0 to size-2 loop
              array_reg(i) <= array_reg(i+1);
            end loop;
            array_reg(level_i) <= din;
            level_i             <= level_i;
          end if;
        end if;
      end if;
    end if;
  end process;
  
  dout  <= array_reg(0);
  empty <= '1' when (level_i = 0) else '0';
  --full  <= '1' when (level_i = size-1) else '0';
  level <= level_i;

end DFF;

