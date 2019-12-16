`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 12/04/2019 07:23:11 PM
// Design Name: 
// Module Name: MasterModule
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


module MasterModule(input logic clk2, mastermode, slavemode, clk, reset, enCmaster, enCslave,
                    output logic masterled, slaveled, enCmasterled, enCslaveled, a, b, c, d, e, f, g, dp, [3:0] an);

    logic [5:0] count, time2wait;
    logic loadM, loadS, clearM = 0, clearS = 0;
    logic [15:0] qM, qS, qI;
    logic [3:0] dig0, dig1, dig2, dig3;
    logic master, slave;
    int start = 0;
    //integer value0, value1, value2, value3;
    
    always_comb
    begin
        if(mastermode)
        begin
            master = mastermode;
            slave = 0;
        end
        else if(slavemode)
        begin
            slave = slavemode;
            master = 0;
        end
        else if(enCmaster)
        begin
            master = 1;
            slave = 0;
        end
        else if(enCslave)
        begin
            slave = 1;
            master = 0;
        end
        else begin
            master = 0;
            slave = 0;
        end
    end
    
    Counter Cmaster(clk, reset, master, slave, loadM);
    Counter Cslave(clk, reset, master, slave, loadS);
    Register Regmaster(clk, clearM, loadM, qM);
    Register Regslave(clk, clearS, loadS, qS);
    
    always_comb
    begin
        if(master)
        begin
            time2wait = 6'd50;
        end
        else if (slave)
        begin
            time2wait = 6'd25;
        end
        else time2wait = 1;  
    end
    
    always_ff @ (posedge clk, posedge reset)
    begin
        if (reset)
        begin
            clearS <= 1;
            clearM <= 1;
            qI <= {16{1'b0}};
        end
        else if (mastermode)
        begin
            clearS <= 1;
            clearM <= 0;
            qI <= qM;
        end
        else if (slavemode)
        begin
            clearS <= 0;
            clearM <= 1;
            qI <= qS;
        end
        else if (enCmaster)
        begin
            clearS <= 1;
            clearM <= 0;
            qI <= qM;
            enCmasterled <= 1;
            enCslaveled <= 0;
        end
        else if (enCslave)
        begin
            clearS <= 0;
            clearM <= 1;
            qI <= qS;
            enCmasterled <= 0;
            enCslaveled <= 1; 
        end
        else
        begin
            enCmasterled <= 0;
            enCslaveled <= 0;
            qI <= {16{1'b0}};
        end
        
        dig0 <= qI[3:0];
        dig1 <= qI[7:4];
        dig2 <= qI[11:8];
        dig3 <= qI[15:12];
    end
    
    //assign count = time2wait;
    
    always_ff @(posedge clk)
    begin
        if((count < time2wait) && (start != 0)) count <= count + 1;
        else if (master)
        begin
             masterled <= ~masterled;
             slaveled <= 0;
             count <= 0;
             start = 1;
        end
        else if (slave)
        begin
             slaveled <= ~slaveled;
             masterled <= 0;
             count <= 0;
             start = 1;
        end
        else
        begin
            masterled <= 1;
            slaveled <= 1;
            count <= 0;
            start = 0;
        end 
    end
    
    SevenSegmentDisplay mySeg(clk2, dig0, dig1, dig2, dig3, a, b, c, d, e, f, g, dp, an);
endmodule
