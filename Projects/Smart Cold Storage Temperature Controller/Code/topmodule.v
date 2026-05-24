`timescale 1ns / 1ps
module topmodule(
    input clk,
    input reset,
    input [7:0] temp,

    output [1:0] cooling_level,
    output alert

);
wire below_lower;
wire above_upper;
wire critical;
wire [1:0] state;
parameter ALERT = 2'b10;
window w1(
    .temp(temp),
    .below_lower(below_lower),
    .above_upper(above_upper),
    .critical(critical)

);
fsm f1(
    .clk(clk),
    .reset(reset),
    .below_lower(below_lower),
    .above_upper(above_upper),
    .critical(critical),
    .state(state)
);
multicooling m1(
    .temp(temp),
    .state(state),
    .cooling_level(cooling_level)
);
assign alert = (state == ALERT) & (~reset);
endmodule
