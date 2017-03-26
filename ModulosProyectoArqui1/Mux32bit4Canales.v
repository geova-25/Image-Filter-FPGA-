`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    06:40:29 03/25/2017 
// Design Name: 
// Module Name:    Mux32bit4Canales 
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
module Mux32bit4Canales(
		input [1:0]S,
		input [31:0]A,B,C,D,
		output reg[31:0]Y
    ); 
	 
	 always@*
	 begin
		case(S)
			2'b00:
				Y=A;
			2'b01:
				Y=B;
			2'b10:
				Y=C;
			2'b11:
				Y=D;
		endcase
	 end


endmodule
