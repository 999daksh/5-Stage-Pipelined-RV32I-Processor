`timescale 1ns / 1ps

module tb_riscv_pipeline;

//======================================================
// Testbench Signals
//======================================================

reg clk;
reg rst;

//======================================================
// Instantiate DUT
//======================================================

riscv_pipeline uut(

    .clk(clk),
    .rst(rst)

);

//======================================================
// Clock Generation (100 MHz)
//======================================================

initial begin
    clk = 1'b0;
    forever #5 clk = ~clk;
end

//======================================================
// Reset Generation
//======================================================

initial begin

    rst = 1'b1;

    repeat(2) @(posedge clk);

    rst = 1'b0;

end

//======================================================
// Monitor Processor State
//======================================================

initial begin

    $display("==============================================");
    $display("        RISC-V PIPELINE SIMULATION");
    $display("==============================================");
    $display("Time\tPC\tInstruction");
    $display("----------------------------------------------");

    $monitor("%0t\t%h\t%h",
             $time,
             uut.pc,
             uut.instruction);

end

//======================================================
// Run Simulation
//======================================================

initial begin

    repeat(40) @(posedge clk);

    $display("");
    $display("==============================================");
    $display("         REGISTER FILE CONTENTS");
    $display("==============================================");

    $display("x0  = %h", uut.rf_inst.registers[0]);
    $display("x1  = %h", uut.rf_inst.registers[1]);
    $display("x2  = %h", uut.rf_inst.registers[2]);
    $display("x3  = %h", uut.rf_inst.registers[3]);
    $display("x4  = %h", uut.rf_inst.registers[4]);
    $display("x5  = %h", uut.rf_inst.registers[5]);
    $display("x6  = %h", uut.rf_inst.registers[6]);
    $display("x7  = %h", uut.rf_inst.registers[7]);
    $display("x8  = %h", uut.rf_inst.registers[8]);
    $display("x9  = %h", uut.rf_inst.registers[9]);
    $display("x10 = %h", uut.rf_inst.registers[10]);
    $display("x11 = %h", uut.rf_inst.registers[11]);
    $display("x12 = %h", uut.rf_inst.registers[12]);

    $display("==============================================");

    $finish;

end

//======================================================
// GTKWave Dump
//======================================================

initial begin
    $dumpfile("riscv.vcd");
    $dumpvars(0, tb_riscv_pipeline);
end 

endmodule



