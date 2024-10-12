module data_memory
(
input logic clk,
input logic writeEnable,
input logic [7:0] addr,
input logic [31:0] writeData,
output logic [31:0] readData
);
logic [31:0] RAM[255:0];

always_ff @(posedge clk)
    if (writeEnable) RAM[addr] <= writeData;

endmodule
