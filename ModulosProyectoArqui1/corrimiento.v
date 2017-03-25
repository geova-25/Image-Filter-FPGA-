`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    06:14:19 03/24/2017 
// Design Name: 
// Module Name:    corrimiento 
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
module corrimiento(
		input [31:0]in,
		output wire [31:0]out
    );

	assign out = in <<2;

endmodule
