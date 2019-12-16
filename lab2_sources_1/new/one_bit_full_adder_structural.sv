`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 10/22/2019 02:08:23 PM
// Design Name: 
// Module Name: one_bit_full_adder_structural
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


module one_bit_full_adder_structural( input logic a, b, cin, output logic s, cout);
	logic n1, n2, n3;
	
    xor( n1, a, b);
	and( n2, a, b);
	xor( s, n1, cin);
	and( n3, n1, cin);
	or( cout, n3, n2);

endmodule
