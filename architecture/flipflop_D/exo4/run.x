echo "compiling compteur.vhd"
ghdl -a compteur.vhd
echo "compiling compteur_tb.vhd"
ghdl -a compteur_tb.vhd
echo "elab"
ghdl -e compteur_tb
echo "run"
ghdl -r compteur_tb --wave=compteur_tb.ghw
gtkwave compteur_tb.ghw compteur.sav
