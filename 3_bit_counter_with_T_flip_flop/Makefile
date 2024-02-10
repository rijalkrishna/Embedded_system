all: result.vcd

result.vcd: t.vhdl t_tb.vhdl
	ghdl -a t.vhdl
	ghdl -a t_tb.vhdl
	ghdl -e counter_tb
	ghdl -r counter_tb --vcd=result.vcd --stop-time=20us

clean:
	rm -rf result.vcd


