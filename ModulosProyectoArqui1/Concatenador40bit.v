`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    00:12:24 03/26/2017 
// Design Name: 
// Module Name:    Concatenador40bit 
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
module Concatenador40bit(
		input [31:0]DoA,
		input [7:0]DoB,
		output wire [39:0]cuarenta
    );
	assign cuarenta = {DoA,DoB};

endmodule
