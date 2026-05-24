`timescale 1ns/1ps
module pwm(
    input clk,           // system clock
    input rst,           // active-high reset
    input [1:0] value,   // selects duty cycle percentage
    input dir,           // motor direction control (0 = anticlockwise, 1 = clockwise)
    output reg pwm_out,  // PWM signal enable
    output reg in1,      // motor driver input IN1
    output reg in2       // motor driver input IN2
);

    reg [7:0] counter;   // 8-bit counter for PWM generation
    reg [7:0] temp;      // threshold value for duty cycle (0-255)

    // ---------------------------------------------------------
    // Combinational logic to set duty cycle based on input value
    // ---------------------------------------------------------
    always @(*) begin
        case(value)
            2'b00: temp = 8'd192;     //0 % duty cycle ? motor off
            2'b01: temp = 8'd128;    //25 % duty cycle ? slow speed
            2'b10: temp = 8'd64;   //50 % duty cycle ? medium speed
            2'b11: temp = 8'd0;   //100 % duty cycle ? full speed
            default:temp=8'd128;
        endcase
    end

    // ---------------------------------------------------------
    // Combinational logic for motor direction control
    // ---------------------------------------------------------
    always @(*) begin
        if(dir) begin      
            // dir = 1 ? clockwise rotation
            in1 = 1'b1;
            in2 = 1'b0;
        end else begin
            // dir = 0 ? anticlockwise rotation
            in1 = 1'b0;
            in2 = 1'b1;
        end
    end

    // ---------------------------------------------------------
    // Sequential logic to generate PWM signal
    // ---------------------------------------------------------
    always @(posedge clk) begin
        if(rst) begin
            // Reset condition: clear counter and turn off PWM
            counter <= 8'd0;
            pwm_out <= 1'b0;
        end else begin
            // Increment counter every clock cycle
            counter <= counter + 1'b1;

            // Compare counter with duty cycle threshold
            if(counter < temp)
                pwm_out <= 1'b1;   // HIGH portion of PWM
            else
                pwm_out <= 1'b0;   // LOW portion of PWM
        end
    end

endmodule
