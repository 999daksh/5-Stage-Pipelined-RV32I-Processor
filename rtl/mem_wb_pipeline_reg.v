`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 19.07.2026 19:58:36
// Design Name: 
// Module Name: mem_wb_pipeline_reg
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
module mem_wb_pipeline_reg(

    input clk,
    input rst,
    input stall,
    input flush,

    //==========================
    // Data Signals
    //==========================
    input [31:0] alu_result_mem,
    input [31:0] read_data_mem,
    input [4:0]  rd_mem,
    input  [31:0] pc_plus4_mem, 

    //==========================
    // Control Signals
    //==========================
    input reg_write_mem,
    input [1:0] wb_sel_mem,

    //==========================
    // Data Outputs
    //==========================
    output reg [31:0] alu_result_wb,
    output reg [31:0] read_data_wb,
    output reg [4:0]  rd_wb,
    output reg [31:0] pc_plus4_wb, 

    //==========================
    // Control Outputs
    //==========================
    output reg reg_write_wb,
    output reg [1:0 ]wb_sel_wb

);

always @(posedge clk)
begin

    // Reset or Flush
    if (rst || flush)
    begin
        alu_result_wb <= 32'd0;
        read_data_wb  <= 32'd0;
        rd_wb         <= 5'd0;

        reg_write_wb  <= 1'b0;
        wb_sel_wb     <= 2'b00;
        pc_plus4_wb <= 32'd0; 
    end

    // Hold previous values during stall
    else if (stall)
    begin
        // Hold previous values
    end

    // Normal pipeline transfer
    else
    begin
        alu_result_wb <= alu_result_mem;
        read_data_wb  <= read_data_mem;
        rd_wb         <= rd_mem;

        reg_write_wb  <= reg_write_mem;
        wb_sel_wb     <= wb_sel_mem;
        pc_plus4_wb <= pc_plus4_mem; 
    end

end

endmodule
