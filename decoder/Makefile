all: result.vcd

result.vcd: decoder.vhdl decoder_tb.vhdl
	ghdl -a decoder.vhdl
	ghdl -a decoder_tb.vhdl
	ghdl -e tb_decoder
	ghdl -r tb_decoder --vcd=result.vcd --stop-time=20us

clean:
	rm -rf result.vcd


