`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    05:39:43 03/25/2017 
// Design Name: 
// Module Name:    Execution 
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
module Execution(
		input sel_res,
		input [2:0]ALU_CTRL,
		input [1:0]selOp_A,
		input [1:0]selOp_B,
		input [31:0]PCmas4,
		input [31:0]DoA,
		input [31:0]DoB,
		input [31:0]immediato,
		input [31:0]adelantadoA, //bus que tira la unidad de adelantamiento
		input [31:0]adelantadoB, //bus que tira la unidad de adelantamiento
		input [39:0]cuarenta,
	
		//salidas
		
		output wire[7:0]DoB_byte,
		output wire[31:0]result,
		output wire N,
		output wire Z
		
    );
	 

	 assign DoB_byte = DoB[7:0];
	 
	 wire [31:0]resultMuxA;
	 wire [31:0]resultMuxB;
	 wire [31:0]resultAlu;
	 wire [7:0]pixelMayor;
	 
	 Mux32bit4Canales muxOpA(		
		.S(selOp_A), //seleccion
		.A(PCmas4),  //00
		.B(adelantadoA),  //01
		.C(DoA),  //10
		.D(32'b0),	 //11
		.Y(resultMuxA) //salida
    );
	 
	 
	 
	  Mux32bit4Canales muxOpB(		
		.S(selOp_B),  //seleccion
		.A(DoB),
		.B(immediato),
		.C(32'b0),
		.D(adelantadoB),
		.Y(resultMuxB)  //salida
    );
	 
	

	 
	ALU alu(
		.A(resultMuxA),
		.B(resultMuxB),
		.Alu_CTRL(ALU_CTRL),
		.C(),  //no se usa
		.Z(Z), 
		.N(N),
		.out(resultAlu) 
	);
	
	
	
	Comparador compara(
		.A(cuarenta[39:32]),
		.B(cuarenta[31:24]),
		.C(cuarenta[23:16]),
		.D(cuarenta[15:8]),
		.E(cuarenta[7:0]),
		.mayor(pixelMayor)
    );
	 
	

	Mux mux_res(
		.A(resultAlu),		//Entrada 0 de 32 bits
		.B({24'b0,pixelMayor}),		//Entrada 1 de 32 bits
		.S(sel_res),				//Entrada de seleccion de 1 bit
		.Y(result)	//Salida de data seleccionada de 32 bits
    );
	 
	 

endmodule
