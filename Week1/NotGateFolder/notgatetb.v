module nottesttb;
    reg a;
    wire y;
    notgate uut(.y(y),.a(a));
    initial
    begin
        #0 a=0;
        #5 a=0;
        #10 a=1;
        #15 a=1;
    end
    initial
    begin
        $monitor($time, "a=%b, y=%b", a,y);
    end
    initial
    begin
        $dumpfile("nottest.vcd");
        $dumpvars(0,nottesttb);    
    end
endmodule