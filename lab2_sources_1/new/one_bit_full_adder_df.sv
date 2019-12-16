`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 10/22/2019 01:54:17 PM
// Design Name: 
// Module Name: one_bit_full_adder_df
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


module one_bit_full_adder_df( input logic a, b, cin, output logic s, cout);
	
	assign s = (a ^ b) ^ cin;
	assign cout = a & b | (a ^ b) & cin;

endmodule
