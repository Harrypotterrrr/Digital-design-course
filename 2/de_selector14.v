`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2017/10/15 15:35:17
// Design Name: 
// Module Name: selector14
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


module de_selector14(
    input iC,
    input iS1,
    input iS0,
    output oZ0,
    output oZ1,
    output oZ2,
    output oZ3
    );
    or (oZ0, iC, iS0, iS1);
    or (oZ1, iC,~iS0, iS1);
    or (oZ2, iC, iS0,~iS1);
    or (oZ3, iC,~iS0,~iS1);
endmodule
