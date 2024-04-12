module display(
    input clk,
    input [7:0]data,
    output [7:0]anodes,
    output [6:0]segments
);

reg [2:0] i = 0;
assign anodes = (8'b1 << i);

always @(posedge clk) begin
    i <= i + 4'b1;
end

wire b = data[i];

dig_to_sig dig_to_sig1(.data(b), .segments(segments));

endmodule