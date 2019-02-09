// n - data bus width
module regs #(parameter n = 8) (input logic clk, w, //reset,// clk and write control
										  input logic [n-1:0] Wdata,
										  input logic [1:0] Rdno, Rsno, // 2-bit register number
										  output logic [n-1:0] Rd, Rs);
// Declare 4 n-bit registers 
logic [n-1:0] gpr [3:0];

	// write to dest reg Rd, if w==1
always_ff @ (posedge clk)//or negedge reset)
	begin
		/*if (!reset)
			begin
				gpr [0] <= 0;
				gpr [1] <= 0;
				gpr [2] <= 0;
				gpr [3] <= 0;
			end
		else*/ 
		if (w)
			gpr[Rdno] <= Wdata;
	end
	
always_comb
	begin
		// dual output bus: Rd and Rs
		Rd = gpr[Rdno];
		// if %0 is selected as Rs (Rsno==0) then Rs is 0
		Rs = (Rsno==2'b00 ? {n{1'b0}} : gpr[Rsno]);
	end
	
endmodule // module regs