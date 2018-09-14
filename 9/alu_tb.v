`timescale 1ns / 1ps
module alu_tb;
    reg [31:0] a;    //32 λ���룬������ 1
    reg [31:0] b;    //32 λ���룬������ 2
    reg [3:0] aluc; //4 λ���룬���� alu �Ĳ���
    wire [31:0] r;   //32 λ������� a��b ���� aluc ָ���Ĳ�������
    wire zero;        //0 ��־λ
    wire carry;       // ��λ��־λ
    wire negative;   // ������־λ
    wire overflow;
    
    initial begin
        aluc = 4'b0000;
        a = {8{4'hf}};
        b = {32{1'b0}};
        #320
        a = {8{4'hf}};
        b = {{31{1'b1}},1'b1};
        #320
        a = 32'd16;
        b = 32'd2;
    end
    always #20 aluc = aluc + 1;
    alu alu_test(
        .a(a),
        .b(b),
        .aluc(aluc),
        .r(r),
        .zero(zero),
        .carry(carry),
        .negative(negative),
        .overflow(overflow)
    );
endmodule
