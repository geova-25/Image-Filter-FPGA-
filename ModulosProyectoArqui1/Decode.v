`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    04:42:21 03/24/2017 
// Design Name: 
// Module Name:    Decode 
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
module Decode(
		//control
		input clk,
		input sel_A,
		input sel_C,
		input sel_B,
		input sel_ext,
		input WE_C,
		input WE_V,
		//datos
		input [3:0]Rp,
		input [3:0]Rs,
		input [23:0]imm24,
		input [15:0]imm16,
		input [3:0]Rg_WB,
		input [31:0]DinC,
		input [7:0]DinV_8bit,
		//salidas
		output wire [31:0]DoA,
		output wire [31:0]DoB,
		output wire [39:0]cuarenta,
		output wire [31:0]immediato


    );
	 

	
	 
	 wire [3:0] salidaMuxA;
	 wire [3:0] salidaMuxB;
	 wire [3:0] salidaMuxC;
	 
	 wire [25:0] imm26Corrido;
	 
	 corrimiento corr(
		.in(imm24),
		.out(imm26Corrido)
    );
	 
	 Mux4bitDosCanales muxA(
    .A(Rp),		//Entrada 0 de 32 bits
    .B(4'b1110),		//Entrada 1 de 32 bits
    .S(sel_A),				//Entrada de seleccion de 1 bit
    .Y(salidaMuxA)	//Salida de data seleccionada de 32 bits
    );
	 
	 Mux4bitDosCanales muxB(
    .A(Rs),		//Entrada 0 de 32 bits
    .B(4'b1111),		//Entrada 1 de 32 bits
    .S(sel_B),				//Entrada de seleccion de 1 bit
    .Y(salidaMuxB)	//Salida de data seleccionada de 32 bits
    );
	 
	 Mux4bitDosCanales muxC(
    .A(Rg_WB),		//Entrada 0 de 32 bits
    .B(4'b1110),		//Entrada 1 de 32 bits
    .S(sel_C),				//Entrada de seleccion de 1 bit
    .Y(salidaMuxC)	//Salida de data seleccionada de 32 bits
    );
	 
	Banco banco(
	//entradas
		.clk(clk),
		.WE_C(WE_C),
		.WE_V(WE_V),
		.DirA(salidaMuxA),
		.DirB(salidaMuxB),
		.DirC(salidaMuxC),
		.DirV(4'b1111),
		.DinC(DinC),
		.DinV({DinV_8bit,24'b0}),
	//salidas
		.DoA(DoA),
		.DoB(DoB)
    );
	 
	  
	 
	 immExt extensor(
		//in
		.selExt(sel_ext),
		.imm16(imm16),
		.imm26(imm26Corrido),
		//out
		.immediato(immediato)
    );
	 
	 Concatenador40bit concat (
		.DoA(DoA),
		.DoB({DoB[31],DoB[30],DoB[29],DoB[28],DoB[27],DoB[26],DoB[25],DoB[24]}),
		.cuarenta(cuarenta)
	 );


endmodule
