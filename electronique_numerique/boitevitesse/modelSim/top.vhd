library ieee;
use ieee.std_logic_1164.all;
use ieee.std_logic_unsigned.all;

entity top is
port(
	clk, reset, frein_normal, acceleration, init, clef	:in std_logic;
	ten_seg 		                        :out std_logic_vector(6 downto 0);
	one_seg 		                        : out std_logic_vector(6 downto 0);
	need_change_speed                               : out std_logic_vector(1 downto 0)
);
end;

architecture archi of top is

component compteur
port(
	clk, clef, frein_normal : in std_logic;
	acceleration, init      : in std_logic;
	need_change_speed       : out std_logic_vector(1 downto 0); 
	ten_seg                 : out std_logic_vector(6 downto 0); 
	one_seg                 : out std_logic_vector(6 downto 0)
);
end component;

component boite_vitesse
port(
	clk, clef, frein_normal,  acceleration, init : in std_logic;
	need_change_speed : out std_logic_vector(1 downto 0)
);
end component;


signal PRESCALER : std_logic_vector(25 downto 0);
signal cnt_one_enable : std_logic ;
signal diz4 :	std_logic_vector(3 downto 0);
signal unit4 :	std_logic_vector(3 downto 0) ; 
type state_type is (S0, S1, S2, S3, S4, S5);
signal my_state : state_type;

begin 

e1:compteur port map(clk, clef, frein_normal, acceleration, init, need_change_speed, ten_seg, one_seg);
e2:boite_vitesse port map(clk, clef, frein_normal, acceleration, init, need_change_speed);



end archi;	