`timescale 1ns / 1ps

module lfsr_1 (
    input wire clk_i,
    input wire rst_i,
    input wire [ 7 : 0 ] val,
    input wire start_i,
    output wire [ 7 : 0 ] result //может можно без него?
);

reg [7:0] register;
assign result = register;

always @(posedge clk_i) begin
    if (rst_i) begin
        register <= val;
    end else if (start_i) begin
        register = {register[6:0],(register[0]^register[1]^register[5]^register[6])};
    end
end
endmodule