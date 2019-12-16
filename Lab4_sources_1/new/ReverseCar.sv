`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 11/19/2019 05:38:36 AM
// Design Name: 
// Module Name: ReverseCar
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


module ReverseCar(input logic r, x, y, s, clk, reset,
                  output logic [3:0] q);
    logic n1;           
    always_comb
    begin
        if(r)
        begin
            n1 = 0;
        end
        else begin
            n1 = 1;
        end
    end
    CarSpeed car(x, y, s, clk, reset, n1, q);
endmodule
