echo "cleaning"
rm -rf *.o datapath_tb work*
echo "compiling datapath.vhd"
ghdl -a datapath.vhd
echo "compiling datapath_tb.vhd"
ghdl -a datapath_tb.vhd
echo "elaborating datapath_tb"
ghdl -e datapath_tb
echo "running datapath_tb"
ghdl -r datapath_tb --wave=datapath_tb.ghw
echo "viewing chronogram"
gtkwave datapath_tb.ghw datapath_tb.sav
