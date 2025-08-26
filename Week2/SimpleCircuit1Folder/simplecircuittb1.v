module tb_simple_circuit;
    wire D,E;
    reg A,B,C;
    simple_circuit1 M1(A,B,C,D,E,);
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
        $monitor($time, "a=%b, b=%b, c=%b, d=%b, e=%b", A,B,C,D,E);
    end
    initial begin
        $dumpfile("simple1.vcd");
        $dumpvars(0,tb_simple_circuit); 
    end
endmodule