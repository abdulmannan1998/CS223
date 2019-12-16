`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 10/22/2019 01:57:01 PM
// Design Name: 
// Module Name: one_bit_full_subtractor_df
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


module one_bit_full_subtractor_df( input logic a, b, bin, output logic d, bout);
	assign d = (a ^ b) ^ bin;
	assign bout = (~a & b) + bin & (~(a ^ b));
endmodule
