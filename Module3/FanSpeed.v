`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    00:34:50 01/28/2021 
// Design Name: 
// Module Name:    FanSpeedUtils 
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
module FanSpeed (
	input        arst     , // reset [asynch]  
	input        clk      , // clock [posedge] 
	input  [7:0] speed    , // speed [duty-cycle]  
	output       pwm_data   // data  [output]
);

	parameter frq = 8'b11111111;     // given duty    cycle      length
	reg [7:0] counter = 8'b00000000; // shows current clk in duty cycle
	reg       pwd_data;              // output                 register
	assign pwm_data = pwd_data;

	always @ (posedge clk or posedge arst) begin
		if(arst)
			// duty cylce restarts here
			counter = 8'b00000000;
	
		else begin
			// if counter has not reached to speed limit(still throws one)
			if(counter < speed)
				pwd_data = 1'b1;
			// if counter has    passed      speed limit(now throws zeros)
			else if(counter <= frq)
				pwd_data = 1'b0;
			
			// counter   increasement  (modulo   by   duty  cycle  length)
			if(counter < frq)
				counter = counter + 8'b00000001;
			else
				counter = 8'b00000000;
		end
	end
	
endmodule
