echo "cleaning..."
rm -rf fsm_tb fsm.ghw
echo "compiling..."
ghdl -a fsm.vhd
