`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2017/10/22 20:05:15
// Design Name: 
// Module Name: decoder
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
module decoder(
    input [2:0] iData, //��λ���� D2,D1,D0
    input [1:0] iEna, //ʹ���ź� G1,G2
    output reg [7:0] oData //��λ�������?? 7~?? 0,�͵�ƽ��Ч
);
    always @(*)
    begin
        oData[0] <=  ~iEna[1] |  iEna[0] |  iData[2] |  iData[1] |  iData[0];
        oData[1] <=  ~iEna[1] |  iEna[0] |  iData[2] |  iData[1] | ~iData[0];
        oData[2] <=  ~iEna[1] |  iEna[0] |  iData[2] | ~iData[1] |  iData[0];
        oData[3] <=  ~iEna[1] |  iEna[0] |  iData[2] | ~iData[1] | ~iData[0];
        oData[4] <=  ~iEna[1] |  iEna[0] | ~iData[2] |  iData[1] |  iData[0];
        oData[5] <=  ~iEna[1] |  iEna[0] | ~iData[2] |  iData[1] | ~iData[0];
        oData[6] <=  ~iEna[1] |  iEna[0] | ~iData[2] | ~iData[1] |  iData[0];
        oData[7] <=  ~iEna[1] |  iEna[0] | ~iData[2] | ~iData[1] | ~iData[0];
    end
endmodule