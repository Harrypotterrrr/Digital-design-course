`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2017/10/16 08:40:23
// Design Name: 
// Module Name: transmission8_tb
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

`timescale 1ns/1ns
module transmission8_tb;
    reg A,B,C;
    reg [7:0]iData;
    wire [7:0]oData;
    initial
    begin
    iData = 8'b11111110;
    #40
    iData = 8'b11111101;
    #40
    iData = 8'b11111011;
    #40
    iData = 8'b11110111;
    #40
    iData = 8'b11101111;
    #40
    iData = 8'b11011111;
    #40
    iData = 8'b10111111;
    #40
    iData = 8'b01111111;
    end
    initial
    begin
    A = 0;
    B = 0;
    C = 0;
    #40    
    A = 0;
    B = 0;
    C = 1;
    #40
    A = 0;
    B = 1;
    C = 0;
    #40
    A = 0;
    B = 1;
    C = 1;
    #40
    A = 1;
    B = 0;
    C = 0;
    #40
    A = 1;
    B = 0;
    C = 1;
    #40
    A = 1;
    B = 1;
    C = 0;
    #40
    A = 1;
    B = 1;
    C = 1;
    end
    transmission8
    transmission8_test(
        .iData(iData),
        .A(A),
        .B(B),
        .C(C),
        .oData(oData)
    );
endmodule
