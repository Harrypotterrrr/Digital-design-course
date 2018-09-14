`timescale 1ns / 1ps
module Counter8_myselftest_tb;
    reg CLK;
    reg rst_n;
    wire [2:0] oQ;
    wire [6:0] oDisplay;
    
    initial begin
        CLK = 0;    
        rst_n = 0;
        #20
        rst_n = 1;
        #500
        rst_n = 0;
    end
    always #1 CLK = ~CLK;
    
    Counter8_myselftest
    Counter8_myselftest_test(
        .CLK(CLK),
        .rst_n(rst_n),
        .oQ(oQ),
        .oDisplay(oDisplay)
    );
    //low effective   asynchronous
    
endmodule
