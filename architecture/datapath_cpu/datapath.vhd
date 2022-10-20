library ieee;
  use ieee.std_logic_1164.all;
  use ieee.numeric_std.all;

entity datapath is
  port (
    reset_n    : in std_logic;
    clk        : in std_logic;
    in1        : in std_logic_vector(31 downto 0);
    mode       : in std_logic_vector(1 downto 0);--00: idle; 01: load ; 10: run
    load_reg   : in  std_logic_vector(1 downto 0);--4 values !
    opcode     : in std_logic; --to be extended later !
    src1, src2 : in std_logic_vector(1 downto 0);
    dest       : in std_logic_vector(1 downto 0);
    f          : out std_logic_vector(31 downto 0)
  );
end entity;

architecture arch of datapath is
  signal r0,r1,r2,r3 : std_logic_vector(31 downto 0);
  signal operand_1,operand_2 : std_logic_vector(31 downto 0);
  signal f_sig : std_logic_vector(31 downto 0);
begin

  -- let's describe registers :
  -- we choose here to use a single process !
  registers: process(reset_n,clk)
  begin
    if reset_n='0' then
      r0 <= "00000000000000000000000000000000";
      r2 <= std_logic_vector(to_unsigned(0,32));
      r1 <= (others=>'0');
      r3 <= (others=>'0');
    elsif rising_edge(clk) then
      if mode="01" and load_reg="00" then
        r0 <= in1;
      elsif mode="10" and dest="00" then
        r0 <= f_sig;
      end if;

      if mode="01" and load_reg="01" then
        r0 <= in1;
      elsif mode="10" and dest="01" then
        r0 <= f_sig;
      end if;

      if mode="01" and load_reg="10" then
        r0 <= in1;
      elsif mode="10" and dest="10" then
        r0 <= f_sig;
      end if;

      if mode="01" and load_reg="11" then
        r0 <= in1;
      elsif mode="10" and dest="11" then
        r0 <= f_sig;
      end if;
    end if;
  end process;

  -- everything else is combinatorial !

  operand_1 <= r0 when src1="00" else
               r1 when src1="01" else
               r2 when src1="10" else
               r3;
  operand_2 <= r0 when src2="00" else
               r1 when src2="01" else
               r2 when src2="10" else
               r3;

  -- f_sig is used internally.

  -- here comes the novelty : type conversions !

  f_sig <= std_logic_vector(signed(operand_1) + signed(operand_2)) when opcode='1' else
           std_logic_vector(resize(signed(operand_1) * signed(operand_2),32));

  f <= f_sig; -- to output

end architecture;
