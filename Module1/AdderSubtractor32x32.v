`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    19:17:43 01/27/2021 
// Design Name: 
// Module Name:    AdderSubtractor32x32 
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
module AdderSubtractor32x32 (
	input  [31:0] A    , // input  [2's complement 32 bits]
	input  [31:0] B    , // input  [2's complement 32 bits]
	input         sel  , // input  [add:sel=0 || sub:sel=1] 
	output [31:0] S      // output [2's complement 32 bits]
);

		assign S = (sel) ? A - B : A + B;

endmodule
