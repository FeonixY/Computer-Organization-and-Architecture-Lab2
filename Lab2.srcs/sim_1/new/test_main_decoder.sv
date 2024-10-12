`timescale 1ns / 1ps

module test_main_decoder();
logic clk, reset;
logic memtoreg, pcsrc, alusrc, regdst, regwrite, jump;
logic [2:0] alucontrol;
logic [31:0] instr, readdata;
logic zero;
logic [31:0] pc, aluout, writedata;

datapath dp(clk, reset, memtoreg, pcsrc, alusrc, regdst, regwrite, jump, alucontrol, instr, readdata, zero, pc, aluout, writedata);
initial
    begin
        clk = 0;
        reset = 0;
        memtoreg = 0;
        pcsrc = 0;
        alusrc = 1;
        regdst = 0;
        regwrite = 1;
        jump = 0;
        alucontrol = 3'b010;
        instr = 32'b00100000000000100000000000000101;
        readdata = 0;
    end
    
always
    begin
    #5 clk = ~clk;
    end

endmodule
