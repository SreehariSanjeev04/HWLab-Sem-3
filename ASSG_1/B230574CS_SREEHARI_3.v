module halfAdder(a,b,sum,carry);
input a,b;
output sum, carry;
xor(sum,a,b);
and(carry,a,b);
endmodule

module fullAdder(a,b,cin,sum,cout);
input a,b,cin;
output sum,cout;
wire w1,w2,w3;
xor(w1,a,b);
xor(sum,cin,w1);
and(w2,cin,w1);
and(w3,b,a);
or(cout,w2,w3);
endmodule

module eightBitAdder(a,b,y,carryOut);
input [7:0] a,b;
output [7:0] y;
output carryOut;
wire c1,c2,c3,c4,c5,c6;
halfAdder h1(a[0],b[0],y[0],c1);
fullAdder f1(a[1],b[1],c1,y[1],c2);
fullAdder f2(a[2],b[2],c2,y[2],c3);
fullAdder f3(a[3],b[3],c3,y[3],c4);
fullAdder f4(a[4],b[4],c4,y[4],c5);
fullAdder f5(a[5],b[5],c5,y[5],c6);
fullAdder f6(a[6],b[6],c6,y[6],c7);
fullAdder f7(a[7],b[7],c7,y[7],carryOut);
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

module halfSubtractor(a,b,d,carry);
input a,b;
output d,carry;
wire neg_a;
xor(d,a,b);
not(neg_a,a);
and(carry,neg_a,b);
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

module bitwiseXOR(a,b,y);
input [7:0] a;
input [7:0] b;
output [7:0] y;
xor(y[0],a[0],b[0]);
xor(y[1],a[1],b[1]);
xor(y[2],a[2],b[2]);
xor(y[3],a[3],b[3]);
xor(y[4],a[4],b[4]);
xor(y[5],a[5],b[5]);
xor(y[6],a[6],b[6]);
xor(y[7],a[7],b[7]);
endmodule

module Shifter(a,y);
input [7:0]a;
output [7:0]y;
and(y[7],a[3],1'b1);
and(y[6],a[2],1'b1);
and(y[5],a[1],1'b1);
and(y[4],a[0],1'b1);
and(y[3],1'b0,1'b0);
and(y[2],1'b0,1'b0);
and(y[1],1'b0,1'b0);
and(y[0],1'b0,1'b0);
endmodule

module twoToOneMUX(s,I0,I1,y);
input s,I0,I1;
output y;
wire neg_s,w1,w2;
not(neg_s,s);
and(w1,neg_s,I0);
and(w2,s,I1);
or(y,w1,w2);
endmodule

module fourToOneMUX(s1,s0,I0,I1,I2,I3,y);
input s1,s0;
input [7:0] I0,I1,I2,I3;
output [7:0] y;
wire neg_s1,neg_s0;
wire [7:0] w1,w2,w3,w4;
not(neg_s1,s1);
not(neg_s0,s0);
and(w1[0],neg_s1,neg_s0,I0[0]);
and(w1[1],neg_s1,neg_s0,I0[1]);
and(w1[2],neg_s1,neg_s0,I0[2]);
and(w1[3],neg_s1,neg_s0,I0[3]);
and(w1[4],neg_s1,neg_s0,I0[4]);
and(w1[5],neg_s1,neg_s0,I0[5]);
and(w1[6],neg_s1,neg_s0,I0[6]);
and(w1[7],neg_s1,neg_s0,I0[7]);

and(w2[0],neg_s1,s0,I1[0]);
and(w2[1],neg_s1,s0,I1[1]);
and(w2[2],neg_s1,s0,I1[2]);
and(w2[3],neg_s1,s0,I1[3]);
and(w2[4],neg_s1,s0,I1[4]);
and(w2[5],neg_s1,s0,I1[5]);
and(w2[6],neg_s1,s0,I1[6]);
and(w2[7],neg_s1,s0,I1[7]);

and(w3[0],s1,neg_s0,I2[0]);
and(w3[1],s1,neg_s0,I2[1]);
and(w3[2],s1,neg_s0,I2[2]);
and(w3[3],s1,neg_s0,I2[3]);
and(w3[4],s1,neg_s0,I2[4]);
and(w3[5],s1,neg_s0,I2[5]);
and(w3[6],s1,neg_s0,I2[6]);
and(w3[7],s1,neg_s0,I2[7]);

and(w4[0],s1,s0,I3[0]);
and(w4[1],s1,s0,I3[1]);
and(w4[2],s1,s0,I3[2]);
and(w4[3],s1,s0,I3[3]);
and(w4[4],s1,s0,I3[4]);
and(w4[5],s1,s0,I3[5]);
and(w4[6],s1,s0,I3[6]);
and(w4[7],s1,s0,I3[7]);

or(y[0],w1[0],w2[0],w3[0],w4[0]);
or(y[1],w1[1],w2[1],w3[1],w4[1]);
or(y[2],w1[2],w2[2],w3[2],w4[2]);
or(y[3],w1[3],w2[3],w3[3],w4[3]);
or(y[4],w1[4],w2[4],w3[4],w4[4]);
or(y[5],w1[5],w2[5],w3[5],w4[5]);
or(y[6],w1[6],w2[6],w3[6],w4[6]);
or(y[7],w1[7],w2[7],w3[7],w4[7]);
endmodule

module eightBitALU(data1,data2,select,result,carryOrBorrow);
input [7:0] data1,data2;
input [1:0] select;
output [7:0] result;
output carryOrBorrow;
wire [7:0] y1,y2,y3,y4;
wire carryOut,borrow,temp;
eightBitAdder e1(data1,data2,y1,carryOut);
eightBitSubtractor e2(data1,data2,y2,borrow);
twoToOneMUX t1(select[0],carryOut,borrow,temp);
twoToOneMUX t2(select[1],temp,1'b0,carryOrBorrow);
bitwiseXOR b1(data1,data2,y3);
Shifter s1(data1,y4);
fourToOneMUX f1(select[1],select[0],y1,y2,y3,y4,result);
endmodule
	