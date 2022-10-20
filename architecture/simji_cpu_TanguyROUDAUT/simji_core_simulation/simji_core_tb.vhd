-- Tanguy ROUDAUT FIPASE24

library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

entity simji_core_tb is
end entity;

architecture behavior of simji_core_tb is
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

  signal instr       : std_logic_vector(31 downto 0);
  signal data        : std_logic_vector(31 downto 0);
  
  type addr_instr_paire is record
    addr    : std_logic_vector(31 downto 0);
    instr   : std_logic_vector(31 downto 0);
  end record;

  
  type program_t is array(natural range <>) of addr_instr_paire;

  -- partie de gauche, à l'itération x -- partie droite, instruction
  constant program : program_t := (
    (x"00000000", x"08200021"),
-- 31 30 29 28 27 | 26 25 24 23 22 |    21    | 20 19 18 17 16 15 14 13 12 11 10 9 8 7 6 5 | 4 3 2 1 0
-- 0  0  0  0  1  | 0  0  0  0  0  |    1     | 0  0  0  0  0  0  0  0  0  0  0  0 0 0 0 1 | 0 0 0 0 1
---    addition    |     alpha      | immo_flg |                imm_o                       |    beta    
-- 0+1=1

    (x"00000001", x"08600022"),
-- 31 30 29 28 27 | 26 25 24 23 22 |    21    | 20 19 18 17 16 15 14 13 12 11 10 9 8 7 6 5 | 4 3 2 1 0
-- 0  0  0  0  1  | 0  0  0  0  1  |    1     | 0  0  0  0  0  0  0  0  0  0  0  0 0 0 0 1 | 0 0 0 1 0
--    addition    |     alpha      | immo_flg |                imm_o                       |    beta    
-- 1+1=2
      
    (x"00000002", x"10a00083"),
-- 31 30 29 28 27 | 26 25 24 23 22 |    21    | 20 19 18 17 16 15 14 13 12 11 10 9 8 7 6 5 | 4 3 2 1 0
-- 0  0  0  1  0  | 0  0  0  1  0  |    1     | 0  0  0  0  0  0  0  0  0  0  0  0 0 1 0 0 | 0 0 0 1 1
--  substraction  |     alpha      | immo_flg |                imm_o                       |    beta    
-- 2-4=-2
      
    (x"00000003", x"18e00044"),
-- 31 30 29 28 27 | 26 25 24 23 22 |    21    | 20 19 18 17 16 15 14 13 12 11 10 9 8 7 6 5 | 4 3 2 1 0
-- 0  0  0  1  1  | 0  0  0  1  1  |    1     | 0  0  0  0  0  0  0  0  0  0  0  0 0 0 1 0 | 0 0 1 0 0
-- multiplication |     alpha      | immo_flg |                imm_o                       |    beta    
-- -2*2=-4

    (x"00000001", x"21200045"),
-- 31 30 29 28 27 | 26 25 24 23 22 |    21    | 20 19 18 17 16 15 14 13 12 11 10 9 8 7 6 5 | 4 3 2 1 0
-- 0  0  1  0  0  | 0  0  1  0  0  |    1     | 0  0  0  0  0  0  0  0  0  0  0  0 0 0 1 0 | 0 0 1 0 1
--    division    |     alpha      | immo_flg |                imm_o                       |    beta    
-- -4/2=-2

    (x"00000003", x"197fffa6"),
-- 31 30 29 28 27 | 26 25 24 23 22 |    21    | 20 19 18 17 16 15 14 13 12 11 10 9 8 7 6 5 | 4 3 2 1 0
-- 0  0  0  1  1  | 0  0  1  0  1  |    1     | 1  1  1  1  1  1  1  1  1  1  1  1 1 1 0 1 | 0 0 1 1 0
-- multiplication |     alpha      | immo_flg |                imm_o                       |    beta    
-- -2*-3=6

    (x"00000001", x"29a00047"),
-- 31 30 29 28 27 | 26 25 24 23 22 |    21    | 20 19 18 17 16 15 14 13 12 11 10 9 8 7 6 5 | 4 3 2 1 0
-- 0  0  1  0  1  | 0  0  1  1  0  |    1     | 0  0  0  0  0  0  0  0  0  0  0  0 0 0 1 0 | 0 0 1 1 1
--       and      |     alpha      | immo_flg |                imm_o                       |    beta    
-- 0x00000006 and 0x00000002 = 0x00000002

    (x"00000001", x"31e00168"),
-- 31 30 29 28 27 | 26 25 24 23 22 |    21    | 20 19 18 17 16 15 14 13 12 11 10 9 8 7 6 5 | 4 3 2 1 0
-- 0  0  1  1  0  | 0  0  1  1  1  |    1     | 0  0  0  0  0  0  0  0  0  0  0  0 1 0 1 1 | 0 1 0 0 0
--       or       |     alpha      | immo_flg |                imm_o                       |    beta    
-- 0x00000002 or 0x0000000b = 0x0000000b

    (x"00000001", x"3a200069")
-- 31 30 29 28 27 | 26 25 24 23 22 |    21    | 20 19 18 17 16 15 14 13 12 11 10 9 8 7 6 5 | 4 3 2 1 0
-- 0  0  1  1  1  | 0  1  0  0  0  |    1     | 0  0  0  0  0  0  0  0  0  0  0  0 0 0 1 1 | 0 1 0 0 1
--       xor      |     alpha      | immo_flg |                imm_o                       |    beta    
-- 0x0000000b xor 0x00000003 = 0x00000008

  );
  
begin
  --------------------------------------------------------------------------------
  -- clock and reset
  --------------------------------------------------------------------------------
  reset_n <= '0','1' after 56 ns;
  clk <= not(clk) after HALF_PERIOD when running else clk;

  --------------------------------------------------------------------------------
  -- Design Under Test
  --------------------------------------------------------------------------------
  dut : entity work.simji_core
    port map (
      reset_n        => reset_n,
      clk            => clk,
      instr_in       => instr, 
      data_in        => data
    );


  --------------------------------------------------------------------------------
  -- sequential stimuli
  --------------------------------------------------------------------------------
  stim : process
  begin
    report "running testbench for simji_core(version_0)";
    report "waiting for asynchronous reset";
    instr       <= (others => '0');
    wait until reset_n='1';
    wait_cycles(5);

    for i in 0 to program'length-1 loop -- pour chaque instruction 
      wait until rising_edge(clk);
      report "executing instruction " & integer'image(i);
      instr       <=  program(i).instr; -- on donne l'instruction i
    end loop;

    wait until rising_edge(clk);
    instr       <= (others => '0');

    wait_cycles(5);
    report "end of simulation";
    running <= false;
    wait;
  end process;
end behavior;
