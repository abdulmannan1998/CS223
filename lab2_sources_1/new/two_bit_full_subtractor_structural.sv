`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 10/22/2019 02:08:23 PM
// Design Name: 
// Module Name: two_bit_full_subtractor_structural
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


module two_bit_full_subtractor_structural( input logic a0, b0, b0in, a1, b1, output logic d0, d1, b1out);
	
	logic b0out;

	one_bit_full_subtractor_structural fs1( a0, b0, b0in, d0, b0out);
    one_bit_full_subtractor_structural fs2( a1, b1, b0out, d1, b1out);

endmodule
