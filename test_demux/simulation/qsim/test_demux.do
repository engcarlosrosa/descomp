onerror {exit -code 1}
vlib work
vlog -work work test_demux.vo
vlog -work work Waveform1.vwf.vt
vsim -novopt -c -t 1ps -L cycloneive_ver -L altera_ver -L altera_mf_ver -L 220model_ver -L sgate_ver -L altera_lnsim_ver work.test_demux_vlg_vec_tst -voptargs="+acc"
vcd file -direction test_demux.msim.vcd
vcd add -internal test_demux_vlg_vec_tst/*
vcd add -internal test_demux_vlg_vec_tst/i1/*
run -all
quit -f
