`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 19.07.2026 19:48:47
// Design Name: 
// Module Name: hazard_detection
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
module hazard_detection(

    input [4:0] rs1_id,
    input [4:0] rs2_id,

    input [4:0] rd_ex,
    input mem_read_ex,

    output reg stall,
    output reg id_ex_flush

);

always @(*) begin

    if (mem_read_ex &&
        (rd_ex != 5'd0) &&
        ((rd_ex == rs1_id) || (rd_ex == rs2_id))) begin

        stall = 1'b1;
        id_ex_flush = 1'b1;

    end
    else begin

        stall = 1'b0;
        id_ex_flush = 1'b0;

    end

end

endmodule
