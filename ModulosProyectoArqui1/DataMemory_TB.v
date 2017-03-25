`timescale 1ns / 1ps

////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer:
//
// Create Date:   00:02:11 03/25/2017
// Design Name:   DataMemory
// Module Name:   C:/Users/Giovanni/Documents/GitHub/Image-Filter-FPGA-/ModulosProyectoArqui1/DataMemory_TB.v
// Project Name:  Image-Filter
// Target Device:  
// Tool versions:  
// Description: 
//
// Verilog Test Fixture created by ISE for module: DataMemory
//
// Dependencies:
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
////////////////////////////////////////////////////////////////////////////////

module DataMemory_TB;

	// Inputs
	reg WE;
	reg clk;
	reg [31:0] A;
	reg [31:0] B;
	reg [7:0] Din;

	// Outputs
	wire [31:0] Do;
	wire [7:0] Dob;

	// Instantiate the Unit Under Test (UUT)
	DataMemory uut (
		.WE(WE), 
		.clk(clk), 
		.A(A), 
		.B(B), 
		.Din(Din), 
		.Do(Do), 
		.Dob(Dob)
	);

	initial begin
		//Inicializados
		WE = 1;
		clk = 0;
		A = 0;
		B = 0;
		Din = 0;		
		#100		
		
		//---------------------------------------------------------------------------Testeo de lectura
		//-------------------------------------------- Lee M				
		/**
		WE = 1;
		clk = 1;
		A = 0;
		B = 0;
		Din = 0;

		#100;
		WE = 1;
		clk = 0;
		A = 0;
		B = 0;
		Din = 0;		
		//-------------------------------------------- Lee N
		#100;
		WE = 1;
		clk = 1;
		A = 4;
		B = 0;
		Din = 0;		
	
		#100;
		WE = 1;
		clk = 0;
		A = 4;
		B = 0;
		Din = 0;		
		//-------------------------------------------- Lee Mascara1
		#100;
		WE = 1;
		clk = 1;
		A = 8;
		B = 0;
		Din = 0;				

		#100;
		WE = 1;
		clk = 0;
		A = 8;
		B = 0;
		Din = 0;		
		//-------------------------------------------- Lee Mascara2
		#100;
		WE = 1;
		clk = 1;
		A = 12;
		B = 0;
		Din = 0;						

		#100;
		WE = 1;
		clk = 0;
		A = 12;
		B = 0;
		Din = 0;								
		//-------------------------------------------- Lee Mascara3
		#100;
		WE = 1;
		clk = 1;
		A = 16;
		B = 0;
		Din = 0;						

		#100;
		WE = 1;
		clk = 0;
		A = 16;
		B = 0;
		Din = 0;	        
		//-------------------------------------------- Lee Mascara4
		#100;
		WE = 1;
		clk = 1;
		A = 20;
		B = 0;
		Din = 0;						

		#100;
		WE = 1;
		clk = 0;
		A = 20;
		B = 0;
		Din = 0;			
		**/
		// Add stimulus here
		/**
		
		//---------------------------------------------------------------------------Testeo de escritura		
		//-------------------------------------------- Lee en 20
		#100;
		WE = 1;
		clk = 1;
		A = 20;
		B = 24;
		Din = 8'hEF;						

		#100;
		WE = 1;
		clk = 0;
		A = 20;
		B = 24;
		Din = 0;			

		//-------------------------------------------- Escribe FF en 20
		#100;
		WE = 0;
		clk = 1;
		A = 20;
		B = 24;
		Din = 8'hEF;						

		#100;
		WE = 0;
		clk = 0;
		A = 20;
		B = 24;
		Din = 0;					
		
		//-------------------------------------------- Lee 20
		#100;
		WE = 1;
		clk = 1;
		A = 20;
		B = 24;
		Din = 8'hFF;						

		#100;
		WE = 1;
		clk = 0;
		A = 20;
		B = 24;
		Din = 0;	
		//-------------------------------------------- LEE  en 04
		#100;
		WE = 1;
		clk = 1;
		A = 4;
		B = 8;
		Din = 8'hFF;						

		#100;
		WE = 1;
		clk = 0;
		A = 4;
		B = 8;
		Din = 0;			
		//-------------------------------------------- Escribe  en 04
		#100;
		WE = 0;
		clk = 1;
		A = 4;
		B = 8;
		Din = 8'hFF;						

		#100;
		WE = 0;
		clk = 0;
		A = 4;
		B = 8;
		Din = 0;		
		//-------------------------------------------- LEE  en 04
		#100;
		WE = 1;
		clk = 1;
		A = 4;
		B = 8;
		Din = 8'hFF;						

		#100;
		WE = 1;
		clk = 0;
		A = 4;
		B = 8;
		Din = 0;			**/
		
		/**
		
		//---------------------------------------------------------------------------Testeo de lectura del b

		//-------------------------------------------- Lee M				
		**/
		WE = 1;
		clk = 1;
		A = 0;
		B = 4;
		Din = 0;

		#100;
		WE = 1;
		clk = 0;
		A = 0;
		B = 4;
		Din = 0;		
		//-------------------------------------------- Lee N
		#100;
		WE = 1;
		clk = 1;
		A = 4;
		B = 8;
		Din = 0;		
	
		#100;
		WE = 1;
		clk = 0;
		A = 4;
		B = 8;
		Din = 0;		
		//-------------------------------------------- Lee Mascara1
		#100;
		WE = 1;
		clk = 1;
		A = 8;
		B = 12;
		Din = 0;				

		#100;
		WE = 1;
		clk = 0;
		A = 8;
		B = 12;
		Din = 0;		
		//-------------------------------------------- Lee Mascara2
		#100;
		WE = 1;
		clk = 1;
		A = 12;
		B = 16;
		Din = 0;						

		#100;
		WE = 1;
		clk = 0;
		A = 12;
		B = 16;
		Din = 0;								
		//-------------------------------------------- Lee Mascara3
		#100;
		WE = 1;
		clk = 1;
		A = 16;
		B = 20;
		Din = 0;						

		#100;
		WE = 1;
		clk = 0;
		A = 16;
		B = 20;
		Din = 0;	        
		//-------------------------------------------- Lee Mascara4
		#100;
		WE = 1;
		clk = 1;
		A = 20;
		B = 24;
		Din = 0;						

		#100;
		WE = 1;
		clk = 0;
		A = 20;
		B = 24;
		Din = 0;
		
		
		
	end
      
endmodule

