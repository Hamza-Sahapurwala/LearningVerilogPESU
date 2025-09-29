module jkff (input wire clk,  input wire rst,input wire j, input wire k,output reg q );
    always @(posedge clk or posedge rst) 
    begin       
    if (rst)            q <= 1'b0;                // Reset to 0       
    else begin case ({j, k})             
        2'b00: q <= q;        // No change       
        2'b01: q <= 1'b0;     // Reset       
        2'b10: q <= 1'b1;     // Set            
        2'b11: q <= ~q;       // Toggle          
    endcase       
    end 
    end
endmodule


module updown_counter_2bit (input  wire clk,input  wire rst,input  wire up_down,output wire [1:0] q);  
    wire j0, k0, j1, k1;  
    assign j0 = 1'b1;        
    assign k0 = 1'b1; 
    assign j1 = up_down * q[0] + ~up_down * q[0];
    assign k1 = up_down * q[0] + ~up_down * q[0];
    jkff jkff0 (.clk(clk), .rst(rst), .j(j0), .k(k0), .q(q[0]));  
    jkff jkff1 (.clk(clk), .rst(rst), .j(j1), .k(k1), .q(q[1]));
endmodule