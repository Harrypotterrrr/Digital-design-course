`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2017/10/23 09:51:16
// Design Name: 
// Module Name: encoder83_tb
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


module encoder83_tb;
    reg [7:0]iData;
    wire [2:0]oData;
    initial 
    begin
        iData = 7'b10000000;
        #40
        iData = 7'b01000000;
        #40
        iData = 7'b00100000;
        #40
        iData = 7'b00010000;
        #40
        iData = 7'b00001000;
        #40
        iData = 7'b00000100;
        #40
        iData = 7'b00000010;
        #40
        iData = 7'b00000001;
    end
    encoder83
    encoder83_test(
        .iData(iData),
        .oData(oData)
    );
endmodule
