`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    00:38:44 01/28/2021 
// Design Name: 
// Module Name:    GasEngineUtils 
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
module ShiftRegister#(integer S = 8)(
	input        shiftin, // value   to  enter   register    in order
	input [S-1:0] loadin, // values  for loading into register houses
	input            clk, //                                    clock
	input          shift, // shift ctrl(highest priority in one clock)
	input           load, // load control(least priority in one clock)
	output      shiftout, // output       of       shift     operation
	output [S-1:0]  data  // for   asyncronous   access   to read data
    );
	reg     [S-1:0] data;
	reg         shiftout;
	always @ (posedge clk) begin
		// shift data    into register
		if      (shift) begin 
			// throwing   last bit  out
			shiftout  = data[0];
			// shift interbits to right
			for  (integer i = S - 1; i > 1; i = i - 1) data[i-1] = data[i];
			// insert  new  first   bit
			data[S-1] = shiftin;
		end
		// load   data   into register
		else if (load)
			for  (integer i = S - 1; i > 0; i = i - 1)   data[i] = loadin[i];
	end

endmodule
