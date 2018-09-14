`timescale 1ns / 1ps
module Counter8_tb;
    reg CLK;
    reg rst_n;
    wire [2:0] oQ;
    wire [6:0] oDisplay;
    
    wire Clock;
    initial begin
        CLK = 0;    
        rst_n = 0;
        #20
        rst_n = 1;
        #500
        rst_n = 0;
    end
    always #1 CLK = ~CLK;
    Counter8 Counter8_test(.CLK(Clock),.rst_n(rst_n),.oQ(oQ),.oDisplay(oDisplay));
    //low effective   asynchronous
    Divider Divider_test(.I_CLK(CLK),.Rst(~rst_n),.O_CLK(Clock));
    //high effective  synchronous
endmodule
