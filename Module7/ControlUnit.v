`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    16:21:12 02/03/2021 
// Design Name: 
// Module Name:    ControlUnit 
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
`define AAA 3'b001 // IDLE
`define BBB 3'b010 // ACTIVE
`define CCC 3'b011 // REQUEST
`define DDD 3'b100 // STORE
`define EEE 3'b101 // TRAP
`define FFF 3'b111 // FFF

`define STATE_IDLE    3'b001
`define STATE_ACTIVE  3'b010
`define STATE_REQUEST 3'b011
`define STATE_STORE   3'b100
`define STATE_TRAP    3'b101
`define STATE_OTHERS  3'b111


module ControlUnit (
	input         arst      , // async  reset
	input         clk       , // clock  posedge
	input         request   , // request input (asynch) 
	input         confirm   , // confirm input 
	input  [ 1:0] password  , // password from user
	input  [ 1:0] syskey    , // key  from memoty unit
	input  [34:0] configin  , // conf from user
	output [34:0] configout , // conf to memory unit
	output        write_en  , // conf mem write enable
	output [ 2:0] dbg_state   // current state (debug)
	);
		// initialization
		// Password Check
		wire passed;
		reg  enable;
		
		// enable data
		assign write_en = enable;
		
		assign configout = configin;
		
		// Password validator unit
		PassCheckUnit passu(syskey, password, passed);
		
		// Memory Unit Connection
		// MemoryUnit    memou(arst, clk, write_en, configin, configout);

//////////////////////////////////////////////////////////////////////////////////
		// moore machine
		reg [2:0] prestate, nxtstate;
		assign dbg_state = prestate;
		// async    and    clock    operations
		always @ (posedge clk or posedge arst or negedge request)
			// output will be reset in prestate sensitive always
			if (arst || ~request)          prestate = `STATE_IDLE;
			
			// state    change(nxtstate)   will    be   affected
			//	(to prestate)     according   to    last     input
			else begin            
				if ((nxtstate == `STATE_STORE)
				&&  (prestate == `STATE_REQUEST))         enable = 1'b1;
				else													enable = 1'b0;
				prestate = nxtstate; 
			end
		
		
		// next state & state operations
		
		// next state pre-determination
		always @ (prestate or confirm or passed or request)
			case(prestate)
			
				`STATE_IDLE:   if     (      request     ) nxtstate = `STATE_ACTIVE;
									else                        nxtstate =  prestate; //`STATE_IDLE;
				
				`STATE_ACTIVE:	if     (confirm &&  passed) nxtstate = `STATE_REQUEST;            
				               else if(confirm && ~passed) nxtstate = `STATE_TRAP;
									else                   		 nxtstate =  prestate; //`STATE_ACTIVE;
				
				`STATE_REQUEST:if     (      confirm     ) nxtstate = `STATE_STORE;
									else                        nxtstate =  prestate; //`STATE_REQUEST;
				
				`STATE_TRAP:	                            nxtstate =  prestate; //`STATE_TRAP;
				
//				`STATE_STORE:  // nothing actually happens at this state beacause request has been fulfilled and another request must be issued
				
//				`STATE_OTHERS: // because our machine implements minimal cost plan we consider this as D.C.
				
				default:       									 nxtstate =  prestate;  //`STATE_IDLE; // IDLE STATE can help to minimalize risk
				
			endcase	


endmodule
