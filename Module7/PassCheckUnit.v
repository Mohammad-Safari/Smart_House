`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    16:25:00 02/03/2021 
// Design Name: 
// Module Name:    PassCheckUnit 
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
module PassCheckUnit (
	input  [ 1:0] pass   , // input  [user   password]
	input  [ 1:0] key    , // input  [system password]
	output        equal    // output [(pass==key) : 1]
);

	/* write your code here */
	assign equal = (pass == key) ? 1'b1: 1'b0;
	/* write your code here */

endmodule
