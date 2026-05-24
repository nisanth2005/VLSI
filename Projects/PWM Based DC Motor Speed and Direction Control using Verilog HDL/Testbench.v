
`timescale 1ns/1ps
module pwm_tb;
    reg clk;
    reg rst;
    reg [1:0] value;
    reg dir;
    wire in1, in2;
    pwm uut (
        .clk(clk),
        .rst(rst),
        .value(value),
        .dir(dir),
        .in1(in1),
        .in2(in2)
    );
    initial begin
        clk = 0;
        forever #5 
        clk = ~clk;
    end
    initial begin

        rst   = 1;
        value = 2'b00;
        dir   = 0;
        #10;
        rst = 0;
        #10;
        value = 2'b01;
        #10;
        dir = 1;
        #10;
        value = 2'b10; 
         dir = 0;
        #10;
        dir = 1;
        #10;
        value = 2'b11; dir = 0;
        #10;
        dir = 1;
        #10;
        $stop;
    end
endmodule
