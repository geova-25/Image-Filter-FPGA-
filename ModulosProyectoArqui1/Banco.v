`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    14:06:24 11/18/2016 
// Design Name: 
// Module Name:    Banco 
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
module Banco(
	//entradas
	input clk,
	
	input WE_C,
	input WE_V,
	input [3:0]DirA,
	input [3:0]DirB,
	input [3:0]DirC,
	input [3:0]DirV,
	input [31:0]DinC,
	input [31:0]DinV,
	//salidas
	output wire [31:0]DoA,
	output wire [31:0]DoB

	
    );

	//Chip selects delos bancos
	wire [15:0]CSa;
	wire [15:0]CSb;
	wire [15:0]CSc;
	wire [15:0]CSv;	

	//dirrecionamiento de memoria con muxes
	 Deco16Canales deco1(.S(DirA),.Y(CSa));
	 Deco16Canales deco2(.S(DirB),.Y(CSb));
	 Deco16Canales deco3(.S(DirC),.Y(CSc));
	 Deco16Canales deco4(.S(DirV),.Y(CSv));

	 registro32bits R0(.clk(clk),.CSa(CSa[0]),.CSb(CSb[0]),.CSc(CSc[0]),.CSv(CSv[0]),.WEc(~WE_C),.WEv(~WE_V),.DinC(DinC),.DinV(DinV),.DoA(DoA),.DoB(DoB));
	
	 registro32bits R1(.clk(clk),.CSa(CSa[1]),.CSb(CSb[1]),.CSc(CSc[1]),.CSv(CSv[1]),.WEc(~WE_C),.WEv(~WE_V),.DinC(DinC),.DinV(DinV),.DoA(DoA),.DoB(DoB));
	 
	 registro32bits R2(.clk(clk),.CSa(CSa[2]),.CSb(CSb[2]),.CSc(CSc[2]),.CSv(CSv[2]),.WEc(~WE_C),.WEv(~WE_V),.DinC(DinC),.DinV(DinV),.DoA(DoA),.DoB(DoB));
	 
	 registro32bits R3(.clk(clk),.CSa(CSa[3]),.CSb(CSb[3]),.CSc(CSc[3]),.CSv(CSv[3]),.WEc(~WE_C),.WEv(~WE_V),.DinC(DinC),.DinV(DinV),.DoA(DoA),.DoB(DoB));
	 
	 registro32bits R4(.clk(clk),.CSa(CSa[4]),.CSb(CSb[4]),.CSc(CSc[4]),.CSv(CSv[4]),.WEc(~WE_C),.WEv(~WE_V),.DinC(DinC),.DinV(DinV),.DoA(DoA),.DoB(DoB));
	 
	 registro32bits R5(.clk(clk),.CSa(CSa[5]),.CSb(CSb[5]),.CSc(CSc[5]),.CSv(CSv[5]),.WEc(~WE_C),.WEv(~WE_V),.DinC(DinC),.DinV(DinV),.DoA(DoA),.DoB(DoB));
	 
	 registro32bits R6(.clk(clk),.CSa(CSa[6]),.CSb(CSb[6]),.CSc(CSc[6]),.CSv(CSv[6]),.WEc(~WE_C),.WEv(~WE_V),.DinC(DinC),.DinV(DinV),.DoA(DoA),.DoB(DoB));
	 
	 registro32bits R7(.clk(clk),.CSa(CSa[7]),.CSb(CSb[7]),.CSc(CSc[7]),.CSv(CSv[7]),.WEc(~WE_C),.WEv(~WE_V),.DinC(DinC),.DinV(DinV),.DoA(DoA),.DoB(DoB));
	 
	 registro32bits R8(.clk(clk),.CSa(CSa[8]),.CSb(CSb[8]),.CSc(CSc[8]),.CSv(CSv[8]),.WEc(~WE_C),.WEv(~WE_V),.DinC(DinC),.DinV(DinV),.DoA(DoA),.DoB(DoB));
	 
	 registro32bits R9(.clk(clk),.CSa(CSa[9]),.CSb(CSb[9]),.CSc(CSc[9]),.CSv(CSv[9]),.WEc(~WE_C),.WEv(~WE_V),.DinC(DinC),.DinV(DinV),.DoA(DoA),.DoB(DoB));
	 
	 registro32bits R10(.clk(clk),.CSa(CSa[10]),.CSb(CSb[10]),.CSc(CSc[10]),.CSv(CSv[10]),.WEc(~WE_C),.WEv(~WE_V),.DinC(DinC),.DinV(DinV),.DoA(DoA),.DoB(DoB));
	 
	 registro32bits R11(.clk(clk),.CSa(CSa[11]),.CSb(CSb[11]),.CSc(CSc[11]),.CSv(CSv[11]),.WEc(~WE_C),.WEv(~WE_V),.DinC(DinC),.DinV(DinV),.DoA(DoA),.DoB(DoB));
	 
	 registro32bits R12(.clk(clk),.CSa(CSa[12]),.CSb(CSb[12]),.CSc(CSc[12]),.CSv(CSv[12]),.WEc(~WE_C),.WEv(~WE_V),.DinC(DinC),.DinV(DinV),.DoA(DoA),.DoB(DoB));
	 
	 registro32bits R13(.clk(clk),.CSa(CSa[13]),.CSb(CSb[13]),.CSc(CSc[13]),.CSv(CSv[13]),.WEc(~WE_C),.WEv(~WE_V),.DinC(DinC),.DinV(DinV),.DoA(DoA),.DoB(DoB));
	 
	 registro32bits R14(.clk(clk),.CSa(CSa[14]),.CSb(CSb[14]),.CSc(CSc[14]),.CSv(CSv[14]),.WEc(~WE_C),.WEv(~WE_V),.DinC(DinC),.DinV(DinV),.DoA(DoA),.DoB(DoB));
	 
	 registro32bits R15(.clk(clk),.CSa(CSa[15]),.CSb(CSb[15]),.CSc(CSc[15]),.CSv(CSv[15]),.WEc(~WE_C),.WEv(~WE_V),.DinC(DinC),.DinV(DinV),.DoA(DoA),.DoB(DoB));

endmodule
