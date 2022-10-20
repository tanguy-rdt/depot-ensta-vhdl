library ieee;
use ieee.std_logic_1164.all;

entity soustractor is
  port(
    a, b : in  std_logic_vector(7 downto 0);
    sum  : out std_logic_vector(7 downto 0);
    cout : out std_logic;
    cmd : in std_logic
    );
end entity soustractor;


architecture structural of soustractor is
  signal cin   : std_logic;
  signal cout_s  : std_logic_vector(7 downto 0);
  signal b_s : std_logic_vector(7 downto 0);

begin  -- architecture logic
  process(cmd)
  begin
    if cmd = '1' then
      cin <= '1';
      b_s <= not b;
    elsif cmd = '0' then
      cin <= '0';
      b_s <= b;
    end if;
  end process;


  fa_1: entity work.fa
    port map (
      a    => a(0),
      b    => b_s(0),
      cin  => cin,
      sum  => sum(0),
      cout => cout_s(0));

  fa_2: entity work.fa
    port map (
      a    => a(1),
      b    => b_s(1),
      cin  => cout_s(0),
      sum  => sum(1),
      cout => cout_s(1));

  fa_3: entity work.fa
    port map (
      a    => a(2),
      b    => b_s(2),
      cin  => cout_s(1),
      sum  => sum(2),
      cout => cout_s(2));

  fa_4: entity work.fa
    port map (
      a    => a(3),
      b    => b_s(3),
      cin  => cout_s(2),
      sum  => sum(3),
      cout => cout_s(3));

  fa_5: entity work.fa
    port map (
      a    => a(4),
      b    => b_s(4),
      cin  => cout_s(3),
      sum  => sum(4),
      cout => cout_s(4));

  fa_6: entity work.fa
    port map (
      a    => a(5),
      b    => b_s(5),
      cin  => cout_s(4),
      sum  => sum(5),
      cout => cout_s(5));

  fa_7: entity work.fa
    port map (
      a    => a(6),
      b    => b_s(6),
      cin  => cout_s(5),
      sum  => sum(6),
      cout => cout_s(6));

  fa_8: entity work.fa
    port map (
      a    => a(7),
      b    => b_s(7),
      cin  => cout_s(6),
      sum  => sum(7),
      cout => cout_s(7));

      cout <= (cout_s(7));
end architecture structural;
