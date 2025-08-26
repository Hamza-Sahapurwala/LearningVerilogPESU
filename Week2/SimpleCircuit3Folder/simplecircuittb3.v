module tb_simple_circuit3;
    wire D,E,F;
    reg A,B,C;
    simple_circuit3 M1(A,B,C,D,E,F,);
    initial 
    begin
        #20 A=1'b0;B=1'b0;C=1'b0;
        #20 A=1'b0;B=1'b0;C=1'b1;
        #20 A=1'b0;B=1'b1;C=1'b0;
        #20 A=1'b0;B=1'b1;C=1'b1;
        #20 A=1'b1;B=1'b0;C=1'b0;
        #20 A=1'b1;B=1'b0;C=1'b1;
        #20 A=1'b1;B=1'b1;C=1'b0;
        #20 A=1'b1;B=1'b1;C=1'b1;
    end
    initial
    begin
        $monitor($time, "a=%b, b=%b, c=%b, d=%b, e=%b, f=%b", A,B,C,D,E,F);
    end
    initial begin
        $dumpfile("simple3.vcd");
        $dumpvars(0,tb_simple_circuit3); 
    end
endmodule