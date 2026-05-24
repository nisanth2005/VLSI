`timescale 1ns / 1ps
module window(
    input  [7:0] temp,
    output reg below_lower,
    output reg above_upper,
    output reg critical

);
parameter LOWER_LIMIT    = 8'd18;
parameter UPPER_LIMIT    = 8'd25;
parameter CRITICAL_LIMIT = 8'd35;
always @(*)
begin
    below_lower = 0;
    above_upper = 0;
    critical    = 0;
    if(temp < LOWER_LIMIT)
        below_lower = 1;
    else if(temp > UPPER_LIMIT)
        above_upper = 1;
    if(temp > CRITICAL_LIMIT)
        critical = 1;
end
endmodule

