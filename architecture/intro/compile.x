echo "=> cleaning"
rm -rf *.o
echo "=> analyzing a.vhd"
ghdl -a b.vhd
echo "=> analyzing b.vhd"
ghdl -a c.vhd
echo "=> analyzing c.vhd"
ghdl -a a.vhd
