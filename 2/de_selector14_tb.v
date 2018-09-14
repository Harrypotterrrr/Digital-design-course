`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2017/10/15 15:59:33
// Design Name: 
// Module Name: selector14_tb
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
module de_selector14_tb;
    reg iC;
    reg iS0,iS1;
    wire oZ0,oZ1,oZ2,oZ3;
    initial
    begin
    iC = 0;
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
    de_selector14 
    selector14_test(
        .iC(iC),
        .iS0(iS0),
        .iS1(iS1),
        .oZ0(oZ0),
        .oZ1(oZ1),
        .oZ2(oZ2),
        .oZ3(oZ3)
    );
endmodule
