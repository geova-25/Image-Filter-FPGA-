`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    04:42:21 03/24/2017 
// Design Name: 
// Module Name:    Decode 
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
module Decode(
		//control
		input sel_A,
		input sel_C,
		input sel_B,
		input sel_ext,
		input WE_C,
		input WE_V,
		//datos
		input [31:0]PCmas4_In,
		input [3:0]Rp,
		input [3:0]Rs,
		input [23:0]imm24,
		input [15:0]imm15,
		input [3:0]Rg_In,
		input [3:0]Rg_WB,
		input [31:0]DinC,
		input [7:0]DinV_8bit,
		//salidas
		output wire [31:0]PCmas4_Out,
		output wire [3:0]Rg_Out,
		output wire [31:0]DoA,
		output wire [31:0]DoB,
		output wire [39:0]cuarenta,
		output wire [31:0]immediato


    );


endmodule
