echo "cleaning"
rm -rf *.cf *.o soc_tb.ghw soc_tb
echo "Done!"

display_loading() {
  nb_files=$((nb_files + 1))
  echo "[${nb_files}/16] - File $1 - OK"
}

echo "\nIP Lib - Analysing files"
ghdl -a --work=ip_lib --std=08 ip_codes/bram.vhd && display_loading "bram.vhd"
ghdl -a --work=ip_lib --std=08 ip_codes/fifo.vhd && display_loading "fifo.vhd"
ghdl -a --work=ip_lib --std=08 ip_codes/ip_bram.vhd && display_loading "ip_bram.vhd"
ghdl -a --work=ip_lib --std=08 ip_codes/ip_leds.vhd && display_loading "ip_leds.vhd"
ghdl -a --work=ip_lib --std=08 ip_codes/ip_switches.vhd && display_loading "ip_switches.vhd"

echo "\nUART Lib - Analysing Files"
ghdl -a --work=uart_lib --std=08 uart_codes/uart_cst.vhd && display_loading "uart_cst.vhd"
ghdl -a --work=uart_lib --std=08 uart_codes/receiver.vhd && display_loading "receiver.vhd"
ghdl -a --work=uart_lib --std=08 uart_codes/sender.vhd && display_loading "sender.vhd"
ghdl -a --work=uart_lib --std=08 uart_codes/tick_gen.vhd && display_loading "tick_gen.vhd"
ghdl -a --work=uart_lib --std=08 uart_codes/uart.vhd && display_loading "uart.vhd"
ghdl -a --work=uart_lib --std=08 uart_codes/uart_api.vhd && display_loading "uart_api.vhd"

echo "\nUART Master Lib - Analysing Files"
ghdl -a --work=uart_bus_master_lib --std=08 uart_bus_master_codes/uart_bus_master_fsm.vhd && display_loading "uart_bus_master_fsm.vhd"
ghdl -a --work=uart_bus_master_lib --std=08 uart_bus_master_codes/uart_bus_master.vhd && display_loading "uart_bus_master.vhd"

echo "\nSoC Lib - Analysing Files"
ghdl -a --std=08 --work=soc_lib soc_pkg.vhd && display_loading "soc_pkg.vhd"
ghdl -a --std=08 --work=soc_lib soc.vhd && display_loading "soc.vhd"

echo "\nElaborating TB"
ghdl -a --std=08 soc_tb.vhd && display_loading "soc_tb.vhd"
ghdl -e --std=08 soc_tb

echo "\nSimulating"
ghdl -r --std=08 soc_tb --wave=soc_tb.ghw

echo "\nViewing --> GTKWAVE"
gtkwave soc_tb.ghw soc_tb.sav