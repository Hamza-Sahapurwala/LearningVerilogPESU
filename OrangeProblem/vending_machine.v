// File: vending_machine.v
// Describes the FSM logic for the vending machine.

module vending_machine (
    input wire clk,
    input wire rst,
    input wire [1:0] coin_in, // 01 for Rs. 5, 10 for Rs. 10
    output reg dispense
);

    // Define states
    parameter S0 = 2'b00, S5 = 2'b01, S10 = 2'b10;

    // State registers
    reg [1:0] current_state, next_state;

    // Sequential logic for state transitions
    always @(posedge clk or posedge rst) begin
        if (rst) current_state <= S0;
        else     current_state <= next_state;
    end

    // Combinational logic for next state and output
    always @(*) begin
        // Set default values to avoid latches
        next_state = current_state;
        dispense = 1'b0;

        case (current_state)
            S0: if (coin_in == 2'b01)      next_state = S5;
                else if (coin_in == 2'b10) next_state = S10;
            
            S5: if (coin_in == 2'b01)      next_state = S10;
                else if (coin_in == 2'b10) begin
                    next_state = S0;
                    dispense = 1'b1;
                end

            S10: if (coin_in == 2'b01 || coin_in == 2'b10) begin
                    next_state = S0;
                    dispense = 1'b1;
                end
        endcase
    end

endmodule