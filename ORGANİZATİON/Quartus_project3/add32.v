
module add32(
input [31:0] a,
input [31:0] b,
input cin,
output [31:0] res,
output cout
);

wire [32:0] c;

buf g0(c[0], cin);
buf g1(cout, c[32]);

genvar i;
generate
for( i = 0; i<32; i=i+1) begin: fas
	fa inst(.a(a[i]), .b(b[i]), .cin(c[i]), .cout(c[i+1]), .res(res[i]));
	end
endgenerate

endmodule


