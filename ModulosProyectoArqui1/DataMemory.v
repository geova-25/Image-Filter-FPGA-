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
	 
	 //reg [7:0] DataMem[262143:0];
	 reg [7:0] DataMem[63:0];	 

	initial begin
	//	Constante M
		DataMem[0] = 8'h00;
		DataMem[1] = 8'h0C;
		DataMem[2] = 8'h11;
		DataMem[3] = 8'h11;
	//	Constante N		
		DataMem[4] = 8'h33;
		DataMem[5] = 8'h44;
		DataMem[6] = 8'h55;
		DataMem[7] = 8'h66;
	//MASCARA1	
		DataMem[8] = 8'hFF;
		DataMem[9] = 8'h00;
		DataMem[10] = 8'h00;
		DataMem[11] = 8'h00;
	//MASCARA2	
		DataMem[12] = 8'h00;		
		DataMem[13] = 8'hFF;
		DataMem[14] = 8'h00;
		DataMem[15] = 8'h00;		
	//MASCARA3
		DataMem[16] = 8'h00;		
		DataMem[17] = 8'h00;
		DataMem[18] = 8'hFF;
		DataMem[19] = 8'h00;		
	//MASCARA4
		DataMem[20] = 8'h00;		
		DataMem[21] = 8'h00;
		DataMem[22] = 8'h00;
		DataMem[23] = 8'hFF;				
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
