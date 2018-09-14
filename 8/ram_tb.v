`timescale 1ns / 1ps
module ram_tb;
    reg clk; //存储器时钟信号，上升沿时向 ram 内部写入数据
    reg ena; //存储器有效信号，高电平时存储器才运行，否则输出 z
    reg wena; //存储器读写有效信号，高电平为写有效，低电平为读有效，与 ena同时有效时才可对存储器进行读写
    reg [4:0] addr; //输入地址，指定数据读写的地址
    reg [31:0] data_in; //存储器写入的数据，在 clk 上升沿时被写入
    wire [31:0] data_out; //存储器读出的数据，
    initial begin
        clk = 0;
        ena = 0;
        wena = 0;
        addr = 5'b00000;
        data_in = {{31{1'b0}},1'b1};
        #10
        ena = 1;
    end
    always begin
        #4
        clk = ~clk;
    end
    always begin
        #30
        data_in = data_in * 16; 
        #10
        wena = ~wena; 
    end     //并行执行
    always begin
        #250
        addr = addr + 1;
    end
    ram ram_test(
        .clk(clk),
        .ena(ena),
        .wena(wena),
        .addr(addr),
        .data_in(data_in),
        .data_out(data_out)
    );
endmodule
