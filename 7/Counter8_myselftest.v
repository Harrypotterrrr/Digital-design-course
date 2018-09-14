`timescale 1ns / 1ps
module Counter8_myselftest(
    input CLK, //时钟信号，上升沿有效
    input rst_n, //复位信号，低电平有效
    output wire [2:0] oQ, //二进制计数器输出
    output wire [6:0] oDisplay //七段数字显示管输出
);
    wire temp,Clock;
    JK_FF JK_FF_test0(.CLK(Clock),.J(1'b1),.K(1'b1),.rst_n(rst_n),.oQ1(oQ[0]),.oQ2());
    JK_FF JK_FF_test1(.CLK(Clock),.J(oQ[0]),.K(oQ[0]),.rst_n(rst_n),.oQ1(oQ[1]),.oQ2());
    assign temp = oQ[0] & oQ[1];
    JK_FF JK_FF_test2(.CLK(Clock),.J(temp),.K(temp),.rst_n(rst_n),.oQ1(oQ[2]),.oQ2());
    
    display7
    display7_test(
        .iData({1'b0,oQ}),
        .oData(oDisplay)
    );
    
    Divider Divider_test(
        .I_CLK(CLK),
        .Rst(~rst_n),
        .O_CLK(Clock)
        );
        //high effective  synchronous
    
endmodule
