`timescale 1ns / 1ps

////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer:
//
// Create Date:   15:05:35 01/28/2021
// Design Name:   GasDetectorSensor
// Module Name:   C:/Users/Mohammad/Projects/Logic Lab/Xilinix ISE/Final/module2_gas_detector/tb_GasDetectorSensor.v
// Project Name:  module2_gas_detector
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

module tb_GasDetectorSensor;

	// Inputs
	reg arst;
	reg clk = 0;
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

	always #25 clk=~clk;
	initial begin
		// Initialize Inputs
		din  = 0;
		arst = 0;
		
		// async reset
		arst = #1 1; 
		arst = #1 0;
        
		// Add stimulus here
		
		// methane
		din = #12 1;
		din = #50 0;
		din = #50 1;
		din = #50 1;
		
		/// common part
		
		din = #50 1;
		din = #50 0;
		din = #50 1;
		din = #50 0;
		din = #50 1;
		din = #50 0;
		
		/// mono
		
		din = #50 0;
		din = #50 1;
		din = #50 0;
		din = #50 0;
		din = #50 1;
		din = #50 1;
		
		/// di
		
		din = #50 1;
		din = #50 0;
		din = #50 0;
		din = #50 1;
		din = #50 0;
		din = #50 0;
		din = #50 1;
		din = #50 0;
		din = #50 0;
		
		/// reset 
		arst = #1 1; 
		arst = #1 0;
		
		
	end
   

      
endmodule

