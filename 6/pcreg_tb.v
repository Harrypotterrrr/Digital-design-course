`timescale 1ns / 1ps
module pcreg_tb;
    reg clk; //1 位输入，寄存器时钟信号，上升沿时为 PC 寄存器赋值
    reg rst; //1 位输入， 异步重置信号，高电平时将 PC 寄存器清零
    //注：当 ena 信号无效时， rst 也可以重置寄存器
    reg ena; //1 位输入,有效信号高电平时 PC 寄存器读入 data_in
    //的值，否则保持原有输出
    reg [31:0] data_in; //32 位输入，输入数据将被存入寄存器内部
    wire [31:0] data_out; //32 位输出，工作时始终输出 PC
    //寄存器内部存储的值

    initial begin
        clk = 0;
        rst = 0;
        ena = 0;
        data_in = 32'b11111111111111111111111111111111;
        #160
        data_in = 32'b00000000000000001111111111111111;
    end
    always #20 clk = ~clk;
    always #40 ena = ~ena;
    always #80 rst = ~rst;
    pcreg
    pcreg_test(
        .clk(clk),
        .rst(rst),
        .ena(ena),
        .data_in(data_in),
        .data_out(data_out)
    );
endmodule