`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 11/19/2019 05:17:44 AM
// Design Name: 
// Module Name: FSMDriver
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


module FSMDriver( input logic clk, reset, clockwise,
                  output logic [3:0] q);

logic [1:0] state, nextstate;
    
    //state register
    always_ff @ (posedge clk, posedge reset)
        if (reset) state <= 2'b00;
        else state <= nextstate;
        
    //next state logic
    always_comb
    begin
        if(clockwise)
        begin    
            nextstate[0] = ~state[0];
            nextstate[1] = (state[1] ^ state[0]);
        end
        else
        begin    
            nextstate[0] = ~state[0];
            nextstate[1] = (~state[1] & ~state[0]) | (state[1] & state [0]);
        end
    end    

    //output logic
     always_comb
        begin
            q[3] = (~state[1] & ~state[0]) | (state[1] & state[0]);
            q[2] = ~state[1];
            q[1] = ~q[3];
            q[0] = ~q[2];
        end
endmodule
