library ieee;
use ieee.std_logic_1164.all ;
use ieee.std_logic_unsigned.all; 

entity compteur is 
	port ( 
		clk, clef, frein_normal : in std_logic;
		acceleration, init      : in std_logic;
		need_change_speed       : out std_logic_vector(1 downto 0); 
		ten_seg                 : out std_logic_vector(6 downto 0); 
		one_seg                 : out std_logic_vector(6 downto 0);
		init_done               : out std_logic
	);
end; 

architecture compteur_archi of compteur is 
	signal PRESCALER : std_logic_vector(25 downto 0);
	signal cnt_one_enable : std_logic ;
	signal diz4 :	std_logic_vector(3 downto 0);
	signal unit4 :	std_logic_vector(3 downto 0) ; 
begin


decounter : process (CLK, clef)
	begin
		if rising_edge(CLK) then
			if CLEF = '0' then
				PRESCALER <= (others => '0');
			elsif PRESCALER = "10000000000000000000000000" then
			--elsif PRESCALER = "000000000000000000000010" then
				PRESCALER <= (others => '0');--"0000000000000000000000000"
			else
				PRESCALER <= PRESCALER + 1;	
			end if; 
			if PRESCALER = "10000000000000000000000000" then
		--	if PRESCALER = "0000000000000000000000010" then
				CNT_ONE_ENABLE <= '1';
			else
				CNT_ONE_ENABLE <= '0';
			end if;
		end if;
	end process;

P1:process(clk, clef, frein_normal, acceleration, init)
	begin

		if rising_edge(clk) then
			if cnt_one_enable='1' then
			init_done <= '0';
			if clef = '1' then 
				unit4 <= (others => '0');
				diz4 <= (others => '0'); 
				need_change_speed <= (others => '0'); 
			else
				if init = '0' then 
				  --if need_change_speed = "01" then 
					-- unit4 <= "0101";  
					 --diz4 <= "1000";
					 --init <= '1';
				  --elsif need_change_speed = "10" then 
					 --unit4 <= "0000";
					 --diz4 <= "0011";
					 --init <= '1';
					 unit4 <= "0000";
					 diz4 <= "0011"; 
					 init_done <= '1';
				elsif acceleration = '1' then 
						if unit4 = "1001" then 
							unit4 <= (others => '0');
							diz4 <= diz4 + 1;
						else unit4 <= unit4 + 1;
						end if;
						if diz4 = "0110" and unit4 = "0000" then
							need_change_speed <= "01"; -- si on acc�laire et que le conteur est � 60 on dit de qu'on doit monter le rapport
							need_change_speed <= "00";
						end if;
					
				elsif frein_normal = '0' then
						if unit4 = "0000" then 
							unit4 <= "1001";
							diz4 <= diz4 - 1;
						else unit4 <= unit4 - 1;
						end if;
						if diz4 = "0001" and unit4 = "0101" then 
							need_change_speed <= "10"; -- si on d�celaire et que le conteur est � 15 on dit de qu'on doit baisser le rapport
							need_change_speed <= "00" ;
						end if;
				end if;
				end if;
			end if;
		end if;
end process P1;	

--------- DECODER SEGMENT ONE ------------
decoder_seg_one : process(unit4)
	begin
		case unit4 is
			--when "0000" => ONE_SEG <= "0000001"; 
			when "0001" => one_seg <= "1001111";
			when "0010" => one_seg <= "0010010"; 
			when "0011" => one_seg <= "0000110";
			when "0100" => one_seg <= "1001100"; 
			when "0101" => one_seg <= "0100100";
			when "0110" => one_seg <= "0100000"; 
			when "0111" => one_seg <= "0001111";
			when "1000" => one_seg <= "0000000"; 
			when "1001" => one_seg <= "0000100";	
			when others => one_seg <= "0000001";
		end case;
end process;	
decoder_seg_ten : process(diz4)
	begin
		case diz4 is
		--	when "0000" => ten_SEG <= "0000001"; 
			when "0001" => ten_SEG <= "1001111";
			when "0010" => ten_SEG <= "0010010"; 
			when "0011" => ten_SEG <= "0000110";
			when "0100" => ten_SEG <= "1001100"; 
			when "0101" => ten_SEG <= "0100100";
			when "0110" => ten_SEG <= "0100000"; 
			when "0111" => ten_SEG <= "0001111";
			when "1000" => ten_SEG <= "0000000"; 
			when "1001" => ten_SEG <= "0000100";	
			when others => ten_SEG <= "0000001";
		end case;
end process;	

end compteur_archi;

	

