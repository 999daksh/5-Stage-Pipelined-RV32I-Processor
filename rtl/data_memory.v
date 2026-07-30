`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 19.07.2026 19:50:57
// Design Name: 
// Module Name: data_memory
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
module data_memory(

    input clk,
    input rst,

    // Address from ALU
    input [31:0] alu_result_mem,

    // Data to be written (for SW)
    input [31:0] read_data2_mem,

    // Control Signals
    input mem_read,
    input mem_write,

    // Data read from memory (for LW)
    output [31:0] read_data

);

reg [31:0] data_memory [0:255];
integer i;

//------------------------------
// Asynchronous Read
//------------------------------
assign read_data = (mem_read) ?
                   data_memory[alu_result_mem[31:2]] :
                   32'd0;

//------------------------------
// Synchronous Write
//------------------------------
always @(posedge clk)
begin

    if (rst)
    begin
        for (i = 0; i < 256; i = i + 1)
            data_memory[i] <= 32'd0;
    end

    else if (mem_write)
    begin
        data_memory[alu_result_mem[31:2]] <= read_data2_mem;
    end

end

endmodule
