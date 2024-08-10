module eightBitSubtractor_tb;
    reg [7:0] a, b;
    wire [7:0] difference;
    wire borrow;
    integer i, j;

    
    eightBitSubtractor e1 (a,b,difference,borrow);

    initial begin
        $monitor("a=%b (%d), b=%b (%d), difference=%b (%d), borrow=%b", a, a, b, b, difference, difference, borrow);
        for (i = 0; i <= 8'b11111111; i = i + 1) begin
            for (j = 0; j <= 8'b11111111; j = j + 1) begin
                a = i;
                b = j;
                #10; 
            end
        end
    end
endmodule
