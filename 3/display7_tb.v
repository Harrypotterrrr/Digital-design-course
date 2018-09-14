`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2017/10/23 08:47:13
// Design Name: 
// Module Name: display7_tb
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


module display7_tb;
    reg[3:0] iData; //四位输入 D3~D0
    wire[6:0] oData;//七位译码输出 g~a
    initial
    begin
        iData = 4'b0000;
        #40
        iData = 4'b0001;
        #40  
        iData = 4'b0010;
        #40
        iData = 4'b0011;
        #40
        iData = 4'b0100;
        #40
        iData = 4'b0101;
        #40
        iData = 4'b0110;
        #40
        iData = 4'b0111;
        #40
        iData = 4'b1000;
        #40
        iData = 4'b1001;
    end
    display7
    display7_test(
        .iData(iData),
        .oData(oData)
    );
endmodule
