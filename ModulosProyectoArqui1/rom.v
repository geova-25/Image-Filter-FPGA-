module rom (
	input wire [17:0] addres,
	output reg [7:0] data
);
	//reg[3:0] primera;
	//reg[3:0] segunda;
	//reg[7:0] total;
	//reg [23:0] rom_contenido [0:16383];
	//reg [7:0] DataMem[131072:0];
	reg [7:0] DataMem[1063:0];
	
	always @ (addres) begin
		data <= DataMem[addres];
		//primera <= total[3:0];
		//segunda <= total [7:4];
		//data[3:0] <= segunda;
		//data[7:4] <= primera;
	end
	integer x;
	initial begin  
		 $readmemh("DataMemInit.txt",DataMem,0,1063);	
		 $display("--------------------------------------------------------------------------------------------------------------------------s");
		$display("--------------------------------------------------------------------------------------------------------------------------s");
		$display("--------------------------------------------------------------------------------------------------------------------------s");
		$display("--------------------------------------------------------------------------------------------------------------------------s");
		$display("--------------------------------------------------------------------------------------------------------------------------s");
		$display("--------------------------------------------------------------------------------------------------------------------------s");
		for(x = 0;x<6;x = x + 1) begin
		$display("%d:%h",x,DataMem[x]);
		end

		//$readmemh("prueba.bmp",DataMem);
		//$readmemh("map_mem_read.mif", rom_contenido, 0, 16383);
	end
	
endmodule