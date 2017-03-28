`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    23:28:38 03/24/2017 
// Design Name: 
// Module Name:    DataMemory 
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
module DataMemory(
    input WE,
	 input clk,
    input [31:0] A,
    input [31:0] B,
    input [7:0] Din,
    output wire [31:0] Do,
    output wire [7:0] Dob
    );
	 
	 reg [7:0] DataMem[131072:0];
	 //reg [7:0] DataMem[127:0];	 
	 integer i = 5'b0;
	initial begin
	$readmemh("DataMemInit.txt",DataMem);
		/**	for (i=0; i < 32; i=i+1)
        $display("%d:%h",i,DataMem[i]);	**/
	end		 
	 
	 reg [31:0] DoReg;	 
	 reg [7:0] DobReg;
	 
	always @(posedge clk)
		begin
			if(~WE)
				begin
					DataMem[A] = Din;
				end
			else
				begin
					DataMem[A] = DataMem[A];
				end
		end

	always @(negedge clk)		
			begin
				DoReg = {DataMem[A+3],DataMem[A+2],DataMem[A+1],DataMem[A]};
				DobReg =  DataMem[B];
			end		
			
	assign Do = DoReg;
	assign Dob = DobReg;
endmodule
