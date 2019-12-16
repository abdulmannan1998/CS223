`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 11/19/2019 05:36:52 AM
// Design Name: 
// Module Name: CarSpeed
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


module CarSpeed(input logic x, y, s, clk, reset, clockwise,
                output logic [3:0] q);
                
    logic t;
    
    ClockDivider clock(clk, x, y, t);
    StartCar car(s, t, reset, clockwise, q);
    
endmodule