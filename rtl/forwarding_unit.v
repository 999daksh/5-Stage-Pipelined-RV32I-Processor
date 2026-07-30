`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 19.07.2026 19:45:51
// Design Name: 
// Module Name: forwarding_unit
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
module forwarding_unit(

    input [4:0] rs1_ex,
    input [4:0] rs2_ex,

    input [4:0] rd_mem,
    input       reg_write_mem,

    input [4:0] rd_wb,
    input       reg_write_wb,

    output reg [1:0] forward_a,
    output reg [1:0] forward_b

);

always @(*) begin

    // Default: Use Register File
    forward_a = 2'b00;
    forward_b = 2'b00;

    // Forward for Operand A
    if (reg_write_mem &&
        (rd_mem != 5'd0) &&
        (rd_mem == rs1_ex))
        forward_a = 2'b10;

    else if (reg_write_wb &&
             (rd_wb != 5'd0) &&
             (rd_wb == rs1_ex))
        forward_a = 2'b01;

    // Forward for Operand B
    if (reg_write_mem &&
        (rd_mem != 5'd0) &&
        (rd_mem == rs2_ex))
        forward_b = 2'b10;

    else if (reg_write_wb &&
             (rd_wb != 5'd0) &&
             (rd_wb == rs2_ex))
        forward_b = 2'b01;

end

endmodule
