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
	 input wire [18:0] vgaAddress,
	 output wire [7:0] ImageData
    /**output wire [31:0] salidaDoa,
    output wire [31:0] salidaDob,
	 output wire [31:0] salida_OP,
	 output wire [31:0] salida_sel_ext,
	 output wire [31:0] salida_sel_a,
	 output wire [31:0] salida_sel_b,
	 output wire [31:0] salida_Rp,
	 output wire [31:0] salida_Rs,
	 output wire [31:0] salida_WE_C_wb,
	 output wire [31:0] salida_WE_C_aux_deco,
	 output wire [31:0] salida_Rg_wb,
	 output wire [31:0] salida_Rg_deco,
	 output wire [31:0] salida_Rg_exe,
	 output wire [31:0] salida_Rg_mem,
	 output wire [31:0] salida_DinC_wb,
	 output wire [31:0] salida_result_exe,
	 output wire [31:0] salida_Instruccion,
	 output wire [31:0] salida_SELOP_A,
	 output wire [31:0] salida_SELOP_B,
	 output wire [31:0] salida_SELOP_A_deco,
	 output wire [31:0] salida_SELOP_B_deco,
	 output wire [31:0] salida_DoA_exe,
	 output wire [31:0] salida_DoB_exe,
	 output wire [31:0] salida_PROHIB_mem,
	 output wire [31:0] salida_PROHIB_wb,
	 output wire [31:0] salida_immediato_deco,
	 output wire [31:0] salida_ALU_result_wb,
	 output wire [31:0] salida_SEL_DAT_deco,
	 output wire [31:0] salida_sel_c_wb,
	 output wire  salida_N,
	 output wire  salida_Z,
	 output wire  salida_WE_V_wb,
	 output wire [31:0] salida_ALU_result_mem,
	 output wire [31:0] salida_Do_mem,
	 output wire [31:0] salida_Dob_mem,
	 output wire [31:0] salida_DoB8_wb,
	 output wire [31:0] salida_cuarenta_exe,
	 output wire [31:0] salida_cuarenta_deco,
	 output wire [31:0] salida_DinBbyte_mem,
	 output wire [31:0] salida_sel_pc,
	 output wire [31:0] salida_COMPARA_deco,
	 output wire [31:0] salida_cond_deco,
	 output wire [31:0] salida_cond_exe**/
    );
	 	
	wire [31:0] Instruccion;
	wire [31:0] Pcmas4_Fetch;
	wire [31:0] result_exe;
	wire sel_pc;
	wire [31:0] Pcmas4_deco;
	wire [3:0]  OpCode;
	wire [1:0] cond_deco;
	wire [1:0]  F;
	wire [3:0]  Rg_deco;
	wire [3:0]  Rp_deco;
	wire [3:0]  Rs_deco;
	wire [15:0] Inm_deco;
	wire [23:0] Label_deco;
	wire [3:0]  Rg_wb;
	wire sel_A; 
	wire sel_B; 
	wire sel_ext;
	wire sel_c_wb;
	wire WE_C_wb;
	wire WE_V_wb; 
	wire WE_C_aux_deco;
	wire WE_V_deco; 
	wire SEL_C_deco;
	wire SEL_DAT_deco;
	wire WE_MEM_deco;
	wire PROHIB_deco;
	wire COMPARA_deco;
	wire SEL_RES_deco;
	wire [2:0] ALU_CTRL_deco;
	wire [1:0] SELOP_B_deco; 
	wire [1:0] SELOP_A_deco;  
	wire [1:0] cond_exe;	
	wire SUMA_RESTA_deco;
	wire SALTO_deco;
	wire [31:0] DoA_deco;
	wire [31:0] DoB_deco;
	wire [31:0] immediato_deco;
	wire [39:0]cuarenta_deco;
	wire WE_MEM_exe;
	wire sel_dat_exe;
	wire sel_c_exe;
	wire we_v_exe;
	wire WE_flags;
	wire WE_C_aux_exe;
	wire suma_resta_exe;
	wire salto_exe;
	wire PROHIB_exe;
	wire WE_C_exe;
	wire sel_res_exe;
	wire [2:0] ALU_CTRL_exe;
	wire [1:0] SELOP_B_exe; 
	wire [1:0] SELOP_A_exe; 
	wire [1:0] SELOP_B; 
	wire [1:0] SELOP_A; 
	wire [3:0]  Rp_exe;
	wire [3:0]  Rs_exe;
	wire [31:0] Pcmas4_exe;
	wire [31:0] DoA_exe;
	wire [31:0] DoB_exe;
	wire [39:0]cuarenta_exe;
	wire [3:0]  Rg_exe;
	wire N, Z;
	wire [7:0]DoBbyte_exe;
	wire [31:0] immediato_exe;
	wire [31:0]adelantadoA;
	wire [31:0]adelantadoB;
	wire [31:0] DinC_wb;
	wire [7:0] DoB8_wb;
	wire WE_mem_mem;
	wire sel_dat_mem;
	wire sel_c_mem;
	wire we_v_mem;
	wire we_c_mem;
	wire PROHIB_mem;
	wire [31:0]ALU_result_mem;
	wire [7:0]DinBbyte_mem; //byte de entrada
	wire [7:0]Dob_mem; //byte de salida
	wire [31:0]Do_mem; //palabra de salida
	wire [3:0]  Rg_mem;
	wire PROHIB_wb;
	wire sel_adel_opA;
	wire sel_adel_opB;
	wire sel_dat_wb;
	wire [7:0]Dob_wb; //byte de salida
	wire [31:0]Do_wb; //palabra de salida
	wire [31:0]ALU_result_wb;

	
	 
	 
//---------------------------------Etapa fetch-------------------------------------
	
	Fetch fetch (
		//Entradas
		.sel_STO(sel_pc), 	
		.clk(clk), 				
		.Direccion_de_Salto(result_exe), 
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
		.Pcmas4(Pcmas4_deco), 		
		.OpCode(OpCode), 	
		.Cond(cond_deco), 		
		.F(F), 				
		.Rg(Rg_deco), 	
		.Rp(Rp_deco), 	
		.Rs(Rs_deco), 	
		.Inm(Inm_deco), 			
		.Label(Label_deco) 		
	);	
	
//---------------------------------Etapa Decode-------------------------------------
		
	Decode decode(
		//control
		.clk(clk),
		.sel_A(sel_A),
		.sel_C(sel_c_wb),
		.sel_B(sel_B),
		.sel_ext(sel_ext),
		.WE_C(WE_C_wb),
		.WE_V(WE_V_wb),
		//datos
		.Rp(Rp_deco),
		.Rs(Rs_deco),
		.imm24(Label_deco),
		.imm16(Inm_deco),
		.Rg_WB(Rg_wb),
		.DinC(DinC_wb),
		.DinV_8bit(DoB8_wb),
		//salidas
		.DoA(DoA_deco),
		.DoB(DoB_deco),
		.cuarenta(cuarenta_deco),
		.immediato(immediato_deco)
    );
	
	Control_Unit control_Unit (
		//Entradas
		.OpCode(OpCode), 		
		.F(F), 					
		//Salidas
		.SEL_A(sel_A), 		
		.SEL_B(sel_B), 		
		.SEL_EXT(sel_ext), 	
		.SELOP_B(SELOP_B_deco), 
		.SELOP_A(SELOP_A_deco), 
		.SEL_RES(SEL_RES_deco), 
		.ALU_CTRL(ALU_CTRL_deco), 
		.WE_MEM(WE_MEM_deco), 
		.SEL_DAT(SEL_DAT_deco), 
		.SEL_C(SEL_C_deco), 
		.WE_C_AUX(WE_C_aux_deco), 		
		.WE_V(WE_V_deco), 			
		.COMPARA(COMPARA_deco), 
		.SUMA_RESTA(SUMA_RESTA_deco), 
		.SALTO(SALTO_deco), 
		.PROHIB(PROHIB_deco)
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
		.we_c_aux_in(WE_C_aux_deco), 
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
		.PCmas4_in(Pcmas4_deco),
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
		.compara(WE_flags), 
		.we_c_aux(WE_C_aux_exe), 
		.suma_resta(suma_resta_exe), 
		.salto(salto_exe), 
		.PROHIB_EXE(PROHIB_exe), 
		.sel_res(sel_res_exe), 
		.ALU_CTRL(ALU_CTRL_exe), 
		.selOp_A(SELOP_A_exe), 
		.selOp_B(SELOP_B_exe), 
		.RP_exe(Rp_exe), 
		.RS_exe(Rs_exe), 
		.PCmas4(Pcmas4_exe), 
		.DoA(DoA_exe), 
		.DoB(DoB_exe), 
		.inmediato(immediato_exe), 
		.cuarenta(cuarenta_exe), 
		.Rg_exe(Rg_exe)
	);	
//-------------------------------------Etapa EXE--------------------------------------------
 
	ConditionControl condition_control (
	//salidas
		.clk(clk),
		.Cond(cond_exe),
		.N_in(N),
		.Z_in(Z),
		.WE_C_aux(WE_C_aux_exe),
		.suma_resta(suma_resta_exe),
		.salto(salto_exe),
		.WE_flags(WE_flags),
		//salidas
		.sel_pc(sel_pc),
		.WE_C(WE_C_exe)
	
);
	
	Execution ejecucion(
		//entradas
		.sel_res(sel_res_exe),
		.ALU_CTRL(ALU_CTRL_exe),
		.selOp_A(SELOP_A),
		.selOp_B(SELOP_B),
		.PCmas4(Pcmas4_exe),
		.DoA(DoA_exe),
		.DoB(DoB_exe),
		.immediato(immediato_exe),
		.adelantadoA(adelantadoA), //bus que tira la unidad de adelantamiento
		.adelantadoB(adelantadoB), //bus que tira la unidad de adelantamiento
		.cuarenta(cuarenta_exe),
		//salidas
		.DoB_byte(DoBbyte_exe),
		.result(result_exe),
		.N(N),
		.Z(Z)
		
    );
	
	
//---------------------------------------------------------------------------------------	
	REG_EXE_MEM  pipe_exe_mem(
	//entradas
	.clk(clk),
	.we_mem_in(WE_MEM_exe),
	.sel_dat_in(sel_dat_exe),
	.sel_c_in(sel_c_exe),
	.we_v_in(we_v_exe),
	.we_c_in(WE_C_exe),
	.prohib_exe(PROHIB_exe),
	.result_in(result_exe),  //salida del mux
	.DoB_byte_in(DoBbyte_exe),
	.Rg_exe(Rg_exe),

	//salidas
	.we_mem(WE_mem_mem),
	.sel_dat(sel_dat_mem),
	.sel_c(sel_c_mem),
	.we_v(we_v_mem),
	.we_c(we_c_mem),
	.prohib_mem(PROHIB_mem),
	.result(ALU_result_mem),  //salida del mux
	.DoB_byte(DinBbyte_mem),
	.Rg_mem(Rg_mem)
);

//------------------------------Etapa de memoria-----------------------------------------	
	Mem etapa_memoria(
		//entradas
		.clk(clk),
		.ALU_Result_In(ALU_result_mem),
		.Rs(DinBbyte_mem),
		.WE_mem(WE_mem_mem),
		.vgaAdress(vgaAdress),
		//salidas
		.Do(Do_mem),
		.Dob(Dob_mem),
		.ImageData(ImageData)
    );

//---------------------------------------------------------------------------------------	

	REG_MEM_WB   pipe_mem_wback(
	//entradas
		.clk(clk),
		.SEL_DAT_In(sel_dat_mem),		
		.SEL_C_In(sel_c_mem),
		.WE_V_In(we_v_mem),	
		.WE_C_In(we_c_mem),
		.PROHIB_MEM(PROHIB_mem),
		.Do_In(Do_mem),
		.Dob_In(Dob_mem),
		.ALU_Result_In(ALU_result_mem),
		.Rg_In(Rg_mem),	
	//salidas
		.Do(Do_wb) ,
		.Dob(Dob_wb) ,
		.ALU_Result(ALU_result_wb),
		.WE_C(WE_C_wb) ,
		.PROHIB_WB(PROHIB_wb),
		.WE_V(WE_V_wb) ,
		.SEL_C(sel_c_wb) ,
		.SEL_DAT(sel_dat_wb),
		.Rg(Rg_wb) 
    );
	 
	 
//--------------------------------Etapa writeback---------------------------------------

	WriteBack etapa_wb(
    .Do(Do_wb),
    .ALU_Result(ALU_result_wb),
    .Dob_In(Dob_wb),
    .sel_dat(sel_dat_wb),
	 //salidas
    .WriteBack_output(DinC_wb),
    .Dob(DoB8_wb)
    );	
	 
//----------------------------------------------------------------------------------------

	Unidad_de_Adelantamiento adelantamiento(
	//entradas
	.SelOp_A_exe(SELOP_A_exe),
	.SelOp_B_exe(SELOP_B_exe),
	.RG_mem(Rg_mem),
	.RG_wb(Rg_wb),
	.prohib_exe(PROHIB_exe),
	.prohib_wb(PROHIB_wb),
	.prohib_mem(PROHIB_mem),
	.RS_exe(Rs_exe),
	.RP_exe(Rp_exe),
	//salidas
	.sel_adel_opA(sel_adel_opA),
	.sel_adel_opB(sel_adel_opB),
	.SelOp_A(SELOP_A),
	.SelOp_B(SELOP_B)
	
);

	Mux mux_adelantaA(
    .A(ALU_result_mem),		//Entrada 0 de 32 bits
    .B(ALU_result_wb),		//Entrada 1 de 32 bits
    .S(sel_adel_opA),				//Entrada de seleccion de 1 bit
    .Y(adelantadoA)	//Salida de data seleccionada de 32 bits
    );

	Mux mux_adelantaB(
    .A(ALU_result_mem),		//Entrada 0 de 32 bits
    .B(ALU_result_wb),		//Entrada 1 de 32 bits
    .S(sel_adel_opB),				//Entrada de seleccion de 1 bit
    .Y(adelantadoB)	//Salida de data seleccionada de 32 bits
    );
	 
	 
	/**assign salidaDoa = DoA_deco;
	assign salidaDob = DoB_deco;
	assign salida_OP = OpCode;
	assign salida_sel_ext  = sel_ext;
	assign salida_sel_a = sel_A;
	assign salida_sel_b = sel_B;	
	assign salida_Rp = Rp_deco;	
	assign salida_Rs = Rs_deco;	
	assign salida_WE_C_wb = WE_C_wb;	
	assign salida_Rg_wb = Rg_wb;	
	assign salida_Rg_deco = Rg_deco;	
	assign salida_Rg_exe = Rg_exe;	
	assign salida_Rg_mem = Rg_mem;	
	assign salida_DinC_wb = DinC_wb;	
	assign salida_result_exe = result_exe;	
	assign salida_Instruccion = Instruccion;	
	assign salida_SELOP_A = SELOP_A;	
	assign salida_SELOP_B = SELOP_B;	
	assign salida_SELOP_A_deco = SELOP_A_deco;	
	assign salida_SELOP_B_deco = SELOP_B_deco;	
	assign salida_DoA_exe = DoA_exe;	
	assign salida_DoB_exe = DoB_exe;	
	assign salida_PROHIB_mem = PROHIB_mem;	
	assign salida_PROHIB_wb = PROHIB_wb;	
	assign salida_immediato_deco = immediato_deco;	
	assign salida_ALU_result_wb = ALU_result_wb;	
	assign salida_SEL_DAT_deco = SEL_DAT_deco;	
	assign salida_sel_c_wb = sel_c_wb;	
	assign salida_N = N;	
	assign salida_Z = Z;
	assign salida_WE_V_wb = WE_V_wb;
	assign salida_Do_mem = Do_mem;
	assign salida_Dob_mem = Dob_mem;
	assign salida_ALU_result_mem = ALU_result_mem;
	assign salida_DoB8_wb = DoB8_wb;
	assign salida_cuarenta_exe = cuarenta_exe;
	assign salida_DinBbyte_mem = DinBbyte_mem;
	assign salida_sel_pc = sel_pc;
	assign salida_WE_C_aux_deco = WE_C_aux_deco;
	assign salida_COMPARA_deco = COMPARA_deco;
	assign salida_cond_deco = cond_deco;
	assign salida_cond_exe = cond_exe;**/
	
endmodule
