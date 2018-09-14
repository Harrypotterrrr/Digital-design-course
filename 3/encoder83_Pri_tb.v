`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2017/10/23 11:18:01
// Design Name: 
// Module Name: encoder83_Pri_tb
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


module encoder83_Pri_tb;
    reg [7:0] iData;
    reg iEI;
    wire [2:0] oData;
    wire oEO;
    initial
    begin
        iData = 8'b11111111;
        #40
        iData = 8'b00000000;
        #40
        iData = 8'b10000000;
        #40
        iData = 8'b11000000;
        #40
        iData = 8'b11100000;
        #40
        iData = 8'b11110000;
        #40
        iData = 8'b11111000;
        #40
        iData = 8'b11111100;
        #40
        iData = 8'b11111110;
    end
    initial
    begin
    iEI = 1;
    #40
    iEI = 0;
    end
    
    encoder83_Pri
    encoder83_Pri_test(
        .iData(iData),
        .iEI(iEI),
        .oData(oData),
        .oEO(oEO)
    );
endmodule
