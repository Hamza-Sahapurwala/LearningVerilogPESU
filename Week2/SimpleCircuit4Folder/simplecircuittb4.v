module tb_simple_circuit4;
    wire D,F;
    reg T,P,O;
    simple_circuit4 M1(T,P,O,D,F,);
    initial 
    begin
        #20 T=1'b0;P=1'b0;O=1'b0;
        #20 T=1'b0;P=1'b0;O=1'b1;
        #20 T=1'b0;P=1'b1;O=1'b0;
        #20 T=1'b0;P=1'b1;O=1'b1;
        #20 T=1'b1;P=1'b0;O=1'b0;
        #20 T=1'b1;P=1'b0;O=1'b1;
        #20 T=1'b1;P=1'b1;O=1'b0;
        #20 T=1'b1;P=1'b1;O=1'b1;
    end
    initial
    begin
        $monitor($time, "t=%b, p=%b, o=%b, d=%b, f=%b", T,P,O,D,F);
    end
    initial begin
        $dumpfile("simple4.vcd");
        $dumpvars(0,tb_simple_circuit4); 
    end
endmodule