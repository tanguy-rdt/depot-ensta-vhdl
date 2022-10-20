library ieee;
use ieee.std_logic_1164.all;
use ieee.std_logic_unsigned.all;

entity top is
port(
  clk, clef, frein_normal,  acceleration             : in std_logic;
  led_start, led0, led1, led2, led3, led4, led5      : out std_logic;
	ten_seg                                           : out std_logic_vector(6 downto 0); 
	one_seg                                           : out std_logic_vector(6 downto 0)
);
end;

architecture archi of top is

component compteur
port(
		clk, clef, frein_normal, acceleration     : in std_logic;
		init                                      : in std_logic;
		need_change_speed                         : out std_logic_vector(1 downto 0); 
		ten_seg                                   : out std_logic_vector(6 downto 0); 
		one_seg                                   : out std_logic_vector(6 downto 0);
		init_done                                 : out std_logic
);
end component;

component boite_vitesse
port(
  clk, clef, frein_normal,  acceleration, init_done   : in std_logic;
  need_change_speed                                                    : in std_logic_vector(1 downto 0);
  init, led_start, led0, led1, led2, led3, led4, led5                  : out std_logic
);
end component;


signal cnt_one_enable : std_logic ;
signal diz4 :	std_logic_vector(3 downto 0);
signal unit4 :	std_logic_vector(3 downto 0) ; 
type state_type is (S0, S1, S2, S3, S4, S5);
signal my_state : state_type;
signal init : std_logic;
signal need_change_speed : std_logic_vector (1 downto 0);
signal init_done : std_logic;

begin 

P1:compteur port map(clk, clef, frein_normal, acceleration, init, need_change_speed, ten_seg, one_seg, init_done);
P2:boite_vitesse port map(clk, clef, frein_normal, acceleration, init_done, need_change_speed, init, led_start, led0, led1, led2, led3, led4, led5);



end archi;	