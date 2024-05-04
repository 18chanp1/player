onerror {resume}
radix define wave {
    "4'b0000" "SINE",
    "4'b0001" "COSINE",
    "4'B0010" "SAW",
    "4'B0011" "SQUARE",
    "4'B1000" "ASK",
    "4'B1001" "FSK",
    "4'B1010" "BPSK",
    "4'B1011" "RAW",
    "4'B1100" "QPSK",
    -default default
}
radix define fsk_phase {
    "32'd14316558" "LO" -color "orange",
    "32'd71582789" "HI" -color "cyan",
    -default default
}
quietly WaveActivateNextPane {} 0
add wave -noupdate /tb_DDS/DUT/rst
add wave -noupdate /tb_DDS/DUT/en
add wave -noupdate /tb_DDS/DUT/data
add wave -noupdate -radix fsk_phase /tb_DDS/fsk_phase_inc
add wave -noupdate -radix wave /tb_DDS/DUT/mode
add wave -noupdate -format Analog-Step -height 74 -max 4096.0 -min -4096.0 /tb_DDS/DUT/wave
TreeUpdate [SetDefaultTree]
WaveRestoreCursors {{Cursor 1} {0 ns} 0}
quietly wave cursor active 1
configure wave -namecolwidth 185
configure wave -valuecolwidth 76
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
WaveRestoreZoom {0 ns} {125620 ns}
