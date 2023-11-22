library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

entity mult is
  port(
    a, b : in  std_logic_vector(3 downto 0);
    p : out std_logic_vector(7 downto 0)
  );
end entity;

architecture rtl of mult is
  constant zero : std_logic := '0';
  signal s0,s1,s2,s3 : std_logic_vector(3 downto 0);
  signal cout_0,cout_1,cout_2,cout_3,cout_4 : std_logic_vector(3 downto 0);

begin
  -- line 0
  a0b0 : entity work.cell port map (a(0),b(0),zero,zero       ,cout_0(0),s0(0));
  a1b0 : entity work.cell port map (a(1),b(0),zero,zero       ,cout_0(1),s0(1));
  a2b0 : entity work.cell port map (a(2),b(0),zero,zero       ,cout_0(2),s0(2));
  a3b0 : entity work.cell port map (a(3),b(0),zero,zero       ,cout_0(3),s0(3));
  -- line 1
  a0b1 : entity work.cell port map (a(0),b(1),cout_0(0),s0(1),cout_1(0),s1(0));
  a1b1 : entity work.cell port map (a(1),b(1),cout_0(1),s0(2),cout_1(1),s1(1));
  a2b1 : entity work.cell port map (a(2),b(1),cout_0(2),s0(3),cout_1(2),s1(2));
  a3b1 : entity work.cell port map (a(3),b(1),cout_0(3), zero,cout_1(3),s1(3));
  -- line 2
  a0b2 : entity work.cell port map (a(0),b(2),cout_1(0),s1(1),cout_2(0),s2(0));
  a1b2 : entity work.cell port map (a(1),b(2),cout_1(1),s1(2),cout_2(1),s2(1));
  a2b2 : entity work.cell port map (a(2),b(2),cout_1(2),s1(3),cout_2(2),s2(2));
  a3b2 : entity work.cell port map (a(3),b(2),cout_1(3), zero,cout_2(3),s2(3));
  -- line 3
  a0b3 : entity work.cell port map (a(0),b(3),cout_2(0),s2(1),cout_3(0),s3(0));
  a1b3 : entity work.cell port map (a(1),b(3),cout_2(1),s2(2),cout_3(1),s3(1));
  a2b3 : entity work.cell port map (a(2),b(3),cout_2(2),s2(3),cout_3(2),s3(2));
  a3b3 : entity work.cell port map (a(3),b(3),cout_2(3), zero,cout_3(3),s3(3));
  -- final adder is missing in the picture provided !
  final_ha_0: entity work.fa port map (s3(1),cout_3(0),zero     ,p(4),cout_4(0));
  final_ha_1: entity work.fa port map (s3(2),cout_3(1),cout_4(0),p(5),cout_4(1));
  final_ha_2: entity work.fa port map (s3(3),cout_3(2),cout_4(1),p(6),cout_4(2));
  final_ha_3: entity work.fa port map (zero ,cout_3(3),cout_4(2),p(7),cout_4(3));

  p(3 downto 0) <=  s3(0) & s2(0) & s1(0) & s0(0);

end rtl;
