`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 10/22/2019 02:08:23 PM
// Design Name: 
// Module Name: one_bit_full_subtractor_structural
// Project Name: 
// Target Devices: 
// Tool Versions: 
// Description: 
// 
// Dependencies: 
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
//////////////////////////////////////////////////////////////////////////////////


module one_bit_full_subtractor_structural( input logic a, b, bin, output logic d, bout);
	logic n1, n2, n3;
	
    xor( n1, a, b);
	and( n2, ~a, b);
	xor( d, n1, bin);
	and( n3, ~n1, bin);
	or( bout, n3, n2);

endmodule
