`timescale 1ns / 1ps
module Regfiles_tb;
    reg clk; //寄存器组时钟信号，下降沿写入数据
    reg rst; //reset 信号，异步复位，高电平时全部寄存器置零
    reg we; //寄存器读写有效信号，高电平时允许寄存器写入数据，低电平时允许寄存器读出数据
    reg [4:0] raddr1; //所需读取的寄存器的地址
    reg [4:0] raddr2; //所需读取的寄存器的地址
    reg [4:0] waddr; //写寄存器的地址
    reg [31:0] wdata; //写寄存器数据，数据在 clk 下降沿时被写入
    wire [31:0] rdata1; //raddr1 所对应寄存器的输出数据
    wire [31:0] rdata2;
    
    initial begin
        clk = 0;
        rst = 1;
        we = 1;
        waddr = 0;
        raddr1 = 5'b00000;
        raddr2 = 5'b11111;
        wdata = 32'b00000001001000110100010101100111;
        // wdata = 8'h01234567
        #10
        rst = 0;
        #500
        rst = 1;
    end
    
    always begin
        #5
        clk = ~clk;
        waddr = waddr + 1;
    end
    always #40 we = ~we;
    always begin
        #20
        raddr1 = raddr1 + 1;
        raddr2 = raddr2 + 1;
    end
    Regfiles Regfiles_test(
        .clk(clk),
        .rst(rst),
        .we(we),
        .raddr1(raddr1),
        .raddr2(raddr2),
        .waddr(waddr),
        .wdata(wdata),
        .rdata1(rdata1),
        .rdata2(rdata2)
    );
endmodule
