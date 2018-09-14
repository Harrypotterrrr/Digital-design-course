`timescale 1ns / 1ps
module Adder_tb;
    reg iSA; //输入控制信号， iSA 为 1 表示有符号运算;
    //iSA 为 0 表示无符号运算
    reg [7:0] iData_a; //8 位加数 a。 iSA 为 1 时，最高位为符号位
    reg [7:0] iData_b; //8 位加数 b。 iSA 为 1 时，最高位为符号位
    wire [8:0] oData; //9 位计算结果。 iSA 为 1 时，最高位为符号位
    wire oData_C; //输出的计算结果进位标识符

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
