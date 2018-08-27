onerror {exit -code 1}
vlib work
vlog -work work single_port_rom.vo
vlog -work work Waveform3.vwf.vt
vsim -novopt -c -t 1ps -L cycloneive_ver -L altera_ver -L altera_mf_ver -L 220model_ver -L sgate_ver -L altera_lnsim_ver work.single_port_rom_vlg_vec_tst -voptargs="+acc"
vcd file -direction single_port_rom.msim.vcd
vcd add -internal single_port_rom_vlg_vec_tst/*
vcd add -internal single_port_rom_vlg_vec_tst/i1/*
run -all
quit -f
