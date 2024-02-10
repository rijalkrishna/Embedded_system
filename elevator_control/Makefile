all: result.vcd

result.vcd: elevator.vhdl elevator_tb.vhdl
	ghdl -a elevator.vhdl
	ghdl -a elevator_tb.vhdl
	ghdl -e elevator_control_tb
	ghdl -r elevator_control_tb --vcd=result.vcd --stop-time=20us

clean:
	rm -rf result.vcd


