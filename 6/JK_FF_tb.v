`timescale 1ns / 1ps
module JK_FF_tb;
    reg CLK; //时钟信号，上升沿有效
    reg J; //输入信号 J
    reg K; //输入信号 K
    reg RST_n; //复位信号，低电平有效
    wire Q1; //输出信号 Q
    wire Q2; //输出信号 Q
    
    initial begin
        CLK = 0;
        RST_n = 0;
        J = 0;
        K = 0;

        forever begin
            #40
            J = 1;
            K = 0;
            #40
            J = 0;
            K = 1;
            #40
            J = 1;
            K = 1;
            #40
            J = 0;
            K = 0;
        end
    end
    
    always #10 CLK = ~CLK;
    always #160 RST_n = ~RST_n;
    
    JK_FF
    JK_FF_test(
        .CLK(CLK),
        .J(J),
        .K(K),
        .RST_n(RST_n),
        .Q1(Q1),
        .Q2(Q2)
    );
    
endmodule
