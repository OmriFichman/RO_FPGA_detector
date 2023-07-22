set projDir "C:/Users/Omri Fichman/Documents/alchitry/reading/work/planAhead"
set projName "reading"
set topName top
set device xc6slx9-2tqg144
if {[file exists "$projDir/$projName"]} { file delete -force "$projDir/$projName" }
create_project $projName "$projDir/$projName" -part $device
set_property design_mode RTL [get_filesets sources_1]
set verilogSources [list "C:/Users/Omri\ Fichman/Documents/alchitry/reading/work/verilog/mojo_top_0.v" "C:/Users/Omri\ Fichman/Documents/alchitry/reading/work/verilog/avr_interface_1.v" "C:/Users/Omri\ Fichman/Documents/alchitry/reading/work/verilog/greeter_2.v" "C:/Users/Omri\ Fichman/Documents/alchitry/reading/work/verilog/cclk_detector_3.v" "C:/Users/Omri\ Fichman/Documents/alchitry/reading/work/verilog/spi_peripheral_4.v" "C:/Users/Omri\ Fichman/Documents/alchitry/reading/work/verilog/uart_rx_5.v" "C:/Users/Omri\ Fichman/Documents/alchitry/reading/work/verilog/uart_tx_6.v" "C:/Users/Omri\ Fichman/Documents/alchitry/reading/work/verilog/simple_ram_7.v" "C:/Users/Omri\ Fichman/Documents/alchitry/reading/work/verilog/sensor_8.v" "C:/Users/Omri\ Fichman/Documents/alchitry/reading/work/verilog/noise_9.v" "C:/Users/Omri\ Fichman/Documents/alchitry/reading/work/verilog/mem_quick_10.v" "C:/Users/Omri\ Fichman/Documents/alchitry/reading/work/verilog/ro_11.v" "C:/Users/Omri\ Fichman/Documents/alchitry/reading/work/verilog/counter_12.v" "C:/Users/Omri\ Fichman/Documents/alchitry/reading/work/verilog/enb_spliter_13.v" ]
import_files -fileset [get_filesets sources_1] -force -norecurse $verilogSources
set ucfSources [list "C:/Program\ Files/Alchitry/Alchitry\ Labs/library/components/mojo.ucf" ]
import_files -fileset [get_filesets constrs_1] -force -norecurse $ucfSources
set_property -name {steps.bitgen.args.More Options} -value {-g Binary:Yes -g Compress} -objects [get_runs impl_1]
set_property steps.map.args.mt on [get_runs impl_1]
set_property steps.map.args.pr b [get_runs impl_1]
set_property steps.par.args.mt on [get_runs impl_1]
update_compile_order -fileset sources_1
launch_runs -runs synth_1
wait_on_run synth_1
launch_runs -runs impl_1
wait_on_run impl_1
launch_runs impl_1 -to_step Bitgen
wait_on_run impl_1
