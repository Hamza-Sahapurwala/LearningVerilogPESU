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
module simple_circuit3(A,B,C,D,E,F,);
    output D,E,F;
    input A,B,C;
    wire w1; // tells that w1 and w2 is an output
    andgate G1(A,B,D);
    andgate G2(B,C,w1); // A and B are input while w1 is the output
    orgate G3(w1,A,E); // w1 and E are input while D is output
    orgate G4(E,D,F);
endmodule