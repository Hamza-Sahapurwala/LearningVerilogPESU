`timescale 1ns/1ps
module ring_counter (
    input  wire clk,
    input  wire rst,       // async reset, active high
    output reg  [2:0] q
);
    always @(posedge clk or posedge rst) begin
        if (rst)
            q <= 3'b001;              // seed the ring with "001"
        else
            q <= {q[1:0], q[2]};      // rotate left
    end
endmodule
