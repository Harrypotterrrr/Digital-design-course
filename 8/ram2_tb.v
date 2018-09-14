`timescale 1ns / 1ps
module ram2_tb;
    reg clk; //�洢��ʱ���źţ�������ʱ�� ram �ڲ�д������
    reg ena; //�洢����Ч�źţ��ߵ�ƽʱ�洢�������У�������� z
    reg wena; //�洢����д��Ч�źţ��ߵ�ƽΪд��Ч���͵�ƽΪ����Ч���� enaͬʱ��Чʱ�ſɶԴ洢�����ж�д
    reg [4:0] addr; //�����ַ��ָ�����ݶ�д�ĵ�ַ
    wire [31:0] data_in;
    reg [31:0] test;
    
    initial begin
        clk = 0;
        ena = 0;
        wena = 0;
        addr = 5'b00000;
        test = {{31{1'b0}},1'b1};
        #10
        ena = 1;
    end
    always begin
        #4
        clk = ~clk;
    end
    always begin
        #30
        test = test * 16; 
        #10
        wena = ~wena; 
    end     //����ִ��
    always begin
        #250
        addr = addr + 1;
    end
    ram2 ram2_test(
        .clk(clk),
        .ena(ena),
        .wena(wena),
        .addr(addr),
        .data(data_in)
    );
    /*
    genvar i = wena;
    generate
        if(i == 1) begin
        ram2 ram2_test(
                .clk(clk),
                .ena(ena),
                .wena(wena),
                .addr(addr),
                .data(test)
            );
        end
        else begin
                ram2 ram2_test(
                .clk(clk),
                .ena(ena),
                .wena(wena),
                .addr(addr),
                .data(data_out)
            );
        end
    endgenerate*/
endmodule
