`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 19.07.2026 18:02:32
// Design Name: 
// Module Name: program_counter
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
module program_counter (
    input         clk,
    input         rst,
    input         stall,
    input  [31:0] next_pc,

    output reg [31:0] pc
);
always @(posedge clk) begin
    if (rst)
        pc <= 32'd0;

    else if (stall)
        ;                  // Hold current PC

    else
        pc <= next_pc;
end

endmodule



