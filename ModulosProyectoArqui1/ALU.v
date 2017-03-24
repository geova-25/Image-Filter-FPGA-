
module ALU(
		input [31:0] A, B,
		input [2:0]  Alu_CTRL,
		output reg  C, Z, N,
		output reg [31:0] out 
		);

always @*
	case (Alu_CTRL)
		3'b000: {C,out} = A + B; 			
		3'b001: {C,out} = A - B;
		3'b010: {C,out} = A * B;
		3'b011: {C,out} = A & B;
		3'b100: {C,out} = A | B;
		default: {C,out} = {1'b0,32'b0};
	endcase
	
always @*
begin
	
	if (out == 32'b0)
	
		Z = 1'b1;
		
	else
	
		Z = 1'b0;
		
	if (out[31]==1)
		begin
		N= 1'b1;
		end
	else
		begin
		N= 1'b0;
		end
	
end

endmodule

