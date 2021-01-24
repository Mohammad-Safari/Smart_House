`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    19:43:22 01/27/2021 
// Design Name: 
// Module Name:    Multiplier8x8 
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
module Multiplier8x8 (
	input  [7:0] A , // input  [unsigned 8 bits]
	input  [7:0] B , // input  [unsigned 8 bits]
	output [15:0] P   // output [unsigned 16 bits]
);

	assign P = A * B;

endmodule
