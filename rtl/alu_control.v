`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 19.07.2026 19:10:32
// Design Name: 
// Module Name: alu_control
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
module alu_control(

    input  [1:0] alu_op,
    input  [2:0] funct3,
    input  [6:0] funct7,

    output reg [3:0] alu_control

);

always @(*) begin

    alu_control = 4'b0000;

    case (alu_op)

        //==========================
        // Load / Store
        //==========================
        2'b00:
            alu_control = 4'b0000;      // ADD

        //==========================
        // Branch
        //==========================
        2'b01:
            alu_control = 4'b0001;      // SUB

        //==========================
        // R-Type & I-Type ALU
        //==========================
        2'b10,
        2'b11:
        begin
            case (funct3)

                // ADD / SUB / ADDI
                3'b000:
                begin
                    if (alu_op == 2'b11)
                        alu_control = 4'b0000;      // ADDI
                    else if (funct7 == 7'b0000000)
                        alu_control = 4'b0000;      // ADD
                    else if (funct7 == 7'b0100000)
                        alu_control = 4'b0001;      // SUB
                end

                // SLL / SLLI
                3'b001:
                    alu_control = 4'b0101;

                // SLT / SLTI
                3'b010:
                    alu_control = 4'b1000;

                // SLTU / SLTIU
                3'b011:
                    alu_control = 4'b1001;

                // XOR / XORI
                3'b100:
                    alu_control = 4'b0100;

                // SRL/SRA or SRLI/SRAI
                3'b101:
                begin
                    if (funct7 == 7'b0000000)
                        alu_control = 4'b0110;
                    else if (funct7 == 7'b0100000)
                        alu_control = 4'b0111;
                end

                // OR / ORI
                3'b110:
                    alu_control = 4'b0011;

                // AND / ANDI
                3'b111:
                    alu_control = 4'b0010;

                default:
                    alu_control = 4'b0000;

            endcase
        end

        default:
            alu_control = 4'b0000;

    endcase

end

endmodule


