`timescale 1ns/1ps

module bcdaddertb;
    reg  [3:0] a, b;
    reg  cin;
    wire [3:0] sum;
    wire cout;
    bcdadder uut (.a(a),.b(b),.cin(cin),.sum(sum),.cout(cout));
    initial begin
        $dumpfile("bcdadder.vcd");
        $dumpvars(0, bcdaddertb);
        a=4'd5; b=4'd4; cin=0; #10;
        a=4'd9; b=4'd5; cin=0; #10;
        a=4'd8; b=4'd7; cin=0; #10;
        a=4'd9; b=4'd9; cin=0; #10;
        a=4'd7; b=4'd2; cin=1; #10;
        $finish;
    end
    initial begin
        $monitor("t=%0t | a=%d b=%d cin=%b || sum=%d cout=%b", $time, a, b, cin, sum, cout);
    end
endmodule