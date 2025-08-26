module fulladd(a, b, c, sum, carry);
    input a, b, c;
    wire w1, w2, w3, w4, w5;
    output sum, carry;
    xor x0(w1, a, b);
    xor x1(sum, w1, c);
    and a0(w2, a, b);
    and a1(w3, a, c);
    and a2(w4, c, b);
    or o0(w5, w2, w3);
    or o1(carry, w5,w4);
endmodule