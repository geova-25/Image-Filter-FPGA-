module ConditionChecker(
	input [1:0]Cond,
	input N,
	input Z,
	
	output wire cumple
);


assign  cumple = ((Cond[1]& Cond[1])) 			? 1'b1:   //condicion no importa
						(N & Z) 							? 1'b0:   //negativo y cero (nunca pasa)
					  (N == Cond[1] & Z==Cond[0]) ? 1'b1:   // cumple la condicion
					  1'b0 ;


endmodule 