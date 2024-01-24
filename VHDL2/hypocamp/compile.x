echo "[+] generating ROM"
ruby ../asm/asmc.rb ../asm/dut.asm
echo "[+] cleaning simulation files"
rm -rf top_tb top_tb.ghw *.cf
echo "[+] compiling uart IP"
ghdl -a --std=08 --work=uart_lib ../hdl/uart_cst_SIM.vhd
ghdl -a --std=08 --work=uart_lib ../hdl/tick_gen.vhd
ghdl -a --std=08 --work=uart_lib ../hdl/sender.vhd
ghdl -a --std=08 --work=uart_lib ../hdl/receiver.vhd
ghdl -a --std=08 --work=uart_lib ../hdl/fifo.vhd
ghdl -a --std=08 --work=uart_lib ../hdl/uart.vhd
echo "[+] compiling hypocampe softcore IP"
ghdl -a --std=08 --work=hypo_lib ../hdl/core_pkg.vhd
ghdl -a --std=08 --work=hypo_lib ../hdl/rom_pkg.vhd
ghdl -a --std=08 --work=hypo_lib ../hdl/core.vhd
echo "[+] compiling top level"
ghdl -a --std=08 ../hdl/top.vhd
echo "[+] compiling testbench"
ghdl -a --std=08 top_tb.vhd
echo "[+] elaborating testbench"
ghdl -e --std=08 top_tb
if [ -f top_tb ]
then
    echo "[+] running simulation"
    ghdl -r top_tb --wave=top_tb.ghw
    echo "[+] analyzing simulation results"
    gtkwave top_tb.ghw top_tb.sav
else
    echo "testbench not elaborated. Aborting simulation."
fi
