

module control_pintado(

	input wire [9:0] cur_x, cur_y,
	input wire clk,
	input wire [7:0] data, //pixel entrada
	output wire [7:0] out,//pixel salida
	output reg [18:0] addres
);


reg [7:0] salida = 8'b0;
reg bandera = 1'b0;

always @(posedge clk)
begin	
	if(1 <= cur_y & cur_y <= 64) begin
		if(1 <= cur_x & cur_x <= 64) begin
			salida <= data;
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
			addres <= 2'h28;
			bandera <= 1;
			salida <= 8'b00000000;
	end
end
assign out = salida;

endmodule

