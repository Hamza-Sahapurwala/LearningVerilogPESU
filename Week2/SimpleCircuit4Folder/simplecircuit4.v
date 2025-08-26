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
module simple_circuit4(T,P,O,D,F,);
    output D,F;
    input T,P,O;
    andgate G1(T,P,D); // A and B are input while w1 is the output
    orgate G3(D,O,F); // w1 and E are input while D is output
endmodule