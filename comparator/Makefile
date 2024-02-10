all: result.vcd

result.vcd: comparator.vhdl comparator_tb.vhdl
	ghdl -a comparator.vhdl
	ghdl -a comparator_tb.vhdl
	ghdl -e tb_comparator
	ghdl -r tb_comparator --vcd=result.vcd --stop-time=20us

clean:
	rm -rf result.vcd


