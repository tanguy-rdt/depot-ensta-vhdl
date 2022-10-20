--------------------------------------------------------------------------------
-- this file was generated automatically by Vertigo Ruby utility
-- date : (d/m/y h:m) 16/12/2020  9:16
-- author : Jean-Christophe Le Lann - 2014
--------------------------------------------------------------------------------

library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

entity datapath_tb is
end entity;

architecture bhv of datapath_tb is
  constant HALF_PERIOD : time :=5 ns;

  signal clk : std_logic := '0';
  signal reset_n : std_logic := '0';

  signal running : boolean := true;

  procedure wait_cycles(n : natural) is
  begin
    for i in 0 to n loop
      wait until rising_edge(clk);
    end loop;
  end procedure;

  signal in1       : std_logic_vector(31 downto 0);
  signal mode      : std_logic_vector(1 downto 0);
  signal load_reg  : std_logic_vector(1 downto 0);
  signal opcode    : std_logic;
  signal src1      : std_logic_vector(1 downto 0);
  signal src2      : std_logic_vector(1 downto 0);
  signal dest      : std_logic_vector(1 downto 0);
  signal f         : std_logic_vector(31 downto 0);
begin
  --------------------------------------------------------------------------------
  -- clock and reset
  --------------------------------------------------------------------------------
  reset_n <= '0','1' after 666 ns;

  clk <= not(clk) after HALF_PERIOD when running else clk;
  --------------------------------------------------------------------------------
  -- Design Under Test
  --------------------------------------------------------------------------------
  dut : entity work.datapath(arch)
    port map (
      reset_n   => reset_n ,
      clk       => clk     ,
      in1       => in1     ,
      mode      => mode,
      load_reg  => load_reg,
      opcode    => opcode  ,
      src1      => src1    ,
      src2      => src2    ,
      dest      => dest    ,
      f         => f       );
  --------------------------------------------------------------------------------
  -- sequential stimuli
  --------------------------------------------------------------------------------
  stim : process
  begin
    mode <= "00";
    load_reg <= "00";
    report "running testbench for datapath(arch)";
    report "waiting for asynchronous reset";
    wait until reset_n='1';
    wait_cycles(10);
    -- load 42 in reg 1
    mode <= "01";
    load_reg <= "01";
    in1      <= std_logic_vector(to_unsigned(42,32));
    wait_cycles(1);
    mode <= "00";
    wait_cycles(10);

    -- load 27 in reg 3
    mode <= "01";
    load_reg <= "11";
    in1      <= std_logic_vector(to_unsigned(27,32));
    wait_cycles(1);
    mode <= "00";
    wait_cycles(10);

    -- lets do a * between r1 and r3 and store in r2 :
    -- ADD R2,R1,R3   (r2 := r1 mul r3)
    mode <= "10"; -- run
    src1 <= "01";
    src2 <= "11";
    dest <= "10";
    wait_cycles(1);
    mode <= "00";

    wait_cycles(10);
    report "end of simulation";
    running <= false;
    wait;
  end process;
end bhv;
