`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2017/10/14 13:16:38
// Design Name: 
// Module Name: selector41
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
module selector41(
    input [3:0] iC0,
    input [3:0] iC1,
    input [3:0] iC2,
    input [3:0] iC3,
    input signed iS0,
    input signed iS1,
    output reg [3:0] oZ
    );
    always @(*)
        case({iS1,iS0})
        2'b00:  oZ = iC0;
        2'b01:  oZ = iC1;
        2'b10:  oZ = iC2;
        default:oZ = iC3;
        endcase
endmodule

/*
   reg [3:0]temp0,temp1,temp2,temp3;
always @(*)
begin
     temp0 = iC0 & ~{{3{iS0}},iS0} & ~{{3{iS1}},iS1};
     temp1 = iC1 &  {{3{iS0}},iS0} & ~{{3{iS1}},iS1};
     temp2 = iC2 & ~{{3{iS0}},iS0} &  {{3{iS1}},iS1};
     temp3 = iC3 &  {{3{iS0}},iS0} &  {{3{iS1}},iS1};
     oZ = temp0 | temp1 | temp2 | temp3;
 end
 */
 
/*
        temp0 = iC0 & ~iS0 & ~iS1;
        temp1 = iC1 &  iS0 & ~iS1;
        temp2 = iC2 & ~iS0 &  iS1;
        temp3 = iC3 &  iS0 &  iS1;
        oZ = temp0 | temp1 | temp2 | temp3;

        temp0 = iC0 & $signed(~iS0) & $signed(~iS1);
        temp1 = iC1 & $signed( iS0) & $signed(~iS1);
        temp2 = iC2 & $signed(~iS0) & $signed( iS1);
        temp3 = iC3 & $signed( iS0) & $signed( iS1);
*/