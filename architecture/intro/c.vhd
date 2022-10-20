entity c is
  port(
    i1, i2 : in  bit;
    f1,f2      : out bit);
end c;

architecture arch of c is
  signal sig_1 : bit;
begin
  
  b_1: entity work.b(arch1)
    port map (
      e1 => i1,
      e2 => '1',
      f  => f1);

  b_2: entity work.b(arch2)
    port map (
      e1 => i1,
      e2 => sig_1,
      f  => sig_1);

  f2 <= sig_1;
end arch;


