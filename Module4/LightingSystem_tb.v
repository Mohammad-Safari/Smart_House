`timescale 1ns / 1ps

////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer:
//
// Create Date:   19:51:47 02/06/2021
// Design Name:   LightingSystem
// Module Name:   F:/sh4/tb_LightingSystem.v
// Project Name:  sh4
// Target Device:  
// Tool versions:  
// Description: 
//
// Verilog Test Fixture created by ISE for module: LightingSystem
//
// Dependencies:
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
////////////////////////////////////////////////////////////////////////////////

module tb_LightingSystem;

	// Inputs
	reg [3:0] tcode;
	reg [3:0] ulight;
	reg [3:0] lenght;

	// Outputs
	wire [3:0] wshade;
	wire [3:0] lightnum;
	wire [15:0] lightstate;

	// Instantiate the Unit Under Test (UUT)
	LightingSystem uut (
		.tcode(tcode), 
		.ulight(ulight), 
		.lenght(lenght), 
		.wshade(wshade), 
		.lightnum(lightnum), 
		.lightstate(lightstate)
	);

	initial begin
		// Initialize Inputs
		tcode = 4'b0001;
		ulight = 4'b0100;
		lenght = 4'b0100;

		// Wait 100 ns for global reset to finish
		#100;
		tcode = 4'b0010;
		ulight = 4'b0100;
		lenght = 4'b0100;

		// Wait 100 ns for global reset to finish
		#100;
		tcode = 4'b0100;
		ulight = 4'b0100;
		lenght = 4'b0100;

		// Wait 100 ns for global reset to finish
		#100;
		tcode = 4'b1000;
		ulight = 4'b0100;
		lenght = 4'b0100;

		// Wait 100 ns for global reset to finish
		#100;
		tcode = 4'b0000;
		ulight = 4'b0100;
		lenght = 4'b0100;

		// Wait 100 ns for global reset to finish
		#100;
        
		// Add stimulus here

	end
      
endmodule

