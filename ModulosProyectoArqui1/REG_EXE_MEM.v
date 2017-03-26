module REG_EXE_MEM(

	input clk,
	input we_mem_in,
	input sel_dat_in,
	input sel_c_in,
	input sel_v_in,
	input we_c_in,
	input prohib_exe,
	input [31:0]result_in,  //salida del mux
	input [7:0]DoB_byte_in,
	input [3:0]Rg_exe,


	output reg we_mem,
	output reg sel_dat,
	output reg sel_c,
	output reg sel_v,
	output reg we_c,
	output reg prohib_mem,
	output reg [31:0]result,  //salida del mux
	output reg [7:0]DoB_byte,
	output reg [3:0]Rg_mem
);

	always @(posedge clk)
	begin
		we_mem<=we_mem_in;
		sel_dat<=sel_dat_in;
		sel_c<= sel_c_in;
		sel_v <= sel_v_in;
		we_c <= we_c_in;
		result <= result_in;
		DoB_byte<= DoB_byte_in;
		Rg_mem <=Rg_exe;	
		prohib_mem <= prohib_exe;
	end

endmodule 