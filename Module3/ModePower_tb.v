`timescale 1ns / 1ps

////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer:
//
// Create Date:   19:00:14 01/28/2021
// Design Name:   ModePower
// Module Name:   C:/Users/hp/Desktop/Logical Circuits Lab/Final Project/FinalProject/ModePower_tb.v
// Project Name:  FinalProject
// Target Device:  
// Tool versions:  
// Description: 
//
// Verilog Test Fixture created by ISE for module: ModePower
//
// Dependencies:
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
////////////////////////////////////////////////////////////////////////////////

module ModePower_tb;

	// Inputs
	reg [7:0] chs_conf;

	// Outputs
	wire [3:0] chs_power;
	wire chs_mode;

	// Instantiate the Unit Under Test (UUT)
	ModePower uut (
		.chs_conf(chs_conf), 
		.chs_power(chs_power), 
		.chs_mode(chs_mode)
	);

	initial begin
		// Initialize Inputs
		chs_conf = 0;

		// Wait 100 ns for global reset to finish
		#100;
		chs_conf = 8'b00001111;
		#100;
		chs_conf = 8'b10000111;
		#100;
		chs_conf = 8'b01101110;
		#100;
		chs_conf = 8'b11111111;
		#100;
		chs_conf = 8'b01111110;
		#100;
		chs_conf = 8'b00001010;
		#100;
		chs_conf = 8'b00000000;
		#100;
		chs_conf = 8'b10111110;
		#100;
		chs_conf = 8'b00111001;
        
		// Add stimulus here

	end
      
endmodule

