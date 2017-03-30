`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    07:56:24 03/25/2017 
// Design Name: 
// Module Name:    REG_MEM_WB 
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
module REG_MEM_WB(
		input clk,
		input SEL_DAT_In,		
		input SEL_C_In,
		input WE_V_In,	
		input WE_C_In,
		input PROHIB_MEM,
		input [31:0] Do_In,
		input [7:0] Dob_In,
		input [31:0] ALU_Result_In,
		input [3:0] Rg_In,	
		
		output  wire [31:0] Do ,
		output  wire [7:0] Dob ,
		output  wire [31:0] ALU_Result,
		output  wire WE_C ,
		output  wire PROHIB_WB,
		output  wire WE_V ,
		output  wire SEL_C ,
		output  wire SEL_DAT,
		output  wire [3:0] Rg 
    );
	 
	reg [31:0] DoReg = 32'b0;
	reg [7:0] DobReg = 8'b0;
	reg [31:0] ALU_ResultReg = 32'b0;
	reg WE_CReg = 1'b0;
	reg PROHIB_REG = 1'b0;
	reg WE_VReg = 1'b0;
	reg SEL_CReg = 1'b0;
	reg SEL_DATReg = 1'b0;
	reg Rg_inReg = 4'b0;
	 
	always @(posedge clk)
	begin
		DoReg = Do_In;
		DobReg = Dob_In;
		ALU_ResultReg = ALU_Result_In;
		WE_CReg = WE_C_In;
		WE_VReg = WE_V_In;
		SEL_CReg = SEL_C_In;
		SEL_DATReg = SEL_DAT_In;	
		PROHIB_REG= PROHIB_MEM;
		Rg_inReg = Rg_In;
	end
	
	assign Do = DoReg;
	assign Dob = DobReg;
	assign ALU_Result = ALU_ResultReg;
	assign WE_C = WE_CReg;
	assign WE_V = WE_VReg;
	assign SEL_C = SEL_CReg;
	assign SEL_DAT = SEL_DATReg;
	assign Rg = Rg_inReg;
	assign PROHIB_WB = PROHIB_REG ;

endmodule
