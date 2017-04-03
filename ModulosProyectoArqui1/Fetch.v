`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    05:17:08 03/24/2017 
// Design Name: 
// Module Name:    Fetch 
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
module Fetch(
    input sel_STO,
	 input clk,
    input  [31:0] Direccion_de_Salto,
    output [31:0] Instruccion,
    output [31:0] Pcmas4
    );
	 
	 wire [31:0] salidaMux;
	 wire [31:0] salidaSumador;
	 wire [31:0] salidaPc;
	 
	Mux mux (
		.A(Pcmas4), 
		.B(Direccion_de_Salto), 
		.S(sel_STO), 
		.Y(salidaMux)
	);
	
	InstructionMemory2 InstMem (
		.DIR(salidaPc), 
		.DO(Instruccion)
	);	
	
	PC PC (
		.Di_pc(salidaMux), 
		.clk(clk), 
		.Do_pc(salidaPc) 
	);
	
	thirtyTwoBitsFullAdder uut (
		.a(32'd4), 		//Entrada 1
		.b(salidaPc), 		//Entrada 2
		.s(Pcmas4), 		//Salida del sumador
		.c0(1'b0), 	//Carry inicial
		.cout() //Carry salida
	);	


endmodule
