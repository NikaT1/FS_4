module top(
    input clk,
    input [ 4 : 0 ] y_bi,
    input is_test_now,
    output DS_EN1, DS_EN2, DS_EN3, DS_EN4, DS_EN5, DS_EN6, DS_EN7, DS_EN8,
    output DS_A, DS_B, DS_C, DS_D, DS_E, DS_F, DS_G
);

reg [7:0] anodes;
assign {DS_EN1, DS_EN2, DS_EN3, DS_EN4, DS_EN5, DS_EN6, DS_EN7, DS_EN8} = ~anodes;

reg [6:0] segments;
assign {DS_A, DS_B, DS_C, DS_D, DS_E, DS_F, DS_G} = ~segments;

wire [7:0] func_anodes, test_anodes;
wire [6:0] func_segments, test_segments;

wire clk2;

always @(posedge clk) begin
    if (is_test_now == 0) begin
        anodes <= func_anodes;
        segments <= func_segments;
    end else begin
        anodes <= test_anodes;
        segments <= test_segments;
    end
end

clk_div clk_div(.clk(clk), .clk2(clk2));

display disp1(.clk(clk2), .data({3'b0, y_bi}), .anodes(func_anodes), .segments(func_segments));

test_display disp2(.clk(clk2), .data({3'b0, y_bi}), .anodes(test_anodes), .segments(test_segments));

endmodule