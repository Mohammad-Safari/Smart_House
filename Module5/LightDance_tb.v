`timescale 1ns / 1ps

////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer:
//
// Create Date:   19:00:57 02/01/2021
// Design Name:   LightDance
// Module Name:   C:/Users/hp/Desktop/Logical Circuits Lab/Final Project/FinalProject/Module05/LightDance_tb.v
// Project Name:  FinalProject
// Target Device:  
// Tool versions:  
// Description: 
//
// Verilog Test Fixture created by ISE for module: LightDance
//
// Dependencies:
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
////////////////////////////////////////////////////////////////////////////////

module LightDance_tb;

	// Inputs
	reg arst;
	reg clk;
	reg din;
	reg load;
	reg [7:0] pdata;

	// Outputs
	wire [7:0] qdata;

	// Instantiate the Unit Under Test (UUT)
	LightDance uut (
		.arst(arst), 
		.clk(clk), 
		.din(din), 
		.load(load), 
		.pdata(pdata), 
		.qdata(qdata)
	);

	initial begin
		// Initialize Inputs
		arst = 0;
		clk = 0;
		din = 0;
		load = 0;
		pdata = 0;
		forever #20 clk = ~clk;
	end
	
	initial begin

		arst = 1'b1;
		#100;
		arst = 1'b0;
		load = 1'b1;
		pdata = 8'b01010101;
		#100;
		arst = 1'b0;
		load = 1'b0;
		#100;
		arst = 1'b0;
		load = 1'b0;
		#100;
		arst = 1'b0;
		load = 1'b0;
		#100;
		arst = 1'b0;
		load = 1'b0;
		#100;
		arst = 1'b0;
		load = 1'b0;
		#100;
		arst = 1'b0;
		load = 1'b0;
		#100;
		arst = 1'b0;
		load = 1'b1;
		pdata = 8'b01110111;
        
		// Add stimulus here

	end
      
endmodule

