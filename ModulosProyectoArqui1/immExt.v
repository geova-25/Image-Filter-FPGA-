`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    05:53:12 03/24/2017 
// Design Name: 
// Module Name:    immExt 
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
module immExt(

		input selExt,
		input [15:0]imm16,
		input [25:0]imm26,
		
		output reg [31:0]immediato
    );

	always @*
	if(selExt)
		immediato = {6'b0,imm26};
	else
		immediato = {16'b0,imm16};

endmodule
