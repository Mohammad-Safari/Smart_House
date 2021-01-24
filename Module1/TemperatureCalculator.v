`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    19:20:56 01/27/2021 
// Design Name: 
// Module Name:    TemperatureCalculator 
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
module TemperatureCalculator (
	input  [31:0] tc_base  , // base [environment degree ]
	input  [ 7:0] tc_ref   , // ref  [system work voltage]
	input  [15:0] adc_data , // adc  [sensor digital data]
	output [31:0] tempc      // temp [temperature celsius]
);
	wire [15:0] ref2;
	Multiplier8x8 Mult18(tc_ref, tc_ref, ref2);
	
	wire [15:0] mul_operand;
	assign mul_operand = {1'b0,adc_data[14:0]}; // ignoring sign bit in this step
	
	wire [31:0] sum_operand;
	Multiplier16x16 Mult16(mul_operand, ref2, sum_operand);
	
	// devision by 64(=2^6) , by shifting 6 bits to right
	wire [31:0] divided_sum_operand;
	assign divided_sum_operand = {6'b000000, sum_operand[31:6]};
	
	AdderSubtractor32x32 AddSub32(tc_base, divided_sum_operand, adc_data[15], tempc);


endmodule
