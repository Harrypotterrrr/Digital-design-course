`timescale 1ns / 1ps
module barrelshifter32_tb;
    reg [31:0] a;
    reg [4:0] b;
    reg [1:0] aluc;
    wire [31:0] c;
    integer i,j,k;
    initial begin
        a = {32{1'b1}};
        aluc = 2'b00;
    end
    initial begin
        for(k = 1 ; k <= 4 ; k = k + 1) begin
            b = 5'b00000;
            for(i = 1 ; i <= 32 ; i = i + 1) begin
                #6
                b = b + 1;
            end
        end
    end
    initial begin
		for(j = 1 ; j <= 4 ; j = j + 1) begin
			#192
			aluc = aluc + 1;
        end
    end
    barrelshifter32
    barrelshifter3w_test(
        .a(a),
        .b(b),
        .aluc(aluc),
        .c(c)
    );
endmodule
