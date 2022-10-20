---------------------------------------
--    SIGNALTAP TECHNICAL TRAINING     --
--    counter.vhd with unsigned        --
---------------------------------------
--
--library ieee;
--use ieee.std_logic_1164.all;
--use ieee.std_logic_unsigned.all;
--
--entity controle2022 is
--port(
--clk,reset,bp	: in std_logic;
--ten_seg 		:out std_logic_vector(6 downto 0);  -- affichage dizaines
--one_seg 		: out std_logic_vector(6 downto 0)  -- affichage unit�es
--);
--end;
--
--architecture archi of controle2022 is
--
--signal diz4	:	std_logic_vector(3 downto 0);
--signal unit4		:	std_logic_vector(3 downto 0);
--signal PRESCALER	: std_logic_vector(25 downto 0);
--signal cnt_one_enable : std_logic;
--
--begin
--
--decounter : process (CLK,reset)
--	begin
--		if rising_edge(CLK) then
--			if RESET = '0' then
--				PRESCALER <= (others => '0');
--			elsif PRESCALER = "10000000000000000000000000" then
--			--elsif PRESCALER = "000000000000000000000010" then
--				PRESCALER <= (others => '0');--"0000000000000000000000000"
--			else
--				PRESCALER <= PRESCALER + '1';	
--			end if; 
--			if PRESCALER = "10000000000000000000000000" then
--			--if PRESCALER = "0000000000000000000000010" then
--				CNT_ONE_ENABLE <= '1';
--			else
--				CNT_ONE_ENABLE <= '0';
--			end if;
--		end if;
--	end process;
--	
--P1:process(clk,reset)
--begin
--  --if clrn='0' then 				--identation
--  --   cnt <= (others => '0');
--  if rising_edge(clk) then
--		if cnt_one_enable='1' then
--			if reset ='0' then
--				unit4 <= (others => '0');  --"00000"
--				diz4 <= (others => '0');  --"00000"
--
--			--elsif load ='1' then
--			--cnt <= unsigned(data);
--			elsif diz4 = "1001" and unit4 = "1001" then
--				unit4 <= (others => '0');
--				diz4 <= (others => '0');
--			elsif unit4 = "1001" then 
--				unit4 <= (others => '0');
--				diz4 <= diz4 + 1;
--			else unit4 <= unit4 + 1;	--'1'
--			end if;
--  	   end if;
--  end if;
--end process P1;	
--
--
--
--count4 <= temp4;
------- DECODER SEGMENT ONE ------------
--	decoder_seg_one : process(unit4)
--	begin
--		case unit4 is
--			--when "0000" => ONE_SEG <= "0000001"; 
--			when "0001" => one_seg <= "1001111";
--			when "0010" => one_seg <= "0010010"; 
--			when "0011" => one_seg <= "0000110";
--			when "0100" => one_seg <= "1001100"; 
--			when "0101" => one_seg <= "0100100";
--			when "0110" => one_seg <= "0100000"; 
--			when "0111" => one_seg <= "0001111";
--			when "1000" => one_seg <= "0000000"; 
--			when "1001" => one_seg <= "0000100";	
--			when others => one_seg <= "0000001";
--		end case;
--	end process;	
--	
--	decoder_seg_ten : process(diz4)
--	begin
--		case diz4 is
--			when "0000" => ten_SEG <= "0000001"; 
--			when "0001" => ten_SEG <= "1001111";
--			when "0010" => ten_SEG <= "0010010"; 
--			when "0011" => ten_SEG <= "0000110";
--			when "0100" => ten_SEG <= "1001100"; 
--			when "0101" => ten_SEG <= "0100100";
--			when "0110" => ten_SEG <= "0100000"; 
--			when "0111" => ten_SEG <= "0001111";
--			when "1000" => ten_SEG <= "0000000"; 
--			when "1001" => ten_SEG <= "0000100";	
--			when others => ten_SEG <= "0000000";
--		end case;
--	end process;		
--end archi;





-------------------------------------------
----    SIGNALTAP TECHNICAL TRAINING     --
----    counter.vhd with integer         --
-------------------------------------------
--
--library ieee;
--use ieee.std_logic_1164.all;
--use ieee.std_logic_unsigned.all;
--
--entity controle2022 is
--port(
--clk,reset,bp	: in std_logic;
--ten_seg 		:out std_logic_vector(6 downto 0);  -- affichage dizaines
--one_seg 		: out std_logic_vector(6 downto 0)  -- affichage unit�es
--);
--end;
--
--architecture archi of controle2022 is
--
--signal diz4	:	std_logic_vector(3 downto 0);
--signal unit4		:	std_logic_vector(3 downto 0);
--signal PRESCALER	: std_logic_vector(25 downto 0);
--signal cnt : integer range 0 to 5;
--
--begin
--
--decounter : process (CLK,reset)
--	begin
--		if rising_edge(CLK) then
--			if RESET = '0' then
--				PRESCALER <= (others => '0');
--			elsif PRESCALER = "10000000000000000000000000" then
--			--elsif PRESCALER = "000000000000000000000010" then
--				PRESCALER <= (others => '0');--"0000000000000000000000000"
--			else
--				PRESCALER <= PRESCALER + '1';	
--			end if; 
--			if PRESCALER = "10000000000000000000000000" then
--			--if PRESCALER = "0000000000000000000000010" then
--				CNT <= CNT + 1;
--			end if;
--			
--			if CNT = 5 then
--				CNT <= 0 ;
--			end if;
--
--		end if;
--	end process;
--	
--P1:process(clk,reset)
--begin
--  --if clrn='0' then 				--identation
--  --   cnt <= (others => '0');
--  if rising_edge(clk) then
--		if cnt = 5 then
--			if reset ='0' then
--				unit4 <= (others => '0');  --"00000"
--				diz4 <= (others => '0');  --"00000"
--
--			--elsif load ='1' then
--			--cnt <= unsigned(data);
--			elsif diz4 = "1001" and unit4 = "1001" then
--				unit4 <= (others => '0');
--				diz4 <= (others => '0');
--			elsif unit4 = "1001" then 
--				unit4 <= (others => '0');
--				diz4 <= diz4 + 1;
--			else unit4 <= unit4 + 1;	--'1'
--			end if;
--  	   end if;
--  end if;
--end process P1;	
--
--
--
----count4 <= temp4;
----------- DECODER SEGMENT ONE ------------
--	decoder_seg_one : process(unit4)
--	begin
--		case unit4 is
--			--when "0000" => ONE_SEG <= "0000001"; 
--			when "0001" => one_seg <= "1001111";
--			when "0010" => one_seg <= "0010010"; 
--			when "0011" => one_seg <= "0000110";
--			when "0100" => one_seg <= "1001100"; 
--			when "0101" => one_seg <= "0100100";
--			when "0110" => one_seg <= "0100000"; 
--			when "0111" => one_seg <= "0001111";
--			when "1000" => one_seg <= "0000000"; 
--			when "1001" => one_seg <= "0000100";	
--			when others => one_seg <= "0000001";
--		end case;
--	end process;	
--	
--	decoder_seg_ten : process(diz4)
--	begin
--		case diz4 is
--			when "0000" => ten_SEG <= "0000001"; 
--			when "0001" => ten_SEG <= "1001111";
--			when "0010" => ten_SEG <= "0010010"; 
--			when "0011" => ten_SEG <= "0000110";
--			when "0100" => ten_SEG <= "1001100"; 
--			when "0101" => ten_SEG <= "0100100";
--			when "0110" => ten_SEG <= "0100000"; 
--			when "0111" => ten_SEG <= "0001111";
--			when "1000" => ten_SEG <= "0000000"; 
--			when "1001" => ten_SEG <= "0000100";	
--			when others => ten_SEG <= "0000000";
--		end case;
--	end process;		
--end archi;



-----------------------------------------------------
----    SIGNALTAP TECHNICAL TRAINING               --
---- counter decounter with unsigned and bp        --
-----------------------------------------------------
--
--library ieee;
--use ieee.std_logic_1164.all;
--use ieee.std_logic_unsigned.all;
--
--entity controle2022 is
--port(
--clk,reset,bp	: in std_logic;
--ten_seg 		:out std_logic_vector(6 downto 0);  -- affichage dizaines
--one_seg 		: out std_logic_vector(6 downto 0)  -- affichage unit�es
--);
--end;
--
--architecture archi of controle2022 is
--
--signal diz4	:	std_logic_vector(3 downto 0);
--signal unit4		:	std_logic_vector(3 downto 0);
--signal PRESCALER	: std_logic_vector(25 downto 0);
--signal cnt_one_enable : std_logic;
--
--begin
--
--decounter : process (CLK,reset)
--	begin
--		if rising_edge(CLK) then
--			if RESET = '0' then
--				PRESCALER <= (others => '0');
--			elsif PRESCALER = "10000000000000000000000000" then
--			--elsif PRESCALER = "000000000000000000000010" then
--				PRESCALER <= (others => '0');--"0000000000000000000000000"
--			else
--				PRESCALER <= PRESCALER + '1';	
--			end if; 
--			if PRESCALER = "10000000000000000000000000" then
--			--if PRESCALER = "0000000000000000000000010" then
--				CNT_ONE_ENABLE <= '1';
--			else
--				CNT_ONE_ENABLE <= '0';
--			end if;
--		end if;
--	end process;
--	
--P1:process(clk,reset)
--begin
--  --if clrn='0' then 				--identation
--  --   cnt <= (others => '0');
--  if rising_edge(clk) then
--		if reset ='0' then
--				unit4 <= (others => '0');  --"00000"
--				diz4 <= (others => '0');  --"00000"
--		elsif bp = '1' then 
--			if cnt_one_enable='1' then
--				if diz4 = "1001" and unit4 = "1001" then
--					unit4 <= (others => '0');
--					diz4 <= (others => '0');
--				elsif unit4 = "1001" then 
--					unit4 <= (others => '0');
--					diz4 <= diz4 + 1;
--				else unit4 <= unit4 + 1;	--'1'
--				end if;
--			end if;
--		elsif bp = '0' then
--			if cnt_one_enable='1' then
--				if diz4 = "0000" and unit4 = "0000" then
--					unit4 <= "1001";
--					diz4 <= "1001";
--				elsif unit4 = "0000" then 
--					unit4 <= "1001";
--					diz4 <= diz4 - 1;
--				else unit4 <= unit4 - 1;
--				end if;
--			end if;
--		end if;
--  end if;
--end process P1;	
--
--
--
----count4 <= temp4;
----------- DECODER SEGMENT ONE ------------
--	decoder_seg_one : process(unit4)
--	begin
--		case unit4 is
--			when "0000" => ONE_SEG <= "0000001"; 
--			when "0001" => one_seg <= "1001111";
--			when "0010" => one_seg <= "0010010"; 
--			when "0011" => one_seg <= "0000110";
--			when "0100" => one_seg <= "1001100"; 
--			when "0101" => one_seg <= "0100100";
--			when "0110" => one_seg <= "0100000"; 
--			when "0111" => one_seg <= "0001111";
--			when "1000" => one_seg <= "0000000"; 
--			when "1001" => one_seg <= "0000100";	
--			when others => one_seg <= "0000001";
--		end case;
--	end process;	
--	
--	decoder_seg_ten : process(diz4)
--	begin
--		case diz4 is
--			when "0000" => ten_SEG <= "0000001"; 
--			when "0001" => ten_SEG <= "1001111";
--			when "0010" => ten_SEG <= "0010010"; 
--			when "0011" => ten_SEG <= "0000110";
--			when "0100" => ten_SEG <= "1001100"; 
--			when "0101" => ten_SEG <= "0100100";
--			when "0110" => ten_SEG <= "0100000"; 
--			when "0111" => ten_SEG <= "0001111";
--			when "1000" => ten_SEG <= "0000000"; 
--			when "1001" => ten_SEG <= "0000100";	
--			when others => ten_SEG <= "0000000";
--		end case;
--	end process;		
--end archi;




---------------------------------------------------
--    SIGNALTAP TECHNICAL TRAINING               --
-- counter decounter with state machine          --
---------------------------------------------------

library ieee;
use ieee.std_logic_1164.all;
use ieee.std_logic_unsigned.all;

entity controle2022 is
port(
clk,reset,bp : in std_logic;
ten_seg :      out std_logic_vector(6 downto 0);  -- affichage dizaines
one_seg :      out std_logic_vector(6 downto 0)  -- affichage unites
);
end;

architecture archi of controle2022 is

signal diz4	:	std_logic_vector(3 downto 0);
signal unit4		:	std_logic_vector(3 downto 0);
signal PRESCALER	: std_logic_vector(25 downto 0);
signal cnt_one_enable : std_logic;
type state_type is (S1, S2, S3);
signal my_state: state_type;

begin

decounter : process (CLK,reset)
	begin
		if rising_edge(CLK) then
			if RESET = '0' then
				PRESCALER <= (others => '0');
			elsif PRESCALER = "10000000000000000000000000" then
			--elsif PRESCALER = "000000000000000000000010" then
				PRESCALER <= (others => '0');--"0000000000000000000000000"
			else
				PRESCALER <= PRESCALER + '1';	
			end if; 
			if PRESCALER = "10000000000000000000000000" then
			--if PRESCALER = "0000000000000000000000010" then
				CNT_ONE_ENABLE <= '1';
			else
				CNT_ONE_ENABLE <= '0';
			end if;
		end if;
end process;
	
P1:process(clk,reset, bp, cnt_one_enable)
begin

	if reset ='0' then
		my_state <= S1;		
	elsif rising_edge(clk) then
		if cnt_one_enable = '1' then
			case my_state is 
				when S1 => if bp = '1' then
									my_state <= S2;
							  elsif bp = '0' then
									my_state <= S3;
							  end if;
							  
				when S2 => if bp = '1' then
									my_state <= S2;
							  elsif bp = '0' then
									my_state <= S3;
							  end if;
								  
				when S3 => if bp = '1' then 
									my_state <= S2;
							  elsif bp = '0' then 
									my_state <= S3;
							  end if;
			end case;
		end if;
	end if;
end process P1;


P2:process(clk, cnt_one_enable)
begin
	if rising_edge(clk) then 
		if cnt_one_enable = '1' then 
			case my_state is 
				when S1 => 	unit4 <= (others => '0');  --"00000"
								diz4 <= (others => '0');  --"00000"
							  
				when S2 => if cnt_one_enable='1' then
									if diz4 = "1001" and unit4 = "1001" then
										unit4 <= (others => '0');
										diz4 <= (others => '0');
									elsif unit4 = "1001" then 
										unit4 <= (others => '0');
										diz4 <= diz4 + 1;
									else unit4 <= unit4 + 1;	--'1'
									end if;
								end if;
								
				when S3 => 	if cnt_one_enable='1' then
									if diz4 = "0000" and unit4 = "0000" then
										unit4 <= "1001";
										diz4 <= "1001";
									elsif unit4 = "0000" then 
										unit4 <= "1001";
										diz4 <= diz4 - 1;
									else unit4 <= unit4 - 1;
									end if;
								end if;
			end case;
		end if;
	end if;
end process P2;	



--count4 <= temp4;
--------- DECODER SEGMENT ONE ------------
	decoder_seg_one : process(unit4)
	begin
		case unit4 is
			when "0000" => ONE_SEG <= "0000001"; 
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
			when "0000" => ten_SEG <= "0000001"; 
			when "0001" => ten_SEG <= "1001111";
			when "0010" => ten_SEG <= "0010010"; 
			when "0011" => ten_SEG <= "0000110";
			when "0100" => ten_SEG <= "1001100"; 
			when "0101" => ten_SEG <= "0100100";
			when "0110" => ten_SEG <= "0100000"; 
			when "0111" => ten_SEG <= "0001111";
			when "1000" => ten_SEG <= "0000000"; 
			when "1001" => ten_SEG <= "0000100";	
			when others => ten_SEG <= "0000000";
		end case;
	end process;		
end archi;





