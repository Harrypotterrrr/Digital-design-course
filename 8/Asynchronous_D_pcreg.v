`timescale 1ns / 1ps
module Asynchronous_D_pcreg(
    input CLK, //ʱ���źţ���������Ч
    input D, //�����ź� D
    input RST_n, //��λ�źţ��͵�ƽ��Ч
    input ena,
    output reg Out //����ź� Q
);
    always@(posedge CLK or posedge RST_n or negedge RST_n) begin
        if(RST_n == 1)
            Out <= 1'b0;
        else if(ena == 1)
            Out <= D;
    end
endmodule
