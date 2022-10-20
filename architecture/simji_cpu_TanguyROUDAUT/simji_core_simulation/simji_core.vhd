-- Tanguy ROUDAUT FIPASE24

library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

entity simji_core is
  port (
    reset_n        : in  std_logic;
    clk            : in  std_logic;
    halt           : out std_logic;
    --
    instr_in       : in  std_logic_vector(31 downto 0);
    --
    data_in        : in  std_logic_vector(31 downto 0);
    data_out       : out std_logic_vector(31 downto 0)
  );
end entity;

architecture archi of simji_core is
  type regs_t is array(0 to 31) of std_logic_vector(31 downto 0);
  signal regs_r, regs_c : regs_t;
  signal halt_r, halt_c : std_logic;
begin

  -- process registers, permet une init asynchrone, et de récupérer les valeurs
  -- de sortie du processus pour les données en entré
  registers: process(reset_n, clk)
  begin
    if reset_n='0' then
      for i in 0 to 31 loop
        regs_r(i) <= (others=> '0');
      end loop;
      halt_r <= '0';
    elsif rising_edge(clk) then
      regs_r  <= regs_c;
      halt_r  <= halt_c;
    end if;
  end process;

  -- process permettant la réalisation des opérations
  decode_exec: process(data_in, instr_in, regs_r, halt_r)
    constant OPCODE_ADD        : std_logic_vector(4 downto 0) := "00001"; -- addition
    constant OPCODE_SUB        : std_logic_vector(4 downto 0) := "00010"; -- soustraction
    constant OPCODE_MUL        : std_logic_vector(4 downto 0) := "00011"; -- multiplication
    constant OPCODE_DIV        : std_logic_vector(4 downto 0) := "00100"; -- division
    constant OPCODE_AND        : std_logic_vector(4 downto 0) := "00101"; -- et logique
    constant OPCODE_OR         : std_logic_vector(4 downto 0) := "00110"; -- ou logique
    constant OPCODE_XOR        : std_logic_vector(4 downto 0) := "00111"; -- ou exclusif
	 --
    variable opcode        : std_logic_vector(4 downto 0); -- variable pour l'opération  
    variable alpha         : integer range 0 to 31; -- choix du registre d'entrée
    variable beta          : integer range 0 to 31; -- choix du registre de sortie
    variable imm_o         : signed(15 downto 0); -- calcul à partir du registre instr
    variable reg_o         : integer range 0 to 31; -- calcul avec un registre d'entrée
    variable o             : std_logic_vector(31 downto 0); -- variable tampon
    variable immo_flag     : std_logic; -- 1 si on fait l'opération avec imm_o ou reg_o
    variable regs_v        : regs_t; -- registre tampon qui changé à chaque étape du calc
    variable halt_v        : std_logic;
    variable instr_v       : std_logic_vector(31 downto 0); 
	 variable data_out_v    : std_logic_vector(31 downto 0); -- registre contenant le result

  --
  begin
	 -- variables tampon
    instr_v    := instr_in;
    regs_v     := regs_r;
    halt_v     := halt_r;

    -- init variables
	 data_out_v := (others=>'0');
    opcode        := "00000";
    immo_flag     := '0';
    imm_o         := (others=>'0');
    reg_o         := 0;
    alpha         := 0;
	 beta          := 0;

	 -- set variables
    opcode        :=                     instr_v(31 downto 27);
    alpha         := to_integer(unsigned(instr_v(26 downto 22)));
    beta          := to_integer(unsigned(instr_v( 4 downto  0)));
    immo_flag     :=                     instr_v(21);
    imm_o         :=              signed(instr_v(20 downto 5));
    reg_o         := to_integer(unsigned(instr_v(9 downto  5)));
	 regs_v(beta) := data_in;
    
    -- choix du second argument de l'opération
    if immo_flag='1' then
      o := std_logic_vector(resize(imm_o,32));
    else
      o := regs_v(reg_o);
    end if;

    -- réalisation du calcul signé en fonction de l'opérateur 
    case opcode is
      when OPCODE_ADD  =>
	report "OPCODE_ADD"; 
        regs_v(beta) := std_logic_vector(signed(regs_v(alpha)) + signed(o));
      when OPCODE_SUB  =>
	report "OPCODE_SUB"; 
        regs_v(beta) := std_logic_vector(signed(regs_v(alpha)) - signed(o));
      when OPCODE_MUL  =>
	report "OPCODE_MUL"; 
        regs_v(beta) := std_logic_vector(resize(signed(regs_v(alpha)) * signed(o),32));
      when OPCODE_DIV  =>
	report "OPCODE_DIV"; 
          regs_v(beta) := std_logic_vector(resize(signed(regs_v(alpha)) / signed(o),32));
      when OPCODE_AND  =>
	report "OPCODE_AND"; 
        regs_v(beta) := regs_v(alpha) and o;
      when OPCODE_OR  =>
	report "OPCODE_OR"; 
        regs_v(beta) := regs_v(alpha)  or o;
      when OPCODE_XOR  =>
	report "OPCODE_XOR"; 
        regs_v(beta) := regs_v(alpha) xor o;
      when others =>
        report "ERROR: Unknow operator";
    end case;
	 
    regs_v(0) := (others =>'0'); -- bit 0 à 0 
    data_out_v  := regs_v(beta); -- on donne à la sortie le résultat

    -- final update of combinatorial signals
    regs_c    <= regs_v; -- registre de sortie vaut le résultat
    halt_c    <= halt_v;
    data_out  <= data_out_v;
  end process;

end architecture;
