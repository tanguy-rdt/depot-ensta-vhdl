#set partname "xc7a100tcsg324-1"
#  ======> 50 T <======
set partname "xc7a50ticsg324-1L"

set xdc_constraints "./nexysa7_50t.xdc"
set outputDir ./SYNTH_OUTPUTS
file mkdir $outputDir

read_vhdl -library work      ../hdl/ticks_gen.vhd
read_vhdl -library work      ../hdl/cross_center_controler.vhd
read_vhdl -library work      ../hdl/vga_constants.vhd
read_vhdl -library work      ../hdl/vga_controler.vhd
read_vhdl -library soc_lib ../hdl/soc.vhd

read_xdc $xdc_constraints
synth_design -top soc -part $partname
write_checkpoint -force $outputDir/post_synth.dcp
report_timing_summary -file $outputDir/post_synth_timing_summary.rpt
report_utilization -file $outputDir/post_synth_util.rpt

opt_design
place_design

write_checkpoint -force $outputDir/post_place.dcp
report_utilization -file $outputDir/post_place_util.rpt
report_timing_summary -file $outputDir/post_place_timing_summary.rpt
route_design
write_checkpoint -force $outputDir/post_route.dcp
report_route_status -file $outputDir/post_route_status.rpt
report_timing_summary -file $outputDir/post_route_timing_summary.rpt
report_power -file $outputDir/post_route_power.rpt
report_drc -file $outputDir/post_imp_drc.rpt
write_bitstream -force $outputDir/top_50t.bit
exit
