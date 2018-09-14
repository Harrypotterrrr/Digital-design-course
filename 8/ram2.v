`timescale 1ns / 1ps
module ram2(
    input clk, //�洢��ʱ���źţ�������ʱ�� ram �ڲ�д������
    input ena, //�洢����Ч�źţ��ߵ�ƽʱ�洢�������У�������� z
    input wena, //�洢����д��Ч�źţ��ߵ�ƽΪд��Ч���͵�ƽΪ����Ч����ena ͬʱ��Чʱ�ſɶԴ洢�����ж�д
    input [4:0] addr, //�����ַ��ָ�����ݶ�д�ĵ�ַ
    inout [31:0] data //�洢�������ߣ��ɴ���洢��������д������ݡ�д��������� clk ������ʱ��д��
    );
    reg [31:0]register[31:0];
    assign data = (ena == 1 && wena == 0) ? register[addr] : 32'bz;
    always @(posedge clk)begin
        if(ena && wena)
            register[addr] = data;
    end
endmodule
