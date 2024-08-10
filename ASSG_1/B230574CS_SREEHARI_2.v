module halfSubtractor(a,b,d,carry);
input a,b;
output d,carry;
wire neg_a;
xor(d,a,b);
not(neg_a,a);
and(carry,neg_a,b);
endmodule

module fullSubtractor(a,b,bin,d,bout);
input a,b,bin;
output d,bout;
wire w1,w2,w3,w4,w5;
xor(w1,a,b);
xor(d,w1,bin);
not(w2,w1);
and(w3,w2,bin);
not(w4,a);
and(w5,w4,b);
or(bout,w3,w5);
endmodule

module eightBitSubtractor(a,b,difference,borrow);
input [7:0] a,b;
output [7:0] difference;
output borrow;
wire b1,b2,b3,b4,b5,b6,b7;
halfSubtractor h1(a[0],b[0],difference[0],b1);
fullSubtractor f1(a[1],b[1],b1,difference[1],b2);
fullSubtractor f2(a[2],b[2],b2,difference[2],b3);
fullSubtractor f3(a[3],b[3],b3,difference[3],b4);
fullSubtractor f4(a[4],b[4],b4,difference[4],b5);
fullSubtractor f5(a[5],b[5],b5,difference[5],b6);
fullSubtractor f6(a[6],b[6],b6,difference[6],b7);
fullSubtractor f7(a[7],b[7],b7,difference[7],borrow);
endmodule
