module my2_fsm(
	output [31:0]result,
	input [31:0] a,
	input [31:0] b,
	input reset,
	input CLK
	
);

wire wx, wwe, ws;
wire [31:0]res_between;

my2_fsm_cu control(
.reset(reset),
.CLK(CLK),
.x(wx),
.temp(res_between),
.we(wwe),
.s(ws),
.result(result)
);

my2_fsm_dp datapath(
.CLK(CLK),
.s(ws),
.we(wwe),
.a(a),
.b(b),
.x(wx),
.result(res_between)
);


endmodule
