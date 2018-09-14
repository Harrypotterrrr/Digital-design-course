`timescale 1ns / 1ps
module JK_FF_tb;
    reg CLK; //ʱ���źţ���������Ч
    reg J; //�����ź� J
    reg K; //�����ź� K
    reg RST_n; //��λ�źţ��͵�ƽ��Ч
    wire Q1; //����ź� Q
    wire Q2; //����ź� Q
    
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
