`timescale 1ns / 1ps
module DataCompare4(
    input [3:0] iData_a, //�������� a
    input [3:0] iData_b, //�������� b
    input [2:0] iData, //��������a>b�� a<b�� a=b
    output reg [2:0] oData //������ A>B�� A<B�� A=B
);
    always @(*)
    begin
        if(iData_a[3] > iData_b[3])
            oData = 3'b100;
        else if (iData_a[3] < iData_b[3])
            oData = 3'b010;
        else if(iData_a[2] > iData_b[2])
            oData = 3'b100;
        else if(iData_a[2] < iData_b[2])
            oData = 3'b010;    
        else if(iData_a[1] > iData_b[1])
            oData = 3'b100;    
        else if(iData_a[1] < iData_b[1])
            oData = 3'b010;    
        else if(iData_a[0] > iData_b[0])
            oData = 3'b100;    
        else if(iData_a[0] < iData_b[0])
            oData = 3'b010;    
        else if(iData == 3'b100)
            oData = 3'b100; 
        else if(iData == 3'b010)
            oData = 3'b010;
        else
            oData = 3'b001;
    end
endmodule