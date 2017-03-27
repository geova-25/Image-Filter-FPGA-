`timescale 1ns / 1ps

////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer:
//
// Create Date:   15:05:08 03/25/2017
// Design Name:   REG_MEM_WB
// Module Name:   C:/Users/Giovanni/Documents/GitHub/Image-Filter-FPGA-/ModulosProyectoArqui1/REG_MEM_WB_TB.v
// Project Name:  Image-Filter
// Target Device:  
// Tool versions:  
// Description: 
//
// Verilog Test Fixture created by ISE for module: REG_MEM_WB
//
// Dependencies:
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
////////////////////////////////////////////////////////////////////////////////

module REG_MEM_WB_TB;

	// Inputs
	reg clk;
	reg WE;
	reg SEL_DAT_In;
	reg SEL_C_In;
	reg WE_V_In;
	reg WE_C_In;
	reg SEL_STO_In;
	reg [31:0] Do_In;
	reg [7:0] Dob_In;
	reg [31:0] ALU_Result_In;
	reg [3:0] Rg_In;

	// Outputs
	wire [31:0] Do;
	wire [7:0] Dob;
	wire [31:0] ALU_Result;
	wire WE_C;
	wire WE_V;
	wire SEL_C;
	wire SEL_DAT;
	wire SEL_STO;
	wire [3:0] Rg;

	// Instantiate the Unit Under Test (UUT)
	REG_MEM_WB uut (
		.clk(clk), 
		.WE(WE), 
		.SEL_DAT_In(SEL_DAT_In), 
		.SEL_C_In(SEL_C_In), 
		.WE_V_In(WE_V_In), 
		.WE_C_In(WE_C_In), 
		.Do_In(Do_In), 
		.Dob_In(Dob_In), 
		.ALU_Result_In(ALU_Result_In), 
		.Rg_In(Rg_In), 
		.Do(Do), 
		.Dob(Dob), 
		.ALU_Result(ALU_Result), 
		.WE_C(WE_C), 
		.WE_V(WE_V), 
		.SEL_C(SEL_C), 
		.SEL_DAT(SEL_DAT), 
		.Rg(Rg)
	);

	initial begin
		// Initialize Inputs
		clk = 0;
		WE = 1;
		SEL_DAT_In = 0;
		SEL_C_In = 0;
		WE_V_In = 0;
		WE_C_In = 0;
		Do_In = 0;
		Dob_In = 0;
		ALU_Result_In = 0;
		Rg_In = 0;

		//----------------------------------- Prueba 1
		#100;
		clk = 1;
		#10		
		WE = 0;
		SEL_DAT_In = 1;
		SEL_C_In = 0;
		WE_V_In = 1;
		WE_C_In = 0;
		Do_In = 32'hEAB3321;
		Dob_In = 8'h12;
		ALU_Result_In = 32'hEEEEEEEE;
		Rg_In = 4'h5;

		#100;
		clk = 0;	
		WE = 0;
		SEL_DAT_In = 1;
		SEL_C_In = 0;
		WE_V_In = 1;
		WE_C_In = 0;
		Do_In = 32'hEAB3321;
		Dob_In = 8'h12;
		ALU_Result_In = 32'hEEEEEEEE;
		Rg_In = 4'h5;
		
		//----------------------------------- Prueba 2
		#100;
		clk = 1;
		#10		
		WE = 0;
		SEL_DAT_In = 1;
		SEL_C_In = 1;
		WE_V_In = 1;
		WE_C_In = 1;
		Do_In = 32'h1111111;
		Dob_In = 8'h11;
		ALU_Result_In = 32'h22222222;
		Rg_In = 4'h3;

		#100;
		clk = 1;
		WE = 0;
		SEL_DAT_In = 1;
		SEL_C_In = 1;
		WE_V_In = 1;
		WE_C_In = 1;
		Do_In = 32'h1111111;
		Dob_In = 8'h11;
		ALU_Result_In = 32'h22222222;
		Rg_In = 4'h3;
				        

	end
      
endmodule

