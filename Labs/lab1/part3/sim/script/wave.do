onerror {resume}
quietly WaveActivateNextPane {} 0
add wave -noupdate -divider TB
add wave -noupdate /template_tb/switch
add wave -noupdate /template_tb/led
add wave -noupdate -divider UUT
add wave -noupdate /template_tb/UUT/switch
add wave -noupdate /template_tb/UUT/led
TreeUpdate [SetDefaultTree]
WaveRestoreCursors {{Cursor 1} {39753 ps} 0}
quietly wave cursor active 1
configure wave -namecolwidth 150
configure wave -valuecolwidth 39
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
WaveRestoreZoom {0 ps} {1260 ps}
