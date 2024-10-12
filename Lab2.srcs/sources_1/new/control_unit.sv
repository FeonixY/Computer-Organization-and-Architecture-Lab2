module control_unit
(
input logic [5:0] op, funct,
input logic zero,
output logic memtoreg, memwrite, pcsrc, alusrc, regdst, regwrite, jump, branch,
output logic [2:0] alucontrol
);
logic [2:0] aluop;

main_decoder maindec(op, memtoreg, memwrite, branch, alusrc, regdst, regwrite, jump, aluop);
alu_decoder aludec(funct, aluop, alucontrol);

assign pcsrc = branch & zero;

endmodule
