`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 19.07.2026 18:48:34
// Design Name: 
// Module Name: register_file
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
module register_file (

    input         clk,
    input         rst,

    input         reg_write,

    input  [4:0]  rs1,
    input  [4:0]  rs2,
    input  [4:0]  rd,

    input  [31:0] write_data,

    output [31:0] read_data1,
    output [31:0] read_data2
);

    // 32 General Purpose Registers (x0-x31)
    reg [31:0] registers [0:31];

    integer i;

    // Write Port (Sequential)
    always @(posedge clk) begin
        if (rst) begin
            for (i = 0; i < 32; i = i + 1)
                registers[i] <= 32'd0;
        end
        else if (reg_write && (rd != 5'd0)) begin
            registers[rd] <= write_data;
        end
    end

    // Read Port 1 (Combinational)
    assign read_data1 = (rs1 == 5'd0) ? 32'd0 : registers[rs1];

    // Read Port 2 (Combinational)
    assign read_data2 = (rs2 == 5'd0) ? 32'd0 : registers[rs2];

endmodule
