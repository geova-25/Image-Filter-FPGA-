`timescale 1ns / 1ps

////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer:
//
// Create Date:   07:01:18 03/30/2017
// Design Name:   ImageFilter
// Module Name:   C:/Users/Giovanni/Documents/GitHub/Image-Filter-FPGA-/ImageFilte_TB.v
// Project Name:  Image-Filter
// Target Device:  
// Tool versions:  
// Description: 
//
// Verilog Test Fixture created by ISE for module: ImageFilter
//
// Dependencies:
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
////////////////////////////////////////////////////////////////////////////////

module ImageFilte_TB;

	// Inputs
	reg clk;

	// Outputs
	wire [31:0] salidaDoa;
	wire [31:0] salidaDob;
	wire [31:0] salida_OP;
	wire [31:0] salida_sel_ext;
	wire [31:0] salida_Rp;
	wire [31:0] salida_Rs;
	wire [31:0] salida_WE_C_wb;
	wire [31:0] salida_Rg_wb;
	wire [31:0] salida_Rg_deco;
	wire [31:0] salida_Rg_exe;
	wire [31:0] salida_Rg_mem;
	wire [31:0] salida_DinC_wb;
	wire [31:0] salida_result_exe;
	wire [31:0] salida_Instruccion;
	wire [31:0] salida_SELOP_A;
	wire [31:0] salida_SELOP_B;
	wire [31:0] salida_SELOP_A_deco;
	wire [31:0] salida_SELOP_B_deco;
	wire [31:0] salida_DoA_exe;
	wire [31:0] salida_DoB_exe;
	wire [31:0] salida_PROHIB_mem;
	wire [31:0] salida_PROHIB_wb;
	wire [31:0] salida_immediato_deco;
	wire [31:0] salida_ALU_result_wb;
	wire [31:0] salida_SEL_DAT_deco;
	wire [31:0] salida_sel_c_wb;

	// Instantiate the Unit Under Test (UUT)
	ImageFilter uut (
		.clk(clk), 
		.salidaDoa(salidaDoa),
		.salidaDob(salidaDob),
		.salida_OP(salida_OP),
		.salida_sel_ext(salida_sel_ext),
		.salida_sel_a(salida_sel_a),
		.salida_sel_b(salida_sel_b),			
		.salida_Rp(salida_Rp),			
		.salida_Rs(salida_Rs),
		.salida_Rg_wb(salida_Rg_wb),
		.salida_WE_C_wb(salida_WE_C_wb),
		.salida_Rg_deco(salida_Rg_deco),
		.salida_Rg_exe(salida_Rg_exe),
		.salida_Rg_mem(salida_Rg_mem),
		.salida_DinC_wb(salida_DinC_wb),
		.salida_result_exe(salida_result_exe),
		.salida_Instruccion(salida_Instruccion),
		.salida_SELOP_A(salida_SELOP_A),
		.salida_SELOP_B(salida_SELOP_B),
		.salida_SELOP_A_deco(salida_SELOP_A_deco),
		.salida_SELOP_B_deco(salida_SELOP_B_deco),
		.salida_DoA_exe(salida_DoA_exe),
		.salida_DoB_exe(salida_DoB_exe),
		.salida_PROHIB_mem(salida_PROHIB_mem),
		.salida_PROHIB_wb(salida_PROHIB_wb),
		.salida_immediato_deco(salida_immediato_deco),
		.salida_ALU_result_wb(salida_ALU_result_wb),
		.salida_SEL_DAT_deco(salida_SEL_DAT_deco),
		.salida_sel_c_wb(salida_sel_c_wb)
		
	);

	initial begin
		// Initialize Inputs	

		
		clk = 0;		
		#200;
		clk = 1;
		#200;		
		clk = 0;
		#200;		
		clk = 1;
		#200;		
		clk = 0;		
		#200;
		clk = 1;
		#200;		
		clk = 0;
		#200;		
		clk = 1;
		#200;		
		clk = 0;	
		#200;
		clk = 1;
		#200;		
		clk = 0;
		#200;		
		clk = 1;
		#200;		
		clk = 0;			
		#200;
		clk = 1;
		#200;		
		clk = 0;
		#200;		
		clk = 1;
		#200;		
		clk = 0;	
		#200;
		clk = 1;
		#200;		
		clk = 0;
		#200;		
		clk = 1;
		#200;		
		clk = 0;			
		clk = 1;
		#200;		
		clk = 0;
		#200;		
		clk = 1;
		#200;		
		clk = 0;	
		#200;
		clk = 1;
		#200;		
		clk = 0;
		#200;		
		clk = 1;
		#200;		
		clk = 0;				
        
		// Add stimulus here

	end
      
endmodule

