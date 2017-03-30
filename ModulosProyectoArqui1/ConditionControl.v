module ConditionControl (
	input clk,
	input [1:0]Cond,
	input N_in,
	input Z_in,
	input WE_C_aux,
	input suma_resta,
	input salto,
	input WE_flags,
	
	output wire sel_pc,
	output wire WE_C
	
);
	reg N=1'b0;
	reg Z=1'b0;
	wire cumple;
	
	always @(posedge clk)
	begin
		if(WE_flags)
			begin
				N<= N_in;
				Z<= Z_in;
			end
		else
			begin
				N<= N;
				Z<= Z;
			end
	end
	
	
	ConditionChecker condition_checker(
		.Cond(Cond),
		.N(N),
		.Z(Z),
		//salida
		.cumple(cumple)
	);
	
	assign WE_C = ~( ~WE_C_aux  & cumple);
	assign sel_pc = cumple & salto ; 
	

endmodule 