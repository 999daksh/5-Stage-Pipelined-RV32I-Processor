`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 19.07.2026 19:43:39
// Design Name: 
// Module Name: branch_target_adder
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
module branch_target_adder(

    input  [31:0] pc_ex,
    input  [31:0] immediate_ex,

    output [31:0] branch_target

);

assign branch_target = pc_ex + immediate_ex;

endmodule