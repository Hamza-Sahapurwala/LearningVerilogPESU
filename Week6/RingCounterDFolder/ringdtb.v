`timescale 1ns/1ps
module tb_ring_counter;
    reg clk, rst;
    wire [2:0] q;

    // Instantiate DUT
    ring_counter uut (.clk(clk), .rst(rst), .q(q));

    // Clock generation: 10ns period
    always #5 clk = ~clk;

    initial begin
        $display("Time\tCLK\tRST\tQ2 Q1 Q0");
    end

    // Print on every rising edge
    always @(posedge clk) begin
        $display("%0t\t%b\t%b\t%b %b %b", $time, clk, rst, q[2], q[1], q[0]);
    end

    initial begin
        $dumpfile("ring_counter.vcd");
        $dumpvars(0, tb_ring_counter);

        clk = 0;
        rst = 1;   // Apply reset
        #10;
        rst = 0;   // Release reset

        #100;
        $finish;
    end
endmodule
