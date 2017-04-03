

module control_pintado(

	input wire [9:0] cur_x, cur_y,
	input wire clk,
	input wire [7:0] data, //pixel entrada
	output wire [7:0] out,//pixel salida
	output reg [18:0] addres
);

reg [18:0] constante = 19'b0000000000000101000;
//reg [18:0] constante = 19'd000000000000000000;
initial begin
	addres = 19'b0000000000000101000;
	$display("--------------------------------------------------------------------------------------------------------------------------s");
$display("--------------------------------------------------------------------------------------------------------------------------s");
	$display("%d:%h",addres,addres);
end



reg [7:0] salida = 8'b0;
reg bandera = 1'b0;

always @(posedge clk)
begin	
	if(1 <= cur_y & cur_y <= 32) begin
		if(1 <= cur_x & cur_x <= 32) begin
			salida <= data;
			//salida <= 8'b11111111;
			addres <= addres + 1'b1;
			bandera <= 0;
		end
		else begin
			salida <= 8'b00000000;
			addres <= addres;
			bandera <= 1;
		end
	end
	else begin
			addres <= 19'b0000000000000101000;
			bandera <= 1;
			salida <= 8'b00000000;
	end
end
assign out = salida;

endmodule

