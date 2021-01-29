`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    16:00:44 02/03/2021 
// Design Name: 
// Module Name:    MemoryUnit 
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
module MemoryUnit (
	input         arst , // async  reset
	input         clk  , // clock  posedge
	input         wren , // write  enabledata
	input  [34:0] din  , // input  data
	output [34:0] dout   // output data
);
   
	reg [34:0] mem;
	assign dout = mem;
	always @ (posedge clk or posedge arst) 
		if(arst)
			mem = 0;
		else if (wren)
			mem = din;
	
endmodule
