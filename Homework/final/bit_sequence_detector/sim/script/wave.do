onerror {resume}
quietly WaveActivateNextPane {} 0
add wave -noupdate -divider TB
add wave -noupdate /bit_sequence_detector_tb/reset_n_tb
add wave -noupdate /bit_sequence_detector_tb/clk_tb
add wave -noupdate /bit_sequence_detector_tb/serial_bit_tb
add wave -noupdate /bit_sequence_detector_tb/output_tb
add wave -noupdate /bit_sequence_detector_tb/sim_done
add wave -noupdate -divider UUT
add wave -noupdate /bit_sequence_detector_tb/UUT/reset_n
add wave -noupdate /bit_sequence_detector_tb/UUT/clk
add wave -noupdate /bit_sequence_detector_tb/UUT/serial_bit
add wave -noupdate /bit_sequence_detector_tb/UUT/pattern_found
add wave -noupdate /bit_sequence_detector_tb/UUT/curr_state
add wave -noupdate /bit_sequence_detector_tb/UUT/next_state
TreeUpdate [SetDefaultTree]
WaveRestoreCursors {{Cursor 1} {0 ps} 0}
quietly wave cursor active 0
configure wave -namecolwidth 121
configure wave -valuecolwidth 70
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
WaveRestoreZoom {0 ps} {546 ns}
