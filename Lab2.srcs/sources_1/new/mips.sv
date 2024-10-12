module mips
(
input logic clk, reset,
input logic [31:0] instr, readdata,
output logic memwrite,
output logic [31:0] pc, aluout, writedata
);
logic memtoreg, branch, pcsrc, zero, alusrc, regdst, regwrite, jump;
logic [2:0] alucontrol;

control_unit cu(instr[31:26], instr[5:0], zero, memtoreg, memwrite, pcsrc, alusrc, regdst, regwrite, jump, branch, alucontrol);
datapath dp(clk, reset, memtoreg, pcsrc, alusrc, regdst, regwrite, jump, alucontrol, instr, readdata, zero, pc, aluout, writedata);

endmodule
