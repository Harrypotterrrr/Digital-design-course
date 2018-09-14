`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2017/10/23 08:20:53
// Design Name: 
// Module Name: display7
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


module display7(
    input [3:0] iData, //四位输入 D3~D0
    output reg[6:0] oData //七位译码输出 g~a
);
    always@(*)
    begin
        oData[6] <= (~iData[3] & ~iData[2] & ~iData[1]) | (~iData[3] & iData[2]& iData[1] & iData[0]);
        oData[5] <= (~iData[3] & ~iData[2] & iData[1]) | (~iData[3] & ~iData[2] & ~iData[1] & iData[0]) | (~iData[3] &  iData[2] &  iData[1] & iData[0]);
        oData[4] <= (~iData[3] & ~iData[2] & iData[0]) | (~iData[3] &  iData[2] & ~iData[1]) | (~iData[3] &  iData[2] &  iData[1] & iData[0]) | ( iData[3] & ~iData[2] & ~iData[1] & iData[0]);
        oData[3] <= (~iData[3] & ~iData[2] & ~iData[1] & iData[0]) | (~iData[3] &  iData[2] & ~iData[1] & ~iData[0]) | (~iData[3] &  iData[2] &  iData[1] & iData[0]);
        oData[2] <= (~iData[3] & ~iData[2] &  iData[1] & ~iData[0]);
        oData[1] <= (~iData[3] &  iData[2] & ~iData[1] & iData[0]) | (~iData[3] &  iData[2] &  iData[1] & ~iData[0]);
        oData[0] <= (~iData[3] & ~iData[2] & ~iData[1] & iData[0]) | (~iData[3] &  iData[2] & ~iData[1] & ~iData[0]);
    end
endmodule
