`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    06:49:01 03/24/2017 
// Design Name: 
// Module Name:    Mux4bitDosCanales 
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
module Mux4bitDosCanales(
    input [3:0]A,		//Entrada 0 de 32 bits
    input [3:0]B,		//Entrada 1 de 32 bits
    input S,				//Entrada de seleccion de 1 bit
    output reg [3:0]Y	//Salida de data seleccionada de 32 bits
    );

always @*		//Seleccion de data dependiendo de valor de S 
    if(S)
		Y = B;	//Si es uno, escoge B
	 else
		Y = A;	//Si es cero, escoge A

endmodule
