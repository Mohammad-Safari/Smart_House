`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    19:46:36 01/27/2021 
// Design Name: 
// Module Name:    GasDetectorSensor 
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
module GasDetectorSensor (
	input        arst     , // async reset
	input        clk      , // clock posedge
	input        din      , // input data 
	output [2:0] dout       // output data
);

		// mealy machine
		reg [2:0] gas_mode;
		reg [4:0] prestate, nxtstate;
		assign    dout  =   gas_mode;
		
		// states(24 states: 2 initial - 2 separator(pivot) - 
		// 6 dioxide-only  - 8 monoxide-only - 6 methane-only)
		parameter init = 5'b00000 , got_one = 5'b00001,//inits
	
		// first pivot(dioxide vs monoxide and methane)
		gas_piv1 = 5'b01000,
		
		// dioxide 5th digit off & 4th digit on
		di1   = 5'b01001, di2   = 5'b01010, di3    = 5'b01011, di4   = 5'b01100, di5   = 5'b01101, di6   = 5'b01110,
		
		// second pivot      (monoxide   vs    methane)
		gas_piv2 = 5'b10000,	
		
		// monoxide   4th   &   5th   digit on
		mono1 = 5'b11000, mono2 = 5'b11001, mono3  = 5'b11010, mono4 = 5'b11011, mono5 = 5'b11100, mono6 = 5'b11101, mono7 = 5'b11110, mono8 = 5'b11111,
		
		// methane 4th digit off, 5th digit on
		met1  = 5'b10001, met2  = 5'b10010, met3   = 5'b10011, met4  = 5'b10100, met5  = 5'b10101, met6  = 5'b10110;
		
		
		
		
		// arst    and    clock    operations
		always @ (posedge clk or posedge arst)
			// output will be reset in prestate sensitive always
			if (arst) prestate = init;
			// state    change(nxtstate)   will    be   affected
			//	(to prestate)     according   to    last      din
			else      prestate = nxtstate; 
		
		
		// next state & output determination
		
		// state
		always @ (din or prestate)
			case(prestate)
			
				init:    if(din) nxtstate = got_one;  else nxtstate = init;
				got_one: if(din) nxtstate = got_one;  else nxtstate = gas_piv1;
				
				gas_piv1:if(din) nxtstate = gas_piv2; else nxtstate = di1;
				gas_piv2:if(din) nxtstate = met1 ;    else nxtstate = mono1;
				
				di1:     if(din) nxtstate = di2;      else nxtstate = init;
				di2:     if(din) nxtstate = got_one;  else nxtstate = di3;
				di3:     if(din) nxtstate = gas_piv2; else nxtstate = di4;
				di4:     if(din) nxtstate = di5;      else nxtstate = init;
				di5:     if(din) nxtstate = got_one;  else nxtstate = di6;
				di6:     if(din) nxtstate = gas_piv2; else nxtstate = di4;
				
				mono1:   if(din) nxtstate = mono2;    else nxtstate = di1;
				mono2:   if(din) nxtstate = met1;     else nxtstate = mono3;
				mono3:   if(din) nxtstate = mono2;    else nxtstate = mono4;
				mono4:   if(din) nxtstate = mono5;    else nxtstate = init;
				mono5:   if(din) nxtstate = got_one;  else nxtstate = mono6;
				mono6:   if(din) nxtstate = gas_piv2; else nxtstate = mono7;
				mono7:   if(din) nxtstate = mono8;    else nxtstate = init;
				mono8:   if(din) nxtstate = got_one;  else nxtstate = di6;	
				
				met1:    if(din) nxtstate = met2;     else nxtstate = gas_piv1;
				met2:    if(din) nxtstate = got_one;  else nxtstate = met3;
				met3:    if(din) nxtstate = met4;     else nxtstate = di1;
				met4:    if(din) nxtstate = met1;     else nxtstate = met5;
				met5:    if(din) nxtstate = met6;     else nxtstate = di1;
				met6:    if(din) nxtstate = met1;     else nxtstate = mono3;
//				default:                                   nxtstate = init;
			endcase
			
		// output
		always @ (din or prestate)
			case(prestate)
				init:    if(arst)  gas_mode=3'b000; // output asynch reset after async state initialization(reset)
				di6:     if(~din)  gas_mode[2] = 1; // detected in   one clock, will   be   saved      till reset!
				mono8:   if(din)   gas_mode[1] = 1; // detected in   one clock, will   be   saved      till reset!
				met6:    if(~din)  gas_mode[0] = 1; // detected in   one clock, will   be   saved      till reset!
//				default: gas_mode = 3'b000;
			endcase		
		


endmodule