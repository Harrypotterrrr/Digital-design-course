`timescale 1ns / 1ps
module Divider_tb;
    reg I_CLK;
    reg Rst;
    wire O_CLK;
    initial begin
        Rst = 1;
        I_CLK = 0;
        #40
        Rst = 0;
        #200
        Rst = 1;
        #200
        Rst = 0;
    end
    always #2 I_CLK = ~I_CLK;
    Divider #(20) Divider_test(
        .I_CLK(I_CLK),
        .Rst(Rst),
        .O_CLK(O_CLK)
    );
endmodule
