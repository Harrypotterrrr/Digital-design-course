`timescale 1ns / 1ps
module Pcreg(
    input clk, //1 位输入，寄存器时钟信号，上升沿时为 PC 寄存器赋值
    input rst, //1 位输入， 异步重置信号，高电平时将 PC 寄存器清零
    //注：当 ena 信号无效时， rst 也可以重置寄存器
    input ena, //1 位输入,有效信号高电平时 PC 寄存器读入 data_in的值，否则保持原有输出
    input [31:0] data_in, //32 位输入，输入数据将被存入寄存器内部
    output wire [31:0] data_out //32 位输出，工作时始终输出 PC
    //寄存器内部存储的值
);
    genvar i;
    generate
        for(i = 0 ; i <= 31 ; i = i + 1) begin
            Asynchronous_D_pcreg
            Asynchronous_D_pcreg_test0(
                .CLK(clk),
                .D(data_in[i]),
                .RST_n(rst),
                .ena(ena),
                .Out(data_out[i])
            );
        end
    endgenerate
endmodule
