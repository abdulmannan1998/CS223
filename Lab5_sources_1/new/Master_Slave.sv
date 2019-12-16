`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 12/04/2019 06:27:07 PM
// Design Name: 
// Module Name: Master_Slave
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


module Master_Slave(input logic clk, reset, mastermode, slavemode, enCmaster, enCslave,
                    output logic masterled, slaveled, enCmasterled, enCslaveled, a, b, c, d, e, f, g, dp, [3:0] an);
                    
    logic clk_timer;                
                    
    Timer T20msec(clk, reset, clk_timer);
    
    MasterModule mymodule (clk, mastermode, slavemode, clk_timer, reset, enCmaster, enCslave, masterled, slaveled, enCmasterled, enCslaveled, a, b, c, d, e, f, g, dp, an);
endmodule
