`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    00:38:21 01/28/2021 
// Design Name: 
// Module Name:    TemperatureCalculatorUtils 
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
module Multiplier#(integer s = 8)(
	input [s-1:0] oprnd1,
	input [s-1:0] oprnd2,
	output [s+s-1:0] prdct
    );
	
	assign prdtc = oprnd1 * oprnd2;

endmodule

module AdderSubtractor#(integer s = 32)(
	input [s-1:0] oprnd1,
	input [s-1:0] oprnd2,
	input sub_add,
	output [s-1:0] res
    );
	
	assign res = (sub_add) ? oprnd1 - oprnd2 : oprnd1 + oprnd2;

endmodule
//////////////////////////////////////////////////////////////////////////////////
module HalfAdder(
	input x  ,
	input y  ,
	output s ,
	output c 
  );

   assign s = x^y; // xor
   assign c = x&y; // and

endmodule

module FullAdder(
	input x     ,
	input y     ,
	input cin   ,
	output s    ,
	output cout 
   );

   wire s1, c1, c2;
   HalfAdder ha1(x, y, s1, c1);
   HalfAdder ha2(cin, s1, s, c2);

   assign cout = c1 + c2;

endmodule

module Adder_4b(
  input [3:0] x   , 
  input [3:0] y   ,
  input cin       ,
  output[3:0] sum ,
  output cout
  );

  wire c1, c2, c3;

  // 4-bit Adder
  FullAdder fa1(x[0],y[0],cin,sum[0],c1);
  FullAdder fa2(x[1],y[1],c1,sum[1],c2);
  FullAdder fa3(x[2],y[2],c2,sum[2],c3);
  FullAdder fa4(x[3],y[3],c3,sum[3],cout);

endmodule

module Mult_4b(
	input [3:0] x       ,
	input [3:0] y       ,
	output reg [7:0] p  ,
	output reg cout
	);
	reg [8:0] c; // carry-ins
	integer i,j;

	// for (i = 0; i < 4 ;i = i + 1)
		// for (j = 0; j < 4 ;j = j + 1) 
			// p[i+j] = 0;

	for (i = 0; i < 4 ;i = i + 1)
		for (j = 0; j < 4 ;j = j + 1) 
			// p[i+j] = p[i+j] + (x[i] & y[j]);
			Adder_4b(p[i+j], (x[i] && y[j]), c[i+j], p[i+j], c[i+j+1]);
	assign cout = c[8];

endmodule
