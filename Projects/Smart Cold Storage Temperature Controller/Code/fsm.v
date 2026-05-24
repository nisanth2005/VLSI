`timescale 1ns / 1ps
module fsm(
    input clk,
    input reset,
    input below_lower,
    input above_upper,
    input critical,
    output reg [1:0] state
);
parameter MONITOR = 2'b00;
parameter COOLING = 2'b01;
parameter ALERT   = 2'b10;
reg [1:0] next_state;
always @(posedge clk or posedge reset)
begin
    if(reset)
        state <= MONITOR;
    else
        state <= next_state;
end
always @(*)
begin
case(state)
MONITOR:
begin
    if(above_upper)
        next_state = COOLING;
    else
        next_state = MONITOR;
end
COOLING:
begin
    if(critical)
        next_state = ALERT;
    else if(below_lower)
        next_state = MONITOR;
    else
        next_state = COOLING;
end
ALERT:
begin
    if(reset)
        next_state = MONITOR;
    else
        next_state = ALERT;
end

default:
    next_state = MONITOR;

endcase
end
endmodule



