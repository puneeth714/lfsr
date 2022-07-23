module d_ff(d,clk,reset,q);
input d,clk,reset;
output reg q;
always @(posedge clk or negedge reset)
begin
    if(!reset)
    begin
        q <= 0;
    end
    else
    begin
        q <= d;
    end
end
endmodule

