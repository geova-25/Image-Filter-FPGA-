module Unidad_de_Adelantamiento(

	input SelOp_A_exe,
	input SelOp_B_exe,
	input RG_mem,
	input RG_wb,
	input prohib_exe,
	input prohib_wb,
	input prohib_mem,
	input RS_exe,
	input RP_exe,
	
	output wire sel_adel_opA,
	output wire sel_adel_opB,
	output wire [1:0]SelOp_A,
	output wire [1:0]SelOp_B
	
);

assign sel_adel_opA = 
((RG_wb == RP_exe) & (RG_mem != RP_exe | prohib_mem ) & ~prohib_wb)? 1'b1:
((RG_mem == RP_exe) & ~prohib_mem)? 											1'b0:
																							1'b1;
assign SelOp_A =
((RG_wb == RP_exe) & (RG_mem != RP_exe | prohib_mem ) & ~prohib_wb)? 2'b01:
((RG_mem == RP_exe) & ~prohib_mem)? 											2'b01:
																							SelOp_A_exe;

																							
assign sel_adel_opB =
((RG_wb == RS_exe) & (RG_mem != RS_exe | prohib_mem ) & ~prohib_wb)? 1'b1:
((RG_mem == RS_exe) & ~prohib_mem)?												1'b0:
																							1'b1;

assign SelOp_B =
((RG_wb == RS_exe) & (RG_mem != RS_exe | prohib_mem ) & ~prohib_wb)? 2'b11:
((RG_mem == RS_exe) & ~prohib_mem)?												2'b11:
																							SelOp_B_exe;
			
/*
always @(*)
begin
	//Rp
	if ((RG_wb == RP_exe) & (RG_mem != RP_exe | prohib_mem ) & ~prohib_wb)
		begin
			sel_adel_opA = 1'b1;
			SelOp_A = 2'b01;
		end
	else if((RG_mem == RP_exe) & ~prohib_mem)
		begin
			sel_adel_opA = 1'b0;
			SelOp_A = 2'b01;
		end
	else
		begin
			sel_adel_opA = 1'b1; //no importa
			SelOp_A = SelOp_A_exe;
		end
end

always @(*)
begin
	//RS
	if ((RG_wb == RS_exe) & (RG_mem != RS_exe | prohib_mem ) & ~prohib_wb)
		begin
			sel_adel_opB = 1'b1;
			SelOp_B = 2'b11;
		end
	else if((RG_mem == RS_exe) & ~prohib_mem)
		begin
			sel_adel_opB = 1'b0;
			SelOp_B = 2'b11;
		end
	else
		begin
			sel_adel_opB = 1'b1; //no importa
			SelOp_B = SelOp_B_exe;
		end
end*/
	



endmodule 