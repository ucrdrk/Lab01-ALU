//=========================================================================
// Name & Email must be EXACTLY as in Gradescope roster!
// Name: Allan Knight
// Email: aknig007@ucr.edu
// 
// Assignment name: Lab01 - ALU
// Lab section: 
// TA: 
// 
// I hereby certify that I have not received assistance on this assignment,
// or used code, from ANY outside source other than the instruction team
// (apart from what was provided in the starter file).
//
//=========================================================================

`timescale 1ns / 1ps

//  Constant definitions 

module myalu # ( parameter NUMBITS = 16 ) (
    input wire clk, 
    input wire reset ,  
    input  wire[NUMBITS-1:0] A, 
    input  wire[NUMBITS-1:0] B, 
    input wire [2:0]opcode, 
    output reg [NUMBITS-1:0] result,  
    output reg carryout ,
    output reg overflow , 
    output reg zero  );

// ------------------------------
// Insert your solution below
// ------------------------------ 
always @(A, B, opcode) begin
    carryout = 0;
    case (opcode)
        3'b000 : {carryout,result} = A + B;
        3'b001 : result = $signed(A) + $signed(B);       
        3'b010 : {carryout,result} = A - B;
        3'b011 : result = $signed(A) - $signed(B);
        3'b100 : result = A & B;
        3'b101 : result = A | B;
        3'b110 : result = A ^~ B;
        3'b111 : result = A >> 1;
    endcase

    overflow = (opcode == 3'b001 || opcode === 3'b011) && 
               (($signed(A) >= 0 && $signed(B) >= 0 && $signed(result) <  0) || 
               ($signed(A) < 0  && $signed(B) < 0  && $signed(result) >= 0));
    zero = result === 0;
end

endmodule
