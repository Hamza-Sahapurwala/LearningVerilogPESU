module tb_simple_circuit2;
    wire D;
    reg A,B,C;
    simple_circuit2 M1(A,B,C,D,);
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
        $monitor($time, "a=%b, b=%b, c=%b, d=%b", A,B,C,D);
    end
    initial begin
        $dumpfile("simple2.vcd");
        $dumpvars(0,tb_simple_circuit2); 
    end
endmodule