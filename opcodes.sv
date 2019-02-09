
//opcodes

// ADD %d, %s;  %d = %d+%s
`define ADD  2'b00

// ADDI %d, %s, imm ;  %d = %s + imm
`define ADDI 2'b01

//`define SUB 3'b011
// MUL %d  %s;  %d = %d*%s
`define MULI 2'b10

// B - branch
`define B    2'b11
