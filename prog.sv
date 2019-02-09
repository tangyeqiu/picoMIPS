//psize - address width, Isize - instruction width
module prog #(parameter Psize = 5, Isize = 14) (input logic [Psize-1:0] address,
												output logic [Isize-1:0] I); // I - instruction code

//program memory declaration, note: 1<<n is same as 2^n
logic [Isize-1:0] progMem[(1<<Psize)-1:0];

//get memory contents from file
always_comb
	begin
		case(address) //still need to be modified
			0: I = 14'b10_00_00_00000000; //MULI 0 //CLEAR %0
		   //1: I = 14'b10_01_01_00000000; //MULI 1 //CLEAR %1
		   //2: I = 14'b10_10_10_00000000; //MULI 2 //CLEAR %2
		   //3: I = 14'b10_11_11_00000000; //MULI 3 //CLEAR %3
			1: I = 14'b11_00_00_00000001; //B 0 PC=1
			2: I = 14'b00_00_00_10000000; //ADD  %0; %0 = inport x1
			3: I = 14'b00_01_00_10000000; //ADD  %1; %1 = inport x1
			4: I = 14'b11_00_00_10000100; //B 1 PC=4
			5: I = 14'b11_00_00_00000101; //B 0 PC=5
			6: I = 14'b00_10_00_10000000; //ADD  %2; %2 = inport y1
		   7: I = 14'b00_11_00_10000000; //ADD  %3; %3 = inport y1
			8: I = 14'b11_00_00_10001000; //B 1 PC=8
			9: I = 14'b10_00_00_01100000; //MULI %0, %0, 0.75; %0 = %0 * 0.75 // 0.75x1
			10: I = 14'b10_01_01_11000000; //MULI %1, %1, -0.5; %1 = %1 * -0.5 // -0.5x1
			11: I = 14'b10_10_10_01000000; //MULI %2, %2, 0.5; %2 = %2 * 0.5 // 0.5y1
			12: I = 14'b10_11_11_01100000; //MULI %3, %3, 0.5; %3 = %3 * 0.75 // 0.75y1
		   13: I = 14'b00_00_10_00000000; //ADD %0, %2; %0 = %0 + %2 // 0.75x1 + 0.5y1
		   14: I = 14'b00_11_01_00000000; //ADD %3, %1; %3 = %3 + %1 // 0.75y1 - 0.5x1
		   15: I = 14'b01_00_00_00010100; //ADDI %0, 20; //%0 = %0 + 20 //x2 = 0.75x1 + 0.5y1 + 20
		   16: I = 14'b11_00_00_00010000; //B 0 PC = 16
		   17: I = 14'b10_00_00_00000000; //MULI 0 //CLEAR %0
		   //16: I = 14'b01_11_00_11101100; //ADDI %3, -20; //%3 = %3 + -20 //y2 = 0.75x1 + 0.5y1 + 20
		   18: I = 14'b00_00_11_00000000; //ADD %0, %3; %0 = %0 + %3 //y2 = 0.75x1 + 0.5y1 + 20 
			19: I = 14'b01_00_00_11101100; //ADDI %0, -20; //%0 = %0 - 20 //DISP
		   20: I = 14'b11_00_00_10010100; //B 1 PC = 20
		   default: I = 14'b11_00_00_00000000;//B0 PC = 0
		endcase
	end
endmodule // end of module prog
