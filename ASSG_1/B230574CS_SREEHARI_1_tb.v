module eightBitAdder_tb;
    reg [7:0] a, b;
    wire [7:0] y;
    wire carryOut;
    eightBitAdder e1(a, b, y, carryOut);
    integer i, j;

    initial begin
		$monitor("a = %b (%d), b = %b (%d), y = %b (%d), carry = %b", a, a, b, b, y, y, carryOut);
        for (i = 0; i <= 8'b11111111; i = i + 1) begin
            for (j = 0; j <= 8'b11111111; j = j + 1) begin
                a = i;
                b = j;
                #10; 
            end
        end
    end
endmodule
