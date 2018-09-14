`timescale 1ns / 1ps
module DataCompare8_tb;
    reg [7:0] iData_a; //输入数据 a
    reg [7:0] iData_b; //输入数据 b
    wire [2:0] oData; //结果输出

    initial
    begin
        iData_a = 8'b10000000;
        iData_b = 8'b01111111;
        #40
        iData_b = 8'b10000000;
        iData_a = 8'b01111111;
        #40
        iData_a = 8'b01000000;
        iData_b = 8'b00111111;
        #40
        iData_b = 8'b01000000;
        iData_a = 8'b00111111;
        #40
        iData_a = 8'b00100000;
        iData_b = 8'b00011111;
        #40
        iData_b = 8'b00100000;
        iData_a = 8'b00011111;
        #40
        iData_a = 8'b00010000;
        iData_b = 8'b00001111;
        #40
        iData_b = 8'b00010000;
        iData_a = 8'b00001111;
        #40
        iData_a = 8'b00001000;
        iData_b = 8'b00000111;
        #40
        iData_b = 8'b00001000;
        iData_a = 8'b00000111;
        #40
        iData_a = 8'b00000100;
        iData_b = 8'b00000011;
        #40
        iData_b = 8'b00000100;
        iData_a = 8'b00000011;
        #40
        iData_a = 8'b00000010;
        iData_b = 8'b00000001;
        #40
        iData_b = 8'b00000010;
        iData_a = 8'b00000001;
        #40
        iData_a = 8'b00000001;
        iData_b = 8'b00000000;
        #40
        iData_b = 8'b00000001;
        iData_a = 8'b00000000;
        #40
        iData_a = 8'b00000000;
        iData_b = 8'b00000000;        
    end
    
    DataCompare8
    DataCompare8_test(
        .iData_a(iData_a),
        .iData_b(iData_b),
        .oData(oData)
    );
endmodule
