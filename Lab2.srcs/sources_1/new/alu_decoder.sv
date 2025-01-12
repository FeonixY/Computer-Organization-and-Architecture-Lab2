module alu_decoder
(
input logic [5:0] funct,
input logic [2:0] aluop,
output logic [2:0] alucontrol
);

always_comb
    case (aluop)
        3'b000: alucontrol = 3'b000; //add-lw\sw\addi
        3'b001: alucontrol = 3'b001; //sub-beq
        3'b011: alucontrol = 3'b011; //and-addi
        3'b100: alucontrol = 3'b100; //or-ori
        default: case (funct) //Rtype
            6'b100000: alucontrol = 3'b000; //add
            6'b100010: alucontrol = 3'b001; //sub
            6'b100100: alucontrol = 3'b011; //and
            6'b100101: alucontrol = 3'b100; //or
            6'b101010: alucontrol = 3'b101; //slt
            default: alucontrol = 3'bxxx;   //???
        endcase
    endcase

endmodule
