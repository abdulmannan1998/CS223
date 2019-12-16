`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 12/04/2019 08:13:37 PM
// Design Name: 
// Module Name: Register
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


module Register(input logic clk, reset, load,
                output [15:0] q);
                
    logic [15:0] outt = 0;
    assign q = outt;
    
    always_ff @ (posedge clk, posedge reset)
    begin
        if(reset) outt <= 0;
        else if (load) outt <= outt + 1; 
    end                        
endmodule
