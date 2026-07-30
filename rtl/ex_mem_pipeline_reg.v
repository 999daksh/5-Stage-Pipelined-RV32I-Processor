`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 19.07.2026 19:47:11
// Design Name: 
// Module Name: ex_mem_pipeline_reg
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
module ex_mem_pipeline_reg(

    input clk,
    input rst,
    input stall,
    input flush,

    //==========================
    // Data Signals
    //==========================
    input [31:0] alu_result_ex,
    input [31:0] read_data2_ex,
    input [4:0]  rd_ex,
    input [31:0] pc_plus4_ex, 

    //==========================
   // Control Signals
  //==========================
   input reg_write_ex,
   input mem_read_ex,
   input mem_write_ex,
   input [1:0] wb_sel_ex,

    //==========================
    // Data Outputs
    //==========================
    output reg [31:0] alu_result_mem,
    output reg [31:0] read_data2_mem,
    output reg [4:0]  rd_mem,
    output reg [31:0] pc_plus4_mem, 

    //==========================
    // Control Outputs
    //==========================
    output reg reg_write_mem,
    output reg mem_read_mem,
    output reg mem_write_mem,
    output reg [1:0] wb_sel_mem
);

always @(posedge clk)
begin

    // Reset or Flush
    if (rst || flush)
    begin
        // Data Signals
        alu_result_mem <= 32'd0;
        read_data2_mem <= 32'd0;
        rd_mem         <= 5'd0;
        pc_plus4_mem <= 32'd0; 

        // Control Signals
        reg_write_mem  <= 1'b0;
        mem_read_mem   <= 1'b0;
        mem_write_mem  <= 1'b0;
        wb_sel_mem     <= 2'b00;
    end

    // Hold previous values during stall
    else if (stall)
    begin
        // No assignment required.
    end

    // Normal pipeline transfer
    else
    begin
        // Data Signals
        alu_result_mem <= alu_result_ex;
        read_data2_mem <= read_data2_ex;
        rd_mem         <= rd_ex;
       pc_plus4_mem <= pc_plus4_ex; 

        // Control Signals
        reg_write_mem  <= reg_write_ex;
        mem_read_mem   <= mem_read_ex;
        mem_write_mem  <= mem_write_ex;
        wb_sel_mem     <= wb_sel_ex;
    end

end

endmodule
