module eightBitDLatch(input [7:0]d, input enable, input reset, output [7:0]q, output [7:0]qbar);
d_latch d1(d[0],enable,reset,q[0],qbar[0]);
d_latch d2(d[1],enable,reset,q[1],qbar[1]);
d_latch d3(d[2],enable,reset,q[2],qbar[2]);
d_latch d4(d[3],enable,reset,q[3],qbar[3]);
d_latch d5(d[4],enable,reset,q[4],qbar[4]);
d_latch d6(d[5],enable,reset,q[5],qbar[5]);
d_latch d7(d[6],enable,reset,q[6],qbar[6]);
d_latch d8(d[7],enable,reset,q[7],qbar[7]);
endmodule

module d_latch(input d,input enable, input reset, output q, output qbar);
wire neg_reset,w1,new_d,s,r,neg_d;
not(neg_reset,reset);
not(neg_d,new_d);
nand(w1,enable,neg_reset);
and(new_d,w1,d);
nand(s,new_d,enable);
nand(r,neg_d,enable);
nand(q,s,qbar);
nand(qbar,r,q,reset);
endmodule
