`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 19.07.2026 20:02:34
// Design Name: 
// Module Name: jalr_target_adder
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
module jalr_target_adder(

    input  [31:0] rs1_data,
    input  [31:0] immediate,

    output [31:0] jalr_target

);

assign jalr_target = (rs1_data + immediate) & 32'hFFFFFFFE;

endmodule
