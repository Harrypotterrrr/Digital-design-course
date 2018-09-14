`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2017/10/23 11:16:51
// Design Name: 
// Module Name: encoder83_Pri
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


module encoder83_Pri(
    input [7:0] iData, //八位输入??7~??0,低电平有效
    input iEI, //选通输入信号 EI,低电平有效
    output reg [2:0] oData, //三位编码输出?? 3~?? 0
    output reg oEO //扩展输出信号 EO,高电平有效
);
    always@(*)
    begin
        if(iEI == 0)
        begin
        if(iData[7] == 0)
            oData = 3'b000;
        else if(iData[7:6] == 2'b10)
            oData = 3'b001;
        else if(iData[7:5] == 3'b110)
            oData = 3'b010;
        else if(iData[7:4] == 4'b1110)
            oData = 3'b011;
        else if(iData[7:3] == 5'b11110)
            oData = 3'b100;
        else if(iData[7:2] == 6'b111110)
            oData = 3'b101;
        else if(iData[7:1] == 7'b1111110)
            oData = 3'b110;
        else if(iData[7:0] == 8'b11111110)
            oData = 3'b111;        
        oEO = 1;
        end
        
        else
        begin
            oData = 3'b111;
            oEO = 0;
        end
    end
endmodule
