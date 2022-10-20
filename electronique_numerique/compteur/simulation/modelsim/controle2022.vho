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

-- VENDOR "Altera"
-- PROGRAM "Quartus II 64-Bit"
-- VERSION "Version 13.0.0 Build 156 04/24/2013 SJ Full Version"

-- DATE "06/03/2022 08:25:40"

-- 
-- Device: Altera EP2C35F672C6 Package FBGA672
-- 

-- 
-- This VHDL file should be used for ModelSim-Altera (VHDL) only
-- 

LIBRARY CYCLONEII;
LIBRARY IEEE;
USE CYCLONEII.CYCLONEII_COMPONENTS.ALL;
USE IEEE.STD_LOGIC_1164.ALL;

ENTITY 	controle2022 IS
    PORT (
	clk : IN std_logic;
	reset : IN std_logic;
	bp : IN std_logic;
	ten_seg : OUT std_logic_vector(6 DOWNTO 0);
	one_seg : OUT std_logic_vector(6 DOWNTO 0)
	);
END controle2022;

-- Design Ports Information
-- ten_seg[0]	=>  Location: PIN_AB24,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: 24mA
-- ten_seg[1]	=>  Location: PIN_AA23,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: 24mA
-- ten_seg[2]	=>  Location: PIN_AA24,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: 24mA
-- ten_seg[3]	=>  Location: PIN_Y22,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: 24mA
-- ten_seg[4]	=>  Location: PIN_W21,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: 24mA
-- ten_seg[5]	=>  Location: PIN_V21,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: 24mA
-- ten_seg[6]	=>  Location: PIN_V20,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: 24mA
-- one_seg[0]	=>  Location: PIN_V13,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: 24mA
-- one_seg[1]	=>  Location: PIN_V14,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: 24mA
-- one_seg[2]	=>  Location: PIN_AE11,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: 24mA
-- one_seg[3]	=>  Location: PIN_AD11,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: 24mA
-- one_seg[4]	=>  Location: PIN_AC12,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: 24mA
-- one_seg[5]	=>  Location: PIN_AB12,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: 24mA
-- one_seg[6]	=>  Location: PIN_AF10,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: 24mA
-- clk	=>  Location: PIN_N2,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: Default
-- bp	=>  Location: PIN_N23,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: Default
-- reset	=>  Location: PIN_G26,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: Default


ARCHITECTURE structure OF controle2022 IS
SIGNAL gnd : std_logic := '0';
SIGNAL vcc : std_logic := '1';
SIGNAL unknown : std_logic := 'X';
SIGNAL devoe : std_logic := '1';
SIGNAL devclrn : std_logic := '1';
SIGNAL devpor : std_logic := '1';
SIGNAL ww_devoe : std_logic;
SIGNAL ww_devclrn : std_logic;
SIGNAL ww_devpor : std_logic;
SIGNAL ww_clk : std_logic;
SIGNAL ww_reset : std_logic;
SIGNAL ww_bp : std_logic;
SIGNAL ww_ten_seg : std_logic_vector(6 DOWNTO 0);
SIGNAL ww_one_seg : std_logic_vector(6 DOWNTO 0);
SIGNAL \clk~clkctrl_INCLK_bus\ : std_logic_vector(3 DOWNTO 0);
SIGNAL \PRESCALER[0]~26_combout\ : std_logic;
SIGNAL \PRESCALER[5]~37_combout\ : std_logic;
SIGNAL \PRESCALER[18]~63_combout\ : std_logic;
SIGNAL \PRESCALER[24]~76\ : std_logic;
SIGNAL \PRESCALER[25]~77_combout\ : std_logic;
SIGNAL \Selector7~0_combout\ : std_logic;
SIGNAL \Add1~0_combout\ : std_logic;
SIGNAL \Selector5~3_combout\ : std_logic;
SIGNAL \Selector4~0_combout\ : std_logic;
SIGNAL \Selector4~1_combout\ : std_logic;
SIGNAL \Selector4~2_combout\ : std_logic;
SIGNAL \Add3~0_combout\ : std_logic;
SIGNAL \unit4[2]~2_combout\ : std_logic;
SIGNAL \Add2~0_combout\ : std_logic;
SIGNAL \Equal0~3_combout\ : std_logic;
SIGNAL \clk~combout\ : std_logic;
SIGNAL \clk~clkctrl_outclk\ : std_logic;
SIGNAL \my_state.S1~feeder_combout\ : std_logic;
SIGNAL \reset~combout\ : std_logic;
SIGNAL \PRESCALER[0]~27\ : std_logic;
SIGNAL \PRESCALER[1]~29_combout\ : std_logic;
SIGNAL \Equal0~2_combout\ : std_logic;
SIGNAL \PRESCALER[7]~41_combout\ : std_logic;
SIGNAL \Equal0~1_combout\ : std_logic;
SIGNAL \PRESCALER[3]~33_combout\ : std_logic;
SIGNAL \PRESCALER[2]~31_combout\ : std_logic;
SIGNAL \Equal0~0_combout\ : std_logic;
SIGNAL \Equal0~4_combout\ : std_logic;
SIGNAL \PRESCALER[7]~28_combout\ : std_logic;
SIGNAL \PRESCALER[1]~30\ : std_logic;
SIGNAL \PRESCALER[2]~32\ : std_logic;
SIGNAL \PRESCALER[3]~34\ : std_logic;
SIGNAL \PRESCALER[4]~35_combout\ : std_logic;
SIGNAL \PRESCALER[4]~36\ : std_logic;
SIGNAL \PRESCALER[5]~38\ : std_logic;
SIGNAL \PRESCALER[6]~39_combout\ : std_logic;
SIGNAL \PRESCALER[6]~40\ : std_logic;
SIGNAL \PRESCALER[7]~42\ : std_logic;
SIGNAL \PRESCALER[8]~43_combout\ : std_logic;
SIGNAL \PRESCALER[8]~44\ : std_logic;
SIGNAL \PRESCALER[9]~45_combout\ : std_logic;
SIGNAL \PRESCALER[9]~46\ : std_logic;
SIGNAL \PRESCALER[10]~47_combout\ : std_logic;
SIGNAL \PRESCALER[10]~48\ : std_logic;
SIGNAL \PRESCALER[11]~49_combout\ : std_logic;
SIGNAL \PRESCALER[11]~50\ : std_logic;
SIGNAL \PRESCALER[12]~51_combout\ : std_logic;
SIGNAL \PRESCALER[12]~52\ : std_logic;
SIGNAL \PRESCALER[13]~53_combout\ : std_logic;
SIGNAL \PRESCALER[13]~54\ : std_logic;
SIGNAL \PRESCALER[14]~55_combout\ : std_logic;
SIGNAL \PRESCALER[14]~56\ : std_logic;
SIGNAL \PRESCALER[15]~57_combout\ : std_logic;
SIGNAL \PRESCALER[15]~58\ : std_logic;
SIGNAL \PRESCALER[16]~59_combout\ : std_logic;
SIGNAL \PRESCALER[16]~60\ : std_logic;
SIGNAL \PRESCALER[17]~61_combout\ : std_logic;
SIGNAL \PRESCALER[17]~62\ : std_logic;
SIGNAL \PRESCALER[18]~64\ : std_logic;
SIGNAL \PRESCALER[19]~66\ : std_logic;
SIGNAL \PRESCALER[20]~67_combout\ : std_logic;
SIGNAL \PRESCALER[20]~68\ : std_logic;
SIGNAL \PRESCALER[21]~69_combout\ : std_logic;
SIGNAL \PRESCALER[21]~70\ : std_logic;
SIGNAL \PRESCALER[22]~71_combout\ : std_logic;
SIGNAL \PRESCALER[22]~72\ : std_logic;
SIGNAL \PRESCALER[23]~73_combout\ : std_logic;
SIGNAL \Equal0~6_combout\ : std_logic;
SIGNAL \PRESCALER[23]~74\ : std_logic;
SIGNAL \PRESCALER[24]~75_combout\ : std_logic;
SIGNAL \PRESCALER[19]~65_combout\ : std_logic;
SIGNAL \Equal0~5_combout\ : std_logic;
SIGNAL \Equal0~7_combout\ : std_logic;
SIGNAL \Equal0~8_combout\ : std_logic;
SIGNAL \cnt_one_enable~regout\ : std_logic;
SIGNAL \my_state.S1~regout\ : std_logic;
SIGNAL \Selector3~0_combout\ : std_logic;
SIGNAL \Add4~0_combout\ : std_logic;
SIGNAL \bp~combout\ : std_logic;
SIGNAL \my_state.S3~0_combout\ : std_logic;
SIGNAL \my_state.S3~regout\ : std_logic;
SIGNAL \unit4[1]~1_combout\ : std_logic;
SIGNAL \my_state.S2~regout\ : std_logic;
SIGNAL \unit4[3]~0_combout\ : std_logic;
SIGNAL \Add4~2_combout\ : std_logic;
SIGNAL \unit4[3]~4_combout\ : std_logic;
SIGNAL \Equal4~0_combout\ : std_logic;
SIGNAL \Selector4~3_combout\ : std_logic;
SIGNAL \Equal2~0_combout\ : std_logic;
SIGNAL \Selector6~3_combout\ : std_logic;
SIGNAL \Selector5~0_combout\ : std_logic;
SIGNAL \Selector4~4_combout\ : std_logic;
SIGNAL \Selector7~1_combout\ : std_logic;
SIGNAL \Selector5~1_combout\ : std_logic;
SIGNAL \Selector5~2_combout\ : std_logic;
SIGNAL \Selector5~4_combout\ : std_logic;
SIGNAL \P2~0_combout\ : std_logic;
SIGNAL \Selector6~0_combout\ : std_logic;
SIGNAL \P2~1_combout\ : std_logic;
SIGNAL \Selector6~1_combout\ : std_logic;
SIGNAL \Selector6~2_combout\ : std_logic;
SIGNAL \Selector6~4_combout\ : std_logic;
SIGNAL \Mux13~0_combout\ : std_logic;
SIGNAL \Mux12~0_combout\ : std_logic;
SIGNAL \Mux11~0_combout\ : std_logic;
SIGNAL \Mux10~0_combout\ : std_logic;
SIGNAL \Mux9~0_combout\ : std_logic;
SIGNAL \Mux8~0_combout\ : std_logic;
SIGNAL \Mux7~0_combout\ : std_logic;
SIGNAL \Add4~1_combout\ : std_logic;
SIGNAL \unit4[2]~3_combout\ : std_logic;
SIGNAL \Mux6~0_combout\ : std_logic;
SIGNAL \Mux5~0_combout\ : std_logic;
SIGNAL \Mux4~0_combout\ : std_logic;
SIGNAL \Mux3~0_combout\ : std_logic;
SIGNAL \Mux2~0_combout\ : std_logic;
SIGNAL \Mux1~0_combout\ : std_logic;
SIGNAL \Mux0~0_combout\ : std_logic;
SIGNAL unit4 : std_logic_vector(3 DOWNTO 0);
SIGNAL diz4 : std_logic_vector(3 DOWNTO 0);
SIGNAL PRESCALER : std_logic_vector(25 DOWNTO 0);
SIGNAL \ALT_INV_reset~combout\ : std_logic;
SIGNAL \ALT_INV_Mux6~0_combout\ : std_logic;
SIGNAL \ALT_INV_Mux13~0_combout\ : std_logic;

BEGIN

ww_clk <= clk;
ww_reset <= reset;
ww_bp <= bp;
ten_seg <= ww_ten_seg;
one_seg <= ww_one_seg;
ww_devoe <= devoe;
ww_devclrn <= devclrn;
ww_devpor <= devpor;

\clk~clkctrl_INCLK_bus\ <= (gnd & gnd & gnd & \clk~combout\);
\ALT_INV_reset~combout\ <= NOT \reset~combout\;
\ALT_INV_Mux6~0_combout\ <= NOT \Mux6~0_combout\;
\ALT_INV_Mux13~0_combout\ <= NOT \Mux13~0_combout\;

-- Location: LCFF_X58_Y7_N7
\PRESCALER[0]\ : cycloneii_lcell_ff
PORT MAP (
	clk => \clk~clkctrl_outclk\,
	datain => \PRESCALER[0]~26_combout\,
	sclr => \PRESCALER[7]~28_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	regout => PRESCALER(0));

-- Location: LCFF_X58_Y7_N17
\PRESCALER[5]\ : cycloneii_lcell_ff
PORT MAP (
	clk => \clk~clkctrl_outclk\,
	datain => \PRESCALER[5]~37_combout\,
	sclr => \PRESCALER[7]~28_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	regout => PRESCALER(5));

-- Location: LCFF_X58_Y6_N11
\PRESCALER[18]\ : cycloneii_lcell_ff
PORT MAP (
	clk => \clk~clkctrl_outclk\,
	datain => \PRESCALER[18]~63_combout\,
	sclr => \PRESCALER[7]~28_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	regout => PRESCALER(18));

-- Location: LCFF_X58_Y6_N25
\PRESCALER[25]\ : cycloneii_lcell_ff
PORT MAP (
	clk => \clk~clkctrl_outclk\,
	datain => \PRESCALER[25]~77_combout\,
	sclr => \PRESCALER[7]~28_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	regout => PRESCALER(25));

-- Location: LCCOMB_X58_Y7_N6
\PRESCALER[0]~26\ : cycloneii_lcell_comb
-- Equation(s):
-- \PRESCALER[0]~26_combout\ = PRESCALER(0) $ (VCC)
-- \PRESCALER[0]~27\ = CARRY(PRESCALER(0))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0101010110101010",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => PRESCALER(0),
	datad => VCC,
	combout => \PRESCALER[0]~26_combout\,
	cout => \PRESCALER[0]~27\);

-- Location: LCCOMB_X58_Y7_N16
\PRESCALER[5]~37\ : cycloneii_lcell_comb
-- Equation(s):
-- \PRESCALER[5]~37_combout\ = (PRESCALER(5) & (!\PRESCALER[4]~36\)) # (!PRESCALER(5) & ((\PRESCALER[4]~36\) # (GND)))
-- \PRESCALER[5]~38\ = CARRY((!\PRESCALER[4]~36\) # (!PRESCALER(5)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0101101001011111",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	dataa => PRESCALER(5),
	datad => VCC,
	cin => \PRESCALER[4]~36\,
	combout => \PRESCALER[5]~37_combout\,
	cout => \PRESCALER[5]~38\);

-- Location: LCCOMB_X58_Y6_N10
\PRESCALER[18]~63\ : cycloneii_lcell_comb
-- Equation(s):
-- \PRESCALER[18]~63_combout\ = (PRESCALER(18) & (\PRESCALER[17]~62\ $ (GND))) # (!PRESCALER(18) & (!\PRESCALER[17]~62\ & VCC))
-- \PRESCALER[18]~64\ = CARRY((PRESCALER(18) & !\PRESCALER[17]~62\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1010010100001010",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	dataa => PRESCALER(18),
	datad => VCC,
	cin => \PRESCALER[17]~62\,
	combout => \PRESCALER[18]~63_combout\,
	cout => \PRESCALER[18]~64\);

-- Location: LCCOMB_X58_Y6_N22
\PRESCALER[24]~75\ : cycloneii_lcell_comb
-- Equation(s):
-- \PRESCALER[24]~75_combout\ = (PRESCALER(24) & (\PRESCALER[23]~74\ $ (GND))) # (!PRESCALER(24) & (!\PRESCALER[23]~74\ & VCC))
-- \PRESCALER[24]~76\ = CARRY((PRESCALER(24) & !\PRESCALER[23]~74\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1100001100001100",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	datab => PRESCALER(24),
	datad => VCC,
	cin => \PRESCALER[23]~74\,
	combout => \PRESCALER[24]~75_combout\,
	cout => \PRESCALER[24]~76\);

-- Location: LCCOMB_X58_Y6_N24
\PRESCALER[25]~77\ : cycloneii_lcell_comb
-- Equation(s):
-- \PRESCALER[25]~77_combout\ = PRESCALER(25) $ (\PRESCALER[24]~76\)

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0101101001011010",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	dataa => PRESCALER(25),
	cin => \PRESCALER[24]~76\,
	combout => \PRESCALER[25]~77_combout\);

-- Location: LCCOMB_X60_Y7_N10
\Selector7~0\ : cycloneii_lcell_comb
-- Equation(s):
-- \Selector7~0_combout\ = (\my_state.S3~regout\ & (\Equal4~0_combout\ $ (!diz4(0))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1000100000100010",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \my_state.S3~regout\,
	datab => \Equal4~0_combout\,
	datad => diz4(0),
	combout => \Selector7~0_combout\);

-- Location: LCCOMB_X60_Y7_N22
\Add1~0\ : cycloneii_lcell_comb
-- Equation(s):
-- \Add1~0_combout\ = diz4(2) $ (((diz4(1) & diz4(0))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0101101011110000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => diz4(1),
	datac => diz4(2),
	datad => diz4(0),
	combout => \Add1~0_combout\);

-- Location: LCCOMB_X59_Y7_N8
\Selector5~3\ : cycloneii_lcell_comb
-- Equation(s):
-- \Selector5~3_combout\ = (\my_state.S2~regout\ & (\Add1~0_combout\ & (\cnt_one_enable~regout\ & !\Equal2~0_combout\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000000010000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \my_state.S2~regout\,
	datab => \Add1~0_combout\,
	datac => \cnt_one_enable~regout\,
	datad => \Equal2~0_combout\,
	combout => \Selector5~3_combout\);

-- Location: LCCOMB_X60_Y7_N28
\Selector4~0\ : cycloneii_lcell_comb
-- Equation(s):
-- \Selector4~0_combout\ = diz4(3) $ (((diz4(1) & (diz4(2) & diz4(0)))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0110110011001100",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => diz4(1),
	datab => diz4(3),
	datac => diz4(2),
	datad => diz4(0),
	combout => \Selector4~0_combout\);

-- Location: LCCOMB_X59_Y7_N26
\Selector4~1\ : cycloneii_lcell_comb
-- Equation(s):
-- \Selector4~1_combout\ = (\cnt_one_enable~regout\ & \my_state.S2~regout\)

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111000000000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datac => \cnt_one_enable~regout\,
	datad => \my_state.S2~regout\,
	combout => \Selector4~1_combout\);

-- Location: LCCOMB_X59_Y7_N20
\Selector4~2\ : cycloneii_lcell_comb
-- Equation(s):
-- \Selector4~2_combout\ = (!\Equal2~0_combout\ & (\Selector4~1_combout\ & (!\P2~1_combout\ & \Selector4~0_combout\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000010000000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \Equal2~0_combout\,
	datab => \Selector4~1_combout\,
	datac => \P2~1_combout\,
	datad => \Selector4~0_combout\,
	combout => \Selector4~2_combout\);

-- Location: LCCOMB_X60_Y7_N2
\Add3~0\ : cycloneii_lcell_comb
-- Equation(s):
-- \Add3~0_combout\ = diz4(3) $ (((diz4(1)) # ((diz4(2)) # (diz4(0)))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0011001100110110",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => diz4(1),
	datab => diz4(3),
	datac => diz4(2),
	datad => diz4(0),
	combout => \Add3~0_combout\);

-- Location: LCCOMB_X59_Y7_N10
\unit4[2]~2\ : cycloneii_lcell_comb
-- Equation(s):
-- \unit4[2]~2_combout\ = (\my_state.S2~regout\ & (unit4(2) $ (((unit4(1) & unit4(0))))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0110101000000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => unit4(2),
	datab => unit4(1),
	datac => unit4(0),
	datad => \my_state.S2~regout\,
	combout => \unit4[2]~2_combout\);

-- Location: LCCOMB_X59_Y7_N30
\Add2~0\ : cycloneii_lcell_comb
-- Equation(s):
-- \Add2~0_combout\ = unit4(3) $ (((unit4(2) & (unit4(0) & unit4(1)))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0110110011001100",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => unit4(2),
	datab => unit4(3),
	datac => unit4(0),
	datad => unit4(1),
	combout => \Add2~0_combout\);

-- Location: LCCOMB_X59_Y6_N12
\Equal0~3\ : cycloneii_lcell_comb
-- Equation(s):
-- \Equal0~3_combout\ = (PRESCALER(12)) # ((PRESCALER(15)) # ((PRESCALER(13)) # (PRESCALER(14))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111111111111110",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => PRESCALER(12),
	datab => PRESCALER(15),
	datac => PRESCALER(13),
	datad => PRESCALER(14),
	combout => \Equal0~3_combout\);

-- Location: PIN_N2,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: Default
\clk~I\ : cycloneii_io
-- pragma translate_off
GENERIC MAP (
	input_async_reset => "none",
	input_power_up => "low",
	input_register_mode => "none",
	input_sync_reset => "none",
	oe_async_reset => "none",
	oe_power_up => "low",
	oe_register_mode => "none",
	oe_sync_reset => "none",
	operation_mode => "input",
	output_async_reset => "none",
	output_power_up => "low",
	output_register_mode => "none",
	output_sync_reset => "none")
-- pragma translate_on
PORT MAP (
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	devoe => ww_devoe,
	oe => GND,
	padio => ww_clk,
	combout => \clk~combout\);

-- Location: CLKCTRL_G2
\clk~clkctrl\ : cycloneii_clkctrl
-- pragma translate_off
GENERIC MAP (
	clock_type => "global clock",
	ena_register_mode => "none")
-- pragma translate_on
PORT MAP (
	inclk => \clk~clkctrl_INCLK_bus\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	outclk => \clk~clkctrl_outclk\);

-- Location: LCCOMB_X59_Y6_N14
\my_state.S1~feeder\ : cycloneii_lcell_comb
-- Equation(s):
-- \my_state.S1~feeder_combout\ = VCC

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111111111111111",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	combout => \my_state.S1~feeder_combout\);

-- Location: PIN_G26,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: Default
\reset~I\ : cycloneii_io
-- pragma translate_off
GENERIC MAP (
	input_async_reset => "none",
	input_power_up => "low",
	input_register_mode => "none",
	input_sync_reset => "none",
	oe_async_reset => "none",
	oe_power_up => "low",
	oe_register_mode => "none",
	oe_sync_reset => "none",
	operation_mode => "input",
	output_async_reset => "none",
	output_power_up => "low",
	output_register_mode => "none",
	output_sync_reset => "none")
-- pragma translate_on
PORT MAP (
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	devoe => ww_devoe,
	oe => GND,
	padio => ww_reset,
	combout => \reset~combout\);

-- Location: LCCOMB_X58_Y7_N8
\PRESCALER[1]~29\ : cycloneii_lcell_comb
-- Equation(s):
-- \PRESCALER[1]~29_combout\ = (PRESCALER(1) & (!\PRESCALER[0]~27\)) # (!PRESCALER(1) & ((\PRESCALER[0]~27\) # (GND)))
-- \PRESCALER[1]~30\ = CARRY((!\PRESCALER[0]~27\) # (!PRESCALER(1)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0011110000111111",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	datab => PRESCALER(1),
	datad => VCC,
	cin => \PRESCALER[0]~27\,
	combout => \PRESCALER[1]~29_combout\,
	cout => \PRESCALER[1]~30\);

-- Location: LCCOMB_X58_Y7_N0
\Equal0~2\ : cycloneii_lcell_comb
-- Equation(s):
-- \Equal0~2_combout\ = (PRESCALER(9)) # ((PRESCALER(10)) # ((PRESCALER(8)) # (PRESCALER(11))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111111111111110",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => PRESCALER(9),
	datab => PRESCALER(10),
	datac => PRESCALER(8),
	datad => PRESCALER(11),
	combout => \Equal0~2_combout\);

-- Location: LCCOMB_X58_Y7_N20
\PRESCALER[7]~41\ : cycloneii_lcell_comb
-- Equation(s):
-- \PRESCALER[7]~41_combout\ = (PRESCALER(7) & (!\PRESCALER[6]~40\)) # (!PRESCALER(7) & ((\PRESCALER[6]~40\) # (GND)))
-- \PRESCALER[7]~42\ = CARRY((!\PRESCALER[6]~40\) # (!PRESCALER(7)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0101101001011111",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	dataa => PRESCALER(7),
	datad => VCC,
	cin => \PRESCALER[6]~40\,
	combout => \PRESCALER[7]~41_combout\,
	cout => \PRESCALER[7]~42\);

-- Location: LCFF_X58_Y7_N21
\PRESCALER[7]\ : cycloneii_lcell_ff
PORT MAP (
	clk => \clk~clkctrl_outclk\,
	datain => \PRESCALER[7]~41_combout\,
	sclr => \PRESCALER[7]~28_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	regout => PRESCALER(7));

-- Location: LCCOMB_X58_Y7_N2
\Equal0~1\ : cycloneii_lcell_comb
-- Equation(s):
-- \Equal0~1_combout\ = (PRESCALER(5)) # ((PRESCALER(4)) # ((PRESCALER(7)) # (PRESCALER(6))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111111111111110",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => PRESCALER(5),
	datab => PRESCALER(4),
	datac => PRESCALER(7),
	datad => PRESCALER(6),
	combout => \Equal0~1_combout\);

-- Location: LCCOMB_X58_Y7_N12
\PRESCALER[3]~33\ : cycloneii_lcell_comb
-- Equation(s):
-- \PRESCALER[3]~33_combout\ = (PRESCALER(3) & (!\PRESCALER[2]~32\)) # (!PRESCALER(3) & ((\PRESCALER[2]~32\) # (GND)))
-- \PRESCALER[3]~34\ = CARRY((!\PRESCALER[2]~32\) # (!PRESCALER(3)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0101101001011111",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	dataa => PRESCALER(3),
	datad => VCC,
	cin => \PRESCALER[2]~32\,
	combout => \PRESCALER[3]~33_combout\,
	cout => \PRESCALER[3]~34\);

-- Location: LCFF_X58_Y7_N13
\PRESCALER[3]\ : cycloneii_lcell_ff
PORT MAP (
	clk => \clk~clkctrl_outclk\,
	datain => \PRESCALER[3]~33_combout\,
	sclr => \PRESCALER[7]~28_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	regout => PRESCALER(3));

-- Location: LCCOMB_X58_Y7_N10
\PRESCALER[2]~31\ : cycloneii_lcell_comb
-- Equation(s):
-- \PRESCALER[2]~31_combout\ = (PRESCALER(2) & (\PRESCALER[1]~30\ $ (GND))) # (!PRESCALER(2) & (!\PRESCALER[1]~30\ & VCC))
-- \PRESCALER[2]~32\ = CARRY((PRESCALER(2) & !\PRESCALER[1]~30\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1010010100001010",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	dataa => PRESCALER(2),
	datad => VCC,
	cin => \PRESCALER[1]~30\,
	combout => \PRESCALER[2]~31_combout\,
	cout => \PRESCALER[2]~32\);

-- Location: LCFF_X58_Y7_N11
\PRESCALER[2]\ : cycloneii_lcell_ff
PORT MAP (
	clk => \clk~clkctrl_outclk\,
	datain => \PRESCALER[2]~31_combout\,
	sclr => \PRESCALER[7]~28_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	regout => PRESCALER(2));

-- Location: LCCOMB_X58_Y7_N4
\Equal0~0\ : cycloneii_lcell_comb
-- Equation(s):
-- \Equal0~0_combout\ = (PRESCALER(0)) # ((PRESCALER(3)) # ((PRESCALER(1)) # (PRESCALER(2))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111111111111110",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => PRESCALER(0),
	datab => PRESCALER(3),
	datac => PRESCALER(1),
	datad => PRESCALER(2),
	combout => \Equal0~0_combout\);

-- Location: LCCOMB_X59_Y6_N30
\Equal0~4\ : cycloneii_lcell_comb
-- Equation(s):
-- \Equal0~4_combout\ = (\Equal0~3_combout\) # ((\Equal0~2_combout\) # ((\Equal0~1_combout\) # (\Equal0~0_combout\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111111111111110",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \Equal0~3_combout\,
	datab => \Equal0~2_combout\,
	datac => \Equal0~1_combout\,
	datad => \Equal0~0_combout\,
	combout => \Equal0~4_combout\);

-- Location: LCCOMB_X59_Y6_N0
\PRESCALER[7]~28\ : cycloneii_lcell_comb
-- Equation(s):
-- \PRESCALER[7]~28_combout\ = ((!\Equal0~7_combout\ & !\Equal0~4_combout\)) # (!\reset~combout\)

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0101010101011111",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \reset~combout\,
	datac => \Equal0~7_combout\,
	datad => \Equal0~4_combout\,
	combout => \PRESCALER[7]~28_combout\);

-- Location: LCFF_X58_Y7_N9
\PRESCALER[1]\ : cycloneii_lcell_ff
PORT MAP (
	clk => \clk~clkctrl_outclk\,
	datain => \PRESCALER[1]~29_combout\,
	sclr => \PRESCALER[7]~28_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	regout => PRESCALER(1));

-- Location: LCCOMB_X58_Y7_N14
\PRESCALER[4]~35\ : cycloneii_lcell_comb
-- Equation(s):
-- \PRESCALER[4]~35_combout\ = (PRESCALER(4) & (\PRESCALER[3]~34\ $ (GND))) # (!PRESCALER(4) & (!\PRESCALER[3]~34\ & VCC))
-- \PRESCALER[4]~36\ = CARRY((PRESCALER(4) & !\PRESCALER[3]~34\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1100001100001100",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	datab => PRESCALER(4),
	datad => VCC,
	cin => \PRESCALER[3]~34\,
	combout => \PRESCALER[4]~35_combout\,
	cout => \PRESCALER[4]~36\);

-- Location: LCFF_X58_Y7_N15
\PRESCALER[4]\ : cycloneii_lcell_ff
PORT MAP (
	clk => \clk~clkctrl_outclk\,
	datain => \PRESCALER[4]~35_combout\,
	sclr => \PRESCALER[7]~28_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	regout => PRESCALER(4));

-- Location: LCCOMB_X58_Y7_N18
\PRESCALER[6]~39\ : cycloneii_lcell_comb
-- Equation(s):
-- \PRESCALER[6]~39_combout\ = (PRESCALER(6) & (\PRESCALER[5]~38\ $ (GND))) # (!PRESCALER(6) & (!\PRESCALER[5]~38\ & VCC))
-- \PRESCALER[6]~40\ = CARRY((PRESCALER(6) & !\PRESCALER[5]~38\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1100001100001100",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	datab => PRESCALER(6),
	datad => VCC,
	cin => \PRESCALER[5]~38\,
	combout => \PRESCALER[6]~39_combout\,
	cout => \PRESCALER[6]~40\);

-- Location: LCFF_X58_Y7_N19
\PRESCALER[6]\ : cycloneii_lcell_ff
PORT MAP (
	clk => \clk~clkctrl_outclk\,
	datain => \PRESCALER[6]~39_combout\,
	sclr => \PRESCALER[7]~28_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	regout => PRESCALER(6));

-- Location: LCCOMB_X58_Y7_N22
\PRESCALER[8]~43\ : cycloneii_lcell_comb
-- Equation(s):
-- \PRESCALER[8]~43_combout\ = (PRESCALER(8) & (\PRESCALER[7]~42\ $ (GND))) # (!PRESCALER(8) & (!\PRESCALER[7]~42\ & VCC))
-- \PRESCALER[8]~44\ = CARRY((PRESCALER(8) & !\PRESCALER[7]~42\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1100001100001100",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	datab => PRESCALER(8),
	datad => VCC,
	cin => \PRESCALER[7]~42\,
	combout => \PRESCALER[8]~43_combout\,
	cout => \PRESCALER[8]~44\);

-- Location: LCFF_X58_Y7_N23
\PRESCALER[8]\ : cycloneii_lcell_ff
PORT MAP (
	clk => \clk~clkctrl_outclk\,
	datain => \PRESCALER[8]~43_combout\,
	sclr => \PRESCALER[7]~28_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	regout => PRESCALER(8));

-- Location: LCCOMB_X58_Y7_N24
\PRESCALER[9]~45\ : cycloneii_lcell_comb
-- Equation(s):
-- \PRESCALER[9]~45_combout\ = (PRESCALER(9) & (!\PRESCALER[8]~44\)) # (!PRESCALER(9) & ((\PRESCALER[8]~44\) # (GND)))
-- \PRESCALER[9]~46\ = CARRY((!\PRESCALER[8]~44\) # (!PRESCALER(9)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0011110000111111",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	datab => PRESCALER(9),
	datad => VCC,
	cin => \PRESCALER[8]~44\,
	combout => \PRESCALER[9]~45_combout\,
	cout => \PRESCALER[9]~46\);

-- Location: LCFF_X58_Y7_N25
\PRESCALER[9]\ : cycloneii_lcell_ff
PORT MAP (
	clk => \clk~clkctrl_outclk\,
	datain => \PRESCALER[9]~45_combout\,
	sclr => \PRESCALER[7]~28_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	regout => PRESCALER(9));

-- Location: LCCOMB_X58_Y7_N26
\PRESCALER[10]~47\ : cycloneii_lcell_comb
-- Equation(s):
-- \PRESCALER[10]~47_combout\ = (PRESCALER(10) & (\PRESCALER[9]~46\ $ (GND))) # (!PRESCALER(10) & (!\PRESCALER[9]~46\ & VCC))
-- \PRESCALER[10]~48\ = CARRY((PRESCALER(10) & !\PRESCALER[9]~46\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1100001100001100",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	datab => PRESCALER(10),
	datad => VCC,
	cin => \PRESCALER[9]~46\,
	combout => \PRESCALER[10]~47_combout\,
	cout => \PRESCALER[10]~48\);

-- Location: LCFF_X58_Y7_N27
\PRESCALER[10]\ : cycloneii_lcell_ff
PORT MAP (
	clk => \clk~clkctrl_outclk\,
	datain => \PRESCALER[10]~47_combout\,
	sclr => \PRESCALER[7]~28_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	regout => PRESCALER(10));

-- Location: LCCOMB_X58_Y7_N28
\PRESCALER[11]~49\ : cycloneii_lcell_comb
-- Equation(s):
-- \PRESCALER[11]~49_combout\ = (PRESCALER(11) & (!\PRESCALER[10]~48\)) # (!PRESCALER(11) & ((\PRESCALER[10]~48\) # (GND)))
-- \PRESCALER[11]~50\ = CARRY((!\PRESCALER[10]~48\) # (!PRESCALER(11)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0011110000111111",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	datab => PRESCALER(11),
	datad => VCC,
	cin => \PRESCALER[10]~48\,
	combout => \PRESCALER[11]~49_combout\,
	cout => \PRESCALER[11]~50\);

-- Location: LCFF_X58_Y7_N29
\PRESCALER[11]\ : cycloneii_lcell_ff
PORT MAP (
	clk => \clk~clkctrl_outclk\,
	datain => \PRESCALER[11]~49_combout\,
	sclr => \PRESCALER[7]~28_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	regout => PRESCALER(11));

-- Location: LCCOMB_X58_Y7_N30
\PRESCALER[12]~51\ : cycloneii_lcell_comb
-- Equation(s):
-- \PRESCALER[12]~51_combout\ = (PRESCALER(12) & (\PRESCALER[11]~50\ $ (GND))) # (!PRESCALER(12) & (!\PRESCALER[11]~50\ & VCC))
-- \PRESCALER[12]~52\ = CARRY((PRESCALER(12) & !\PRESCALER[11]~50\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1100001100001100",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	datab => PRESCALER(12),
	datad => VCC,
	cin => \PRESCALER[11]~50\,
	combout => \PRESCALER[12]~51_combout\,
	cout => \PRESCALER[12]~52\);

-- Location: LCFF_X59_Y6_N25
\PRESCALER[12]\ : cycloneii_lcell_ff
PORT MAP (
	clk => \clk~clkctrl_outclk\,
	sdata => \PRESCALER[12]~51_combout\,
	sclr => \PRESCALER[7]~28_combout\,
	sload => VCC,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	regout => PRESCALER(12));

-- Location: LCCOMB_X58_Y6_N0
\PRESCALER[13]~53\ : cycloneii_lcell_comb
-- Equation(s):
-- \PRESCALER[13]~53_combout\ = (PRESCALER(13) & (!\PRESCALER[12]~52\)) # (!PRESCALER(13) & ((\PRESCALER[12]~52\) # (GND)))
-- \PRESCALER[13]~54\ = CARRY((!\PRESCALER[12]~52\) # (!PRESCALER(13)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0011110000111111",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	datab => PRESCALER(13),
	datad => VCC,
	cin => \PRESCALER[12]~52\,
	combout => \PRESCALER[13]~53_combout\,
	cout => \PRESCALER[13]~54\);

-- Location: LCFF_X58_Y6_N1
\PRESCALER[13]\ : cycloneii_lcell_ff
PORT MAP (
	clk => \clk~clkctrl_outclk\,
	datain => \PRESCALER[13]~53_combout\,
	sclr => \PRESCALER[7]~28_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	regout => PRESCALER(13));

-- Location: LCCOMB_X58_Y6_N2
\PRESCALER[14]~55\ : cycloneii_lcell_comb
-- Equation(s):
-- \PRESCALER[14]~55_combout\ = (PRESCALER(14) & (\PRESCALER[13]~54\ $ (GND))) # (!PRESCALER(14) & (!\PRESCALER[13]~54\ & VCC))
-- \PRESCALER[14]~56\ = CARRY((PRESCALER(14) & !\PRESCALER[13]~54\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1100001100001100",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	datab => PRESCALER(14),
	datad => VCC,
	cin => \PRESCALER[13]~54\,
	combout => \PRESCALER[14]~55_combout\,
	cout => \PRESCALER[14]~56\);

-- Location: LCFF_X58_Y6_N3
\PRESCALER[14]\ : cycloneii_lcell_ff
PORT MAP (
	clk => \clk~clkctrl_outclk\,
	datain => \PRESCALER[14]~55_combout\,
	sclr => \PRESCALER[7]~28_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	regout => PRESCALER(14));

-- Location: LCCOMB_X58_Y6_N4
\PRESCALER[15]~57\ : cycloneii_lcell_comb
-- Equation(s):
-- \PRESCALER[15]~57_combout\ = (PRESCALER(15) & (!\PRESCALER[14]~56\)) # (!PRESCALER(15) & ((\PRESCALER[14]~56\) # (GND)))
-- \PRESCALER[15]~58\ = CARRY((!\PRESCALER[14]~56\) # (!PRESCALER(15)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0011110000111111",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	datab => PRESCALER(15),
	datad => VCC,
	cin => \PRESCALER[14]~56\,
	combout => \PRESCALER[15]~57_combout\,
	cout => \PRESCALER[15]~58\);

-- Location: LCFF_X58_Y6_N5
\PRESCALER[15]\ : cycloneii_lcell_ff
PORT MAP (
	clk => \clk~clkctrl_outclk\,
	datain => \PRESCALER[15]~57_combout\,
	sclr => \PRESCALER[7]~28_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	regout => PRESCALER(15));

-- Location: LCCOMB_X58_Y6_N6
\PRESCALER[16]~59\ : cycloneii_lcell_comb
-- Equation(s):
-- \PRESCALER[16]~59_combout\ = (PRESCALER(16) & (\PRESCALER[15]~58\ $ (GND))) # (!PRESCALER(16) & (!\PRESCALER[15]~58\ & VCC))
-- \PRESCALER[16]~60\ = CARRY((PRESCALER(16) & !\PRESCALER[15]~58\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1100001100001100",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	datab => PRESCALER(16),
	datad => VCC,
	cin => \PRESCALER[15]~58\,
	combout => \PRESCALER[16]~59_combout\,
	cout => \PRESCALER[16]~60\);

-- Location: LCFF_X58_Y6_N7
\PRESCALER[16]\ : cycloneii_lcell_ff
PORT MAP (
	clk => \clk~clkctrl_outclk\,
	datain => \PRESCALER[16]~59_combout\,
	sclr => \PRESCALER[7]~28_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	regout => PRESCALER(16));

-- Location: LCCOMB_X58_Y6_N8
\PRESCALER[17]~61\ : cycloneii_lcell_comb
-- Equation(s):
-- \PRESCALER[17]~61_combout\ = (PRESCALER(17) & (!\PRESCALER[16]~60\)) # (!PRESCALER(17) & ((\PRESCALER[16]~60\) # (GND)))
-- \PRESCALER[17]~62\ = CARRY((!\PRESCALER[16]~60\) # (!PRESCALER(17)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0011110000111111",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	datab => PRESCALER(17),
	datad => VCC,
	cin => \PRESCALER[16]~60\,
	combout => \PRESCALER[17]~61_combout\,
	cout => \PRESCALER[17]~62\);

-- Location: LCFF_X58_Y6_N9
\PRESCALER[17]\ : cycloneii_lcell_ff
PORT MAP (
	clk => \clk~clkctrl_outclk\,
	datain => \PRESCALER[17]~61_combout\,
	sclr => \PRESCALER[7]~28_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	regout => PRESCALER(17));

-- Location: LCCOMB_X58_Y6_N12
\PRESCALER[19]~65\ : cycloneii_lcell_comb
-- Equation(s):
-- \PRESCALER[19]~65_combout\ = (PRESCALER(19) & (!\PRESCALER[18]~64\)) # (!PRESCALER(19) & ((\PRESCALER[18]~64\) # (GND)))
-- \PRESCALER[19]~66\ = CARRY((!\PRESCALER[18]~64\) # (!PRESCALER(19)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0101101001011111",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	dataa => PRESCALER(19),
	datad => VCC,
	cin => \PRESCALER[18]~64\,
	combout => \PRESCALER[19]~65_combout\,
	cout => \PRESCALER[19]~66\);

-- Location: LCCOMB_X58_Y6_N14
\PRESCALER[20]~67\ : cycloneii_lcell_comb
-- Equation(s):
-- \PRESCALER[20]~67_combout\ = (PRESCALER(20) & (\PRESCALER[19]~66\ $ (GND))) # (!PRESCALER(20) & (!\PRESCALER[19]~66\ & VCC))
-- \PRESCALER[20]~68\ = CARRY((PRESCALER(20) & !\PRESCALER[19]~66\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1100001100001100",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	datab => PRESCALER(20),
	datad => VCC,
	cin => \PRESCALER[19]~66\,
	combout => \PRESCALER[20]~67_combout\,
	cout => \PRESCALER[20]~68\);

-- Location: LCFF_X58_Y6_N15
\PRESCALER[20]\ : cycloneii_lcell_ff
PORT MAP (
	clk => \clk~clkctrl_outclk\,
	datain => \PRESCALER[20]~67_combout\,
	sclr => \PRESCALER[7]~28_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	regout => PRESCALER(20));

-- Location: LCCOMB_X58_Y6_N16
\PRESCALER[21]~69\ : cycloneii_lcell_comb
-- Equation(s):
-- \PRESCALER[21]~69_combout\ = (PRESCALER(21) & (!\PRESCALER[20]~68\)) # (!PRESCALER(21) & ((\PRESCALER[20]~68\) # (GND)))
-- \PRESCALER[21]~70\ = CARRY((!\PRESCALER[20]~68\) # (!PRESCALER(21)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0011110000111111",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	datab => PRESCALER(21),
	datad => VCC,
	cin => \PRESCALER[20]~68\,
	combout => \PRESCALER[21]~69_combout\,
	cout => \PRESCALER[21]~70\);

-- Location: LCFF_X58_Y6_N17
\PRESCALER[21]\ : cycloneii_lcell_ff
PORT MAP (
	clk => \clk~clkctrl_outclk\,
	datain => \PRESCALER[21]~69_combout\,
	sclr => \PRESCALER[7]~28_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	regout => PRESCALER(21));

-- Location: LCCOMB_X58_Y6_N18
\PRESCALER[22]~71\ : cycloneii_lcell_comb
-- Equation(s):
-- \PRESCALER[22]~71_combout\ = (PRESCALER(22) & (\PRESCALER[21]~70\ $ (GND))) # (!PRESCALER(22) & (!\PRESCALER[21]~70\ & VCC))
-- \PRESCALER[22]~72\ = CARRY((PRESCALER(22) & !\PRESCALER[21]~70\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1100001100001100",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	datab => PRESCALER(22),
	datad => VCC,
	cin => \PRESCALER[21]~70\,
	combout => \PRESCALER[22]~71_combout\,
	cout => \PRESCALER[22]~72\);

-- Location: LCFF_X58_Y6_N19
\PRESCALER[22]\ : cycloneii_lcell_ff
PORT MAP (
	clk => \clk~clkctrl_outclk\,
	datain => \PRESCALER[22]~71_combout\,
	sclr => \PRESCALER[7]~28_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	regout => PRESCALER(22));

-- Location: LCCOMB_X58_Y6_N20
\PRESCALER[23]~73\ : cycloneii_lcell_comb
-- Equation(s):
-- \PRESCALER[23]~73_combout\ = (PRESCALER(23) & (!\PRESCALER[22]~72\)) # (!PRESCALER(23) & ((\PRESCALER[22]~72\) # (GND)))
-- \PRESCALER[23]~74\ = CARRY((!\PRESCALER[22]~72\) # (!PRESCALER(23)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0101101001011111",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	dataa => PRESCALER(23),
	datad => VCC,
	cin => \PRESCALER[22]~72\,
	combout => \PRESCALER[23]~73_combout\,
	cout => \PRESCALER[23]~74\);

-- Location: LCFF_X58_Y6_N21
\PRESCALER[23]\ : cycloneii_lcell_ff
PORT MAP (
	clk => \clk~clkctrl_outclk\,
	datain => \PRESCALER[23]~73_combout\,
	sclr => \PRESCALER[7]~28_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	regout => PRESCALER(23));

-- Location: LCCOMB_X58_Y6_N28
\Equal0~6\ : cycloneii_lcell_comb
-- Equation(s):
-- \Equal0~6_combout\ = (PRESCALER(21)) # ((PRESCALER(20)) # ((PRESCALER(23)) # (PRESCALER(22))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111111111111110",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => PRESCALER(21),
	datab => PRESCALER(20),
	datac => PRESCALER(23),
	datad => PRESCALER(22),
	combout => \Equal0~6_combout\);

-- Location: LCFF_X58_Y6_N23
\PRESCALER[24]\ : cycloneii_lcell_ff
PORT MAP (
	clk => \clk~clkctrl_outclk\,
	datain => \PRESCALER[24]~75_combout\,
	sclr => \PRESCALER[7]~28_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	regout => PRESCALER(24));

-- Location: LCFF_X58_Y6_N13
\PRESCALER[19]\ : cycloneii_lcell_ff
PORT MAP (
	clk => \clk~clkctrl_outclk\,
	datain => \PRESCALER[19]~65_combout\,
	sclr => \PRESCALER[7]~28_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	regout => PRESCALER(19));

-- Location: LCCOMB_X58_Y6_N26
\Equal0~5\ : cycloneii_lcell_comb
-- Equation(s):
-- \Equal0~5_combout\ = (PRESCALER(18)) # ((PRESCALER(17)) # ((PRESCALER(16)) # (PRESCALER(19))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111111111111110",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => PRESCALER(18),
	datab => PRESCALER(17),
	datac => PRESCALER(16),
	datad => PRESCALER(19),
	combout => \Equal0~5_combout\);

-- Location: LCCOMB_X58_Y6_N30
\Equal0~7\ : cycloneii_lcell_comb
-- Equation(s):
-- \Equal0~7_combout\ = ((\Equal0~6_combout\) # ((PRESCALER(24)) # (\Equal0~5_combout\))) # (!PRESCALER(25))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111111111111101",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => PRESCALER(25),
	datab => \Equal0~6_combout\,
	datac => PRESCALER(24),
	datad => \Equal0~5_combout\,
	combout => \Equal0~7_combout\);

-- Location: LCCOMB_X59_Y6_N20
\Equal0~8\ : cycloneii_lcell_comb
-- Equation(s):
-- \Equal0~8_combout\ = (!\Equal0~7_combout\ & !\Equal0~4_combout\)

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000000000001111",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datac => \Equal0~7_combout\,
	datad => \Equal0~4_combout\,
	combout => \Equal0~8_combout\);

-- Location: LCFF_X59_Y6_N21
cnt_one_enable : cycloneii_lcell_ff
PORT MAP (
	clk => \clk~clkctrl_outclk\,
	datain => \Equal0~8_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	regout => \cnt_one_enable~regout\);

-- Location: LCFF_X59_Y6_N15
\my_state.S1\ : cycloneii_lcell_ff
PORT MAP (
	clk => \clk~clkctrl_outclk\,
	datain => \my_state.S1~feeder_combout\,
	aclr => \ALT_INV_reset~combout\,
	ena => \cnt_one_enable~regout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	regout => \my_state.S1~regout\);

-- Location: LCCOMB_X59_Y6_N8
\Selector3~0\ : cycloneii_lcell_comb
-- Equation(s):
-- \Selector3~0_combout\ = (\my_state.S1~regout\ & !unit4(0))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000000011110000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datac => \my_state.S1~regout\,
	datad => unit4(0),
	combout => \Selector3~0_combout\);

-- Location: LCFF_X59_Y7_N17
\unit4[0]\ : cycloneii_lcell_ff
PORT MAP (
	clk => \clk~clkctrl_outclk\,
	sdata => \Selector3~0_combout\,
	sload => VCC,
	ena => \cnt_one_enable~regout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	regout => unit4(0));

-- Location: LCCOMB_X59_Y6_N10
\Add4~0\ : cycloneii_lcell_comb
-- Equation(s):
-- \Add4~0_combout\ = unit4(1) $ (unit4(0))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0101010110101010",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => unit4(1),
	datad => unit4(0),
	combout => \Add4~0_combout\);

-- Location: PIN_N23,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: Default
\bp~I\ : cycloneii_io
-- pragma translate_off
GENERIC MAP (
	input_async_reset => "none",
	input_power_up => "low",
	input_register_mode => "none",
	input_sync_reset => "none",
	oe_async_reset => "none",
	oe_power_up => "low",
	oe_register_mode => "none",
	oe_sync_reset => "none",
	operation_mode => "input",
	output_async_reset => "none",
	output_power_up => "low",
	output_register_mode => "none",
	output_sync_reset => "none")
-- pragma translate_on
PORT MAP (
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	devoe => ww_devoe,
	oe => GND,
	padio => ww_bp,
	combout => \bp~combout\);

-- Location: LCCOMB_X60_Y7_N24
\my_state.S3~0\ : cycloneii_lcell_comb
-- Equation(s):
-- \my_state.S3~0_combout\ = !\bp~combout\

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000111100001111",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datac => \bp~combout\,
	combout => \my_state.S3~0_combout\);

-- Location: LCFF_X60_Y7_N25
\my_state.S3\ : cycloneii_lcell_ff
PORT MAP (
	clk => \clk~clkctrl_outclk\,
	datain => \my_state.S3~0_combout\,
	aclr => \ALT_INV_reset~combout\,
	ena => \cnt_one_enable~regout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	regout => \my_state.S3~regout\);

-- Location: LCCOMB_X59_Y7_N22
\unit4[1]~1\ : cycloneii_lcell_comb
-- Equation(s):
-- \unit4[1]~1_combout\ = (\Add4~0_combout\ & (\unit4[3]~0_combout\)) # (!\Add4~0_combout\ & (((\Equal4~0_combout\ & \my_state.S3~regout\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1010110010100000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \unit4[3]~0_combout\,
	datab => \Equal4~0_combout\,
	datac => \Add4~0_combout\,
	datad => \my_state.S3~regout\,
	combout => \unit4[1]~1_combout\);

-- Location: LCFF_X59_Y7_N23
\unit4[1]\ : cycloneii_lcell_ff
PORT MAP (
	clk => \clk~clkctrl_outclk\,
	datain => \unit4[1]~1_combout\,
	ena => \cnt_one_enable~regout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	regout => unit4(1));

-- Location: LCFF_X60_Y7_N11
\my_state.S2\ : cycloneii_lcell_ff
PORT MAP (
	clk => \clk~clkctrl_outclk\,
	sdata => \bp~combout\,
	aclr => \ALT_INV_reset~combout\,
	sload => VCC,
	ena => \cnt_one_enable~regout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	regout => \my_state.S2~regout\);

-- Location: LCCOMB_X59_Y7_N0
\unit4[3]~0\ : cycloneii_lcell_comb
-- Equation(s):
-- \unit4[3]~0_combout\ = (\Equal2~0_combout\ & \my_state.S2~regout\)

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1010101000000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \Equal2~0_combout\,
	datad => \my_state.S2~regout\,
	combout => \unit4[3]~0_combout\);

-- Location: LCCOMB_X59_Y7_N16
\Add4~2\ : cycloneii_lcell_comb
-- Equation(s):
-- \Add4~2_combout\ = unit4(3) $ (((unit4(2)) # ((unit4(0)) # (unit4(1)))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0011001100110110",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => unit4(2),
	datab => unit4(3),
	datac => unit4(0),
	datad => unit4(1),
	combout => \Add4~2_combout\);

-- Location: LCCOMB_X59_Y7_N2
\unit4[3]~4\ : cycloneii_lcell_comb
-- Equation(s):
-- \unit4[3]~4_combout\ = (\Add2~0_combout\ & ((\unit4[3]~0_combout\) # ((!\Add4~2_combout\ & \my_state.S3~regout\)))) # (!\Add2~0_combout\ & (((!\Add4~2_combout\ & \my_state.S3~regout\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1000111110001000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \Add2~0_combout\,
	datab => \unit4[3]~0_combout\,
	datac => \Add4~2_combout\,
	datad => \my_state.S3~regout\,
	combout => \unit4[3]~4_combout\);

-- Location: LCFF_X59_Y7_N3
\unit4[3]\ : cycloneii_lcell_ff
PORT MAP (
	clk => \clk~clkctrl_outclk\,
	datain => \unit4[3]~4_combout\,
	ena => \cnt_one_enable~regout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	regout => unit4(3));

-- Location: LCCOMB_X59_Y7_N28
\Equal4~0\ : cycloneii_lcell_comb
-- Equation(s):
-- \Equal4~0_combout\ = (unit4(2)) # ((unit4(1)) # ((unit4(0)) # (unit4(3))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111111111111110",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => unit4(2),
	datab => unit4(1),
	datac => unit4(0),
	datad => unit4(3),
	combout => \Equal4~0_combout\);

-- Location: LCCOMB_X59_Y7_N18
\Selector4~3\ : cycloneii_lcell_comb
-- Equation(s):
-- \Selector4~3_combout\ = (!\Add3~0_combout\ & (\my_state.S3~regout\ & (\cnt_one_enable~regout\ & !\Equal4~0_combout\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000000001000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \Add3~0_combout\,
	datab => \my_state.S3~regout\,
	datac => \cnt_one_enable~regout\,
	datad => \Equal4~0_combout\,
	combout => \Selector4~3_combout\);

-- Location: LCCOMB_X59_Y7_N6
\Equal2~0\ : cycloneii_lcell_comb
-- Equation(s):
-- \Equal2~0_combout\ = (unit4(2)) # ((unit4(1)) # ((!unit4(3)) # (!unit4(0))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1110111111111111",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => unit4(2),
	datab => unit4(1),
	datac => unit4(0),
	datad => unit4(3),
	combout => \Equal2~0_combout\);

-- Location: LCCOMB_X59_Y7_N24
\Selector6~3\ : cycloneii_lcell_comb
-- Equation(s):
-- \Selector6~3_combout\ = (\my_state.S3~regout\ & ((\Equal4~0_combout\) # (!\cnt_one_enable~regout\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1100111100000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datab => \Equal4~0_combout\,
	datac => \cnt_one_enable~regout\,
	datad => \my_state.S3~regout\,
	combout => \Selector6~3_combout\);

-- Location: LCCOMB_X60_Y7_N18
\Selector5~0\ : cycloneii_lcell_comb
-- Equation(s):
-- \Selector5~0_combout\ = (\Selector6~3_combout\) # ((\my_state.S2~regout\ & ((\Equal2~0_combout\) # (!\cnt_one_enable~regout\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111111111000100",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \cnt_one_enable~regout\,
	datab => \my_state.S2~regout\,
	datac => \Equal2~0_combout\,
	datad => \Selector6~3_combout\,
	combout => \Selector5~0_combout\);

-- Location: LCCOMB_X60_Y7_N26
\Selector4~4\ : cycloneii_lcell_comb
-- Equation(s):
-- \Selector4~4_combout\ = (\Selector4~2_combout\) # ((\Selector4~3_combout\) # ((diz4(3) & \Selector5~0_combout\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111111011101110",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \Selector4~2_combout\,
	datab => \Selector4~3_combout\,
	datac => diz4(3),
	datad => \Selector5~0_combout\,
	combout => \Selector4~4_combout\);

-- Location: LCFF_X60_Y7_N27
\diz4[3]\ : cycloneii_lcell_ff
PORT MAP (
	clk => \clk~clkctrl_outclk\,
	datain => \Selector4~4_combout\,
	ena => \cnt_one_enable~regout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	regout => diz4(3));

-- Location: LCCOMB_X60_Y7_N12
\Selector7~1\ : cycloneii_lcell_comb
-- Equation(s):
-- \Selector7~1_combout\ = (\Selector7~0_combout\) # ((\my_state.S2~regout\ & (diz4(0) $ (!\Equal2~0_combout\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1110101010101110",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \Selector7~0_combout\,
	datab => \my_state.S2~regout\,
	datac => diz4(0),
	datad => \Equal2~0_combout\,
	combout => \Selector7~1_combout\);

-- Location: LCFF_X60_Y7_N13
\diz4[0]\ : cycloneii_lcell_ff
PORT MAP (
	clk => \clk~clkctrl_outclk\,
	datain => \Selector7~1_combout\,
	ena => \cnt_one_enable~regout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	regout => diz4(0));

-- Location: LCCOMB_X60_Y7_N16
\Selector5~1\ : cycloneii_lcell_comb
-- Equation(s):
-- \Selector5~1_combout\ = (\cnt_one_enable~regout\ & (diz4(2) $ (((!diz4(1) & !diz4(0))))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1110000100000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => diz4(1),
	datab => diz4(0),
	datac => diz4(2),
	datad => \cnt_one_enable~regout\,
	combout => \Selector5~1_combout\);

-- Location: LCCOMB_X59_Y7_N14
\Selector5~2\ : cycloneii_lcell_comb
-- Equation(s):
-- \Selector5~2_combout\ = (!\P2~0_combout\ & (!\Equal4~0_combout\ & (\Selector5~1_combout\ & \my_state.S3~regout\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0001000000000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \P2~0_combout\,
	datab => \Equal4~0_combout\,
	datac => \Selector5~1_combout\,
	datad => \my_state.S3~regout\,
	combout => \Selector5~2_combout\);

-- Location: LCCOMB_X60_Y7_N20
\Selector5~4\ : cycloneii_lcell_comb
-- Equation(s):
-- \Selector5~4_combout\ = (\Selector5~3_combout\) # ((\Selector5~2_combout\) # ((\Selector5~0_combout\ & diz4(2))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111111111101010",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \Selector5~3_combout\,
	datab => \Selector5~0_combout\,
	datac => diz4(2),
	datad => \Selector5~2_combout\,
	combout => \Selector5~4_combout\);

-- Location: LCFF_X60_Y7_N21
\diz4[2]\ : cycloneii_lcell_ff
PORT MAP (
	clk => \clk~clkctrl_outclk\,
	datain => \Selector5~4_combout\,
	ena => \cnt_one_enable~regout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	regout => diz4(2));

-- Location: LCCOMB_X60_Y7_N4
\P2~0\ : cycloneii_lcell_comb
-- Equation(s):
-- \P2~0_combout\ = (!diz4(1) & (!diz4(3) & (!diz4(2) & !diz4(0))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000000000000001",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => diz4(1),
	datab => diz4(3),
	datac => diz4(2),
	datad => diz4(0),
	combout => \P2~0_combout\);

-- Location: LCCOMB_X60_Y7_N14
\Selector6~0\ : cycloneii_lcell_comb
-- Equation(s):
-- \Selector6~0_combout\ = (\my_state.S3~regout\ & (!\Equal4~0_combout\ & (!\P2~0_combout\ & \cnt_one_enable~regout\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000001000000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \my_state.S3~regout\,
	datab => \Equal4~0_combout\,
	datac => \P2~0_combout\,
	datad => \cnt_one_enable~regout\,
	combout => \Selector6~0_combout\);

-- Location: LCCOMB_X60_Y7_N0
\P2~1\ : cycloneii_lcell_comb
-- Equation(s):
-- \P2~1_combout\ = (!diz4(1) & (diz4(3) & (!diz4(2) & diz4(0))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000010000000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => diz4(1),
	datab => diz4(3),
	datac => diz4(2),
	datad => diz4(0),
	combout => \P2~1_combout\);

-- Location: LCCOMB_X60_Y7_N30
\Selector6~1\ : cycloneii_lcell_comb
-- Equation(s):
-- \Selector6~1_combout\ = (\cnt_one_enable~regout\ & (\my_state.S2~regout\ & (!\Equal2~0_combout\ & !\P2~1_combout\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000000000001000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \cnt_one_enable~regout\,
	datab => \my_state.S2~regout\,
	datac => \Equal2~0_combout\,
	datad => \P2~1_combout\,
	combout => \Selector6~1_combout\);

-- Location: LCCOMB_X60_Y7_N8
\Selector6~2\ : cycloneii_lcell_comb
-- Equation(s):
-- \Selector6~2_combout\ = (diz4(0) & ((diz4(1) & (\Selector6~0_combout\)) # (!diz4(1) & ((\Selector6~1_combout\))))) # (!diz4(0) & ((diz4(1) & ((\Selector6~1_combout\))) # (!diz4(1) & (\Selector6~0_combout\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1101100011100100",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => diz4(0),
	datab => \Selector6~0_combout\,
	datac => \Selector6~1_combout\,
	datad => diz4(1),
	combout => \Selector6~2_combout\);

-- Location: LCCOMB_X60_Y7_N6
\Selector6~4\ : cycloneii_lcell_comb
-- Equation(s):
-- \Selector6~4_combout\ = (\Selector6~2_combout\) # ((diz4(1) & \Selector5~0_combout\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111110011001100",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datab => \Selector6~2_combout\,
	datac => diz4(1),
	datad => \Selector5~0_combout\,
	combout => \Selector6~4_combout\);

-- Location: LCFF_X60_Y7_N7
\diz4[1]\ : cycloneii_lcell_ff
PORT MAP (
	clk => \clk~clkctrl_outclk\,
	datain => \Selector6~4_combout\,
	ena => \cnt_one_enable~regout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	regout => diz4(1));

-- Location: LCCOMB_X64_Y4_N0
\Mux13~0\ : cycloneii_lcell_comb
-- Equation(s):
-- \Mux13~0_combout\ = (diz4(3)) # ((diz4(1) & ((!diz4(0)) # (!diz4(2)))) # (!diz4(1) & (diz4(2))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111011011111110",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => diz4(1),
	datab => diz4(2),
	datac => diz4(3),
	datad => diz4(0),
	combout => \Mux13~0_combout\);

-- Location: LCCOMB_X64_Y4_N2
\Mux12~0\ : cycloneii_lcell_comb
-- Equation(s):
-- \Mux12~0_combout\ = (!diz4(3) & ((diz4(1) & ((diz4(0)) # (!diz4(2)))) # (!diz4(1) & (!diz4(2) & diz4(0)))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000101100000010",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => diz4(1),
	datab => diz4(2),
	datac => diz4(3),
	datad => diz4(0),
	combout => \Mux12~0_combout\);

-- Location: LCCOMB_X64_Y4_N12
\Mux11~0\ : cycloneii_lcell_comb
-- Equation(s):
-- \Mux11~0_combout\ = (diz4(1) & (((!diz4(3) & diz4(0))))) # (!diz4(1) & ((diz4(2) & (!diz4(3))) # (!diz4(2) & ((diz4(0))))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0001111100000100",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => diz4(1),
	datab => diz4(2),
	datac => diz4(3),
	datad => diz4(0),
	combout => \Mux11~0_combout\);

-- Location: LCCOMB_X64_Y4_N14
\Mux10~0\ : cycloneii_lcell_comb
-- Equation(s):
-- \Mux10~0_combout\ = (!diz4(3) & ((diz4(1) & (diz4(2) & diz4(0))) # (!diz4(1) & (diz4(2) $ (diz4(0))))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000100100000100",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => diz4(1),
	datab => diz4(2),
	datac => diz4(3),
	datad => diz4(0),
	combout => \Mux10~0_combout\);

-- Location: LCCOMB_X64_Y4_N16
\Mux9~0\ : cycloneii_lcell_comb
-- Equation(s):
-- \Mux9~0_combout\ = (diz4(1) & (!diz4(2) & (!diz4(3) & !diz4(0))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000000000000010",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => diz4(1),
	datab => diz4(2),
	datac => diz4(3),
	datad => diz4(0),
	combout => \Mux9~0_combout\);

-- Location: LCCOMB_X64_Y4_N22
\Mux8~0\ : cycloneii_lcell_comb
-- Equation(s):
-- \Mux8~0_combout\ = (diz4(2) & (!diz4(3) & (diz4(1) $ (diz4(0)))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000010000001000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => diz4(1),
	datab => diz4(2),
	datac => diz4(3),
	datad => diz4(0),
	combout => \Mux8~0_combout\);

-- Location: LCCOMB_X64_Y4_N24
\Mux7~0\ : cycloneii_lcell_comb
-- Equation(s):
-- \Mux7~0_combout\ = (!diz4(1) & (!diz4(3) & (diz4(2) $ (diz4(0)))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000000100000100",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => diz4(1),
	datab => diz4(2),
	datac => diz4(3),
	datad => diz4(0),
	combout => \Mux7~0_combout\);

-- Location: LCCOMB_X59_Y7_N4
\Add4~1\ : cycloneii_lcell_comb
-- Equation(s):
-- \Add4~1_combout\ = unit4(2) $ (((unit4(1)) # (unit4(0))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000001111111100",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datab => unit4(1),
	datac => unit4(0),
	datad => unit4(2),
	combout => \Add4~1_combout\);

-- Location: LCCOMB_X59_Y7_N12
\unit4[2]~3\ : cycloneii_lcell_comb
-- Equation(s):
-- \unit4[2]~3_combout\ = (\unit4[2]~2_combout\) # ((\Equal4~0_combout\ & (!\Add4~1_combout\ & \my_state.S3~regout\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1010111010101010",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \unit4[2]~2_combout\,
	datab => \Equal4~0_combout\,
	datac => \Add4~1_combout\,
	datad => \my_state.S3~regout\,
	combout => \unit4[2]~3_combout\);

-- Location: LCFF_X59_Y7_N13
\unit4[2]\ : cycloneii_lcell_ff
PORT MAP (
	clk => \clk~clkctrl_outclk\,
	datain => \unit4[2]~3_combout\,
	ena => \cnt_one_enable~regout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	regout => unit4(2));

-- Location: LCCOMB_X59_Y6_N6
\Mux6~0\ : cycloneii_lcell_comb
-- Equation(s):
-- \Mux6~0_combout\ = (unit4(1) & (!unit4(3) & ((!unit4(0)) # (!unit4(2))))) # (!unit4(1) & (unit4(3) $ ((unit4(2)))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0001011000110110",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => unit4(1),
	datab => unit4(3),
	datac => unit4(2),
	datad => unit4(0),
	combout => \Mux6~0_combout\);

-- Location: LCCOMB_X59_Y6_N4
\Mux5~0\ : cycloneii_lcell_comb
-- Equation(s):
-- \Mux5~0_combout\ = (!unit4(3) & ((unit4(1) & ((unit4(0)) # (!unit4(2)))) # (!unit4(1) & (!unit4(2) & unit4(0)))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0010001100000010",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => unit4(1),
	datab => unit4(3),
	datac => unit4(2),
	datad => unit4(0),
	combout => \Mux5~0_combout\);

-- Location: LCCOMB_X59_Y6_N18
\Mux4~0\ : cycloneii_lcell_comb
-- Equation(s):
-- \Mux4~0_combout\ = (unit4(1) & (!unit4(3) & ((unit4(0))))) # (!unit4(1) & ((unit4(2) & (!unit4(3))) # (!unit4(2) & ((unit4(0))))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0011011100010000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => unit4(1),
	datab => unit4(3),
	datac => unit4(2),
	datad => unit4(0),
	combout => \Mux4~0_combout\);

-- Location: LCCOMB_X59_Y6_N16
\Mux3~0\ : cycloneii_lcell_comb
-- Equation(s):
-- \Mux3~0_combout\ = (!unit4(3) & ((unit4(1) & (unit4(2) & unit4(0))) # (!unit4(1) & (unit4(2) $ (unit4(0))))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0010000100010000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => unit4(1),
	datab => unit4(3),
	datac => unit4(2),
	datad => unit4(0),
	combout => \Mux3~0_combout\);

-- Location: LCCOMB_X59_Y6_N22
\Mux2~0\ : cycloneii_lcell_comb
-- Equation(s):
-- \Mux2~0_combout\ = (unit4(1) & (!unit4(3) & (!unit4(2) & !unit4(0))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000000000000010",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => unit4(1),
	datab => unit4(3),
	datac => unit4(2),
	datad => unit4(0),
	combout => \Mux2~0_combout\);

-- Location: LCCOMB_X59_Y6_N28
\Mux1~0\ : cycloneii_lcell_comb
-- Equation(s):
-- \Mux1~0_combout\ = (!unit4(3) & (unit4(2) & (unit4(1) $ (unit4(0)))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0001000000100000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => unit4(1),
	datab => unit4(3),
	datac => unit4(2),
	datad => unit4(0),
	combout => \Mux1~0_combout\);

-- Location: LCCOMB_X59_Y6_N26
\Mux0~0\ : cycloneii_lcell_comb
-- Equation(s):
-- \Mux0~0_combout\ = (!unit4(1) & (!unit4(3) & (unit4(2) $ (unit4(0)))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000000100010000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => unit4(1),
	datab => unit4(3),
	datac => unit4(2),
	datad => unit4(0),
	combout => \Mux0~0_combout\);

-- Location: PIN_AB24,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: 24mA
\ten_seg[0]~I\ : cycloneii_io
-- pragma translate_off
GENERIC MAP (
	input_async_reset => "none",
	input_power_up => "low",
	input_register_mode => "none",
	input_sync_reset => "none",
	oe_async_reset => "none",
	oe_power_up => "low",
	oe_register_mode => "none",
	oe_sync_reset => "none",
	operation_mode => "output",
	output_async_reset => "none",
	output_power_up => "low",
	output_register_mode => "none",
	output_sync_reset => "none")
-- pragma translate_on
PORT MAP (
	datain => \ALT_INV_Mux13~0_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	devoe => ww_devoe,
	oe => VCC,
	padio => ww_ten_seg(0));

-- Location: PIN_AA23,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: 24mA
\ten_seg[1]~I\ : cycloneii_io
-- pragma translate_off
GENERIC MAP (
	input_async_reset => "none",
	input_power_up => "low",
	input_register_mode => "none",
	input_sync_reset => "none",
	oe_async_reset => "none",
	oe_power_up => "low",
	oe_register_mode => "none",
	oe_sync_reset => "none",
	operation_mode => "output",
	output_async_reset => "none",
	output_power_up => "low",
	output_register_mode => "none",
	output_sync_reset => "none")
-- pragma translate_on
PORT MAP (
	datain => \Mux12~0_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	devoe => ww_devoe,
	oe => VCC,
	padio => ww_ten_seg(1));

-- Location: PIN_AA24,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: 24mA
\ten_seg[2]~I\ : cycloneii_io
-- pragma translate_off
GENERIC MAP (
	input_async_reset => "none",
	input_power_up => "low",
	input_register_mode => "none",
	input_sync_reset => "none",
	oe_async_reset => "none",
	oe_power_up => "low",
	oe_register_mode => "none",
	oe_sync_reset => "none",
	operation_mode => "output",
	output_async_reset => "none",
	output_power_up => "low",
	output_register_mode => "none",
	output_sync_reset => "none")
-- pragma translate_on
PORT MAP (
	datain => \Mux11~0_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	devoe => ww_devoe,
	oe => VCC,
	padio => ww_ten_seg(2));

-- Location: PIN_Y22,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: 24mA
\ten_seg[3]~I\ : cycloneii_io
-- pragma translate_off
GENERIC MAP (
	input_async_reset => "none",
	input_power_up => "low",
	input_register_mode => "none",
	input_sync_reset => "none",
	oe_async_reset => "none",
	oe_power_up => "low",
	oe_register_mode => "none",
	oe_sync_reset => "none",
	operation_mode => "output",
	output_async_reset => "none",
	output_power_up => "low",
	output_register_mode => "none",
	output_sync_reset => "none")
-- pragma translate_on
PORT MAP (
	datain => \Mux10~0_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	devoe => ww_devoe,
	oe => VCC,
	padio => ww_ten_seg(3));

-- Location: PIN_W21,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: 24mA
\ten_seg[4]~I\ : cycloneii_io
-- pragma translate_off
GENERIC MAP (
	input_async_reset => "none",
	input_power_up => "low",
	input_register_mode => "none",
	input_sync_reset => "none",
	oe_async_reset => "none",
	oe_power_up => "low",
	oe_register_mode => "none",
	oe_sync_reset => "none",
	operation_mode => "output",
	output_async_reset => "none",
	output_power_up => "low",
	output_register_mode => "none",
	output_sync_reset => "none")
-- pragma translate_on
PORT MAP (
	datain => \Mux9~0_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	devoe => ww_devoe,
	oe => VCC,
	padio => ww_ten_seg(4));

-- Location: PIN_V21,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: 24mA
\ten_seg[5]~I\ : cycloneii_io
-- pragma translate_off
GENERIC MAP (
	input_async_reset => "none",
	input_power_up => "low",
	input_register_mode => "none",
	input_sync_reset => "none",
	oe_async_reset => "none",
	oe_power_up => "low",
	oe_register_mode => "none",
	oe_sync_reset => "none",
	operation_mode => "output",
	output_async_reset => "none",
	output_power_up => "low",
	output_register_mode => "none",
	output_sync_reset => "none")
-- pragma translate_on
PORT MAP (
	datain => \Mux8~0_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	devoe => ww_devoe,
	oe => VCC,
	padio => ww_ten_seg(5));

-- Location: PIN_V20,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: 24mA
\ten_seg[6]~I\ : cycloneii_io
-- pragma translate_off
GENERIC MAP (
	input_async_reset => "none",
	input_power_up => "low",
	input_register_mode => "none",
	input_sync_reset => "none",
	oe_async_reset => "none",
	oe_power_up => "low",
	oe_register_mode => "none",
	oe_sync_reset => "none",
	operation_mode => "output",
	output_async_reset => "none",
	output_power_up => "low",
	output_register_mode => "none",
	output_sync_reset => "none")
-- pragma translate_on
PORT MAP (
	datain => \Mux7~0_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	devoe => ww_devoe,
	oe => VCC,
	padio => ww_ten_seg(6));

-- Location: PIN_V13,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: 24mA
\one_seg[0]~I\ : cycloneii_io
-- pragma translate_off
GENERIC MAP (
	input_async_reset => "none",
	input_power_up => "low",
	input_register_mode => "none",
	input_sync_reset => "none",
	oe_async_reset => "none",
	oe_power_up => "low",
	oe_register_mode => "none",
	oe_sync_reset => "none",
	operation_mode => "output",
	output_async_reset => "none",
	output_power_up => "low",
	output_register_mode => "none",
	output_sync_reset => "none")
-- pragma translate_on
PORT MAP (
	datain => \ALT_INV_Mux6~0_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	devoe => ww_devoe,
	oe => VCC,
	padio => ww_one_seg(0));

-- Location: PIN_V14,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: 24mA
\one_seg[1]~I\ : cycloneii_io
-- pragma translate_off
GENERIC MAP (
	input_async_reset => "none",
	input_power_up => "low",
	input_register_mode => "none",
	input_sync_reset => "none",
	oe_async_reset => "none",
	oe_power_up => "low",
	oe_register_mode => "none",
	oe_sync_reset => "none",
	operation_mode => "output",
	output_async_reset => "none",
	output_power_up => "low",
	output_register_mode => "none",
	output_sync_reset => "none")
-- pragma translate_on
PORT MAP (
	datain => \Mux5~0_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	devoe => ww_devoe,
	oe => VCC,
	padio => ww_one_seg(1));

-- Location: PIN_AE11,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: 24mA
\one_seg[2]~I\ : cycloneii_io
-- pragma translate_off
GENERIC MAP (
	input_async_reset => "none",
	input_power_up => "low",
	input_register_mode => "none",
	input_sync_reset => "none",
	oe_async_reset => "none",
	oe_power_up => "low",
	oe_register_mode => "none",
	oe_sync_reset => "none",
	operation_mode => "output",
	output_async_reset => "none",
	output_power_up => "low",
	output_register_mode => "none",
	output_sync_reset => "none")
-- pragma translate_on
PORT MAP (
	datain => \Mux4~0_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	devoe => ww_devoe,
	oe => VCC,
	padio => ww_one_seg(2));

-- Location: PIN_AD11,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: 24mA
\one_seg[3]~I\ : cycloneii_io
-- pragma translate_off
GENERIC MAP (
	input_async_reset => "none",
	input_power_up => "low",
	input_register_mode => "none",
	input_sync_reset => "none",
	oe_async_reset => "none",
	oe_power_up => "low",
	oe_register_mode => "none",
	oe_sync_reset => "none",
	operation_mode => "output",
	output_async_reset => "none",
	output_power_up => "low",
	output_register_mode => "none",
	output_sync_reset => "none")
-- pragma translate_on
PORT MAP (
	datain => \Mux3~0_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	devoe => ww_devoe,
	oe => VCC,
	padio => ww_one_seg(3));

-- Location: PIN_AC12,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: 24mA
\one_seg[4]~I\ : cycloneii_io
-- pragma translate_off
GENERIC MAP (
	input_async_reset => "none",
	input_power_up => "low",
	input_register_mode => "none",
	input_sync_reset => "none",
	oe_async_reset => "none",
	oe_power_up => "low",
	oe_register_mode => "none",
	oe_sync_reset => "none",
	operation_mode => "output",
	output_async_reset => "none",
	output_power_up => "low",
	output_register_mode => "none",
	output_sync_reset => "none")
-- pragma translate_on
PORT MAP (
	datain => \Mux2~0_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	devoe => ww_devoe,
	oe => VCC,
	padio => ww_one_seg(4));

-- Location: PIN_AB12,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: 24mA
\one_seg[5]~I\ : cycloneii_io
-- pragma translate_off
GENERIC MAP (
	input_async_reset => "none",
	input_power_up => "low",
	input_register_mode => "none",
	input_sync_reset => "none",
	oe_async_reset => "none",
	oe_power_up => "low",
	oe_register_mode => "none",
	oe_sync_reset => "none",
	operation_mode => "output",
	output_async_reset => "none",
	output_power_up => "low",
	output_register_mode => "none",
	output_sync_reset => "none")
-- pragma translate_on
PORT MAP (
	datain => \Mux1~0_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	devoe => ww_devoe,
	oe => VCC,
	padio => ww_one_seg(5));

-- Location: PIN_AF10,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: 24mA
\one_seg[6]~I\ : cycloneii_io
-- pragma translate_off
GENERIC MAP (
	input_async_reset => "none",
	input_power_up => "low",
	input_register_mode => "none",
	input_sync_reset => "none",
	oe_async_reset => "none",
	oe_power_up => "low",
	oe_register_mode => "none",
	oe_sync_reset => "none",
	operation_mode => "output",
	output_async_reset => "none",
	output_power_up => "low",
	output_register_mode => "none",
	output_sync_reset => "none")
-- pragma translate_on
PORT MAP (
	datain => \Mux0~0_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	devoe => ww_devoe,
	oe => VCC,
	padio => ww_one_seg(6));
END structure;


