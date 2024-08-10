module eightBitALU_tb;
    reg [7:0] data1;
    reg [7:0] data2;
    reg [1:0] select;
    wire [7:0] result;
	 wire carryOrBorrow;
    eightBitALU uut (data1, data2, select,result, carryOrBorrow);
    integer i, j, k;
    initial begin   
        $monitor("data1 = %b (%d), data2 = %b (%d), select = %b, result = %b (%d), carry/borrow = %b", data1, data1, data2,data2, select, result,result,carryOrBorrow);
        for(i = 0; i <= 8'b11111111; i = i + 1) begin
            for(j = 0; j <= 8'b11111111; j = j + 1) begin
                for(k = 0; k <= 2'b11; k = k + 1) begin
                    data1 = i;
                    data2 = j;
                    select = k;
                    #10; 
                end
            end
        end
    end

endmodule
