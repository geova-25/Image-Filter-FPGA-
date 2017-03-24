`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    02:20:51 03/24/2017 
// Design Name: 
// Module Name:    InstructionMemory 
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
module InstructionMemory(
    input wire  [31:0] DIR,
    output wire [31:0] DO
    );
	
	//reg [7:0] InstMem[262143:0];	 
	reg [7:0] InstMem[63:0];	 
	initial begin
		InstMem[0] = 8'hFF;
		InstMem[1] = 8'h00;
		InstMem[2] = 8'h00;
		InstMem[3] = 8'h00;
		
		InstMem[4] = 8'h00;		
		InstMem[5] = 8'hFF;
		InstMem[6] = 8'h00;
		InstMem[7] = 8'h00;		

		InstMem[8] = 8'h00;		
		InstMem[9] = 8'h00;
		InstMem[10] = 8'hFF;
		InstMem[11] = 8'h00;		
		
		InstMem[12] = 8'h00;		
		InstMem[13] = 8'h00;
		InstMem[14] = 8'h00;
		InstMem[15] = 8'hFF;				
	end	
	
	assign DO = {InstMem[DIR+3],InstMem[DIR+2],InstMem[DIR+1],InstMem[DIR]};

endmodule
