`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    02:49:27 04/02/2017 
// Design Name: 
// Module Name:    ClockDivision25MHz 
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
module ClockDivision25MHz(
			input clk,
			output reg clk_25MHz
    );
	 
	 	 	// señal de reloj
		initial begin
			clk_25MHz = 0;
		end
		always @(posedge clk)
		clk_25MHz <= ~clk_25MHz;
	 


endmodule
