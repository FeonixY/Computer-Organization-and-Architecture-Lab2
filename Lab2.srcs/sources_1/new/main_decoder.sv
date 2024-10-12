module main_decoder
(
input logic [5:0] op,
output logic memtoreg, memwrite, branch, alusrc, regdst, regwrite, jump,
output logic [2:0] aluop
);
logic [9:0] controls;

assign {regwrite, regdst, alusrc, branch, memwrite, memtoreg, jump, aluop} = controls;

always_comb
    case (op)
        6'b000000: controls = 10'b1100000111; //R-type
        6'b100011: controls = 10'b1010010000; //lw
        6'b101011: controls = 10'b0010100000; //sw
        6'b001000: controls = 10'b1010000000; //addi
        6'b000100: controls = 10'b0001000001; //beq
        6'b001100: controls = 10'b1010000011; //andi
        6'b001101: controls = 10'b1010000100; //ori
        6'b000010: controls = 10'b0000001000; //j
        default: controls = 10'bxxxxxxxxxx;
    endcase

endmodule
