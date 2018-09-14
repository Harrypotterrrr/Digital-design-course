`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2017/10/23 09:33:22
// Design Name: 
// Module Name: encoder83
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


module encoder83(
    input [7:0] iData, //��λ���� D7~D0,�ߵ�ƽ��Ч
    output reg[2:0] oData //��λ������� Y2~Y0
);
    always@(*)
    begin
        oData[2] <= iData[7] | iData[6] | iData[5] | iData[4];
        oData[1] <= iData[7] | iData[6] | iData[3] | iData[2];
        oData[0] <= iData[7] | iData[5] | iData[3] | iData[1];
    end
endmodule
