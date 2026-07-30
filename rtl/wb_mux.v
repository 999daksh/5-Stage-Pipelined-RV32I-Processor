`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 19.07.2026 20:01:29
// Design Name: 
// Module Name: wb_mux
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
module wb_mux(

    input [31:0] alu_result_wb,
    input [31:0] read_data_wb,
    input [31:0] pc_plus4_wb,

    input [1:0] wb_sel,

    output reg [31:0] write_data

);

always @(*) begin

    case(wb_sel)

        2'b00:
            write_data = alu_result_wb;

        2'b01:
            write_data = read_data_wb;

        2'b10:
            write_data = pc_plus4_wb;

        default:
            write_data = 32'd0;

    endcase

end

endmodule

