onerror {resume}
quietly WaveActivateNextPane {} 0
add wave -noupdate -divider TB
add wave -noupdate /pipo_4bit_tb/clk_tb
add wave -noupdate /pipo_4bit_tb/reset_n_tb
add wave -noupdate /pipo_4bit_tb/data_in_tb
add wave -noupdate /pipo_4bit_tb/data_out_tb
add wave -noupdate /pipo_4bit_tb/mode_tb
add wave -noupdate /pipo_4bit_tb/inp_left_tb
add wave -noupdate /pipo_4bit_tb/inp_right_tb
add wave -noupdate /pipo_4bit_tb/sim_done
add wave -noupdate -divider UUT
add wave -noupdate /pipo_4bit_tb/UUT/reset_n
add wave -noupdate /pipo_4bit_tb/UUT/clk
add wave -noupdate /pipo_4bit_tb/UUT/data_in
add wave -noupdate /pipo_4bit_tb/UUT/mode
add wave -noupdate /pipo_4bit_tb/UUT/inp_left
add wave -noupdate /pipo_4bit_tb/UUT/inp_right
add wave -noupdate /pipo_4bit_tb/UUT/data_out
add wave -noupdate /pipo_4bit_tb/UUT/data
add wave -noupdate /pipo_4bit_tb/UUT/q
TreeUpdate [SetDefaultTree]
WaveRestoreCursors {{Cursor 1} {344707 ps} 0}
quietly wave cursor active 1
configure wave -namecolwidth 150
configure wave -valuecolwidth 100
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
