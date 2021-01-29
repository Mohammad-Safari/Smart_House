`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    16:24:05 02/01/2021 
// Design Name: 
// Module Name:    DFlop 
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
module DFlop (
	input  arst  , // async reset        (most  priority - just    arst )
	input  clk   , // clock posedge
	input  din   , // data  in           (least priority - just    clk  )
	input  eload , // load  enable
	input  dload , // data  load         (mid    pririty - clk and eload)
	output dout    // data  out
);
	reg out;
	assign dout = out;
	always @ (posedge clk or posedge arst)
		if     (arst ) out = 0;
		else if(eload) out = dload;
		else           out = din;
	
endmodule
