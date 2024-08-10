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
wire c1,c2,c3,c4,c5,c6,c7;
halfAdder h1(a[0],b[0],y[0],c1);
fullAdder f1(a[1],b[1],c1,y[1],c2);
fullAdder f2(a[2],b[2],c2,y[2],c3);
fullAdder f3(a[3],b[3],c3,y[3],c4);
fullAdder f4(a[4],b[4],c4,y[4],c5);
fullAdder f5(a[5],b[5],c5,y[5],c6);
fullAdder f6(a[6],b[6],c6,y[6],c7);
fullAdder f7(a[7],b[7],c7,y[7],carryOut);
endmodule
