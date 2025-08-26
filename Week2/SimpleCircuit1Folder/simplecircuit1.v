module andgate(a,b,y);
    input a,b;
    output y;
    assign y = a & b;
endmodule
module notgate (a,y);
    input a;
    output y;
    assign y = !a;
endmodule
module orgate (a,b,y);
    input a,b;
    output y;
    assign y = a | b;
endmodule
module simple_circuit1(A,B,C,D,E,);
    output D,E;
    input A,B,C;
    wire w1; // tells that w1 is an output
    andgate G1(A,B,w1); // A and B are input while w1 is the output
    notgate G2(C,E); // C is input while E is output
    orgate G3(w1,E,D); // w1 and E are input while D is output
endmodule