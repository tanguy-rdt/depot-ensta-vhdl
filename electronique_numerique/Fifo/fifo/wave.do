onerror {resume}
quietly WaveActivateNextPane {} 0
add wave -noupdate /fifo_tst/running
add wave -noupdate /fifo_tst/reset_n
add wave -noupdate /fifo_tst/reset
add wave -noupdate /fifo_tst/clk
add wave -noupdate -radix decimal /fifo_tst/din
add wave -noupdate -radix decimal /fifo_tst/dout
add wave -noupdate /fifo_tst/push
add wave -noupdate /fifo_tst/pop
add wave -noupdate -radix decimal /fifo_tst/i1/level_i
add wave -noupdate -radix decimal /fifo_tst/level
add wave -noupdate -radix decimal -childformat {{/fifo_tst/i1/array_reg(0) -radix decimal} {/fifo_tst/i1/array_reg(1) -radix decimal} {/fifo_tst/i1/array_reg(2) -radix decimal} {/fifo_tst/i1/array_reg(3) -radix decimal}} -expand -subitemconfig {/fifo_tst/i1/array_reg(0) {-radix decimal} /fifo_tst/i1/array_reg(1) {-radix decimal} /fifo_tst/i1/array_reg(2) {-radix decimal} /fifo_tst/i1/array_reg(3) {-radix decimal}} /fifo_tst/i1/array_reg
add wave -noupdate /fifo_tst/empty
add wave -noupdate /fifo_tst/full
TreeUpdate [SetDefaultTree]
WaveRestoreCursors {{Cursor 1} {95 ns} 0}
quietly wave cursor active 1
configure wave -namecolwidth 150
configure wave -valuecolwidth 100
configure wave -justifyvalue left
configure wave -signalnamewidth 0
configure wave -snapdistance 10
configure wave -datasetprefix 0
configure wave -rowmargin 4
configure wave -childrowmargin 2
configure wave -gridoffset 0
configure wave -gridperiod 1
configure wave -griddelta 40
configure wave -timeline 0
configure wave -timelineunits ns
update
WaveRestoreZoom {0 ns} {315 ns}
