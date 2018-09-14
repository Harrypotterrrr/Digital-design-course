`timescale 1ns / 1ps
module Asynchronous_D_FF(
    input CLK, //时钟信号，上升沿有效
    input D, //输入信号 D
    input RST_n, //复位信号，低电平有效
    output reg Q1 = 1, //输出信号 Q
    output reg Q2 = 0 //输出信号 ?
);
    always@(posedge CLK or negedge RST_n) begin
    
        if(RST_n == 1) begin
            Q1 = D;
            Q2 = ~Q1;
        end    
        else begin
            Q1 <= 1'b0;
            Q2 <= 1'b1;
        end
    end
endmodule6