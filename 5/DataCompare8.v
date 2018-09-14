`timescale 1ns / 1ps
module DataCompare8(
    input [7:0] iData_a, //�������� a
    input [7:0] iData_b, //�������� b
    output [2:0] oData //������
);
    wire [2:0]iData;
    wire [2:0]oData_temp;
    DataCompare4
    DataCompare4_test1(
        .iData_a(iData_a[3:0]),
        .iData_b(iData_b[3:0]),
        .iData(iData),
        .oData(oData_temp)
    );
    DataCompare4
    DataCompare4_test2(
        .iData_a(iData_a[7:4]),
        .iData_b(iData_b[7:4]),
        .iData(oData_temp),
        .oData(oData)
    );
endmodule
