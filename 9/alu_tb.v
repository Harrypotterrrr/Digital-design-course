`timescale 1ns / 1ps
module alu_tb;
    reg [31:0] a;    //32 位输入，操作数 1
    reg [31:0] b;    //32 位输入，操作数 2
    reg [3:0] aluc; //4 位输入，控制 alu 的操作
    wire [31:0] r;   //32 位输出，由 a、b 经过 aluc 指定的操作生成
    wire zero;        //0 标志位
    wire carry;       // 进位标志位
    wire negative;   // 负数标志位
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
