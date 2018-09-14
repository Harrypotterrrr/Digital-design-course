`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2017/10/14 13:58:32
// Design Name: 
// Module Name: selector41_tb
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
module selector41_tb;
    reg[3:0] iC0;
    reg[3:0] iC1;
    reg[3:0] iC2;
    reg[3:0] iC3;
    reg iS0;
    reg iS1;
    wire[3:0] oZ;
    
    initial
    begin
    iC0 = 4'b0001;
    iC1 = 4'b0011;
    iC2 = 4'b0111;
    iC3 = 4'b1111;
    end 
    
    initial
    begin
    iS0 = 0;
    iS1 = 0;
    #40
    iS0 = 1;
    iS1 = 0;
    #40
    iS0 = 0;
    iS1 = 1;
    #40
    iS0 = 1;
    iS1 = 1;
    end
    
    selector41
    selector41_test(
        .iC0(iC0),
        .iC1(iC1),
        .iC2(iC2),
        .iC3(iC3),
        .iS0(iS0),
        .iS1(iS1),
        .oZ(oZ)
        );
endmodule
