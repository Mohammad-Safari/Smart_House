`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    16:24:30 02/01/2021 
// Design Name: 
// Module Name:    LightDance 
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
module LightDance (
	input        arst  , // async  reset
	input        clk   , // clock  posedge
	input        din   , // input  data
	input        load  , // load   enable 
	input  [7:0] pdata , // load   data
	output [7:0] qdata   // output data
);

	wire [7:0] in;
	
	assign in[7] = qdata[0]^din;
	assign in[6] = qdata[7];
	assign in[5] = qdata[0]^qdata[6];
	assign in[4] = qdata[0]^qdata[5];
	assign in[3] = qdata[4];
	assign in[2] = qdata[3];
	assign in[1] = qdata[0]^qdata[2];
	assign in[0] = qdata[0]^qdata[1];
	
	genvar i;
	generate
		for(i = 7; i >= 0; i = i - 1) begin : DFF
				DFlop DFF(arst, clk, in[i], load, pdata[i], qdata[i]);
		end
	endgenerate

endmodule
