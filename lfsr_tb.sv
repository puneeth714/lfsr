`include "lfsr.sv"
module lfsr_tb;
reg clk,reset,seed;
wire [3:0]out;
initial begin
    clk=0;
    reset=1;
    seed=0;
end
lfsr l1(.clk(clk),.reset(reset),.out(out),.seed(seed));
always #10 clk=~clk;
initial begin
    $monitor("clk=%b seed=%b out=%b",clk,seed,out);
    $dumpfile("lfsr.vcd");
    $dumpvars(0,lfsr_tb);
    reset=0;
    seed=1;
    #10 reset=1;
end
initial #2000 $finish(0);
endmodule

