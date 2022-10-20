-- Copyright (C) 1991-2013 Altera Corporation
-- Your use of Altera Corporation's design tools, logic functions 
-- and other software and tools, and its AMPP partner logic 
-- functions, and any output files from any of the foregoing 
-- (including device programming or simulation files), and any 
-- associated documentation or information are expressly subject 
-- to the terms and conditions of the Altera Program License 
-- Subscription Agreement, Altera MegaCore Function License 
-- Agreement, or other applicable license agreement, including, 
-- without limitation, that your use is for the sole purpose of 
-- programming logic devices manufactured by Altera and sold by 
-- Altera or its authorized distributors.  Please refer to the 
-- applicable agreement for further details.

-- ***************************************************************************
-- This file contains a Vhdl test bench template that is freely editable to   
-- suit user's needs .Comments are provided in each section to help the user  
-- fill out necessary details.                                                
-- ***************************************************************************
-- Generated on "04/18/2014 10:56:39"
                                                            
-- Vhdl Test Bench template for design  :  FIFO
-- 
-- Simulation tool : ModelSim-Altera (VHDL)
-- 

LIBRARY ieee;                                               
USE ieee.std_logic_1164.all;   
USE ieee.numeric_std.all;                             

ENTITY FIFO_tst IS
END FIFO_tst;

ARCHITECTURE test_archi OF FIFO_tst IS
-- constants                                                 
-- signals                                                   
SIGNAL clk : STD_LOGIC :='0';
SIGNAL din : STD_LOGIC_VECTOR(15 DOWNTO 0);
SIGNAL dout : STD_LOGIC_VECTOR(15 DOWNTO 0);
SIGNAL empty : STD_LOGIC;
SIGNAL full : STD_LOGIC;
SIGNAL level : integer range 0 to 16;
SIGNAL pop : STD_LOGIC ;
SIGNAL push : STD_LOGIC;
SIGNAL reset : STD_LOGIC;
SIGNAL reset_n : STD_LOGIC;
signal running  : boolean :=true;
constant HALF_PERIOD : time := 10 ns;

BEGIN
	i1 : entity work.FIFO(dff)
	PORT MAP (
-- list connections between master ports and signals
	clk => clk,
	din => din,
	dout => dout,
	empty => empty,
	full => full,
	level => level,
	pop => pop,
	push => push,
	reset => reset,
	reset_n => reset_n
	);
---Clock and reset generation
	clk <= not(clk) after HALF_PERIOD when running else '0';
	reset_n <= '0', '1' after 65 ns;
	reset <= '0';
	pop <= '0', '1' after 100 ns;
chargt: process
variable i : integer range 0 to 16;
begin
wait until reset_n ='1';
push <= '1';
din <= X"000A";
wait until rising_edge(clk);
din <=  X"0001";
wait until rising_edge(clk);
din <= 	X"0002";
wait until rising_edge(clk);
din <= 	X"0003";
wait until rising_edge(clk);
din <= 	X"0004";
wait until rising_edge(clk);
din <= 	X"0005";
wait until rising_edge(clk);
din <= 	X"0006";
wait until rising_edge(clk);
din <= 	X"0007";
wait until rising_edge(clk);
din <= 	X"0008";
wait until rising_edge(clk);
din <= 	X"0009";
wait until rising_edge(clk);
din <= 	X"000A";
for i in 0 to 10 loop
  wait until rising_edge(clk);
  din <= 	X"000F";
end loop;
i:=0;
for i in 0 to 3 loop
  wait until rising_edge(clk);
end loop;

running <= false;
wait;
end process;


end test_archi;




