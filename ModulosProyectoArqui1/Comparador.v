`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    04:17:55 03/25/2017 
// Design Name: 
// Module Name:    Comparador 
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
module Comparador(
    input [7:0] A,
    input [7:0] B,
    input [7:0] C,
    input [7:0] D,
    input [7:0] E,
	 output reg [7:0] mayor
    );

	always@(*)
	begin
		if((A>=B) & (A>=C) & (A>=D) & (A>=E))
			mayor = A;
		if((B>=A) & (B>=C) & (B>=D) & (B>=E))
			mayor = B;
		if((C>=A) & (C>=B) & (C>=D) & (C>=E))
			mayor = C;
		if((D>=A) & (D>=B) & (D>=C) & (D>=E))
			mayor = D;
		else 
			mayor = E;
	end



endmodule
