module data_memory_decoder
(
input logic clk, reset,
input logic writeEnable, btnL, btnR,
input logic [7:0] addr,
input logic [15:0] switch,
input logic [31:0] writeData,
output [31:0] readData,
output logic [7:0] an,
output logic [6:0] a2g
);
logic pRead, pWrite;
logic [31:0] readData1, readData2;
logic [11:0] led;

assign pRead = (addr[7] == 1'b1) ? 1 : 0;
assign pWrite = (addr[7] == 1'b1) ? writeEnable : 0;

data_memory dmem(clk, writeEnable, addr, writeData, readData1);
IO io(clk, reset, pRead, pWrite, btnL, btnR, addr[3:2], switch, writeData, readData2, led);
mux7seg m7seg(clk, reset, {switch, 4'b0000, led}, a2g, an);

assign readData = (addr[7] == 1) ? readData2 : readData1;
endmodule
