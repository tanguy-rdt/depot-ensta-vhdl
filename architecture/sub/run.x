echo "cleaning..."
rm -rf soustractor_tb soustractor.ghw
echo "compiling..."
ghdl -a ha.vhd
ghdl -a fa.vhd
ghdl -a soustractor.vhd
ghdl -a soustractor_tb.vhd
echo "elaborating testbench..."
ghdl -e soustractor_tb
echo "running simulation..."
ghdl -r soustractor_tb --wave=soustractor_tb.ghw
gtkwave soustractor_tb.ghw soustractor_tb.sav
