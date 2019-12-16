`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 10/22/2019 02:08:23 PM
// Design Name: 
// Module Name: two_bit_full_adder_structural
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


module two_bit_full_adder_structural( input logic a0, b0, c0in, a1, b1, output logic s0, s1, c1out);
	logic c0out;

	one_bit_full_adder_structural fa1( a0, b0, c0in, s0, c0out);
    one_bit_full_adder_structural fa2( a1, b1, c0out, s1, c1out);


endmodule
