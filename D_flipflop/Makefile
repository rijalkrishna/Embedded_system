all: result.vcd

result.vcd: d.vhdl d_tb.vhdl
	ghdl -a d.vhdl
	ghdl -a d_tb.vhdl
	ghdl -e d_flip_flop_tb
	ghdl -r d_flip_flop_tb --vcd=result.vcd --stop-time=20us

clean:
	rm -rf result.vcd


