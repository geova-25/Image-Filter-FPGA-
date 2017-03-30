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
	reg [7:0] InstMem[511:0];	 
	//integer i = 5'b0;	
	initial begin
	$readmemh("InstructionsMemInit.txt",InstMem);
			/**for (i=0; i < 32; i=i+1)
        $display("%d:%h",i,InstMem[i]);		**/

	end	
	
	assign DO = {InstMem[DIR],InstMem[DIR+1],InstMem[DIR+2],InstMem[DIR+3]};

endmodule
