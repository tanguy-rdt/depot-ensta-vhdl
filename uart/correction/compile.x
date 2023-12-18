echo "=> cleaning"
rm -rf work*.cf *.o
echo "=> analysis"
echo ghdl -a --std=08 tick_gen.vhd
ghdl -a --std=08 tick_gen.vhd


echo ghdl -a --std=08 receiver.vhd
ghdl -a --std=08 receiver.vhd

echo ghdl -a --std=08 top.vhd
ghdl -a --std=08 top.vhd

echo ghdl -a --std=08 top_tb.vhd
ghdl -a --std=08  top_tb.vhd

echo "=> elaboration"
echo ghdl -e --std=08 top_tb
ghdl -e --std=08  top_tb

echo "=> run"
echo ghdl -r --std=08  top_tb
ghdl -r top_tb --wave=top.ghw

echo "=> result analysis"
gtkwave top.ghw top.sav
