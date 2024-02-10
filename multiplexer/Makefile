all: result.vcd

result.vcd: multiplexer.vhdl multiplexer_tb.vhdl
	ghdl -a multiplexer.vhdl
	ghdl -a multiplexer_tb.vhdl
	ghdl -e tb_multiplexer
	ghdl -r tb_multiplexer --vcd=result.vcd --stop-time=20us

clean:
	rm -rf result.vcd


