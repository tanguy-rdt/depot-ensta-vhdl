library ieee;
use ieee.std_logic_1164.all ;
use ieee.std_logic_unsigned.all; 

entity boite_vitesse is 
	port(
		clk, clef, frein_normal,  acceleration, init : in std_logic;
		need_change_speed : out std_logic_vector(1 downto 0); 
	);
end boite_vitesse;

architecture archit_boite_vitesse of boite_vitesse is 
	signal cnt_one_enable : std_logic ;
	signal s_need_change_speed : std_logic_vector(1 downto 0); 
	type state_type is (S0, S1, S2, S3, S4, S5);
	signal my_state : state_type;
begin


P2 : process (clk,clef,my_state, frein_normal)
begin
	if clef = '1' then
		my_state <= S0;
	elsif rising_edge(clk) then 
		if cnt_one_enable = '1' then 
			need_change_speed <= s_need_change_speed ;
			case my_state is 			 
				when S0 => 	if frein_normal = '1' and acceleration='0' then 
								my_state <= S1;
								init <= '1';
								s_need_change_speed <= "00" ;
							else
								my_state <= S0;
							end if ; 

				when S1 => 	if acceleration = '0' and frein_normal = '1' and s_need_change_speed = "01" then
								my_state<= S2; 
								init <= '1';
								s_need_change_speed <= "00" ; 
					
							elsif acceleration = '1' and frein_normal = '0' and s_need_change_speed = "10" then
								my_state <= S0;
								init <= '1';
								s_need_change_speed <= "00" ; 
							else
								my_state <= S1;
							end if ; 

				when S2 => 	if acceleration = '0' and frein_normal = '1' and s_need_change_speed = "01" then 
								my_state<= S1; 
								init <= '1';
								s_need_change_speed <= "00" ; 		
							elsif  acceleration = '1' and frein_normal = '0' and s_need_change_speed = "10" then 
								my_state <= S3;
								init <= '1';
								s_need_change_speed <= "00" ;
							else
								my_state <= S2;
							end if ;

				when S3 =>	if acceleration = '0' and frein_normal = '1' and s_need_change_speed = "01" then 
								my_state<= S2; 
								init <= '1';
								s_need_change_speed <= "00" ; 
							elsif  acceleration = '1' and frein_normal = '0' and s_need_change_speed = "10" then 
								my_state <= S4;
								init <= '1';
								need_change_speed <= "00" ; 
							else
								my_state <= S3;
							end if ;
					
				when S4 =>	if acceleration = '0' and frein_normal = '1' and s_need_change_speed = "01" then 
								my_state<= S2; 
								init <= '1';
								s_need_change_speed <= "00" ; 
							elsif  acceleration = '1' and frein_normal = '0' and s_need_change_speed = "10" then 
								my_state <= S4;
								init <= '1';
								need_change_speed <= "00" ; 
							else
								my_state <= S4;
							end if ;

				when S5 => 	if acceleration = '1' and frein_normal = '0' and s_need_change_speed = "01" then
								my_state<= S3; 
								init <= '1';
								s_need_change_speed <= "00" ; 
							else
								my_state <= S5;
							end if ;
			end case ; 
		end if ; 
	end if ; 
end process P2 ; 
end archit_boite_vitesse ; 