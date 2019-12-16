`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 11/19/2019 10:21:55 AM
// Design Name: 
// Module Name: TurnCar
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


module TurnCar(input logic b1, b0, r, x, y, s, clk, reset,
               output logic left, right,
               output logic [3:0] q,
               output logic a, b, c, d, e, f, g, dp,
               output logic [3:0] an);
    
    ReverseCar car(r, x, y, s, clk, reset, q);
    
    logic [3:0] speed3, speed2, speed1, speed0;
    
    always_comb begin
    if(!x && !y)
    begin
        speed3 = 4'd0;
        speed2 = 4'd3;
        speed1 = 4'd5;
        speed0 = 4'd8;
    end
    else if(!x && y)
    begin
        speed3 = 4'd0;
        speed2 = 4'd1;
        speed1 = 4'd7;
        speed0 = 4'd9;
    end
    else if(x && !y)
    begin
        speed3 = 4'd0;
        speed2 = 4'd0;
        speed1 = 4'd4;
        speed0 = 4'd5;
    end
    else
    begin
        speed3 = 4'd0;
        speed2 = 4'd0;
        speed1 = 4'd0;
        speed0 = 4'd0;
    end
    end
    
    logic t;
    ClockDivider2 clock(clk, b1, b0, t);
    always_comb
    if(b0) begin
        right = t;
        left = 0;
    end
    else if(b1) begin
        right = 0;
        left = t;
    end 
    else begin
        right = 0;
        left = 0;
    end
    
    SevSeg_4digit mySeg(clk, speed0, speed1, speed2, speed3, a, b, c, d, e, f, g, dp, an);
    
endmodule
