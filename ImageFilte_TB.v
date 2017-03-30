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
	wire [31:0] salida_OP_sel_a;
	wire [31:0] salida_OP_sel_b;
	wire [31:0] salida_Rp;
	wire [31:0] salida_Rs;
	wire [31:0] salida_WE_C_wb;
	wire [31:0] salida_Rg_wb;
	wire [31:0] salida_Rg_deco;
	wire [31:0] salida_Rg_exe;
	wire [31:0] salida_Rg_mem;
	wire [31:0] salida_DinC_wb;
	wire [31:0] salida_result_exe;

	// Instantiate the Unit Under Test (UUT)
	ImageFilter uut (
		.clk(clk), 
		.salidaDoa(salidaDoa),
		.salidaDob(salidaDob),
		.salida_OP(salida_OP),
		.salida_sel_ext(salida_sel_ext),
		.salida_OP_sel_a(salida_OP_sel_a),
		.salida_OP_sel_b(salida_OP_sel_b),			
		.salida_Rp(salida_Rp),			
		.salida_Rs(salida_Rs),
		.salida_Rg_wb(salida_Rg_wb),
		.salida_WE_C_wb(salida_WE_C_wb),
		.salida_Rg_deco(salida_Rg_deco),
		.salida_Rg_exe(salida_Rg_exe),
		.salida_Rg_mem(salida_Rg_mem),
		.salida_DinC_wb(salida_DinC_wb),
		.salida_result_exe(salida_result_exe)
		
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
        
		// Add stimulus here

	end
      
endmodule

