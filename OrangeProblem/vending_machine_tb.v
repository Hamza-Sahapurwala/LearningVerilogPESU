// File: vending_machine_tb.v
// This is the correct, original version.

`timescale 1ns / 1ps

module vending_machine_tb;

    // Inputs to the design
    reg clk;
    reg rst;
    reg [1:0] coin_in;

    // Output from the design
    wire dispense;

    // Instantiate the Unit Under Test (UUT)
    vending_machine uut (
        .clk(clk),
        .rst(rst),
        .coin_in(coin_in),
        .dispense(dispense)
    );

    // File handles for automated I/O
    integer input_file;
    integer output_file;

    // Clock generation
    initial begin
        clk = 0;
        forever #5 clk = ~clk;
    end

    // Simulation control block
    initial begin
        // Open files for reading inputs and writing outputs
        input_file = $fopen("input.txt", "r");
        output_file = $fopen("output.txt", "w");

        // Handle file open errors
        if (input_file == 0) begin
            $display("Error: Could not open input.txt");
            $finish;
        end

        // Initialize and apply reset
        rst = 1;
        coin_in = 2'b00;
        #15;
        rst = 0;
        #5;

        // Read each coin input from the file and apply it
        while (!$feof(input_file)) begin
            $fscanf(input_file, "%b\n", coin_in);
            #10;
            $fwrite(output_file, "%b\n", dispense);
            coin_in = 2'b00;
            #10;
        end

        // Clean up and end the simulation
        $fclose(input_file);
        $fclose(output_file);
        $finish;
    end

endmodule