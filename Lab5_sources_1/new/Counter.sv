`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 12/04/2019 06:42:46 PM
// Design Name: 
// Module Name: Counter
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


module Counter(input logic clk, reset, mastermode, slavemode,
               output logic q);
               
    logic [5:0] time2wait = 0;
    logic [5:0] count = 0;
    logic outt;
    assign q = outt;
    
    always_comb
    begin
        if(mastermode) time2wait = 6'd50;
        else if(slavemode) time2wait = 6'd25;
    end
               
    always_ff @ (posedge clk, posedge reset)
        if (reset)
        begin
            outt <= 0;
            count <= 0;
        end 
        else if (count < time2wait)
        begin
            count <= count + 1;
            outt <= 0;
        end
        else if (mastermode || slavemode) 
        begin
            count <= 0;
            outt <= 1;
        end
endmodule





