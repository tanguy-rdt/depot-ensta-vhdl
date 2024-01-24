--------------------------------------------------------------------------------
-- this file was generated automatically by Vertigo Ruby utility
-- date : (d/m/y h:m) 08/11/2023 11:40
-- author : Jean-Christophe Le Lann - 2014
--------------------------------------------------------------------------------
 
library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;
 
entity lut_tb is
end entity;
 
architecture bhv of lut_tb is
  constant HALF_PERIOD : time :=5 ns;
 
  signal clk : std_logic := '0';
  signal reset_n : std_logic := '0';
 
  signal running : boolean := true;
 
  procedure wait_cycles(n : natural) is 
  begin
    for i in 0 to n-1 loop
      wait until rising_edge(clk);
    end loop;
  end procedure;
 
  procedure toggle(signal s : inout std_logic) is
  begin
    wait until rising_edge(clk);
    s <=not(s);
    wait until rising_edge(clk);
    s <=not(s);
  end procedure;
 
  signal push     : std_logic;
  signal bitsream : std_logic;
  signal a        : std_logic;
  signal b        : std_logic;
  signal f        : std_logic;
begin
  --------------------------------------------------------------------------------
  -- clock and reset
  --------------------------------------------------------------------------------
  reset_n <= '0','1' after 123 ns;
   
  clk <= not(clk) after HALF_PERIOD when running else clk;
  --------------------------------------------------------------------------------
  -- Design Under Test
  --------------------------------------------------------------------------------
  dut : entity work.lut(arch)
    port map (
      push     => push    ,
      clk      => clk     ,
      reset_n  => reset_n ,
      bitsream => bitsream,
      a        => a       ,
      b        => b       ,
      f        => f       
    );
  --------------------------------------------------------------------------------
  -- sequential stimuli
  --------------------------------------------------------------------------------
  stim : process
  begin
    report "running testbench for lut(arch)";
    report "waiting for asynchronous reset";
    wait until reset_n='1';
    wait_cycles(10);

    push <= '1';
    wait_cycles(1);
    bitsream <= '0';
    wait_cycles(1);
    bitsream <= '1';
    wait_cycles(1);
    bitsream <= '1';
    wait_cycles(1);
    bitsream <= '0';
    wait_cycles(1);
    push <= '0';
    wait_cycles(5);

    report "testing f (should be a xor b)";

    wait_cycles(1);
    a <= '0';
    b <= '0';
    if (a xor b) = f then
      report "the result for a='0' and b='0' is 0, F=a xor b (bitstream 0110)";
    else 
      report "error: a='0' and b='0'";
    end if;

    wait_cycles(1);
    a <= '0';
    b <= '1';
    if (a xor b) = f then
      report "the result for a='0' and b='1' is 1, F=a xor b (bitstream 0110)";
    else 
      report "error: a='0' and b='1'";
    end if;

    wait_cycles(1);
    a <= '1';
    b <= '0';
    if (a xor b) = f then
      report "the result for a='1' and b='0' is 1, F=a xor b (bitstream 0110)";
    else 
      report "error: a='1' and b='0'";
    end if;

    wait_cycles(1);
    a <= '1';
    b <= '1';
    if (a xor b) /= f then
      report "the result for a='1' and b='1' is 0, F=a xor b (bitstream 0110)";
    else 
      report "error: a='1' and b='1'";
    end if;

    wait_cycles(200);
    report "end of simulation";
    running <= false;
    wait;
  end process;
end bhv;
