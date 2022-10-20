echo "cleaning..."
rm -rf adder8_tb adder8.ghw
echo "compiling..."
ghdl -a ha.vhd
ghdl -a fa.vhd
ghdl -a adder8.vhd
ghdl -a adder8_tb.vhd
echo "elaborating testbench..."
ghdl -e adder8_tb
echo "running simulation..."
ghdl -r adder8_tb --wave=adder8_tb.ghw
gtkwave adder8_tb.ghw adder8_tb.sav
