`timescale 1ns / 1ps
module Synchronous_D_FF(
    input CLK, //ʱ���źţ���������Ч
    input D, //�����ź� D
    input RST_n, //��λ�źţ��͵�ƽ��Ч
    output reg Q1 = 1, //����ź� Q
    output reg Q2 = 0 //����ź� ?
);
    always@(posedge CLK) begin
        if(RST_n == 0) begin
            Q1 <= 1'b0;
            Q2 <= 1'b1;        
        end
        else begin
            Q1 = D;
            Q2 = ~Q1;
        end
    end
endmodule
