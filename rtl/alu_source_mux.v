`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 19.07.2026 19:40:49
// Design Name: 
// Module Name: alu_source_mux
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
module alu_source_mux(

    input  [31:0] read_data2_ex,
    input  [31:0] immediate_ex,
    input         alu_src,

    output [31:0] operand_b

);

assign operand_b = (alu_src) ? immediate_ex : read_data2_ex;

endmodule

