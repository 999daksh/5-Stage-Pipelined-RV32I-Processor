`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 19.07.2026 18:08:48
// Design Name: 
// Module Name: next_pc_mux
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

module next_pc_mux(

    input [31:0] pc_plus4,
    input [31:0] branch_target,
    input [31:0] jalr_target,

    input branch_taken,
    input jump,
    input jalr,

    output reg [31:0] next_pc

);

always @(*) begin

    if (jalr)
        next_pc = jalr_target;

    else if (jump || branch_taken)
        next_pc = branch_target;

    else
        next_pc = pc_plus4;

end

endmodule
