`timescale 1ns / 1ps

////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer:
//
// Create Date:   21:09:41 01/28/2021
// Design Name:   TemperatureCalculator
// Module Name:   C:/Users/Mohammad/Projects/Logic Lab/Xilinix ISE/Final/module1_temp_sensor/tb_TemperatureCalculator.v
// Project Name:  module1_temp_sensor
// Target Device:  
// Tool versions:  
// Description: 
//
// Verilog Test Fixture created by ISE for module: TemperatureCalculator
//
// Dependencies:
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
////////////////////////////////////////////////////////////////////////////////

module tb_TemperatureCalculator;

	// Inputs
	reg [31:0] tc_base;
	reg [7:0] tc_ref;
	reg [15:0] adc_data;

	// Outputs
	wire [31:0] tempc;

	// Instantiate the Unit Under Test (UUT)
	TemperatureCalculator uut (
		.tc_base(tc_base), 
		.tc_ref(tc_ref), 
		.adc_data(adc_data), 
		.tempc(tempc)
	);

	initial begin
		// Initialize Inputs
		tc_base = 0;
		tc_ref = 0;
		adc_data = 0;

		// Wait 100 ns for global reset to finish
		#10;
        
		// Add stimulus here
		tc_base = 32'b00000000000000000000000001100100; // 100
		tc_ref = 8'b00101000; // 40
		adc_data = 16'b1000000000001001; // -9
		#10;
		
		// 
		tc_base = 32'b00000000000000000000000001100100; // 100
		tc_ref = 8'b00101000; // 40
		adc_data = 16'b0000000000001001; // 9
		#10;

		// 
		tc_base = 32'b00000000000000000000000001100100; // 100
		tc_ref = 8'b11011000; // -40 !!!!
		adc_data = 16'b1000000000001001; // -9
		#10;
		
		// 
		tc_base = 32'b11111111111111111111111110011100; // -100
		tc_ref = 8'b00101000; // 40
		adc_data = 16'b0000000000001001; // 9
		#10;
	end
      
endmodule

