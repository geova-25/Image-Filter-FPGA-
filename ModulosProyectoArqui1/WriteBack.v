`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    06:50:49 03/25/2017 
// Design Name: 
// Module Name:    WriteBack 
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
module WriteBack(
    input [31:0] Do,
    input [31:0] ALU_Result,
    input [7:0] Dob_In,
    input sel_dat,
    output wire [31:0] WriteBack_output,
    output wire [7:0] Dob
    );

	Mux mux (
		.A(Do), 
		.B(ALU_Result), 
		.S(sel_dat), 
		.Y(WriteBack_output)
	);
	
	assign Dob = Dob_In;

endmodule
