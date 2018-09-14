`timescale 1ns / 1ps
module Divider(
    input I_CLK, //输入时钟信号，上升沿有效
    input Rst, //复位信号，高电平有效
    output reg O_CLK //输出时钟 
    );
    parameter N = 20                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                 ;
    integer i = 0;
    always@(posedge I_CLK) begin
        if(Rst == 1) begin
            O_CLK <= 0;
            i <= 0;
        end
        else begin
            if(i == N / 2 ) begin
                O_CLK = ~O_CLK;
                i = 0;
            end
            else begin
                i = i + 1;
            end
        end
    end
    /*
    parameter N = 20;
    wire [19:0]tmp;
    genvar i;

    generate
        assign tmp[0] = 1'b1;
        for(i = 0 ; i < N ; i = i + 1) begin
            JK_FF JK_test(
                .CLK(I_CLK),
                .J(tmp[i]),
                .K(tmp[i]),
                .rst_n((~Rst)),
                .oQ1(tmp[i+1]),
                .oQ2()
            );
        assign O_CLK = tmp[19];
        end
    endgenerate
    */
endmodule
