module halfaddtb;
    reg aa,bb;
    wire ss,cy;
    halfadd add1(.a(aa), .b(bb),  .sum(ss), .carry(cy));
    initial
        begin
            $dumpfile("halfaddtest.vcd");
            $dumpvars(0, halfaddtb);
        end
    initial
        begin 
            $monitor($time, "a=%b, b=%b, sum=%b, carry=%b", aa, bb, ss, cy);
            aa = 1'b0;bb = 1'b0;
            #5  aa = 1'b0;bb = 1'b1;
            #5  aa = 1'b1;bb = 1'b0;
            #5  aa = 1'b1;bb = 1'b1;
        end
endmodule
