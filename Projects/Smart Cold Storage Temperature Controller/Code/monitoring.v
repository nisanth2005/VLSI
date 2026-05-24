`timescale 1ns / 1ps
module multicooling(
    input [7:0] temp,
    input [1:0] state,
    output reg [1:0] cooling_level

);
parameter MONITOR = 2'b00;
parameter COOLING = 2'b01;
parameter ALERT   = 2'b10;
always @(*)
begin
cooling_level = 2'b00;
case(state)
MONITOR:
cooling_level = 2'b00;

COOLING:
begin
if(temp >= 25 && temp < 28)
    cooling_level = 2'b01;
else if(temp >= 28 && temp < 32)
    cooling_level = 2'b10;
else if(temp >= 32)
    cooling_level = 2'b11;
end
ALERT:
cooling_level = 2'b11;
endcase
end
endmodule


