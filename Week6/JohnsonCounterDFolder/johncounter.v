`timescale 1ns/1ps
module johnson_counter (
    input  wire clk,
    input  wire rst,       // async reset, active high
    output reg  [2:0] q
);
    always @(posedge clk or posedge rst) begin
        if (rst)
            q <= 3'b000;                  // Johnson starts at all zeros
        else
            q <= {q[1:0], ~q[2]};         // shift left, insert inverted MSB
    end
endmodule
