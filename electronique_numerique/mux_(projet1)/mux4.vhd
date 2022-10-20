Library ieee;
Use ieee.std_logic_1164.all;
Use ieee.numeric_std.all;

Entity mux4 is 
port(
a,b: in std_logic_vector (3 downto 0); --bus poids fort => poids faible 
sel: std_logic; --par defaut le mode in est pris en compte
sort: out std_logic_vector (3 downto 0) --mode out a preciser
);
end mux4;

architecture archi of mux4 is 
Signal cpt: std_logic_vector (3 downto 0);
begin
with sel select
sort <= a when '1', --sort recopie a lorsque sel = '1'
	b when others; --recopie b dans tous les autres cas
end archi;