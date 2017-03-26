module REG_DECO_EXE(


	input clk,
	input [1:0]cond_in,
	input we_mem_in,
	input sel_dat_in,
	input sel_c_in,
	input we_v_in,
	input we_v_aux_in,
	input suma_resta_in,
	input salto_in,
	input PROHIB,
	input sel_res_in,
	input [2:0]ALU_CTRL_in,
	input [1:0]selOp_A_in,
	input [1:0]selOp_B_in,
	input [3:0]RP_exe_in,
	input [3:0]RS_exe_in,
	input [31:0]PCmas4_in,
	input [31:0]DoA_in,
	input [31:0]DoB_in,
	input [31:0]inmediato_in,
	input [39:0]cuarenta_in,
	input [3:0]Rg_exe_in,
	
	
	output reg [1:0]cond,
	output reg we_mem,
	output reg sel_dat,
	output reg sel_c,
	output reg we_v,
	output reg we_v_aux,
	output reg suma_resta,
	output reg salto,
	output reg PROHIB_EXE,
	output reg sel_res,
	output reg [2:0]ALU_CTRL,
	output reg [1:0]selOp_A,
	output reg [1:0]selOp_B,
	output reg [3:0]RP_exe,
	output reg [3:0]RS_exe,
	output reg [31:0]PCmas4,
	output reg [31:0]DoA,
	output reg [31:0]DoB,
	output reg [31:0]inmediato,
	output reg [39:0]cuarenta,
	output reg [3:0]Rg_exe
	
	
	
);



	always @(posedge clk )
	begin
		cond <= cond_in;
		we_mem<= we_mem_in;
		sel_dat<= sel_dat_in;
		sel_c<= sel_c_in;
		we_v<=we_v_in;
		we_v_aux<=we_v_aux_in;
		suma_resta<=suma_resta_in;
		salto<=salto_in;
		PROHIB_EXE <=  PROHIB;
		sel_res<=sel_res_in;
		ALU_CTRL<=ALU_CTRL_in;
		selOp_A<=selOp_A_in;
		selOp_B<=selOp_B_in;
		RP_exe<=RP_exe_in;
		RS_exe<=RS_exe_in;
		PCmas4<=PCmas4_in;
		DoA<=DoA_in;
		DoB<=DoB_in;
		inmediato<=inmediato_in;
		cuarenta<=cuarenta_in;
		Rg_exe<=Rg_exe_in;
	end
endmodule 