
`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Create Date:    16:34:09 09/15/2016 
// Integrantes: Javier Cordero, Martín Barquero, Sebastián Gonzalez, Danny Mejías
// Restricciones:
//    - Elemento de 16 bits de la entrada Di y la salida Do es de 32 bits
// Entradas:
//    - 3.3V para alto, 0V para bajo 
// Salidas: 
//    - 3.3V para alto, 0V para bajo 
// Tiempo de retardo:     Maximum output required time after clock: 3.597ns
// Consumo de Energía: 20 mW
//
//		Area:
//  Number of Slice Registers:                     0 
//  Number of Slice LUTs:                          0 
//  Number of occupied Slices:                     0 
//  Number of bonded IOBs:                        65 
//  IOB Flip Flops:                             32
//////////////////////////////////////////////////////////////////////////////////
module PC(
	 input [31:0]Di_pc, //entrada
	 input clk, //reloj
	 output reg [31:0] Do_pc = 0  //registro
	);
	
	always @(posedge clk) 
	begin
		Do_pc=Di_pc; //se le asigna el dato de entrada al registro de 23 bits
	end

endmodule