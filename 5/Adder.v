`timescale 1ns / 1ps
/*
module Adder(
    input iSA, //输入控制信号， iSA 为 1 表示有符号运算;
    //iSA 为 0 表示无符号运算
    input [7:0] iData_a, //8 位加数 a。 iSA 为 1 时，最高位为符号位
    input [7:0] iData_b, //8 位加数 b。 iSA 为 1 时，最高位为符号位
    output reg [8:0] oData, //9 位计算结果。 iSA 为 1 时，最高位为符号位
    output reg oData_C //输出的计算结果进位标识符
);
    reg temp_a, temp_b;
    always@(*)
    begin
    
        temp_a = iData_a;
        temp_b = iData_b;
        
        if(iSA == 1)
        begin
            if(iData_a[7] == 1)
            begin
                temp_a = ~iData_a;
                temp_a = temp_a + 1;
            end
            if(iData_b[7] == 1)
            begin
                temp_b = ~iData_b;
                temp_b = temp_b + 1;
            end
        end
        
        oData = 0;
        oData[7:0] =  temp_a;
        oData = oData + temp_b;
        if(oData[8] == 1)
            oData_C = 1;
        else
            oData_C = 0;
            
    end
endmodule
*/
module Adder(
  input iSA,      //输入控制信号，iSA 为 1 表示有符号运算; //iSA 为 0 表示无符号运算
  input [7:0] iData_a,   //8 位加数 a。iSA 为 1 时，最高位为符号位
  input [7:0] iData_b, //8 位加数 b。iSA 为 1 时，最高位为符号位
  output reg [8:0] oData, //9 位计算结果。iSA 为 1 时，最高位为符号位
  output reg oData_C      //输出的计算结果进位标识符 
); 
reg [8:0] iData_a_temp;
reg [8:0] iData_b_temp;
always@(iSA or iData_a or iData_b)
begin
	if(iSA==0)
		begin
		iData_a_temp={1'b0,iData_a[7:0]};
		iData_b_temp={1'b0,iData_b[7:0]};
		oData=iData_a_temp + iData_b_temp;
		if(oData[8]==1)
			oData_C=1;
		else
			oData_C=0;
		end
		
	else
		begin
			if(iData_a[7]==0&&iData_b[7]==0)
				begin
					iData_a_temp={2'b00,iData_a[6:0]};
					iData_b_temp={2'b00,iData_b[6:0]};
					oData=iData_a_temp+iData_b_temp;
					oData_C=oData[7];
				end
			else if(iData_a[7]==1&&iData_b[7]==1)
				begin
					iData_a_temp={2'b00,iData_a[6:0]};
					iData_b_temp={2'b00,iData_b[6:0]};
					oData=iData_a_temp+iData_b_temp;
					oData[8]=1;
					oData_C=oData[7];
				end
			else if(iData_a[7]==0&&iData_b[7]==1)
				begin
					oData_C=0;
					iData_b_temp={2'b00,iData_b[6:0]};
					iData_a_temp={2'b00,iData_a[6:0]};
					oData=iData_a_temp+1'b1+~iData_b_temp;
				if(oData[8]==1)
					begin
					oData=~oData+1'b1;
					oData[8]=1;
					end
				end
			
			else if(iData_a[7]==1&&iData_b[7]==0)
				begin
					oData_C=0;
					iData_b_temp={2'b00,iData_b[6:0]};
					iData_a_temp={2'b00,iData_a[6:0]};
					oData=~iData_a_temp+1'b1+iData_b_temp;
				if(oData[8]==1)
					begin
						oData=~oData+1'b1;
						oData[8]=1;
					end
				end
		end
	end
endmodule