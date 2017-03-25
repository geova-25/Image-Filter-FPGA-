`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    12:42:26 11/18/2016 
// Design Name: 
// Module Name:    registro32bits 
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
module registro32bits(
			input clk,
			input CSa,
			input CSb,
			
			input CSc,
			input CSv,
			input WEc,
			input WEv,
			input [31:0]DinC,
			input [31:0]DinV,
			output wire [31:0]DoA,
			output wire [31:0]DoB
			
    );
	 
	reg [31:0]Do=0;
	
	
	//escritura 
	always @(posedge clk)
	begin
		if(WEc & CSc)
			Do=DinC;
		else if (WEv & CSv)
			Do=DinV;
		else
			Do=Do;
			
	end
	

	//lectura 
	
	
	assign DoA = (CSa & ~clk)? Do: 32'bz;
	assign DoB = (CSb & ~clk)? Do: 32'bz;
			
endmodule
