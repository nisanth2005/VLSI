`timescale 1ns / 1ps
module testbench;
reg clk;
reg reset;
reg [7:0] temp;
wire [1:0] cooling_level;
wire alert;
topmodule uut(
    .clk(clk),
    .reset(reset),
    .temp(temp),
    .cooling_level(cooling_level),
    .alert(alert)
);
always #5 clk = ~clk;
initial
begin
clk = 0;
reset = 1;
temp = 20;
#10 reset = 0;
#20 temp = 22;
#20 temp = 26;
#20 temp = 30;
#20 temp = 33;
#20 temp = 36;
#20 reset = 1;
#10 reset = 0;
#20 temp = 21;
#50 $finish;
end
endmodule
