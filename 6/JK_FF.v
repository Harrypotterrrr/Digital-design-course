`timescale 1ns / 1ps
module JK_FF(
    input CLK, //时钟信号，上升沿有效
    input J, //输入信号 J
    input K, //输入信号 K
    input RST_n, //复位信号，低电平有效
    output reg Q1, //输出信号 Q
    output reg Q2 //输出信号 Q
);
    always @(posedge (CLK) or posedge (RST_n) or negedge (RST_n)) begin
        if(RST_n == 1) begin
        
            if(J == 1 && K == 1) begin
                Q1 <= Q2;
                Q2 <= Q1;
            end
            
            else if(J != 0 || K != 0) begin
                Q1 <= J;
                Q2 <= K;                
            end
            
            else begin
                Q1 <= Q1;
                Q2 <= Q2;
            end
            
        end
        
        else begin
            Q1 <= 1'b0;
            Q2 <= 1'b1;  
        end
    end

endmodule
