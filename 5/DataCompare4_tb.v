`timescale 1ns / 1ps
module DataCompare4_tb;
    reg [3:0] iData_a; //�������� a
    reg [3:0] iData_b; //�������� b
    reg [2:0] iData; //��������a>b�� a<b�� a=b
    wire [2:0] oData; //������ A>B�� A<B�� A=B
    
    initial
    begin
        iData = 3'b000;
        iData_a = 4'b1000;
        iData_b = 4'b0111;
        #40
        iData_b = 4'b1000;
        iData_a = 4'b0111;
        #40
        iData_a = 4'b0100;
        iData_b = 4'b0011;
        #40
        iData_b = 4'b0100;
        iData_a = 4'b0011;
        #40
        iData_a = 4'b0010;
        iData_b = 4'b0001;
        #40
        iData_b = 4'b0010;
        iData_a = 4'b0001;
        #40
        
        iData_a = 4'b0000;
        iData_b = 4'b0000;
        iData = 3'b100;
        #40
        iData_a = 4'b0000;
        iData_b = 4'b0000;
        iData = 3'b010;
        #40
        iData_a = 4'b0000;
        iData_b = 4'b0000;
        iData = 3'b001;

    end
    DataCompare4
    DataCompare4_test(
        .iData_a(iData_a),
        .iData_b(iData_b),
        .iData(iData),
        .oData(oData)
    );
endmodule