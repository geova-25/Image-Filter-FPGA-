`timescale 1ns / 1ps

////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer:
//
// Create Date:   06:55:49 03/25/2017
// Design Name:   WriteBack
// Module Name:   C:/Users/Giovanni/Documents/GitHub/Image-Filter-FPGA-/ModulosProyectoArqui1/WriteBack_TB.v
// Project Name:  Image-Filter
// Target Device:  
// Tool versions:  
// Description: 
//
// Verilog Test Fixture created by ISE for module: WriteBack
//
// Dependencies:
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
////////////////////////////////////////////////////////////////////////////////

module WriteBack_TB;

	// Inputs
	reg [31:0] Do;
	reg [31:0] ALU_Result;
	reg [7:0] Dob_In;
	reg [3:0] Rg_In;
	reg sel_dat;

	// Outputs
	wire [3:0] Rg;
	wire [31:0] WriteBack_output;
	wire [7:0] Dob;

	// Instantiate the Unit Under Test (UUT)
	WriteBack uut (
		.Do(Do), 
		.ALU_Result(ALU_Result), 
		.Dob_In(Dob_In), 
		.Rg_In(Rg_In), 
		.sel_dat(sel_dat), 
		.Rg(Rg), 
		.WriteBack_output(WriteBack_output), 
		.Dob(Dob)
	);

	initial begin
		// Initialize Inputs
		Do = 0;
		ALU_Result = 0;
		Dob_In = 0;
		Rg_In = 0;
		sel_dat = 0;

		#100;
        
	//------------------------------ Select1
		#100;
		Do = 32'hea4;
		ALU_Result = 32'h1245;
		Dob_In = 3;
		Rg_In = 4;
		sel_dat = 0;	
	//----------- Select 1.1
		#100;
		Do = 32'hea4;
		ALU_Result = 32'h1245;
		Dob_In = 3;
		Rg_In = 4;
		sel_dat = 1;			
	//------------------------------ Select2
		#100;
		Do = 32'hbbb;
		ALU_Result = 32'h555;
		Dob_In = 69;
		Rg_In = 88;
		sel_dat = 0;	
	//----------- Select 2.1
		#100;
		Do = 32'hbbb;
		ALU_Result = 32'h555;
		Dob_In = 69;
		Rg_In = 88;
		sel_dat = 1;		
	end
      
endmodule

