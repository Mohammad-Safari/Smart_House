`timescale 1ns / 1ps

////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer:
//
// Create Date:   23:12:32 01/28/2021
// Design Name:   GasDetectorSensor
// Module Name:   C:/Users/hp/Desktop/Logical Circuits Lab/Final Project/FinalProject/GasDetectorSensor_tb.v
// Project Name:  FinalProject
// Target Device:  
// Tool versions:  
// Description: 
//
// Verilog Test Fixture created by ISE for module: GasDetectorSensor
//
// Dependencies:
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
////////////////////////////////////////////////////////////////////////////////

module GasDetectorSensor_tb;

	// Inputs
	reg arst;
	reg clk;
	reg din;

	// Outputs
	wire [2:0] dout;

	// Instantiate the Unit Under Test (UUT)
	GasDetectorSensor uut (
		.arst(arst), 
		.clk(clk), 
		.din(din), 
		.dout(dout)
	);

	initial begin
		// Initialize Inputs
		arst = 1'b0;
		clk = 1'b0;
		din = 1'b0;
		forever #100 clk = ~clk;
	end
	
	initial begin
		arst =    1'b1;
		arst = #1 1'b0;
		// Wait 100 ns for global reset to finish
		#10;
		din = 1'b1;
		arst = 1'b0;
		#100;
		din = 1'b0;
		arst = 1'b0;
		#100;
		din = 1'b0;
		arst = 1'b0;
		#100;
		din = 1'b1;
		arst = 1'b0;
		#100;
		din = 1'b0;
		arst = 1'b0;
		#100;
		din = 1'b0;
		arst = 1'b0;
		#100;
		din = 1'b1;
		arst = 1'b0;
		#100;
		din = 1'b0;
		arst = 1'b0;
		#100;
		din = 1'b0;
		arst = 1'b0;
		#100;
		din = 1'b1;
		arst = 1'b0;
		#100;
		din = 1'b0;
		arst = 1'b0;
		#100;
		din = 1'b1;
		arst = 1'b0;
		#100;
		din = 1'b1;
		arst = 1'b0;
		#100;
		din = 1'b1;
		arst = 1'b0;
		#100;
		din = 1'b1;
		arst = 1'b0;
		#100;
		din = 1'b0;
		arst = 1'b0;
		#100;
		din = 1'b1;
		arst = 1'b0;
		#100;
		din = 1'b0;
		arst = 1'b0;
		#100;
		din = 1'b1;
		arst = 1'b0;
		#100;
		din = 1'b0;
		arst = 1'b0;
		#100;
		din = 1'b1;
		arst = 1'b0;
		// Add stimulus here
	end
      
endmodule

