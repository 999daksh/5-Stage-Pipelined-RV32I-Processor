`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 19.07.2026 19:07:20
// Design Name: 
// Module Name: id_ex_pipeline_reg
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


module id_ex_pipeline_reg(

    input clk,
    input rst,
    input stall,
    input flush,

    //==========================
    // Data Signals
    //==========================
    input [31:0] pc_id,
    input [31:0] pc_plus4_id,
    input [31:0] read_data1_id,
    input [31:0] read_data2_id,
    input [31:0] immediate_id,

    //==========================
    // Instruction Fields
    //==========================
    input [4:0] rd_id,
    input [4:0] rs1_id,
    input [4:0] rs2_id,
    input [2:0] funct3_id,
    input [6:0] funct7_id,

    //==========================
    // Control Signals
    //==========================
    input reg_write_id,
    input alu_src_id,
    input mem_read_id,
    input mem_write_id,
    input [1:0] wb_sel_id,
    input branch_id,
    input jump_id,
    input jalr_id,
    input [1:0] alu_op_id,

    //==========================
    // Data Outputs
    //==========================
    output reg [31:0] pc_ex,
    output reg [31:0] pc_plus4_ex,
    output reg [31:0] read_data1_ex,
    output reg [31:0] read_data2_ex,
    output reg [31:0] immediate_ex,

    //==========================
    // Instruction Field Outputs
    //==========================
    output reg [4:0] rd_ex,
    output reg [4:0] rs1_ex,
    output reg [4:0] rs2_ex,
    output reg [2:0] funct3_ex,
    output reg [6:0] funct7_ex,

    //==========================
    // Control Outputs
    //==========================
    output reg reg_write_ex,
    output reg alu_src_ex,
    output reg mem_read_ex,
    output reg mem_write_ex,
    output reg [1:0] wb_sel_ex,
    output reg branch_ex,
    output reg jump_ex,
    output reg jalr_ex,
    output reg [1:0] alu_op_ex

);

always @(posedge clk)
begin

    // Reset or Flush
    if (rst || flush)
    begin
        // Data Signals
        pc_ex          <= 32'd0;
        pc_plus4_ex    <= 32'd0;
        read_data1_ex  <= 32'd0;
        read_data2_ex  <= 32'd0;
        immediate_ex   <= 32'd0;

        // Instruction Fields
        rd_ex          <= 5'd0;
        rs1_ex         <= 5'd0;
        rs2_ex         <= 5'd0;
        funct3_ex      <= 3'd0;
        funct7_ex      <= 7'd0;

        // Control Signals
        reg_write_ex <= 1'b0;
        alu_src_ex   <= 1'b0;
        mem_read_ex  <= 1'b0;
        mem_write_ex <= 1'b0;
        wb_sel_ex    <= 2'b00;
        branch_ex    <= 1'b0;
        jump_ex      <= 1'b0;
        jalr_ex      <= 1'b0;
        alu_op_ex    <= 2'b00;
    end

    // Hold current values during stall
    else if (stall)
    begin
        // No assignment required.
        // Flip-flops automatically retain their previous values.
    end

    // Normal pipeline transfer
    else
    begin
        // Data Signals
        pc_ex          <= pc_id;
        pc_plus4_ex    <= pc_plus4_id;
        read_data1_ex  <= read_data1_id;
        read_data2_ex  <= read_data2_id;
        immediate_ex   <= immediate_id;

        // Instruction Fields
        rd_ex          <= rd_id;
        rs1_ex         <= rs1_id;
        rs2_ex         <= rs2_id;
        funct3_ex      <= funct3_id;
        funct7_ex      <= funct7_id;

        // Control Signals
        reg_write_ex <= reg_write_id;
        alu_src_ex   <= alu_src_id;
        mem_read_ex  <= mem_read_id;
        mem_write_ex <= mem_write_id;
        wb_sel_ex    <= wb_sel_id;
        branch_ex    <= branch_id;
        jump_ex      <= jump_id;
        jalr_ex      <= jalr_id;
        alu_op_ex    <= alu_op_id;
    end

end

endmodule