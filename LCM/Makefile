all: result.vcd

result.vcd: lcm.vhdl lcm_tb.vhdl
	ghdl -a lcm.vhdl
	ghdl -a lcm_tb.vhdl
	ghdl -e tb_lcm
	ghdl -r tb_lcm --vcd=result.vcd --stop-time=20us

clean:
	rm -rf result.vcd


