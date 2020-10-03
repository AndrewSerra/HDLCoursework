vlib work
vcom -93 -quiet -work work ../../src/and_n.vhd
vcom -93 -quiet -work work ../../src/nor_n.vhd
vcom -93 -quiet -work work ../../src/or_2.vhd
vcom -93 -quiet -work work ../../src/xor_2.vhd
vcom -93 -quiet -work work ../../src/top_level.vhd
vcom -93 -quiet -work work ../src/top_level_tb.vhd
vsim -voptargs=+acc -msgmode both top_level_tb
do wave.do
run -all
