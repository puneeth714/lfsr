`include "d_ff.v"
module lfsr(clk,seed,reset,out);
input clk,reset,seed;
output [3:0] out;
wire w1,w2;
d_ff d1(.clk(clk),.reset(reset),.d(w2),.q(out[0]));
d_ff d2(.clk(clk),.reset(reset),.d(out[0]),.q(out[1]));
d_ff d3(.clk(clk),.reset(reset),.d(out[1]),.q(out[2]));
d_ff d4(.clk(clk),.reset(reset),.d(out[2]),.q(out[3]));
xor x1(w1,seed,out[3]);
xor x2(w2,w1,out[2]);
endmodule