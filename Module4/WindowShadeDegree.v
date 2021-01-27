`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    11:27:49 02/01/2021 
// Design Name: 
// Module Name:    WindowShadeDegree 
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
module WindowShadeDegree (
	input  [3:0] tcode  , // time code    [table2 time code   ]
	input  [3:0] ulight , // user light   [light degree mode  ]
	output [3:0] wshade   // shade level  [window shade level ]
);

	reg [3:0] deg;
	parameter morning = 4'b0001, afternoon = 4'b0010, evening = 4'b0100, night = 4'b1000;
	always @ (tcode or ulight)
		case(tcode)
			morning:   deg =      4'b1111;
			afternoon: deg =      4'b1100;
			evening:   deg =       ulight;
			night:     deg =      4'b0000;
			default:   deg =      4'b0000;
		endcase
	assign wshade = deg;

endmodule

