module test_display(
    input clk,
    input [7:0]data,
    output [7:0]anodes,
    output [6:0]segments
);

reg [2:0] i = 0;
reg [2:0] j = 0;
reg [17:0] cnt = 0;


assign anodes = (8'b1 << i);

always @(posedge clk) begin
    i <= i + 4'b1;
    
    if (cnt[17] == 1) begin
        cnt <= 0;
    end else begin
        j <= j + 1;
        cnt <= cnt + 1;
    end

end

test_to_sig test_to_sig1(.data(j), .segments(segments));

endmodule