`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2017/10/22 20:14:48
// Design Name: 
// Module Name: decoder_tb
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
module decoder_tb;
    reg [2:0] iData; //三位输入 D2,D1,D0
    reg [1:0] iEna; //使能信号 G1,G2
    wire [7:0] oData; //八位译码输出?? 7~?? 0,低电平有效
    initial
    begin
        iEna = 2'b10;
    end
    initial
    begin
        iData = 3'b000;
        #40
        iData = 3'b001;
        #40
        iData = 3'b010;
        #40
        iData = 3'b011;
        #40
        iData = 3'b100;
        #40
        iData = 3'b101;
        #40
        iData = 3'b110;
        #40
        iData = 3'b111;
    end
    decoder
    decoder_test(
        .iData(iData),
        .iEna(iEna),
        .oData(oData)
    );
endmodule
