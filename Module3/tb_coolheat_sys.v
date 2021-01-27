`timescale 1ns / 1ps

////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer:
//
// Create Date:   15:19:06 01/26/2021
// Design Name:   module3_coolheat_sys
// Module Name:   C:/Users/Mohammad/Projects/Logic Lab/Xilinix ISE/Final/module3_coolheat_sys/tbCoolHeatSystem.v
// Project Name:  module3_coolheat_sys
// Target Device:  
// Tool versions:  
// Description: 
//
// Verilog Test Fixture created by ISE for module: module3CoolHeatSystem
//
// Dependencies:
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
////////////////////////////////////////////////////////////////////////////////

module tb_CoolHeatSystem;

	// Inputs
	reg [7:0] chs_conf;
	reg [7:0] speed;
	reg clk = 0;

	// Outputs
	wire [3:0] chs_power;
	wire chs_mode;
	wire pwm_data;

	// Instantiate the Unit Under Test (UUT)
	CoolHeatSystem uut (
		.chs_conf(chs_conf), 
		.speed(speed), 
		.clk(clk), 
		.chs_power(chs_power), 
		.chs_mode(chs_mode), 
		.pwm_data(pwm_data)
	);
	
	always #25 clk=~clk;
	initial begin
		// Initialize Inputs
		chs_conf = 0;
		speed = 0;

		// Wait 100 ns for global reset to finish
		// #100;
        
		// Add stimulus here
		
		chs_conf = 8'b1101011;
		speed = 8'b00000111;
		#500;
		chs_conf = 8'b1101111;
		speed = 8'b00001111;
		#500;
	end
      
endmodule

