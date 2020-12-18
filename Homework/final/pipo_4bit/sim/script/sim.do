vlib work
vcom -93 -quiet -work work ../../src/dff_shift.vhd
vcom -93 -quiet -work work ../../src/pipo_4bit.vhd
vcom -93 -quiet -work work ../src/pipo_4bit_tb.vhd
vsim -voptargs=+acc -msgmode both pipo_4bit_tb
do wave.do
run -all
