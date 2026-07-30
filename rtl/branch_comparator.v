`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 19.07.2026 19:42:04
// Design Name: 
// Module Name: branch_comparator
// Project Name: 
// Target Devices: 
// Tool Versions: 
// Description: 
// 
// Dependencies: 
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
//////////////////////////////////////////////////////////////////////////////////
module branch_comparator(

    input [31:0] operand_a,
    input [31:0] operand_b, 
    input [2:0] funct3,

    output reg branch_taken

);

always @(*) begin

    branch_taken = 1'b0;

    case (funct3)

        3'b000: branch_taken = (operand_a == operand_b);                          // BEQ 
        3'b001: branch_taken = (operand_a != operand_b);                          // BNE 
        3'b100: branch_taken = ($signed(operand_a) <  $signed(operand_b));        // BLT 
        3'b101: branch_taken = ($signed(operand_a) >= $signed(operand_b));        // BGE 
        3'b110: branch_taken = (operand_a <  operand_b);                          // BLTU 
        3'b111: branch_taken = (operand_a >= operand_b);                          // BGEU 

        default: branch_taken = 1'b0;

    endcase

end

endmodule
