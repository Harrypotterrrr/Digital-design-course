`timescale 1ns / 1ps
module Regfiles_tb;
    reg clk; //�Ĵ�����ʱ���źţ��½���д������
    reg rst; //reset �źţ��첽��λ���ߵ�ƽʱȫ���Ĵ�������
    reg we; //�Ĵ�����д��Ч�źţ��ߵ�ƽʱ����Ĵ���д�����ݣ��͵�ƽʱ����Ĵ�����������
    reg [4:0] raddr1; //�����ȡ�ļĴ����ĵ�ַ
    reg [4:0] raddr2; //�����ȡ�ļĴ����ĵ�ַ
    reg [4:0] waddr; //д�Ĵ����ĵ�ַ
    reg [31:0] wdata; //д�Ĵ������ݣ������� clk �½���ʱ��д��
    wire [31:0] rdata1; //raddr1 ����Ӧ�Ĵ������������
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
