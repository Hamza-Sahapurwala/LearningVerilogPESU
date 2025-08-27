module TB;
  reg [3:0] Y;
  wire [1:0] A;
  initial 
    begin
        $dumpfile("4-2encoder.vcd");
        $dumpvars(0, TB);
        $monitor("Time=%0t | Y=%b | A=%b", $time, Y, A);
    end
  en4to2 newen(.a(A), .y(Y));
  initial 
  begin
        Y = 4'b0001; #5;
        Y = 4'b0010; #5;
        Y = 4'b0100; #5;
        Y = 4'b1000; #5;
  end
endmodule