`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 11/20/2019 04:27:35 AM
// Design Name: 
// Module Name: ClockDivider2
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


module ClockDivider2(input logic clk, a, b,
                    output logic clk_out);
    
    logic [23:0] count = {24{1'b0}};
    logic [23:0] count1 = {24{1'b0}};
    logic clk_NoBuf;
    
    always@ (posedge clk) begin
        if (b) begin
            count <= count + 1;
        end
        else if (a) begin
            count1 <= count1 + 1;
        end
        else begin
            count = 24'd0;
            count1 = 24'd0;
        end
    end
    // you can modify 25 to have different clock rate
    always_comb begin
        if(b) begin
            clk_NoBuf = count[23];
        end
        else if(a) begin
            clk_NoBuf = count1[23];
        end
        else clk_NoBuf = 0;
    end
    
    BUFG BUFG_inst (.I(clk_NoBuf), // 1-bit input: Clock input
                    .O(clk_out) // 1-bit output: Clock output
                                  );
endmodule
