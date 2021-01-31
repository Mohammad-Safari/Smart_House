`timescale 1ns / 1ps

////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer:
//
// Create Date:   23:13:22 02/06/2021
// Design Name:   ControlUnit
// Module Name:   F:/sh7/tb_ControlUnit.v
// Project Name:  sh7
// Target Device:  
// Tool versions:  
// Description: 
//
// Verilog Test Fixture created by ISE for module: ControlUnit
//
// Dependencies:
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
////////////////////////////////////////////////////////////////////////////////

module tb_ControlUnit;

	// Inputs
	reg arst;
	reg clk;
	reg request;
	reg confirm;
	reg [1:0] password;
	reg [1:0] syskey;
	reg [34:0] configin;

	// Outputs
	wire [34:0] configout;
	wire write_en;
	wire [2:0] dbg_state;

	// Instantiate the Unit Under Test (UUT)
	ControlUnit uut (
		.arst(arst), 
		.clk(clk), 
		.request(request), 
		.confirm(confirm), 
		.password(password), 
		.syskey(syskey), 
		.configin(configin), 
		.configout(configout), 
		.write_en(write_en), 
		.dbg_state(dbg_state)
	);

	initial begin
		// Initialize Inputs
		syskey = 2'b11;
		password = 2'b11;
		clk = 1'b0;
		configin = 35'b11111111111111111111011111111111111;
		arst = 1'b0;
		arst = #10 1'b1; // change
		arst = #10 1'b0; // change
		#100;
		request = 1'b1;
		#100;
		confirm = 1'b1;
		#100;
		#100;
		#100;

		// Wait 100 ns for global reset to finish
		#100;
        
		// Add stimulus here

	end
	initial begin
		repeat(20)
		#50 clk = ~clk;
	end
      
endmodule

