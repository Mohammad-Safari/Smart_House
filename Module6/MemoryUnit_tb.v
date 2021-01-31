`timescale 1ns / 1ps

////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer:
//
// Create Date:   16:29:15 01/31/2021
// Design Name:   MemoryUnit
// Module Name:   C:/Users/hp/Desktop/Logical Circuits Lab/Final Project/FinalProject/Module07/MemoryUnit_tb.v
// Project Name:  FinalProject
// Target Device:  
// Tool versions:  
// Description: 
//
// Verilog Test Fixture created by ISE for module: MemoryUnit
//
// Dependencies:
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
////////////////////////////////////////////////////////////////////////////////

module MemoryUnit_tb;

	// Inputs
	reg arst;
	reg clk;
	reg wren;
	reg [34:0] din;

	// Outputs
	wire [34:0] dout;

	// Instantiate the Unit Under Test (UUT)
	MemoryUnit uut (
		.arst(arst), 
		.clk(clk), 
		.wren(wren), 
		.din(din), 
		.dout(dout)
	);

	initial begin
		// Initialize Inputs
		arst = 1'b0;
		clk = 1'b1;
		wren = 1'b0;
		din = 35'b00000000000000000000000000000000000;
		forever #20 clk = ~clk;
	end 
	
	initial begin

		arst = 1'b1;
		#100;
      arst = 1'b0;
		wren = 1'b1;
		din = 35'b01010001001000000000001000100100101;
		#100;
      arst = 1'b0;
		wren = 1'b0;
		din = 35'b00000000000000000000000000000000000;
		#100;
      arst = 1'b0;
		wren = 1'b1;
		din = 35'b00001110000000000000000000001010101;
		#100;
      arst = 1'b0;
		wren = 1'b0;
		din = 35'b00000000000000000000000000000000000;
		#100;
      arst = 1'b0;
		wren = 1'b0;
		din = 35'b00000000000000000000000000000000000;
		#100;
      arst = 1'b0;
		wren = 1'b1;
		din = 35'b11111111111111111111111111111111111;
		#100;
      arst = 1'b0;
		wren = 1'b0;
		din = 35'b00000000000000000000000000000000000;
		#100;
      arst = 1'b0;
		wren = 1'b0;
		din = 35'b00000000000000000000000000000000000;
		#100;
      arst = 1'b0;
		wren = 1'b0;
		din = 35'b00000000000000000000000000000000000;
		#100;
      arst = 1'b0;
		wren = 1'b1;
		din = 35'b10100100111111100000000000000001111;
		#100;
      arst = 1'b0;
		wren = 1'b0;
		din = 35'b00000000000000000000000000000000000;
		#100;
      arst = 1'b0;
		wren = 1'b1;
		din = 35'b11101110111011101110111000000000111;
		#100;
      arst = 1'b0;
		wren = 1'b0;
		din = 35'b00000000000000000000000000000000000;
		#100;
      arst = 1'b1;
		// Add stimulus here

	end
      
endmodule

