`timescale 1ns / 1ps

////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer:
//
// Create Date:   19:37:41 01/28/2021
// Design Name:   FanSpeed
// Module Name:   C:/Users/hp/Desktop/Logical Circuits Lab/Final Project/FinalProject/FanSpeed_tb.v
// Project Name:  FinalProject
// Target Device:  
// Tool versions:  
// Description: 
//
// Verilog Test Fixture created by ISE for module: FanSpeed
//
// Dependencies:
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
////////////////////////////////////////////////////////////////////////////////

module FanSpeed_tb;

	// Inputs
	reg arst;
	reg clk;
	reg [7:0] speed;

	// Outputs
	wire pwm_data;

	// Instantiate the Unit Under Test (UUT)
	FanSpeed uut (
		.arst(arst), 
		.clk(clk), 
		.speed(speed), 
		.pwm_data(pwm_data)
	);

	initial begin
		// Initialize Inputs
		arst = 1'b0;
		clk = 1'b1;
		speed = 8'b00000000;
		forever #10 clk = ~clk;
	end
	
	initial begin
		

		// Wait 100 ns for global reset to finish
		arst = 1'b1;
		#100;
      speed = 8'b00000001;
		arst = 1'b0;
		#2560
		speed = 8'b00001101;
		arst = 1'b0;
		#2560
		speed = 8'b01001001;
		arst = 1'b0;
		#2560
		speed = 8'b10000000;
		arst = 1'b0;
		#2560
		speed = 8'b00001111;
		arst = 1'b0;
		#2560
		speed = 8'b01110001;
		arst = 1'b0;
		#2560
		speed = 8'b00000000;
		arst = 1'b0;
		// Add stimulus here

	end
      
endmodule

