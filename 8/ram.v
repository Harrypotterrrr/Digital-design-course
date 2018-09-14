`timescale 1ns / 1ps
    /*
module ram (
    input clk, //存储器时钟信号，上升沿时向 ram 内部写入数据
    input ena, //存储器有效信号，高电平时存储器才运行，否则输出 z
    input wena, //存储器读写有效信号，高电平为写有效，低电平为读有效，与 ena同时有效时才可对存储器进行读写
    input [4:0] addr, //输入地址，指定数据读写的地址
    input [31:0] data_in, //存储器写入的数据，在 clk 上升沿时被写入
    output reg [31:0] data_out //存储器读出的数据，
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
        input clk, //存储器时钟信号，上升沿时向 ram 内部写入数据
        input ena, //存储器有效信号，高电平时存储器才运行，否则输出 z
        input wena, //存储器读写有效信号，高电平为写有效，低电平为读有效，与 ena同时有效时才可对存储器进行读写
        input [4:0] addr, //输入地址，指定数据读写的地址
        input [31:0] data_in, //存储器写入的数据，在 clk 上升沿时被写入
        output [31:0] data_out //存储器读出的数据，
    );
        reg [31:0] register[31:0];
        assign data_out = (ena && !wena) ? register[addr] : {32{1'bz}};
        always@(posedge clk) begin
            if(wena) begin
                register[addr] = data_in;
            end
        end
endmodule
