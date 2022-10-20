
library ieee;
use ieee.std_logic_1164.all ;
use ieee.std_logic_unsigned.all; 

entity boite_vitesse is 
port(
  clk, clef, frein_normal,  acceleration, init_done : in std_logic;
  need_change_speed : in std_logic_vector(1 downto 0);
  init, led_start, led0, led1, led2, led3, led4, led5 : out std_logic
);
end;

architecture archit_boite_vitesse of boite_vitesse is 
	signal cnt_one_enable : std_logic ;
	type state_type is (S0, S1, S2, S3, S4, S5);
	signal my_state : state_type;
begin


P2 : process (clk,clef,my_state, frein_normal)
begin

	if clef = '0' then
		my_state <= S0;
		led_start <= '0';
	elsif rising_edge(clk) then 
		led_start <= '1';
		if cnt_one_enable = '1' then 
			case my_state is 			 
				when S0 => 	if frein_normal = '1' and acceleration='0' then 
								my_state <= S1;
								init <= '0';
								while init_done /= '1' loop
								end loop;
								init <= '1';
							else
								led0 <= '1';
								my_state <= S0;
							end if ; 	

				when S1 => 	if acceleration = '0' and frein_normal = '1' and need_change_speed = "01" then
								my_state<= S2; 
								init <= '0';
								while init_done /= '1' loop
								end loop;
								init <= '1';
							elsif acceleration = '1' and frein_normal = '0' and need_change_speed = "10" then
								my_state <= S0;
								init <= '0';
								while init_done /= '1' loop
								led1 <= '0';
								end loop;
								init <= '1';
							else
								led1 <= '1';
								my_state <= S1;
							end if ; 

				when S2 => 	if acceleration = '0' and frein_normal = '1' and need_change_speed = "01" then 
								my_state<= S1; 
								init <= '0';
								while init_done /= '1' loop
								end loop;
								init <= '1';								
							elsif  acceleration = '1' and frein_normal = '0' and need_change_speed = "10" then 
								my_state <= S1;
								init <= '0';
								while init_done /= '1' loop
								end loop;
								init <= '1';
								led2 <= '0';
							else
								led2 <= '1';
								my_state <= S2;
							end if ;

				when S3 =>	if acceleration = '0' and frein_normal = '1' and need_change_speed = "01" then 
								my_state<= S2; 
								init <= '0';
								while init_done /= '1' loop
								end loop;
								init <= '1';
							elsif  acceleration = '1' and frein_normal = '0' and need_change_speed = "10" then 
								my_state <= S2;
								init <= '0';
								while init_done /= '1' loop
								end loop;
								init <= '1';
								led3 <= '0';
							else
								my_state <= S3;
								led3 <= '1';
							end if ;
					
				when S4 =>	if acceleration = '0' and frein_normal = '1' and need_change_speed = "01" then 
								my_state<= S2; 
								init <= '0';
								while init_done /= '1' loop
								end loop;
								init <= '1';
							elsif  acceleration = '1' and frein_normal = '0' and need_change_speed = "10" then 
								my_state <= S3;
								init <= '0';
								while init_done /= '1' loop
								end loop;
								init <= '1';
								led4 <= '0';
							else
								my_state <= S4;
								led4 <= '1';
							end if ;

				when S5 => 	if acceleration = '1' and frein_normal = '0' and need_change_speed = "01" then
								my_state<= S3; 
								init <= '0';
								while init_done /= '1' loop
								end loop;
								init <= '1';
								led5 <= '0';
							else
								my_state <= S5;
								led5 <= '1';
							end if ;
			end case ; 
		end if ; 
	end if ; 
end process P2 ; 
end archit_boite_vitesse ; 