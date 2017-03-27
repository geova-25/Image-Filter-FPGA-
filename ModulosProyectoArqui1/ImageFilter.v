`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    03:00:42 03/27/2017 
// Design Name: 
// Module Name:    ImageFilter 
// Project Name: 
// Target Devices: 
// Tool versions: 
// Description: 
//
// Dependencies: 
//
// Revision: 
// Revision 0.01 - File Created
// Additional Comments: 
//
//////////////////////////////////////////////////////////////////////////////////
module ImageFilter(
    input wire clk,
    output [31:0] salida
    );
	 
	wire sel_A; //K
	wire sel_B; //K
	wire sel_ext; //k
	wire WE_C_deco; //K
	wire WE_V_deco; //k 
	wire [1:0] SELOP_B_deco; //k
	wire [1:0] SELOP_A_deco; //k
	wire SEL_RES_deco; //k
	wire [2:0] ALU_CTRL_deco; //k
	wire WE_MEM_deco; //k
	wire SEL_DAT_deco;//k	
	wire SEL_C_deco;//k
	wire COMPARA_deco;//K
	wire SUMA_RESTA_deco;//k
	wire SALTO_deco;//k
	wire PROHIB_deco;//k
	
	wire [31:0] Instruccion;//k
	wire [31:0] Pcmas4_Fetch;//k
	
	wire [3:0]  OpCode;//k
	wire [1:0]  F;//k
	wire [31:0] Pcmas4_Deco_In; //k
	wire [3:0]  Rg_Fetch;//k
	wire [3:0]  Rp_Fetch;//k
	wire [3:0]  Rs_Fetch;//k
	wire [15:0] Inm;//k
	wire [23:0] Label;//k
	
	wire [1:0] cond_deco;//k
	wire [31:0] Pcmas4_Deco_OUT;//k
	wire [31:0] DoA_deco;//k
	wire [31:0] DoB_deco;//k
	wire [31:0] immediato_deco;//k
	wire [39:0]cuarenta_deco;//k
	wire [3:0] Rp_deco;//k
	wire [3:0] Rs_deco;//k
	wire [3:0] Rg_deco;//k

	wire [1:0] cond_exe;	//k
	
	wire WE_MEM_exe;
	wire sel_dat_exe;
	wire sel_c_exe;
	wire we_v_exe;
	
	
	
	
	 
	 
//---------------------------------Etapa fetch-------------------------------------
	
	Fetch fetch (
		//Entradas
		.sel_STO(), 	
		.clk(clk), 				
		.Direccion_de_Salto(), 
		//Salidas
		.Instruccion(Instruccion), 	
		.Pcmas4(Pcmas4_Fetch)			
	);	
	
//-----------------------------------------------------------------------------
	
	REG_IF_ID Pipe_Fetch_Decode (
		//entradas
		.clk(clk),  					
		.Instruction(Instruccion), 
		.Pcmas4_In(Pcmas4_Fetch), 	
		//salidas
		.Pcmas4(Pcmas4_Deco_In), 		
		.OpCode(OpCode), 	
		.Cond(cond_deco), 		
		.F(F), 				
		.Rg(Rg_Fetch), 	
		.Rp(Rp_Fetch), 	
		.Rs(Rs_Fetch), 	
		.Inm(Inm), 			
		.Label(Label) 		
	);	
	
//---------------------------------Etapa Decode-------------------------------------
		
	Decode decode (
	//Entradas
		//control
		.clk(clk),  				
		.sel_A(sel_A), 			
		.sel_C(sel_C), 			
		.sel_B(sel_B), 			
		.sel_ext(sel_ext), 		
		.WE_C(WE_C), 				
		.WE_V(WE_V), 				
		//datos
		.PCmas4_In(Pcmas4_Deco_In),
		.Rp(Rp_Fetch), 			
		.Rs(Rs_Fetch), 			
		.imm24(Label), 			
		.imm16(Inm), 				
		.Rg_In(Rg_Fetch), 		
		.Rg_WB(), 			
		.DinC(), 				
		.DinV_8bit(), 
	//Salidas
		.PCmas4_Out(Pcmas4_Deco_OUT),  
		.Rg_Out(Rg_deco), 
		.DoA(DoA_deco), 
		.DoB(DoB_deco), 
		.cuarenta(cuarenta_deco),  
		.immediato(immediato_deco),
		.Rp_out(Rp_deco),  
		.Rs_out(Rs_deco)   
	);	
	
	Control_Unit control_Unit (
		//Entradas
		.OpCode(OpCode), 		
		.F(F), 					
		//Salidas
		.SEL_A(sel_A), 		
		.SEL_B(sel_B), 		
		.SEL_EXT(sel_ext), 	
		.SELOP_B(), 
		.SELOP_A(), 
		.SEL_RES(), 
		.ALU_CTRL(), 
		.WE_MEM(), 
		.SEL_DAT(), 
		.SEL_C(SEL_C_deco), 
		.WE_C_AUX(WE_C_deco), 		
		.WE_V(WE_V_deco), 			
		.COMPARA(), 
		.SUMA_RESTA(), 
		.SALTO(), 
		.PROHIB()
	);	
//---------------------------------------------------------------------------------

	REG_DECO_EXE pipe_deco_exe (
	//Entradas
		//control
		.clk(clk), 			
		.cond_in(cond_deco), 	
		.we_mem_in(WE_MEM_deco), 
		.sel_dat_in(SEL_DAT_deco), 
		.sel_c_in(SEL_C_deco),  
		.we_v_in(WE_V_deco), 
		.compara_in(COMPARA_deco), 
		.we_c_aux_in(WE_C_deco), 
		.suma_resta_in(SUMA_RESTA_deco), 
		.salto_in(SALTO_deco), 
		.PROHIB(PROHIB_deco), 
		.sel_res_in(SEL_RES_deco), 
		.ALU_CTRL_in(ALU_CTRL_deco), 
		.selOp_A_in(SELOP_A_deco), 
		.selOp_B_in(SELOP_B_deco), 
		//datos
		.RP_exe_in(Rp_deco), 
		.RS_exe_in(Rs_deco), 
		.PCmas4_in(Pcmas4_Deco_OUT),
		.DoA_in(DoA_deco), 
		.DoB_in(DoB_deco), 
		.inmediato_in(immediato_deco), 
		.cuarenta_in(cuarenta_deco), 
		.Rg_exe_in(Rg_deco), 
	//Salidas
		.cond(cond_exe), 
		.we_mem(WE_MEM_exe), 
		.sel_dat(sel_dat_exe), 
		.sel_c(sel_c_exe), 
		.we_v(we_v_exe), 
		.compara(), 
		.we_c_aux(), 
		.suma_resta(), 
		.salto(), 
		.PROHIB_EXE(), 
		.sel_res(), 
		.ALU_CTRL(), 
		.selOp_A(), 
		.selOp_B(), 
		.RP_exe(), 
		.RS_exe(), 
		.PCmas4(), 
		.DoA(), 
		.DoB(), 
		.inmediato(), 
		.cuarenta(), 
		.Rg_exe()
	);	
//-------------------------------------Etapa EXE--------------------------------------------
 
	ConditionControl condition_control (
	//salidas
		.clk(clk),
		.Cond(cond_exe),
		.N_in(),
		.Z_in(),
		.WE_C_aux(),
		.suma_resta(),
		.salto(),
		.WE_flags(),
		//salidas
		.sel_pc(),
		.WE_C()
	
);
	
	Execution ejecucion(
		//entradas
		
		.sel_res(),
		.ALU_CTRL(),
		.selOp_A(),
		.selOp_B(),
		.PCmas4(),
		.DoA(),
		.DoB(),
		.immediato(),
		.adelantado(), //bus que tira la unidad de adelantamiento
		.cuarenta(),
		.Rg_input(),
		
		//salidas
		.Rg_output(),
		.DoB_byte(),
		.result(),
		.N(),
		.Z()
		
    );
	
	
//---------------------------------------------------------------------------------------	
	REG_EXE_MEM  pipe_exe_mem(
	//entradas
	.clk(clk),
	.we_mem_in(WE_MEM_exe),
	.sel_dat_in(sel_dat_exe),
	.sel_c_in(sel_c_exe),
	.sel_v_in(),
	.we_c_in(we_v_exe),
	.prohib_exe(),
	.result_in(),  //salida del mux
	.DoB_byte_in(),
	.Rg_exe(),

	//salidas
	.we_mem(),
	.sel_dat(),
	.sel_c(),
	.sel_v(),
	.we_c(),
	.prohib_mem(),
	.result(),  //salida del mux
	.DoB_byte(),
	.Rg_mem()
);

//------------------------------Etapa de memoria-----------------------------------------	
	Mem etapa_memoria(
		//entradas
		.clk(clk),
		.ALU_Result_In(),
		.Rs(),
		.WE_mem(),
		
		//salidas
		.Rg_In(),
		.Do(),
		.Dob(),
		.ALU_Result_Out,
		.Rg()
    );

//---------------------------------------------------------------------------------------	

	REG_MEM_WB   pipe_mem_wback(
	//entradas
		.clk(clk),
		.WE(),
		.SEL_DAT_In(),		
		.SEL_C_In(),
		.WE_V_In(),	
		.WE_C_In(),
		.PROHIB_MEM(),
		.Do_In(),
		.Dob_In(),
		.ALU_Result_In(),
		.Rg_In(),	
	//salidas
		.Do() ,
		.Dob() ,
		.ALU_Result(),
		.WE_C() ,
		.PROHIB_WB(),
		.WE_V() ,
		.SEL_C() ,
		.SEL_DAT(),
		.Rg() 
    );
	 
	 
//--------------------------------Etapa writeback---------------------------------------

	WriteBack etapa_wb(
    .Do(),
    .ALU_Result(),
    .Dob_In(),
    .Rg_In(),
    .sel_dat(),
	 .Rg(),
    .WriteBack_output(),
    .Dob()
    );	
	 
//----------------------------------------------------------------------------------------

	Unidad_de_Adelantamiento adelantamiento(
	//entradas
	.SelOp_A_exe(),
	.SelOp_B_exe(),
	.RG_mem(),
	.RG_wb(),
	.prohib_exe(),
	.prohib_wb(),
	.prohib_mem(),
	.RS_exe(),
	.RP_exe(),
	//salidas
	.sel_adel_opA(),
	.sel_adel_opB(),
	.SelOp_A(),
	.SelOp_B()
	
);




endmodule
