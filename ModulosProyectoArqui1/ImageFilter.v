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
	 
	wire sel_A;
	wire sel_B;
	wire sel_ext;
	wire WE_C_deco;
	wire WE_V_deco;	 
	wire [1:0] SELOP_B_deco;
	wire [1:0] SELOP_A_deco;
	wire SEL_RES_deco;
	wire [2:0] ALU_CTRL_deco;
	wire WE_MEM_deco;
	wire SEL_DAT_deco;	
	wire SEL_C_deco;
	wire COMPARA_deco;
	wire SUMA_RESTA_deco;
	wire SALTO_deco;
	wire PROHIB_deco;
	 
	 
	Control_Unit control_Unit (
		//Entradas
		.OpCode(OpCode), 		//-
		.F(F), 					//-
		//Salidas
		.SEL_A(sel_A), 		//-
		.SEL_B(sel_B), 		//-
		.SEL_EXT(sel_ext), 	//-
		.SELOP_B(SELOP_B_deco), 
		.SELOP_A(SELOP_A_deco), 
		.SEL_RES(SEL_RES_deco), 
		.ALU_CTRL(ALU_CTRL_deco), 
		.WE_MEM(WE_MEM_deco), 
		.SEL_DAT(SEL_DAT_deco), 
		.SEL_C(SEL_C_deco), 
		.WE_C_AUX(WE_C_deco), 		//-
		.WE_V(WE_V_deco), 			//-
		.COMPARA(COMPARA_deco), 
		.SUMA_RESTA(SUMA_RESTA_deco), 
		.SALTO(SALTO_deco), 
		.PROHIB(PROHIB_deco)
	);	 
	
	Fetch fetch (
		//Entradas
		.sel_STO(sel_STO), 	//
		.clk(clk), 				//-
		.Direccion_de_Salto(Direccion_de_Salto), //
		//Salidas
		.Instruccion(Instruccion), 	//-
		.Pcmas4(Pcmas4_Fetch)			//-
	);	
	
	wire [31:0] Instruction;
	wire [31:0] Pcmas4_Fetch;
	
	REG_IF_ID IF_ID (
		//entradas
		.clk(clk),  					//-
		.Instruction(Instruction), //-
		.Pcmas4_In(Pcmas4_Fetch), 	//-
		//salidas
		.Pcmas4(Pcmas4_Deco_In), 		//-
		.OpCode(OpCode), 	//-
		.Cond(cond), 		//-
		.F(F), 				//-
		.Rg(Rg_Fetch), 	//-
		.Rp(Rp_Fetch), 	//-
		.Rs(Rs_Fetch), 	//-
		.Inm(Inm), 			//-
		.Label(Label) 		//-
	);	
	
	wire [3:0]  OpCode;
	wire [1:0]  F;
	wire [31:0] Pcmas4_Deco_In;
	wire [3:0]  Rg_Fetch;
	wire [3:0]  Rp_Fetch;
	wire [3:0]  Rs_Fetch;
	wire [15:0] Inm;
	wire [23:0] Label;
		
	Decode decode (
	//Entradas
		//control
		.clk(clk),  				//-
		.sel_A(sel_A), 			//-
		.sel_C(sel_C), 			//-
		.sel_B(sel_B), 			//-
		.sel_ext(sel_ext), 		//-
		.WE_C(WE_C), 				//-
		.WE_V(WE_V), 				//-
		//datos
		.PCmas4_In(Pcmas4_Deco_In),//-
		.Rp(Rp_Fetch), 			//-
		.Rs(Rs_Fetch), 			//-
		.imm24(Label), 			//-
		.imm16(Inm), 				//-
		.Rg_In(Rg_Fetch), 		//-
		.Rg_WB(Rg_WB), 			//
		.DinC(DinC), 				//
		.DinV_8bit(DinV_8bit), 	//
	//Salidas
		.PCmas4_Out(Pcmas4_Deco_OUT),  //-
		.Rg_Out(Rg_deco), 
		.DoA(DoA_deco), //-
		.DoB(DoB_deco), //-
		.cuarenta(cuarenta_deco),  //-
		.immediato(immediato_deco), //-
		.Rp_out(Rp_deco),  //-
		.Rs_out(Rs_deco)   //-
	);	
	
	wire [1:0] cond_deco;
	wire [31:0] Pcmas4_Deco_OUT;
	wire [31:0] DoA_deco;
	wire [31:0] DoB_deco;
	wire [31:0] immediato_deco;
	wire [39:0]cuarenta_deco;
	wire [3:0] Rp_deco;
	wire [3:0] Rs_deco;	
	wire [3:0] Rg_deco;	
	
	REG_DECO_EXE uut (
	//Entradas
		//control
		.clk(clk), 			//-
		.cond_in(cond_deco), 	//-
		.we_mem_in(WE_MEM_deco), //-
		.sel_dat_in(SEL_DAT_deco), //-
		.sel_c_in(SEL_C_deco),  //-
		.we_v_in(WE_V_deco), //-
		.compara_in(COMPARA_deco), //-
		.we_c_aux_in(WE_C_deco), //-
		.suma_resta_in(SUMA_RESTA_deco), //-
		.salto_in(SALTO_deco), //-
		.PROHIB(PROHIB_deco), //-
		.sel_res_in(SEL_RES_deco), //-
		.ALU_CTRL_in(ALU_CTRL_deco), //_
		.selOp_A_in(SELOP_A_deco), //-
		.selOp_B_in(SELOP_B_deco), //-
		//datos
		.RP_exe_in(Rp_deco), //-
		.RS_exe_in(Rs_deco), //-
		.PCmas4_in(Pcmas4_Deco_OUT),//- 
		.DoA_in(DoA_deco), //-
		.DoB_in(DoB_deco), //-
		.inmediato_in(immediato_deco), //-
		.cuarenta_in(cuarenta_deco), //-
		.Rg_exe_in(Rg_deco), //-
	//Salidas
		.cond(cond_exe), //-
		.we_mem(we_mem), 
		.sel_dat(sel_dat), 
		.sel_c(sel_c), 
		.we_v(we_v), 
		.compara(compara), 
		.we_c_aux(we_c_aux), 
		.suma_resta(suma_resta), 
		.salto(salto), 
		.PROHIB_EXE(PROHIB_EXE), 
		.sel_res(sel_res), 
		.ALU_CTRL(ALU_CTRL), 
		.selOp_A(selOp_A), 
		.selOp_B(selOp_B), 
		.RP_exe(RP_exe), 
		.RS_exe(RS_exe), 
		.PCmas4(PCmas4), 
		.DoA(DoA), 
		.DoB(DoB), 
		.inmediato(inmediato), 
		.cuarenta(cuarenta), 
		.Rg_exe(Rg_exe)
	);	
	
	wire [1:0] cond_exe;
	


endmodule
