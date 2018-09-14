`timescale 1ns / 1ps
module Synchronous_D_FF_test;
    reg CLK; //时钟信号，上升沿有效
    reg D; //输入信号 D
    reg RST_n; //复位信号，低电平有效
    wire Q1; //输出信号 Q
    wire Q2; //输出信号 ?
    initial begin
        CLK = 0;
        RST_n = 1;
        D = 1;
    end
    
    always #40 D = ~D;
    always #10 CLK = ~CLK;
    always #80 RST_n = ~RST_n;
    
    Synchronous_D_FF
    Synchronous_D_FF_test(
        .CLK(CLK),
        .D(D),
        .RST_n(RST_n),
        .Q1(Q1),
        .Q2(Q2)
    );
endmodule