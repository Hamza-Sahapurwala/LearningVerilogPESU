module jkff (input wire clk,  input wire reset,input wire j, input wire k,output reg q );
    always @(posedge clk or posedge reset) 
    begin       
    if (reset)            q <= 1'b0;                // Reset to 0       
    else begin case ({j, k})             
        2'b00: q <= q;        // No change       
        2'b01: q <= 1'b0;     // Reset       
        2'b10: q <= 1'b1;     // Set            
        2'b11: q <= ~q;       // Toggle          
    endcase       
    end 
    end
endmodule

// 2-bit synchronous down counter using JK flip-flops
module down_counter_2bit (input clk,    input reset,    output [1:0] q); 
    // JK inputs       
    wire j0, k0, j1, k1;  
    assign j0 = 1'b1;        
    assign k0 = 1'b1; 
    assign j1 = ~q[0];
    assign k1 = ~q[0];
    // Instantiate flip-flops   
    jkff jkff0 (.clk(clk), .reset(reset), .j(j0), .k(k0), .q(q[0]));  
    jkff jkff1 (.clk(clk), .reset(reset), .j(j1), .k(k1), .q(q[1]));
endmodule
