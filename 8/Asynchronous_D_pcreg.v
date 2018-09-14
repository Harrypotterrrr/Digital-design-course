`timescale 1ns / 1ps
module Asynchronous_D_pcreg(
    input CLK, //时钟信号，上升沿有效
    input D, //输入信号 D
    input RST_n, //复位信号，低电平有效
    input ena,
    output reg Out //输出信号 Q
);
    always@(posedge CLK or posedge RST_n or negedge RST_n) begin
        if(RST_n == 1)
            Out <= 1'b0;
        else if(ena == 1)
            Out <= D;
    end
endmodule
