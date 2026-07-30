`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 19.07.2026 18:03:59
// Design Name: 
// Module Name: instruction_memory
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
module instruction_memory (
    input  [31:0] pc,
    output [31:0] instruction
);

reg [31:0] instruction_mem [0:255];

initial begin
    $readmemh("program.mem", instruction_mem);
end

assign instruction = instruction_mem[pc[31:2]];

endmodule