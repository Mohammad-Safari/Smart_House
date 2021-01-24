`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    19:12:18 01/27/2021 
// Design Name: 
// Module Name:    Multiplier16x16 
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
module Multiplier16x16 (
	input  [15:0] A , // input  [unsigned 16 bits]
	input  [15:0] B , // input  [unsigned 16 bits]
	output [31:0] P   // output [unsigned 32 bits]
);

	assign P = A * B;
	
endmodule