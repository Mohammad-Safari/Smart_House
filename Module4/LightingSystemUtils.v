`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    11:28:25 02/01/2021 
// Design Name: 
// Module Name:    LightingSystemUtils 
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
module Min_Decoder4x16(
	input [3:0]         code ,
	output reg [15:0] decode
    );
	 reg[4:0] i;
	 reg state;
	 always @ (code) begin
		state = 1;
		// traverse      through    all 16 lamps
		for(i = 0; i <= 4'b1111; i = i + 1) begin
			if(code == i) // if we meet the bound
				state = 0; // from now we turn off
			decode[i] = state;
		 end
	 end

endmodule
