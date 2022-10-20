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

-- DATE "07/13/2022 10:12:05"

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

ENTITY 	top IS
    PORT (
	clk : IN std_logic;
	clef : IN std_logic;
	frein_normal : IN std_logic;
	acceleration : IN std_logic;
	led_start : OUT std_logic;
	led0 : OUT std_logic;
	led1 : OUT std_logic;
	led2 : OUT std_logic;
	led3 : OUT std_logic;
	led4 : OUT std_logic;
	led5 : OUT std_logic;
	ten_seg : OUT std_logic_vector(6 DOWNTO 0);
	one_seg : OUT std_logic_vector(6 DOWNTO 0)
	);
END top;

-- Design Ports Information
-- frein_normal	=>  Location: PIN_E2,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: Default
-- acceleration	=>  Location: PIN_N23,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: Default
-- led_start	=>  Location: PIN_AE22,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: 24mA
-- led0	=>  Location: PIN_AE23,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: 24mA
-- led1	=>  Location: PIN_AF23,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: 24mA
-- led2	=>  Location: PIN_AB21,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: 24mA
-- led3	=>  Location: PIN_AC22,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: 24mA
-- led4	=>  Location: PIN_AD22,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: 24mA
-- led5	=>  Location: PIN_AD23,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: 24mA
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
-- clef	=>  Location: PIN_N25,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: Default


ARCHITECTURE structure OF top IS
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
SIGNAL ww_clef : std_logic;
SIGNAL ww_frein_normal : std_logic;
SIGNAL ww_acceleration : std_logic;
SIGNAL ww_led_start : std_logic;
SIGNAL ww_led0 : std_logic;
SIGNAL ww_led1 : std_logic;
SIGNAL ww_led2 : std_logic;
SIGNAL ww_led3 : std_logic;
SIGNAL ww_led4 : std_logic;
SIGNAL ww_led5 : std_logic;
SIGNAL ww_ten_seg : std_logic_vector(6 DOWNTO 0);
SIGNAL ww_one_seg : std_logic_vector(6 DOWNTO 0);
SIGNAL \clk~clkctrl_INCLK_bus\ : std_logic_vector(3 DOWNTO 0);
SIGNAL \P1|PRESCALER[0]~26_combout\ : std_logic;
SIGNAL \P1|PRESCALER[0]~27\ : std_logic;
SIGNAL \P1|PRESCALER[1]~29_combout\ : std_logic;
SIGNAL \P1|PRESCALER[1]~30\ : std_logic;
SIGNAL \P1|PRESCALER[2]~31_combout\ : std_logic;
SIGNAL \P1|PRESCALER[2]~32\ : std_logic;
SIGNAL \P1|PRESCALER[3]~33_combout\ : std_logic;
SIGNAL \P1|PRESCALER[3]~34\ : std_logic;
SIGNAL \P1|PRESCALER[4]~35_combout\ : std_logic;
SIGNAL \P1|PRESCALER[4]~36\ : std_logic;
SIGNAL \P1|PRESCALER[5]~37_combout\ : std_logic;
SIGNAL \P1|PRESCALER[5]~38\ : std_logic;
SIGNAL \P1|PRESCALER[6]~39_combout\ : std_logic;
SIGNAL \P1|PRESCALER[6]~40\ : std_logic;
SIGNAL \P1|PRESCALER[7]~41_combout\ : std_logic;
SIGNAL \P1|PRESCALER[7]~42\ : std_logic;
SIGNAL \P1|PRESCALER[8]~43_combout\ : std_logic;
SIGNAL \P1|PRESCALER[8]~44\ : std_logic;
SIGNAL \P1|PRESCALER[9]~45_combout\ : std_logic;
SIGNAL \P1|PRESCALER[9]~46\ : std_logic;
SIGNAL \P1|PRESCALER[10]~47_combout\ : std_logic;
SIGNAL \P1|PRESCALER[10]~48\ : std_logic;
SIGNAL \P1|PRESCALER[11]~49_combout\ : std_logic;
SIGNAL \P1|PRESCALER[11]~50\ : std_logic;
SIGNAL \P1|PRESCALER[12]~51_combout\ : std_logic;
SIGNAL \P1|PRESCALER[12]~52\ : std_logic;
SIGNAL \P1|PRESCALER[13]~53_combout\ : std_logic;
SIGNAL \P1|PRESCALER[13]~54\ : std_logic;
SIGNAL \P1|PRESCALER[14]~55_combout\ : std_logic;
SIGNAL \P1|PRESCALER[14]~56\ : std_logic;
SIGNAL \P1|PRESCALER[15]~57_combout\ : std_logic;
SIGNAL \P1|PRESCALER[15]~58\ : std_logic;
SIGNAL \P1|PRESCALER[16]~59_combout\ : std_logic;
SIGNAL \P1|PRESCALER[16]~60\ : std_logic;
SIGNAL \P1|PRESCALER[17]~61_combout\ : std_logic;
SIGNAL \P1|PRESCALER[17]~62\ : std_logic;
SIGNAL \P1|PRESCALER[18]~63_combout\ : std_logic;
SIGNAL \P1|PRESCALER[18]~64\ : std_logic;
SIGNAL \P1|PRESCALER[19]~65_combout\ : std_logic;
SIGNAL \P1|PRESCALER[19]~66\ : std_logic;
SIGNAL \P1|PRESCALER[20]~67_combout\ : std_logic;
SIGNAL \P1|PRESCALER[20]~68\ : std_logic;
SIGNAL \P1|PRESCALER[21]~69_combout\ : std_logic;
SIGNAL \P1|PRESCALER[21]~70\ : std_logic;
SIGNAL \P1|PRESCALER[22]~71_combout\ : std_logic;
SIGNAL \P1|PRESCALER[22]~72\ : std_logic;
SIGNAL \P1|PRESCALER[23]~73_combout\ : std_logic;
SIGNAL \P1|PRESCALER[23]~74\ : std_logic;
SIGNAL \P1|PRESCALER[24]~75_combout\ : std_logic;
SIGNAL \P1|PRESCALER[24]~76\ : std_logic;
SIGNAL \P1|PRESCALER[25]~77_combout\ : std_logic;
SIGNAL \P1|cnt_one_enable~regout\ : std_logic;
SIGNAL \P1|Equal0~0_combout\ : std_logic;
SIGNAL \P1|Equal0~1_combout\ : std_logic;
SIGNAL \P1|Equal0~2_combout\ : std_logic;
SIGNAL \P1|Equal0~3_combout\ : std_logic;
SIGNAL \P1|Equal0~4_combout\ : std_logic;
SIGNAL \P1|Equal0~5_combout\ : std_logic;
SIGNAL \P1|Equal0~6_combout\ : std_logic;
SIGNAL \P1|Equal0~7_combout\ : std_logic;
SIGNAL \P1|Equal0~8_combout\ : std_logic;
SIGNAL \P1|PRESCALER[0]~28_combout\ : std_logic;
SIGNAL \clk~combout\ : std_logic;
SIGNAL \clk~clkctrl_outclk\ : std_logic;
SIGNAL \P2|led_start~feeder_combout\ : std_logic;
SIGNAL \clef~combout\ : std_logic;
SIGNAL \P2|led_start~regout\ : std_logic;
SIGNAL \P1|diz4[0]~0_combout\ : std_logic;
SIGNAL \P1|diz4\ : std_logic_vector(3 DOWNTO 0);
SIGNAL \P1|PRESCALER\ : std_logic_vector(25 DOWNTO 0);
SIGNAL \ALT_INV_clef~combout\ : std_logic;
SIGNAL \P1|ALT_INV_diz4\ : std_logic_vector(0 DOWNTO 0);

BEGIN

ww_clk <= clk;
ww_clef <= clef;
ww_frein_normal <= frein_normal;
ww_acceleration <= acceleration;
led_start <= ww_led_start;
led0 <= ww_led0;
led1 <= ww_led1;
led2 <= ww_led2;
led3 <= ww_led3;
led4 <= ww_led4;
led5 <= ww_led5;
ten_seg <= ww_ten_seg;
one_seg <= ww_one_seg;
ww_devoe <= devoe;
ww_devclrn <= devclrn;
ww_devpor <= devpor;

\clk~clkctrl_INCLK_bus\ <= (gnd & gnd & gnd & \clk~combout\);
\ALT_INV_clef~combout\ <= NOT \clef~combout\;
\P1|ALT_INV_diz4\(0) <= NOT \P1|diz4\(0);

-- Location: LCFF_X63_Y21_N7
\P1|PRESCALER[0]\ : cycloneii_lcell_ff
PORT MAP (
	clk => \clk~clkctrl_outclk\,
	datain => \P1|PRESCALER[0]~26_combout\,
	sclr => \P1|PRESCALER[0]~28_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	regout => \P1|PRESCALER\(0));

-- Location: LCFF_X63_Y21_N9
\P1|PRESCALER[1]\ : cycloneii_lcell_ff
PORT MAP (
	clk => \clk~clkctrl_outclk\,
	datain => \P1|PRESCALER[1]~29_combout\,
	sclr => \P1|PRESCALER[0]~28_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	regout => \P1|PRESCALER\(1));

-- Location: LCFF_X63_Y21_N11
\P1|PRESCALER[2]\ : cycloneii_lcell_ff
PORT MAP (
	clk => \clk~clkctrl_outclk\,
	datain => \P1|PRESCALER[2]~31_combout\,
	sclr => \P1|PRESCALER[0]~28_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	regout => \P1|PRESCALER\(2));

-- Location: LCFF_X63_Y21_N13
\P1|PRESCALER[3]\ : cycloneii_lcell_ff
PORT MAP (
	clk => \clk~clkctrl_outclk\,
	datain => \P1|PRESCALER[3]~33_combout\,
	sclr => \P1|PRESCALER[0]~28_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	regout => \P1|PRESCALER\(3));

-- Location: LCFF_X63_Y21_N15
\P1|PRESCALER[4]\ : cycloneii_lcell_ff
PORT MAP (
	clk => \clk~clkctrl_outclk\,
	datain => \P1|PRESCALER[4]~35_combout\,
	sclr => \P1|PRESCALER[0]~28_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	regout => \P1|PRESCALER\(4));

-- Location: LCFF_X63_Y21_N17
\P1|PRESCALER[5]\ : cycloneii_lcell_ff
PORT MAP (
	clk => \clk~clkctrl_outclk\,
	datain => \P1|PRESCALER[5]~37_combout\,
	sclr => \P1|PRESCALER[0]~28_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	regout => \P1|PRESCALER\(5));

-- Location: LCFF_X63_Y21_N19
\P1|PRESCALER[6]\ : cycloneii_lcell_ff
PORT MAP (
	clk => \clk~clkctrl_outclk\,
	datain => \P1|PRESCALER[6]~39_combout\,
	sclr => \P1|PRESCALER[0]~28_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	regout => \P1|PRESCALER\(6));

-- Location: LCFF_X63_Y21_N21
\P1|PRESCALER[7]\ : cycloneii_lcell_ff
PORT MAP (
	clk => \clk~clkctrl_outclk\,
	datain => \P1|PRESCALER[7]~41_combout\,
	sclr => \P1|PRESCALER[0]~28_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	regout => \P1|PRESCALER\(7));

-- Location: LCFF_X63_Y21_N23
\P1|PRESCALER[8]\ : cycloneii_lcell_ff
PORT MAP (
	clk => \clk~clkctrl_outclk\,
	datain => \P1|PRESCALER[8]~43_combout\,
	sclr => \P1|PRESCALER[0]~28_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	regout => \P1|PRESCALER\(8));

-- Location: LCFF_X63_Y21_N25
\P1|PRESCALER[9]\ : cycloneii_lcell_ff
PORT MAP (
	clk => \clk~clkctrl_outclk\,
	datain => \P1|PRESCALER[9]~45_combout\,
	sclr => \P1|PRESCALER[0]~28_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	regout => \P1|PRESCALER\(9));

-- Location: LCFF_X63_Y21_N27
\P1|PRESCALER[10]\ : cycloneii_lcell_ff
PORT MAP (
	clk => \clk~clkctrl_outclk\,
	datain => \P1|PRESCALER[10]~47_combout\,
	sclr => \P1|PRESCALER[0]~28_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	regout => \P1|PRESCALER\(10));

-- Location: LCFF_X63_Y21_N29
\P1|PRESCALER[11]\ : cycloneii_lcell_ff
PORT MAP (
	clk => \clk~clkctrl_outclk\,
	datain => \P1|PRESCALER[11]~49_combout\,
	sclr => \P1|PRESCALER[0]~28_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	regout => \P1|PRESCALER\(11));

-- Location: LCFF_X64_Y20_N17
\P1|PRESCALER[12]\ : cycloneii_lcell_ff
PORT MAP (
	clk => \clk~clkctrl_outclk\,
	sdata => \P1|PRESCALER[12]~51_combout\,
	sclr => \P1|PRESCALER[0]~28_combout\,
	sload => VCC,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	regout => \P1|PRESCALER\(12));

-- Location: LCFF_X64_Y20_N31
\P1|PRESCALER[13]\ : cycloneii_lcell_ff
PORT MAP (
	clk => \clk~clkctrl_outclk\,
	sdata => \P1|PRESCALER[13]~53_combout\,
	sclr => \P1|PRESCALER[0]~28_combout\,
	sload => VCC,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	regout => \P1|PRESCALER\(13));

-- Location: LCFF_X63_Y20_N3
\P1|PRESCALER[14]\ : cycloneii_lcell_ff
PORT MAP (
	clk => \clk~clkctrl_outclk\,
	datain => \P1|PRESCALER[14]~55_combout\,
	sclr => \P1|PRESCALER[0]~28_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	regout => \P1|PRESCALER\(14));

-- Location: LCFF_X63_Y20_N5
\P1|PRESCALER[15]\ : cycloneii_lcell_ff
PORT MAP (
	clk => \clk~clkctrl_outclk\,
	datain => \P1|PRESCALER[15]~57_combout\,
	sclr => \P1|PRESCALER[0]~28_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	regout => \P1|PRESCALER\(15));

-- Location: LCFF_X63_Y20_N7
\P1|PRESCALER[16]\ : cycloneii_lcell_ff
PORT MAP (
	clk => \clk~clkctrl_outclk\,
	datain => \P1|PRESCALER[16]~59_combout\,
	sclr => \P1|PRESCALER[0]~28_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	regout => \P1|PRESCALER\(16));

-- Location: LCFF_X63_Y20_N9
\P1|PRESCALER[17]\ : cycloneii_lcell_ff
PORT MAP (
	clk => \clk~clkctrl_outclk\,
	datain => \P1|PRESCALER[17]~61_combout\,
	sclr => \P1|PRESCALER[0]~28_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	regout => \P1|PRESCALER\(17));

-- Location: LCFF_X63_Y20_N11
\P1|PRESCALER[18]\ : cycloneii_lcell_ff
PORT MAP (
	clk => \clk~clkctrl_outclk\,
	datain => \P1|PRESCALER[18]~63_combout\,
	sclr => \P1|PRESCALER[0]~28_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	regout => \P1|PRESCALER\(18));

-- Location: LCFF_X63_Y20_N13
\P1|PRESCALER[19]\ : cycloneii_lcell_ff
PORT MAP (
	clk => \clk~clkctrl_outclk\,
	datain => \P1|PRESCALER[19]~65_combout\,
	sclr => \P1|PRESCALER[0]~28_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	regout => \P1|PRESCALER\(19));

-- Location: LCFF_X63_Y20_N15
\P1|PRESCALER[20]\ : cycloneii_lcell_ff
PORT MAP (
	clk => \clk~clkctrl_outclk\,
	datain => \P1|PRESCALER[20]~67_combout\,
	sclr => \P1|PRESCALER[0]~28_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	regout => \P1|PRESCALER\(20));

-- Location: LCFF_X63_Y20_N17
\P1|PRESCALER[21]\ : cycloneii_lcell_ff
PORT MAP (
	clk => \clk~clkctrl_outclk\,
	datain => \P1|PRESCALER[21]~69_combout\,
	sclr => \P1|PRESCALER[0]~28_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	regout => \P1|PRESCALER\(21));

-- Location: LCFF_X63_Y20_N19
\P1|PRESCALER[22]\ : cycloneii_lcell_ff
PORT MAP (
	clk => \clk~clkctrl_outclk\,
	datain => \P1|PRESCALER[22]~71_combout\,
	sclr => \P1|PRESCALER[0]~28_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	regout => \P1|PRESCALER\(22));

-- Location: LCFF_X63_Y20_N21
\P1|PRESCALER[23]\ : cycloneii_lcell_ff
PORT MAP (
	clk => \clk~clkctrl_outclk\,
	datain => \P1|PRESCALER[23]~73_combout\,
	sclr => \P1|PRESCALER[0]~28_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	regout => \P1|PRESCALER\(23));

-- Location: LCFF_X63_Y20_N23
\P1|PRESCALER[24]\ : cycloneii_lcell_ff
PORT MAP (
	clk => \clk~clkctrl_outclk\,
	datain => \P1|PRESCALER[24]~75_combout\,
	sclr => \P1|PRESCALER[0]~28_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	regout => \P1|PRESCALER\(24));

-- Location: LCFF_X63_Y20_N25
\P1|PRESCALER[25]\ : cycloneii_lcell_ff
PORT MAP (
	clk => \clk~clkctrl_outclk\,
	datain => \P1|PRESCALER[25]~77_combout\,
	sclr => \P1|PRESCALER[0]~28_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	regout => \P1|PRESCALER\(25));

-- Location: LCCOMB_X63_Y21_N6
\P1|PRESCALER[0]~26\ : cycloneii_lcell_comb
-- Equation(s):
-- \P1|PRESCALER[0]~26_combout\ = \P1|PRESCALER\(0) $ (VCC)
-- \P1|PRESCALER[0]~27\ = CARRY(\P1|PRESCALER\(0))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0101010110101010",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \P1|PRESCALER\(0),
	datad => VCC,
	combout => \P1|PRESCALER[0]~26_combout\,
	cout => \P1|PRESCALER[0]~27\);

-- Location: LCCOMB_X63_Y21_N8
\P1|PRESCALER[1]~29\ : cycloneii_lcell_comb
-- Equation(s):
-- \P1|PRESCALER[1]~29_combout\ = (\P1|PRESCALER\(1) & (!\P1|PRESCALER[0]~27\)) # (!\P1|PRESCALER\(1) & ((\P1|PRESCALER[0]~27\) # (GND)))
-- \P1|PRESCALER[1]~30\ = CARRY((!\P1|PRESCALER[0]~27\) # (!\P1|PRESCALER\(1)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0011110000111111",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	datab => \P1|PRESCALER\(1),
	datad => VCC,
	cin => \P1|PRESCALER[0]~27\,
	combout => \P1|PRESCALER[1]~29_combout\,
	cout => \P1|PRESCALER[1]~30\);

-- Location: LCCOMB_X63_Y21_N10
\P1|PRESCALER[2]~31\ : cycloneii_lcell_comb
-- Equation(s):
-- \P1|PRESCALER[2]~31_combout\ = (\P1|PRESCALER\(2) & (\P1|PRESCALER[1]~30\ $ (GND))) # (!\P1|PRESCALER\(2) & (!\P1|PRESCALER[1]~30\ & VCC))
-- \P1|PRESCALER[2]~32\ = CARRY((\P1|PRESCALER\(2) & !\P1|PRESCALER[1]~30\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1010010100001010",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	dataa => \P1|PRESCALER\(2),
	datad => VCC,
	cin => \P1|PRESCALER[1]~30\,
	combout => \P1|PRESCALER[2]~31_combout\,
	cout => \P1|PRESCALER[2]~32\);

-- Location: LCCOMB_X63_Y21_N12
\P1|PRESCALER[3]~33\ : cycloneii_lcell_comb
-- Equation(s):
-- \P1|PRESCALER[3]~33_combout\ = (\P1|PRESCALER\(3) & (!\P1|PRESCALER[2]~32\)) # (!\P1|PRESCALER\(3) & ((\P1|PRESCALER[2]~32\) # (GND)))
-- \P1|PRESCALER[3]~34\ = CARRY((!\P1|PRESCALER[2]~32\) # (!\P1|PRESCALER\(3)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0101101001011111",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	dataa => \P1|PRESCALER\(3),
	datad => VCC,
	cin => \P1|PRESCALER[2]~32\,
	combout => \P1|PRESCALER[3]~33_combout\,
	cout => \P1|PRESCALER[3]~34\);

-- Location: LCCOMB_X63_Y21_N14
\P1|PRESCALER[4]~35\ : cycloneii_lcell_comb
-- Equation(s):
-- \P1|PRESCALER[4]~35_combout\ = (\P1|PRESCALER\(4) & (\P1|PRESCALER[3]~34\ $ (GND))) # (!\P1|PRESCALER\(4) & (!\P1|PRESCALER[3]~34\ & VCC))
-- \P1|PRESCALER[4]~36\ = CARRY((\P1|PRESCALER\(4) & !\P1|PRESCALER[3]~34\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1100001100001100",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	datab => \P1|PRESCALER\(4),
	datad => VCC,
	cin => \P1|PRESCALER[3]~34\,
	combout => \P1|PRESCALER[4]~35_combout\,
	cout => \P1|PRESCALER[4]~36\);

-- Location: LCCOMB_X63_Y21_N16
\P1|PRESCALER[5]~37\ : cycloneii_lcell_comb
-- Equation(s):
-- \P1|PRESCALER[5]~37_combout\ = (\P1|PRESCALER\(5) & (!\P1|PRESCALER[4]~36\)) # (!\P1|PRESCALER\(5) & ((\P1|PRESCALER[4]~36\) # (GND)))
-- \P1|PRESCALER[5]~38\ = CARRY((!\P1|PRESCALER[4]~36\) # (!\P1|PRESCALER\(5)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0101101001011111",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	dataa => \P1|PRESCALER\(5),
	datad => VCC,
	cin => \P1|PRESCALER[4]~36\,
	combout => \P1|PRESCALER[5]~37_combout\,
	cout => \P1|PRESCALER[5]~38\);

-- Location: LCCOMB_X63_Y21_N18
\P1|PRESCALER[6]~39\ : cycloneii_lcell_comb
-- Equation(s):
-- \P1|PRESCALER[6]~39_combout\ = (\P1|PRESCALER\(6) & (\P1|PRESCALER[5]~38\ $ (GND))) # (!\P1|PRESCALER\(6) & (!\P1|PRESCALER[5]~38\ & VCC))
-- \P1|PRESCALER[6]~40\ = CARRY((\P1|PRESCALER\(6) & !\P1|PRESCALER[5]~38\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1100001100001100",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	datab => \P1|PRESCALER\(6),
	datad => VCC,
	cin => \P1|PRESCALER[5]~38\,
	combout => \P1|PRESCALER[6]~39_combout\,
	cout => \P1|PRESCALER[6]~40\);

-- Location: LCCOMB_X63_Y21_N20
\P1|PRESCALER[7]~41\ : cycloneii_lcell_comb
-- Equation(s):
-- \P1|PRESCALER[7]~41_combout\ = (\P1|PRESCALER\(7) & (!\P1|PRESCALER[6]~40\)) # (!\P1|PRESCALER\(7) & ((\P1|PRESCALER[6]~40\) # (GND)))
-- \P1|PRESCALER[7]~42\ = CARRY((!\P1|PRESCALER[6]~40\) # (!\P1|PRESCALER\(7)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0101101001011111",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	dataa => \P1|PRESCALER\(7),
	datad => VCC,
	cin => \P1|PRESCALER[6]~40\,
	combout => \P1|PRESCALER[7]~41_combout\,
	cout => \P1|PRESCALER[7]~42\);

-- Location: LCCOMB_X63_Y21_N22
\P1|PRESCALER[8]~43\ : cycloneii_lcell_comb
-- Equation(s):
-- \P1|PRESCALER[8]~43_combout\ = (\P1|PRESCALER\(8) & (\P1|PRESCALER[7]~42\ $ (GND))) # (!\P1|PRESCALER\(8) & (!\P1|PRESCALER[7]~42\ & VCC))
-- \P1|PRESCALER[8]~44\ = CARRY((\P1|PRESCALER\(8) & !\P1|PRESCALER[7]~42\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1100001100001100",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	datab => \P1|PRESCALER\(8),
	datad => VCC,
	cin => \P1|PRESCALER[7]~42\,
	combout => \P1|PRESCALER[8]~43_combout\,
	cout => \P1|PRESCALER[8]~44\);

-- Location: LCCOMB_X63_Y21_N24
\P1|PRESCALER[9]~45\ : cycloneii_lcell_comb
-- Equation(s):
-- \P1|PRESCALER[9]~45_combout\ = (\P1|PRESCALER\(9) & (!\P1|PRESCALER[8]~44\)) # (!\P1|PRESCALER\(9) & ((\P1|PRESCALER[8]~44\) # (GND)))
-- \P1|PRESCALER[9]~46\ = CARRY((!\P1|PRESCALER[8]~44\) # (!\P1|PRESCALER\(9)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0101101001011111",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	dataa => \P1|PRESCALER\(9),
	datad => VCC,
	cin => \P1|PRESCALER[8]~44\,
	combout => \P1|PRESCALER[9]~45_combout\,
	cout => \P1|PRESCALER[9]~46\);

-- Location: LCCOMB_X63_Y21_N26
\P1|PRESCALER[10]~47\ : cycloneii_lcell_comb
-- Equation(s):
-- \P1|PRESCALER[10]~47_combout\ = (\P1|PRESCALER\(10) & (\P1|PRESCALER[9]~46\ $ (GND))) # (!\P1|PRESCALER\(10) & (!\P1|PRESCALER[9]~46\ & VCC))
-- \P1|PRESCALER[10]~48\ = CARRY((\P1|PRESCALER\(10) & !\P1|PRESCALER[9]~46\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1100001100001100",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	datab => \P1|PRESCALER\(10),
	datad => VCC,
	cin => \P1|PRESCALER[9]~46\,
	combout => \P1|PRESCALER[10]~47_combout\,
	cout => \P1|PRESCALER[10]~48\);

-- Location: LCCOMB_X63_Y21_N28
\P1|PRESCALER[11]~49\ : cycloneii_lcell_comb
-- Equation(s):
-- \P1|PRESCALER[11]~49_combout\ = (\P1|PRESCALER\(11) & (!\P1|PRESCALER[10]~48\)) # (!\P1|PRESCALER\(11) & ((\P1|PRESCALER[10]~48\) # (GND)))
-- \P1|PRESCALER[11]~50\ = CARRY((!\P1|PRESCALER[10]~48\) # (!\P1|PRESCALER\(11)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0011110000111111",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	datab => \P1|PRESCALER\(11),
	datad => VCC,
	cin => \P1|PRESCALER[10]~48\,
	combout => \P1|PRESCALER[11]~49_combout\,
	cout => \P1|PRESCALER[11]~50\);

-- Location: LCCOMB_X63_Y21_N30
\P1|PRESCALER[12]~51\ : cycloneii_lcell_comb
-- Equation(s):
-- \P1|PRESCALER[12]~51_combout\ = (\P1|PRESCALER\(12) & (\P1|PRESCALER[11]~50\ $ (GND))) # (!\P1|PRESCALER\(12) & (!\P1|PRESCALER[11]~50\ & VCC))
-- \P1|PRESCALER[12]~52\ = CARRY((\P1|PRESCALER\(12) & !\P1|PRESCALER[11]~50\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1100001100001100",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	datab => \P1|PRESCALER\(12),
	datad => VCC,
	cin => \P1|PRESCALER[11]~50\,
	combout => \P1|PRESCALER[12]~51_combout\,
	cout => \P1|PRESCALER[12]~52\);

-- Location: LCCOMB_X63_Y20_N0
\P1|PRESCALER[13]~53\ : cycloneii_lcell_comb
-- Equation(s):
-- \P1|PRESCALER[13]~53_combout\ = (\P1|PRESCALER\(13) & (!\P1|PRESCALER[12]~52\)) # (!\P1|PRESCALER\(13) & ((\P1|PRESCALER[12]~52\) # (GND)))
-- \P1|PRESCALER[13]~54\ = CARRY((!\P1|PRESCALER[12]~52\) # (!\P1|PRESCALER\(13)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0011110000111111",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	datab => \P1|PRESCALER\(13),
	datad => VCC,
	cin => \P1|PRESCALER[12]~52\,
	combout => \P1|PRESCALER[13]~53_combout\,
	cout => \P1|PRESCALER[13]~54\);

-- Location: LCCOMB_X63_Y20_N2
\P1|PRESCALER[14]~55\ : cycloneii_lcell_comb
-- Equation(s):
-- \P1|PRESCALER[14]~55_combout\ = (\P1|PRESCALER\(14) & (\P1|PRESCALER[13]~54\ $ (GND))) # (!\P1|PRESCALER\(14) & (!\P1|PRESCALER[13]~54\ & VCC))
-- \P1|PRESCALER[14]~56\ = CARRY((\P1|PRESCALER\(14) & !\P1|PRESCALER[13]~54\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1100001100001100",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	datab => \P1|PRESCALER\(14),
	datad => VCC,
	cin => \P1|PRESCALER[13]~54\,
	combout => \P1|PRESCALER[14]~55_combout\,
	cout => \P1|PRESCALER[14]~56\);

-- Location: LCCOMB_X63_Y20_N4
\P1|PRESCALER[15]~57\ : cycloneii_lcell_comb
-- Equation(s):
-- \P1|PRESCALER[15]~57_combout\ = (\P1|PRESCALER\(15) & (!\P1|PRESCALER[14]~56\)) # (!\P1|PRESCALER\(15) & ((\P1|PRESCALER[14]~56\) # (GND)))
-- \P1|PRESCALER[15]~58\ = CARRY((!\P1|PRESCALER[14]~56\) # (!\P1|PRESCALER\(15)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0011110000111111",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	datab => \P1|PRESCALER\(15),
	datad => VCC,
	cin => \P1|PRESCALER[14]~56\,
	combout => \P1|PRESCALER[15]~57_combout\,
	cout => \P1|PRESCALER[15]~58\);

-- Location: LCCOMB_X63_Y20_N6
\P1|PRESCALER[16]~59\ : cycloneii_lcell_comb
-- Equation(s):
-- \P1|PRESCALER[16]~59_combout\ = (\P1|PRESCALER\(16) & (\P1|PRESCALER[15]~58\ $ (GND))) # (!\P1|PRESCALER\(16) & (!\P1|PRESCALER[15]~58\ & VCC))
-- \P1|PRESCALER[16]~60\ = CARRY((\P1|PRESCALER\(16) & !\P1|PRESCALER[15]~58\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1010010100001010",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	dataa => \P1|PRESCALER\(16),
	datad => VCC,
	cin => \P1|PRESCALER[15]~58\,
	combout => \P1|PRESCALER[16]~59_combout\,
	cout => \P1|PRESCALER[16]~60\);

-- Location: LCCOMB_X63_Y20_N8
\P1|PRESCALER[17]~61\ : cycloneii_lcell_comb
-- Equation(s):
-- \P1|PRESCALER[17]~61_combout\ = (\P1|PRESCALER\(17) & (!\P1|PRESCALER[16]~60\)) # (!\P1|PRESCALER\(17) & ((\P1|PRESCALER[16]~60\) # (GND)))
-- \P1|PRESCALER[17]~62\ = CARRY((!\P1|PRESCALER[16]~60\) # (!\P1|PRESCALER\(17)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0011110000111111",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	datab => \P1|PRESCALER\(17),
	datad => VCC,
	cin => \P1|PRESCALER[16]~60\,
	combout => \P1|PRESCALER[17]~61_combout\,
	cout => \P1|PRESCALER[17]~62\);

-- Location: LCCOMB_X63_Y20_N10
\P1|PRESCALER[18]~63\ : cycloneii_lcell_comb
-- Equation(s):
-- \P1|PRESCALER[18]~63_combout\ = (\P1|PRESCALER\(18) & (\P1|PRESCALER[17]~62\ $ (GND))) # (!\P1|PRESCALER\(18) & (!\P1|PRESCALER[17]~62\ & VCC))
-- \P1|PRESCALER[18]~64\ = CARRY((\P1|PRESCALER\(18) & !\P1|PRESCALER[17]~62\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1010010100001010",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	dataa => \P1|PRESCALER\(18),
	datad => VCC,
	cin => \P1|PRESCALER[17]~62\,
	combout => \P1|PRESCALER[18]~63_combout\,
	cout => \P1|PRESCALER[18]~64\);

-- Location: LCCOMB_X63_Y20_N12
\P1|PRESCALER[19]~65\ : cycloneii_lcell_comb
-- Equation(s):
-- \P1|PRESCALER[19]~65_combout\ = (\P1|PRESCALER\(19) & (!\P1|PRESCALER[18]~64\)) # (!\P1|PRESCALER\(19) & ((\P1|PRESCALER[18]~64\) # (GND)))
-- \P1|PRESCALER[19]~66\ = CARRY((!\P1|PRESCALER[18]~64\) # (!\P1|PRESCALER\(19)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0101101001011111",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	dataa => \P1|PRESCALER\(19),
	datad => VCC,
	cin => \P1|PRESCALER[18]~64\,
	combout => \P1|PRESCALER[19]~65_combout\,
	cout => \P1|PRESCALER[19]~66\);

-- Location: LCCOMB_X63_Y20_N14
\P1|PRESCALER[20]~67\ : cycloneii_lcell_comb
-- Equation(s):
-- \P1|PRESCALER[20]~67_combout\ = (\P1|PRESCALER\(20) & (\P1|PRESCALER[19]~66\ $ (GND))) # (!\P1|PRESCALER\(20) & (!\P1|PRESCALER[19]~66\ & VCC))
-- \P1|PRESCALER[20]~68\ = CARRY((\P1|PRESCALER\(20) & !\P1|PRESCALER[19]~66\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1100001100001100",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	datab => \P1|PRESCALER\(20),
	datad => VCC,
	cin => \P1|PRESCALER[19]~66\,
	combout => \P1|PRESCALER[20]~67_combout\,
	cout => \P1|PRESCALER[20]~68\);

-- Location: LCCOMB_X63_Y20_N16
\P1|PRESCALER[21]~69\ : cycloneii_lcell_comb
-- Equation(s):
-- \P1|PRESCALER[21]~69_combout\ = (\P1|PRESCALER\(21) & (!\P1|PRESCALER[20]~68\)) # (!\P1|PRESCALER\(21) & ((\P1|PRESCALER[20]~68\) # (GND)))
-- \P1|PRESCALER[21]~70\ = CARRY((!\P1|PRESCALER[20]~68\) # (!\P1|PRESCALER\(21)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0101101001011111",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	dataa => \P1|PRESCALER\(21),
	datad => VCC,
	cin => \P1|PRESCALER[20]~68\,
	combout => \P1|PRESCALER[21]~69_combout\,
	cout => \P1|PRESCALER[21]~70\);

-- Location: LCCOMB_X63_Y20_N18
\P1|PRESCALER[22]~71\ : cycloneii_lcell_comb
-- Equation(s):
-- \P1|PRESCALER[22]~71_combout\ = (\P1|PRESCALER\(22) & (\P1|PRESCALER[21]~70\ $ (GND))) # (!\P1|PRESCALER\(22) & (!\P1|PRESCALER[21]~70\ & VCC))
-- \P1|PRESCALER[22]~72\ = CARRY((\P1|PRESCALER\(22) & !\P1|PRESCALER[21]~70\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1100001100001100",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	datab => \P1|PRESCALER\(22),
	datad => VCC,
	cin => \P1|PRESCALER[21]~70\,
	combout => \P1|PRESCALER[22]~71_combout\,
	cout => \P1|PRESCALER[22]~72\);

-- Location: LCCOMB_X63_Y20_N20
\P1|PRESCALER[23]~73\ : cycloneii_lcell_comb
-- Equation(s):
-- \P1|PRESCALER[23]~73_combout\ = (\P1|PRESCALER\(23) & (!\P1|PRESCALER[22]~72\)) # (!\P1|PRESCALER\(23) & ((\P1|PRESCALER[22]~72\) # (GND)))
-- \P1|PRESCALER[23]~74\ = CARRY((!\P1|PRESCALER[22]~72\) # (!\P1|PRESCALER\(23)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0101101001011111",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	dataa => \P1|PRESCALER\(23),
	datad => VCC,
	cin => \P1|PRESCALER[22]~72\,
	combout => \P1|PRESCALER[23]~73_combout\,
	cout => \P1|PRESCALER[23]~74\);

-- Location: LCCOMB_X63_Y20_N22
\P1|PRESCALER[24]~75\ : cycloneii_lcell_comb
-- Equation(s):
-- \P1|PRESCALER[24]~75_combout\ = (\P1|PRESCALER\(24) & (\P1|PRESCALER[23]~74\ $ (GND))) # (!\P1|PRESCALER\(24) & (!\P1|PRESCALER[23]~74\ & VCC))
-- \P1|PRESCALER[24]~76\ = CARRY((\P1|PRESCALER\(24) & !\P1|PRESCALER[23]~74\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1100001100001100",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	datab => \P1|PRESCALER\(24),
	datad => VCC,
	cin => \P1|PRESCALER[23]~74\,
	combout => \P1|PRESCALER[24]~75_combout\,
	cout => \P1|PRESCALER[24]~76\);

-- Location: LCCOMB_X63_Y20_N24
\P1|PRESCALER[25]~77\ : cycloneii_lcell_comb
-- Equation(s):
-- \P1|PRESCALER[25]~77_combout\ = \P1|PRESCALER\(25) $ (\P1|PRESCALER[24]~76\)

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0101101001011010",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	dataa => \P1|PRESCALER\(25),
	cin => \P1|PRESCALER[24]~76\,
	combout => \P1|PRESCALER[25]~77_combout\);

-- Location: LCFF_X64_Y20_N21
\P1|cnt_one_enable\ : cycloneii_lcell_ff
PORT MAP (
	clk => \clk~clkctrl_outclk\,
	datain => \P1|Equal0~8_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	regout => \P1|cnt_one_enable~regout\);

-- Location: LCCOMB_X63_Y21_N4
\P1|Equal0~0\ : cycloneii_lcell_comb
-- Equation(s):
-- \P1|Equal0~0_combout\ = (\P1|PRESCALER\(2)) # ((\P1|PRESCALER\(1)) # ((\P1|PRESCALER\(0)) # (\P1|PRESCALER\(3))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111111111111110",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \P1|PRESCALER\(2),
	datab => \P1|PRESCALER\(1),
	datac => \P1|PRESCALER\(0),
	datad => \P1|PRESCALER\(3),
	combout => \P1|Equal0~0_combout\);

-- Location: LCCOMB_X63_Y21_N2
\P1|Equal0~1\ : cycloneii_lcell_comb
-- Equation(s):
-- \P1|Equal0~1_combout\ = (\P1|PRESCALER\(5)) # ((\P1|PRESCALER\(6)) # ((\P1|PRESCALER\(7)) # (\P1|PRESCALER\(4))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111111111111110",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \P1|PRESCALER\(5),
	datab => \P1|PRESCALER\(6),
	datac => \P1|PRESCALER\(7),
	datad => \P1|PRESCALER\(4),
	combout => \P1|Equal0~1_combout\);

-- Location: LCCOMB_X63_Y21_N0
\P1|Equal0~2\ : cycloneii_lcell_comb
-- Equation(s):
-- \P1|Equal0~2_combout\ = (\P1|PRESCALER\(9)) # ((\P1|PRESCALER\(8)) # ((\P1|PRESCALER\(10)) # (\P1|PRESCALER\(11))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111111111111110",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \P1|PRESCALER\(9),
	datab => \P1|PRESCALER\(8),
	datac => \P1|PRESCALER\(10),
	datad => \P1|PRESCALER\(11),
	combout => \P1|Equal0~2_combout\);

-- Location: LCCOMB_X64_Y20_N14
\P1|Equal0~3\ : cycloneii_lcell_comb
-- Equation(s):
-- \P1|Equal0~3_combout\ = (\P1|PRESCALER\(12)) # ((\P1|PRESCALER\(13)) # ((\P1|PRESCALER\(15)) # (\P1|PRESCALER\(14))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111111111111110",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \P1|PRESCALER\(12),
	datab => \P1|PRESCALER\(13),
	datac => \P1|PRESCALER\(15),
	datad => \P1|PRESCALER\(14),
	combout => \P1|Equal0~3_combout\);

-- Location: LCCOMB_X64_Y20_N28
\P1|Equal0~4\ : cycloneii_lcell_comb
-- Equation(s):
-- \P1|Equal0~4_combout\ = (\P1|Equal0~3_combout\) # ((\P1|Equal0~0_combout\) # ((\P1|Equal0~2_combout\) # (\P1|Equal0~1_combout\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111111111111110",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \P1|Equal0~3_combout\,
	datab => \P1|Equal0~0_combout\,
	datac => \P1|Equal0~2_combout\,
	datad => \P1|Equal0~1_combout\,
	combout => \P1|Equal0~4_combout\);

-- Location: LCCOMB_X63_Y20_N26
\P1|Equal0~5\ : cycloneii_lcell_comb
-- Equation(s):
-- \P1|Equal0~5_combout\ = (\P1|PRESCALER\(18)) # ((\P1|PRESCALER\(17)) # ((\P1|PRESCALER\(16)) # (\P1|PRESCALER\(19))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111111111111110",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \P1|PRESCALER\(18),
	datab => \P1|PRESCALER\(17),
	datac => \P1|PRESCALER\(16),
	datad => \P1|PRESCALER\(19),
	combout => \P1|Equal0~5_combout\);

-- Location: LCCOMB_X63_Y20_N28
\P1|Equal0~6\ : cycloneii_lcell_comb
-- Equation(s):
-- \P1|Equal0~6_combout\ = (\P1|PRESCALER\(21)) # ((\P1|PRESCALER\(20)) # ((\P1|PRESCALER\(23)) # (\P1|PRESCALER\(22))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111111111111110",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \P1|PRESCALER\(21),
	datab => \P1|PRESCALER\(20),
	datac => \P1|PRESCALER\(23),
	datad => \P1|PRESCALER\(22),
	combout => \P1|Equal0~6_combout\);

-- Location: LCCOMB_X63_Y20_N30
\P1|Equal0~7\ : cycloneii_lcell_comb
-- Equation(s):
-- \P1|Equal0~7_combout\ = ((\P1|Equal0~6_combout\) # ((\P1|PRESCALER\(24)) # (\P1|Equal0~5_combout\))) # (!\P1|PRESCALER\(25))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111111111111101",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \P1|PRESCALER\(25),
	datab => \P1|Equal0~6_combout\,
	datac => \P1|PRESCALER\(24),
	datad => \P1|Equal0~5_combout\,
	combout => \P1|Equal0~7_combout\);

-- Location: LCCOMB_X64_Y20_N20
\P1|Equal0~8\ : cycloneii_lcell_comb
-- Equation(s):
-- \P1|Equal0~8_combout\ = (!\P1|Equal0~7_combout\ & !\P1|Equal0~4_combout\)

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000000000001111",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datac => \P1|Equal0~7_combout\,
	datad => \P1|Equal0~4_combout\,
	combout => \P1|Equal0~8_combout\);

-- Location: LCCOMB_X64_Y20_N18
\P1|PRESCALER[0]~28\ : cycloneii_lcell_comb
-- Equation(s):
-- \P1|PRESCALER[0]~28_combout\ = ((!\P1|Equal0~7_combout\ & !\P1|Equal0~4_combout\)) # (!\clef~combout\)

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0101010101011111",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \clef~combout\,
	datac => \P1|Equal0~7_combout\,
	datad => \P1|Equal0~4_combout\,
	combout => \P1|PRESCALER[0]~28_combout\);

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

-- Location: LCCOMB_X64_Y20_N24
\P2|led_start~feeder\ : cycloneii_lcell_comb
-- Equation(s):
-- \P2|led_start~feeder_combout\ = VCC

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111111111111111",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	combout => \P2|led_start~feeder_combout\);

-- Location: PIN_N25,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: Default
\clef~I\ : cycloneii_io
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
	padio => ww_clef,
	combout => \clef~combout\);

-- Location: LCFF_X64_Y20_N25
\P2|led_start\ : cycloneii_lcell_ff
PORT MAP (
	clk => \clk~clkctrl_outclk\,
	datain => \P2|led_start~feeder_combout\,
	aclr => \ALT_INV_clef~combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	regout => \P2|led_start~regout\);

-- Location: LCCOMB_X64_Y20_N22
\P1|diz4[0]~0\ : cycloneii_lcell_comb
-- Equation(s):
-- \P1|diz4[0]~0_combout\ = (\P1|cnt_one_enable~regout\ & ((!\clef~combout\))) # (!\P1|cnt_one_enable~regout\ & (\P1|diz4\(0)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0101000011111010",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \P1|cnt_one_enable~regout\,
	datac => \P1|diz4\(0),
	datad => \clef~combout\,
	combout => \P1|diz4[0]~0_combout\);

-- Location: LCFF_X64_Y20_N23
\P1|diz4[0]\ : cycloneii_lcell_ff
PORT MAP (
	clk => \clk~clkctrl_outclk\,
	datain => \P1|diz4[0]~0_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	regout => \P1|diz4\(0));

-- Location: PIN_E2,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: Default
\frein_normal~I\ : cycloneii_io
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
	padio => ww_frein_normal);

-- Location: PIN_N23,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: Default
\acceleration~I\ : cycloneii_io
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
	padio => ww_acceleration);

-- Location: PIN_AE22,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: 24mA
\led_start~I\ : cycloneii_io
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
	datain => \P2|led_start~regout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	devoe => ww_devoe,
	oe => VCC,
	padio => ww_led_start);

-- Location: PIN_AE23,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: 24mA
\led0~I\ : cycloneii_io
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
	datain => GND,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	devoe => ww_devoe,
	oe => VCC,
	padio => ww_led0);

-- Location: PIN_AF23,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: 24mA
\led1~I\ : cycloneii_io
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
	datain => GND,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	devoe => ww_devoe,
	oe => VCC,
	padio => ww_led1);

-- Location: PIN_AB21,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: 24mA
\led2~I\ : cycloneii_io
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
	datain => GND,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	devoe => ww_devoe,
	oe => VCC,
	padio => ww_led2);

-- Location: PIN_AC22,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: 24mA
\led3~I\ : cycloneii_io
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
	datain => GND,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	devoe => ww_devoe,
	oe => VCC,
	padio => ww_led3);

-- Location: PIN_AD22,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: 24mA
\led4~I\ : cycloneii_io
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
	datain => GND,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	devoe => ww_devoe,
	oe => VCC,
	padio => ww_led4);

-- Location: PIN_AD23,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: 24mA
\led5~I\ : cycloneii_io
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
	datain => GND,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	devoe => ww_devoe,
	oe => VCC,
	padio => ww_led5);

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
	datain => \P1|ALT_INV_diz4\(0),
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
	datain => \P1|diz4\(0),
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
	datain => \P1|diz4\(0),
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
	datain => GND,
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
	datain => GND,
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
	datain => GND,
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
	datain => GND,
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
	datain => VCC,
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
	datain => GND,
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
	datain => GND,
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
	datain => GND,
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
	datain => GND,
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
	datain => GND,
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
	datain => GND,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	devoe => ww_devoe,
	oe => VCC,
	padio => ww_one_seg(6));
END structure;


