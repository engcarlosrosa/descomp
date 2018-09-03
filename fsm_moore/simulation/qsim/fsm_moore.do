onerror {exit -code 1}
vlib work
vlog -work work fsm_moore.vo
vlog -work work Waveform4.vwf.vt
vsim -novopt -c -t 1ps -L cycloneive_ver -L altera_ver -L altera_mf_ver -L 220model_ver -L sgate_ver -L altera_lnsim_ver work.fsm_moore_vlg_vec_tst -voptargs="+acc"
vcd file -direction fsm_moore.msim.vcd
vcd add -internal fsm_moore_vlg_vec_tst/*
vcd add -internal fsm_moore_vlg_vec_tst/i1/*
run -all
quit -f
