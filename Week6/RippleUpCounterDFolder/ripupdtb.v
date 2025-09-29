module ripple_up_counter;
    reg clk, rst;
    wire [1:0] q;

    // Instantiate counter
    ripple_up_counter_2bit uut (.clk(clk), .rst(rst), .q(q));

    // Clock generation
    initial clk = 0;
    always #5 clk = ~clk;  
 // Clock period = 10
    initial 
    begin
        $dumpfile("ripple_up_counter_d.vcd");
        $dumpvars(0, ripple_up_counter);
    end
    initial
    begin
    $display("Time\tClk\tReset\tQ1 Q0");
    $monitor("%0t\t%b\t%b\t%b %b", $time, clk, rst, q[1], q[0]);
        rst = 1; #10;   // Apply reset
        rst = 0;
        #60;              // Run counter for a while
        rst = 1; #10;   // Reset again
        rst = 0;
        #40;
        $finish;
    end
endmodule