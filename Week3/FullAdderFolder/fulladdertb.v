module fulladdtb;
    reg aa,bb, cc;
    wire ss,cy;
    fulladd add1(.a(aa), .b(bb), .c(cc),  .sum(ss), .carry(cy));
    initial
        begin
            $dumpfile("fulladdtest.vcd");
            $dumpvars(0, fulladdtb);
        end
    initial
        begin 
            $monitor($time, " a=%b, b=%b, c=%b,sum=%b, carry=%b", aa, bb, cc, ss, cy);
              aa = 1'b0;bb = 1'b0;cc = 1'b0;
            #5  aa = 1'b0;bb = 1'b0;cc = 1'b1;
            #5  aa = 1'b0;bb = 1'b1;cc = 1'b0;
            #5  aa = 1'b0;bb = 1'b1;cc = 1'b1;
            #5  aa = 1'b1;bb = 1'b0;cc = 1'b0;
            #5  aa = 1'b1;bb = 1'b0;cc = 1'b1;
            #5  aa = 1'b1;bb = 1'b1;cc = 1'b0;
            #5  aa = 1'b1;bb = 1'b1;cc = 1'b1;
        end
endmodule
