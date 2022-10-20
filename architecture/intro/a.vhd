entity a is
  port(in1,in2 : in bit;
       f : out bit);
end a;

architecture arch of a is
  signal sig_f : bit;
begin

  b_1: entity work.b(arch1)
    port map (
      e1 => in1,
      e2 => in2,
      f  => sig_f);
  
  c_1: entity work.c
    port map (
      i1 => sig_f,
      i2 => sig_f,
      f1 => f,
      f2 => open);
  
end arch;
