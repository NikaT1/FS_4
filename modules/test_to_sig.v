module test_to_sig(
    input [2:0] data,
    output reg [6:0]segments
);

always @(*) begin
    case (data)
        3'b000: segments <= 7'b0001111;
        3'b001: segments <= 7'b1011011;
        3'b010: segments <= 7'b1001111;
        3'b011: segments <= 7'b0001111;
        3'b100: segments <= 7'b0000001;
        3'b101: segments <= 7'b0000001;
        3'b110: segments <= 7'b0000001;
        3'b111: segments <= 7'b0000001;
    endcase
end

endmodule