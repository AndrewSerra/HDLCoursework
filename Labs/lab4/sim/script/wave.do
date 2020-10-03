onerror {resume}
radix define States {
    "7'b1000000" "0" -color "red",
    "7'b1111001" "1" -color "red",
    "7'b0100100" "2" -color "red",
    "7'b0110000" "3" -color "red",
    "7'b0011001" "4" -color "red",
    "7'b0010010" "5" -color "red",
    "7'b0000010" "6" -color "red",
    "7'b1111000" "7" -color "red",
    "7'b0000000" "8" -color "red",
    "7'b0011000" "9" -color "red",
    "7'b0001000" "A" -color "red",
    "7'b0000011" "B" -color "red",
    "7'b1000110" "C" -color "red",
    "7'b0100001" "D" -color "red",
    "7'b0000110" "E" -color "red",
    "7'b0001110" "F" -color "red",
    -default default
}
quietly WaveActivateNextPane {} 0
add wave -noupdate -divider TB
add wave -noupdate /counter_tb/clk_tb
add wave -noupdate /counter_tb/reset_tb
add wave -noupdate -radix States /counter_tb/hex0_tb
add wave -noupdate /counter_tb/sim_done
add wave -noupdate -divider UUT
add wave -noupdate /counter_tb/UUT/CLOCK_50
add wave -noupdate /counter_tb/UUT/reset
add wave -noupdate -radix States /counter_tb/UUT/HEX0
add wave -noupdate /counter_tb/UUT/enable_sig
add wave -noupdate /counter_tb/UUT/sum_res
add wave -noupdate -radix States /counter_tb/UUT/ssd_out
add wave -noupdate /counter_tb/UUT/sum_sig
add wave -noupdate -divider Counter
add wave -noupdate /counter_tb/UUT/counter/clk
add wave -noupdate /counter_tb/UUT/counter/reset
add wave -noupdate /counter_tb/UUT/counter/output
add wave -noupdate /counter_tb/UUT/counter/count_sig
add wave -noupdate -divider Adder
add wave -noupdate -radix unsigned /counter_tb/UUT/adder/a
add wave -noupdate -radix unsigned /counter_tb/UUT/adder/b
add wave -noupdate -radix unsigned /counter_tb/UUT/adder/cin
add wave -noupdate -radix unsigned /counter_tb/UUT/adder/sum
add wave -noupdate /counter_tb/UUT/adder/cout
add wave -noupdate /counter_tb/UUT/adder/sum_temp
add wave -noupdate /counter_tb/UUT/adder/cin_guard
TreeUpdate [SetDefaultTree]
WaveRestoreCursors {{Cursor 1} {50000 ps} 0}
quietly wave cursor active 1
configure wave -namecolwidth 177
configure wave -valuecolwidth 40
configure wave -justifyvalue left
configure wave -signalnamewidth 1
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
WaveRestoreZoom {0 ps} {2791439 ps}
