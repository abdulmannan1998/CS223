`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 11/19/2019 05:34:32 AM
// Design Name: 
// Module Name: StartCar
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


module StartCar(input logic s, clk, reset, clockwise,
                output logic [3:0] q);
                
    logic n3;
    always_comb
    begin
        if (s) n3 = clk;
        else n3 = 0;
    end
    FSMDriver fsm(n3, reset, clockwise, q);
endmodule