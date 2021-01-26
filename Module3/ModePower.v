`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    00:36:34 01/28/2021 
// Design Name: 
// Module Name:    ModePower 
// Project Name: 
// Target Devices: 
// Tool versions: 
// Description: 
//
// Dependencies: 
//
// Revision: 
// Revision 0.01 - File Created
// Additional Comments: 
//
//////////////////////////////////////////////////////////////////////////////////
module ModePower (
	input  [7:0] chs_conf  , // degree [temprature] 
	output [3:0] chs_power , // power  [cooler/heater] 
	output       chs_mode    // model  [heat=1/cool=0]
);
	reg [3:0] counter;
	reg        modulo;
	integer         i; // iterator over 8 bits

	// deassign chs_power;
	// deassign chs_mode;

	always @ (chs_conf) begin
		counter = 4'b0000;
		modulo  = 1'b0;
		for (i = 0; i < 8; i = i + 1) begin
				counter = counter + chs_conf[i];
				modulo  = modulo  + chs_conf[i];
		end
	end
	
	assign chs_power = counter;
	// assign chs_mode = counter % 2;
	assign chs_mode = modulo;
	
endmodule
