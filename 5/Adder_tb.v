`timescale 1ns / 1ps
module Adder_tb;
    reg iSA; //��������źţ� iSA Ϊ 1 ��ʾ�з�������;
    //iSA Ϊ 0 ��ʾ�޷�������
    reg [7:0] iData_a; //8 λ���� a�� iSA Ϊ 1 ʱ�����λΪ����λ
    reg [7:0] iData_b; //8 λ���� b�� iSA Ϊ 1 ʱ�����λΪ����λ
    wire [8:0] oData; //9 λ�������� iSA Ϊ 1 ʱ�����λΪ����λ
    wire oData_C; //����ļ�������λ��ʶ��

    initial
    begin
        iSA = 0;
        iData_a = 8'b00000000;
        iData_b = 8'b00000000;
        #40
        iData_a = 8'b00001000;
        iData_b = 8'b00000111;
        #40
        iData_a = 8'b00001000;
        iData_b = 8'b00001000;
        #40
        iData_a = 8'b10000000;
        iData_b = 8'b10000000;
        #40
        iData_a = 8'b11111111;
        iData_b = 8'b10000000;
        #40
        iData_a = 8'b11111111;
        iData_b = 8'b11111111;
        #40
        
        iSA = 1;
        iData_a = 8'b00000000;
        iData_b = 8'b00000000;
        #40
        iData_a = 8'b00001000;
        iData_b = 8'b00000111;
        #40
        iData_a = 8'b00001000;
        iData_b = 8'b00001000;
        #40
        iData_a = 8'b10000000;
        iData_b = 8'b10000000;
        #40
        iData_a = 8'b11111111;
        iData_b = 8'b10000000;
        #40
        iData_a = 8'b11111111;
        iData_b = 8'b11111111;
    end
    
    Adder
    Adder_test(
        .iSA(iSA),
        .iData_a(iData_a),
        .iData_b(iData_b),
        .oData(oData),
        .oData_C(oData_C)
    );
endmodule
