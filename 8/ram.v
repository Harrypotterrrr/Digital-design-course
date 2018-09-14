`timescale 1ns / 1ps
    /*
module ram (
    input clk, //�洢��ʱ���źţ�������ʱ�� ram �ڲ�д������
    input ena, //�洢����Ч�źţ��ߵ�ƽʱ�洢�������У�������� z
    input wena, //�洢����д��Ч�źţ��ߵ�ƽΪд��Ч���͵�ƽΪ����Ч���� enaͬʱ��Чʱ�ſɶԴ洢�����ж�д
    input [4:0] addr, //�����ַ��ָ�����ݶ�д�ĵ�ַ
    input [31:0] data_in, //�洢��д������ݣ��� clk ������ʱ��д��
    output reg [31:0] data_out //�洢�����������ݣ�
);
    reg [31:0] register[31:0];

    always@(posedge clk or posedge ena or negedge ena) begin
        if(ena == 0) begin
            data_out = {32{1'bz}};
        end
        else begin
            if(wena == 1) begin
                register[addr] = data_in;
                //data_out = register[addr];//???????/
            end
            else begin 
                data_out = register[addr];
            end
        end
    end
    */
module ram (
        input clk, //�洢��ʱ���źţ�������ʱ�� ram �ڲ�д������
        input ena, //�洢����Ч�źţ��ߵ�ƽʱ�洢�������У�������� z
        input wena, //�洢����д��Ч�źţ��ߵ�ƽΪд��Ч���͵�ƽΪ����Ч���� enaͬʱ��Чʱ�ſɶԴ洢�����ж�д
        input [4:0] addr, //�����ַ��ָ�����ݶ�д�ĵ�ַ
        input [31:0] data_in, //�洢��д������ݣ��� clk ������ʱ��д��
        output [31:0] data_out //�洢�����������ݣ�
    );
        reg [31:0] register[31:0];
        assign data_out = (ena && !wena) ? register[addr] : {32{1'bz}};
        always@(posedge clk) begin
            if(wena) begin
                register[addr] = data_in;
            end
        end
endmodule
