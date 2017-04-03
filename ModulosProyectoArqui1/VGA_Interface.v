

module VGA_Interface(

    input wire clk, 
	 input wire reset,
	 input wire [7:0]byte_In,
	 output wire [18:0]Adress_byte,
    output wire vga_hs,
	 output wire vga_vs, 
	 output wire solicitud,
	 output wire vga_blank,
	 output wire vga_clock,
    output wire [7:0]r_out,
	 output wire [7:0]g_out,
	 output wire [7:0]b_out
   );

		
   //signal declaration
   reg [7:0] r_reg,g_reg,b_reg;
   wire video_on;
	
	reg [9:0] r,g,b;
	wire [9:0] cur_x, cur_y;
	wire [9:0] vga_r, vga_g, vga_b;

   // instantiate vga sync circuit
   vga_controlador controlador
      (r,g,b,
		cur_x,cur_y,solicitud,
		vga_r, vga_g, vga_b, vga_hs, vga_vs, vga_blank, vga_clock,
		clk, reset);
   
	wire [7:0] out;
	
	
 control_pintado pintado(
	.cur_x(cur_x), 
	.cur_y(cur_y),
	.clk(clk),
	.data(byte_In), //byte que entra
	.out(out),
	.addres(Adress_byte) //direccion que sale
);
	// rgb buffer
   always @(posedge clk, posedge reset)
    begin  
		if (reset)begin
         r_reg <= 0;
			g_reg <= 0;
			b_reg <= 0;
			end
      else
			begin
			r_reg <= out;
			g_reg <= out;
			b_reg <= out;
			end
	end
	
	
	
   // output
   assign r_out = (vga_blank) ? r_reg : 7'b0;
	assign g_out = (vga_blank) ? g_reg : 7'b0;
	assign b_out = (vga_blank) ? b_reg : 7'b0;

endmodule 