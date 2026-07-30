`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 19.07.2026 18:45:39
// Design Name: 
// Module Name: if_id_pipeline_reg
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
module if_id_pipeline_reg (
    input         clk,
    input         rst,
    input         stall,
    input         flush,

    input  [31:0] pc_if,
    input  [31:0] instruction_if,
    input  [31:0] pc_plus4_if,

    output reg [31:0] pc_id,
    output reg [31:0] instruction_id,
    output reg [31:0] pc_plus4_id
);

always @(posedge clk) begin
    if (rst) begin
        pc_id          <= 32'd0;
        instruction_id <= 32'd0;
        pc_plus4_id    <= 32'd0;
    end

    else if (flush) begin
        // Insert NOP into the pipeline
        pc_id          <= 32'd0;
        instruction_id <= 32'h00000013;   // ADDI x0, x0, 0 (NOP)
        pc_plus4_id    <= 32'd0;
    end

    else if (stall) begin
        // Hold previous values
        pc_id          <= pc_id;
        instruction_id <= instruction_id;
        pc_plus4_id    <= pc_plus4_id;
    end

    else begin
        pc_id          <= pc_if;
        instruction_id <= instruction_if;
        pc_plus4_id    <= pc_plus4_if;
    end
end

endmodule
