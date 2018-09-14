`timescale 1ns / 1ps
module JK_FF(
    input CLK,
    input J,
    input K,
    input rst_n,
    output reg oQ1,
    output reg oQ2
    );
    always @(posedge CLK or negedge rst_n) begin
        if(rst_n == 0) begin
            oQ1 <= 0;
            oQ2 <= 1;
        end

        else begin
            if(J == 1 && K == 1) begin
                oQ1 <= oQ2;
                oQ2 <= oQ1;
            end   
            else if(J == 0 && K == 0) begin
                oQ1 <= oQ1;
                oQ2 <= oQ2;
            end 
            else if(J == 1 && K == 0) begin
                oQ1 <= 1;
                oQ2 <= 0;
            end
            else begin
                oQ1 <= 0;
                oQ2 <= 1;
            end
        end
    end
endmodule
