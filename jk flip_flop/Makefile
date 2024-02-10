all: result.vcd

result.vcd: jk.vhdl jk_tb.vhdl
	ghdl -a jk.vhdl
	ghdl -a jk_tb.vhdl
	ghdl -e tb_jk_ff
	ghdl -r tb_jk_ff --vcd=result.vcd --stop-time=20us

clean:
	rm -rf result.vcd


