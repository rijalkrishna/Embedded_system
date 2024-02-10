all: result.vcd

result.vcd: full_adder.vhdl full_adder_tb.vhdl
	ghdl -a full_adder.vhdl
	ghdl -a full_adder_tb.vhdl
	ghdl -e tb_full_adder
	ghdl -r tb_full_adder --vcd=result.vcd --stop-time=20us

clean:
	rm -rf result.vcd


