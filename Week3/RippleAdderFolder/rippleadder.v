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

module fulladdR(input wire [3:0] a, b, input wire cin, output wire [3:0] sum, output wire cout);
    wire [2:0] c;  
    fulladd u0 (a[0],b[0],cin,sum[0],c[0]);  
    fulladd u1 (a[1],b[1],c[0],sum[1],c[1]);  
    fulladd u2 (a[2],b[2],c[1],sum[2],c[2]);  
    fulladd u3 (a[3],b[3],c[2],sum[3],cout);
endmodule 
