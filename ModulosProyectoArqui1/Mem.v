`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    04:32:55 03/25/2017 
// Design Name: 
// Module Name:    Mem 
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
module Mem(
		input clk,
		input [31:0] ALU_Result_In,
		input [7:0] Rs,
		input WE_mem,
		output wire [31:0] Do,
		output wire [7:0] Dob
		
    );
	 
	 parameter CUATRO = 32'd4;
	 wire [31:0] ALU_Result_mas4;
	 
	DataMemory dataMem (
		.WE(WE_mem), 
		.clk(clk), 
		.A(ALU_Result_In), 
		.B(ALU_Result_In + 4), 
		.Din(Rs), 
		.Do(Do), 
		.Dob(Dob)
	);
	
	/*thirtyTwoBitsFullAdder sumador (
		.a(CUATRO), 		//Entrada 1
		.b(ALU_Result_In), 					//Entrada 2
		.s(ALU_Result_mas4), 	//Salida del sumador
		.c0(1'b0), 					//Carry inicial
		.cout() 						//Carry salida
	);*/		
	

endmodule
