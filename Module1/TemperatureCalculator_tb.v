`timescale 1ns / 1ps

////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer:
//
// Create Date:   22:22:26 01/28/2021
// Design Name:   TemperatureCalculator
// Module Name:   F:/AMART_HOUSE/tb_TemperatureCalculator.v
// Project Name:  AMART_HOUSE
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

module TemperatureCalculator_tb;

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
		tc_base = 32'b00000000000000000000000000000001;
		tc_ref = 8'b00001000;
		adc_data = 16'b0000000000000001;

		// Wait 100 ns for global reset to finish
		#100;
        
		// Add stimulus here

	end
      
endmodule

