`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2017/10/16 08:26:33
// Design Name: 
// Module Name: transmission8
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


module transmission8(
    input [7:0] iData,
    input A,
    input B,
    input C,
    output reg [7:0] oData
    );
    always@(*)
    begin
    oData = 8'b11111111;
    case({A,B,C})
        3'b000: oData[0] = iData[0];
        3'b001: oData[1] = iData[1];
        3'b010: oData[2] = iData[2];
        3'b011: oData[3] = iData[3];
        3'b100: oData[4] = iData[4];
        3'b101: oData[5] = iData[5];
        3'b110: oData[6] = iData[6];
        default: oData[7] = iData[7];
    endcase
    end
endmodule
/*
·½·¨¶þ
always@(*)
    begin
    temp[0] = iData[0] & ~A & ~B & ~C;
    temp[1] = iData[1] & ~A & ~B &  C;
    temp[2] = iData[2] & ~A &  B & ~C;
    temp[3] = iData[3] & ~A &  B &  C;
    temp[4] = iData[4] &  A & ~B & ~C;
    temp[5] = iData[5] &  A & ~B &  C; 
    temp[6] = iData[6] &  A &  B & ~C;
    temp[7] = iData[7] &  A &  B &  C;
    mid = temp[0] | temp[1] | temp[2] | temp[3] | temp[4] | temp[5] | temp[6] | temp[7];
    oData[0] = mid |  A |  B  |  C;
    oData[1] = mid |  A |  B  | ~C;
    oData[2] = mid |  A | ~B  |  C;
    oData[3] = mid |  A | ~B  | ~C;
    oData[4] = mid | ~A |  B  |  C;
    oData[5] = mid | ~A |  B  | ~C;
    oData[6] = mid | ~A | ~B  |  C;
    oData[7] = mid | ~A | ~B  | ~C;
    end*/