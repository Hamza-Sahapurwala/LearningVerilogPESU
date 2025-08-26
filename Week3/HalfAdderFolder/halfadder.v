module xorgate (y,a,b);
    input a,b;
    output y;
    assign y = a ^ b;
endmodule

module andgate(y,a,b);
    input a,b;
    output y;
    assign y = a & b;
endmodule

module halfadd (a,b,sum,carry,);
    input a,b;
    output sum,carry;
    xorgate s(sum,a,b);
    andgate c(carry,a,b);
endmodule