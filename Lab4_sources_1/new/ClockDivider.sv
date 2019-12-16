`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 11/19/2019 06:02:06 AM
// Design Name: 
// Module Name: ClockDivider
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


module ClockDivider(input logic clk, a, b,
                    output logic clk_out);
    
    logic [21:0] ctr1 = {22{1'b0}};                
    logic [23:0] count = {24{1'b0}};
    logic [25:0] ctr = {26{1'b0}};
    logic clk_NoBuf;
    
    always@ (posedge clk) begin
        if (!a && !b) begin
            ctr1 = ctr1 + 1;
        end
        else if (!a && b) begin
            count <= count + 1;
        end
        else if (a && !b) begin
            ctr <= ctr + 1;
        end
    end
    // you can modify 25 to have different clock rate
    always_comb begin
        if(!a && !b) clk_NoBuf = ctr1[21];
        else if(!a && b) clk_NoBuf = count[23];
        else if(a && !b) clk_NoBuf = ctr[25];
        else if(a && b) clk_NoBuf = 0;
        else clk_NoBuf = 0;
    end
    
    BUFG BUFG_inst (.I(clk_NoBuf), // 1-bit input: Clock input
                    .O(clk_out) // 1-bit output: Clock output
                                  );
    
endmodule
