vlib work
vcom -93 -quiet -work work ../../src/bcd_7seg.vhd
vcom -93 -quiet -work work ../../src/generic_counter.vhd
vcom -93 -quiet -work work ../../src/generic_adder_beh.vhd
vcom -93 -quiet -work work ../../src/top.vhd
vcom -93 -quiet -work work ../src/counter_tb.vhd
vsim -voptargs=+acc -msgmode both counter_tb
do wave.do
run -all
