# Rappel

## GHDL

- Analyze :
  - ghdl -a circuit.vhd
  - ghdl -a circuit_tb.vhd
  
- Elaboration :
  - ghdl -e circuit_tb
  
- Run :
  - ghdl -r circuit_tb --wave=circuit_tb.ghw
  
- Viewing :
  - gtkwave circuit_tb.ghw circuit_tb.sav


## Génération rapide de squelettes de testbenches
On utilise mon générateur appelé Vertigo (qui est un front-end VHDL). 

- Pour l'installer : 
```
gem install vertigo_vhdl 
```

- Pour l'utiliser : 
```
vertigo --gen_tb fichier_contenant_l_entity.vhd
```