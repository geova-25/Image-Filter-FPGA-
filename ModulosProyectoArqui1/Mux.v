`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    08:17:53 11/10/2016 
// Design Name: 
// Module Name:    Mux 
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
module Mux(
    input [31:0]A,		//Entrada 0 de 32 bits
    input [31:0]B,		//Entrada 1 de 32 bits
    input S,				//Entrada de seleccion de 1 bit
    output reg [31:0]Y	//Salida de data seleccionada de 32 bits
    );

always @*		//Seleccion de data dependiendo de valor de S 
    if(S)
		Y = B;	//Si es uno, escoge B
	 else
		Y = A;	//Si es cero, escoge A

endmodule
