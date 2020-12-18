vlib work
vcom -93 -quiet -work work ../../src/clock_synchronizer.vhd
vcom -93 -quiet -work work ../../src/bit_sequence_detector.vhd
vcom -93 -quiet -work work ../src/bit_sequence_detector_tb.vhd
vsim -voptargs=+acc -msgmode both bit_sequence_detector_tb
do wave.do
run -all
