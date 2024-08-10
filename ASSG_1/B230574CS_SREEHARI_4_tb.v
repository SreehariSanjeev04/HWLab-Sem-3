module eightBitDLatch_tb;
  reg [7:0] d;
  reg enable;
  reg reset;
  wire [7:0] q, qbar;
  integer i, j, k;

  eightBitDLatch d1 (d,enable,reset,q,qbar);

  initial begin
    $monitor("d=%b, enable=%b, reset=%b, q=%b nq=%b\n", d, enable, reset, q, qbar);
    d = 8'b0;
    enable = 0;
    reset = 0;

    for (i = 0; i <= 8'b11111111; i = i + 1) begin
      for (j = 0; j <= 1; j = j + 1) begin
        for (k = 0; k <= 1; k = k + 1) begin
          d = i;
          enable = j;
          reset = k;
          #10;  
        end
      end
    end
  end
endmodule
