`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    11:25:12 02/01/2021 
// Design Name: 
// Module Name:    LampState 
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
module LampState (
	input  [ 3:0] active_lights , // number of active light
	output [15:0] lights_state    // state of lights is on
);

	Min_Decoder4x16 State(active_lights, lights_state);

endmodule

