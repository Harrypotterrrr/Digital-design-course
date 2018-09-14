`timescale 1ns / 1ps
module barrelshifter32(
    input [31:0] a, //32 λԭʼ��������
    input [4:0] b, //5 λ�����źţ�������λ��λ��
    input [1:0] aluc, //2 λ�����źţ�������λ�ķ�ʽ
    output reg [31:0] c //32 λ��λ����������
);
    reg [31:0] temp;
    always @(a or b or aluc) begin
        case(aluc)
            2'b00: begin
                temp = b[0] ? {a[31],a[31:1]} : a;
                temp = b[1] ? {temp[31:30],temp[31:2]} : temp;
                temp = b[2] ? {temp[31:28],temp[31:4]} : temp;
                temp = b[3] ? {temp[31:24],temp[31:8]} : temp;
                temp = b[4] ? {temp[31:16],temp[31:16]} : temp;
                end
            2'b01: begin
                temp = b[0] ? {1'b0,a[31:1]} : a;
                temp = b[1] ? {2'b0,temp[31:2]} : temp;
                temp = b[2] ? {4'b0,temp[31:4]} : temp;
                temp = b[3] ? {8'b0,temp[31:8]} : temp;
                temp = b[4] ? {16'b0,temp[31:16]} : temp;
                end
            default: begin
                temp = b[0] ? {a[30:0],1'b0} : a;
                temp = b[1] ? {temp[29:0],2'b0} : temp;
                temp = b[2] ? {temp[27:0],4'b0} : temp;
                temp = b[3] ? {temp[23:0],8'b0} : temp;
                temp = b[4] ? {temp[15:0],16'b0} : temp;
                end
        endcase
        c = temp;
    end
endmodule
