`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 12/04/2019 05:40:54 PM
// Design Name: 
// Module Name: Timer
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


module Timer(input logic clk, reset,
             output logic clk_out);
    
    logic [20:0] count;   
    logic outt;
    assign clk_out = outt;

    always_ff @ (posedge clk, posedge reset)
        begin
            outt <= 0;
            if (reset)
                begin
                    count <= 0;
                    outt <= 0;
                end
            else if (count < 21'd2000000) count <= count + 1;    
            else
                begin
                    count <= 0;
                    outt <= 1;
                end 
        end
endmodule
