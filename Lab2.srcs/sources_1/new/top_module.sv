module top_module
(
input logic CLK100MHZ,
input logic BTNC, BTNL, BTNR,
input logic [15:0] SW,
output logic [7:0] AN,
output logic [6:0] A2G
);
logic [31:0] pc, instr, readData, writeData, dataAddr;
logic writeEnable;

mips mips(CLK100MHZ, BTNC, instr, readData, writeEnable, pc, dataAddr, writeData);
instruction_memory imem(pc[7:2], instr);
data_memory_decoder dmemd(CLK100MHZ, BTNC, writeEnable, BTNL, BTNR, dataAddr[7:0], SW, writeData, readData, AN, A2G);

endmodule
