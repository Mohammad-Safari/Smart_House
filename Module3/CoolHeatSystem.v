`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    00:33:55 01/28/2021 
// Design Name: 
// Module Name:    CoolHeatSystem 
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
module CoolHeatSystem (
	input        arst      , // reset [asynch]  
	input        clk       , // clock [posedge] 
	
	input  [7:0] speed     , // speed [duty-cycle]  
	
	input  [7:0] chs_conf  , // degree [temprature] 
	
	output [3:0] chs_power , // power  [cooler/heater] 
	output       chs_mode  , // model  [heat=1/cool=0]

	output       pwm_data    // data  [output]
);

	ModePower MP(chs_conf, chs_power, chs_mode);
	
	FanSpeed FS(arst, clk, speed, pwm_data);

endmodule
