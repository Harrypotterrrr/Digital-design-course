module alu(
 input [31:0] a,    //32 位输入，操作数 1
 input [31:0] b,    //32 位输入，操作数 2
 input  [3:0] aluc, //4 位输入，控制 alu 的操作
 output reg [31:0] r,   //32 位输出，由 a、b 经过 aluc 指定的操作生成
 output reg zero,        //0 标志位
 output reg carry,       // 进位标志位
 output reg negative,   // 负数标志位
 output reg overflow   // 溢出标志位 
);
	wire signed [31:0]A_signed;
	wire signed [31:0]B_signed;
	/* 		calculate answer	*/
	wire unsigned [32:0]plus_unsigned;
	wire unsigned [32:0]minus_unsigned;
	wire signed [32:0]plus_signed;
	wire signed [32:0]minus_signed;
	/*		flag answer 		*/
	wire [31:0]And;
	wire [31:0]Or;
	wire [31:0]Xor;
	wire [31:0]Nor;
	wire [31:0]Lui;
	wire [31:0]Slt;
	wire [31:0]Sltu;
	wire [31:0]Sra;
	wire [31:0]Sll_Slr;
	wire [31:0]Srl;
	
	assign A_signed = $signed(a);
	assign B_signed = $signed(b);
	
	assign plus_unsigned = a + b;
	assign plus_signed = A_signed + B_signed;
	
	assign minus_unsigned = a - b;
	assign minus_signed = A_signed - B_signed;
	
	assign And = a & b;
	assign Or = a | b;
	assign Xor = a ^ b;
	assign Nor = ~(a | b);
	assign Lui = {b[15:0],16'b0};
	assign Slt = (A_signed < B_signed)  ? 1 : 0;
	assign Sltu = (a < b)  ? 1 : 0;
	assign Sra = B_signed >>> A_signed;
	assign Sll_Slr = b << a;
	assign Srl = b >> a;
	always@(*) begin
		case(aluc)
		4'b0000: begin
			r = plus_unsigned[31:0];
			zero = (r == 0)  ? 1'b1 : 1'b0;
			carry = plus_unsigned[32];
			negative = r[31];
		end
		4'b0001: begin
			r = minus_unsigned[31:0];
			zero = (r == 0)  ? 1'b1 : 1'b0;
			carry = minus_unsigned[32];
			negative = r[31];
		end
		4'b0010: begin
			r = plus_signed[31:0];
			zero = (r == 0)  ? 1'b1 : 1'b0;
			negative = r[31];
			overflow = ((A_signed[31] == B_signed[31]) && (A_signed[31] != r[31]))  ? 1'b1 : 1'b0;
		end
		4'b0011: begin
			r = minus_signed[31:0];
			zero = (r == 0)  ? 1'b1 : 1'b0;
			negative = r[31];
			overflow = ((A_signed[31] == B_signed[31]) && (A_signed[31] == r[31]))  ? 1'b1 : 1'b0;
		end
		4'b0100: begin 
			r = And;
			zero = (r == 0) ? 1'b1 : 1'b0;
			negative = r[31];
		end
		4'b0101: begin 
			r = Or;
			zero = (r == 0) ? 1'b1 : 1'b0;
			negative = r[31];
		end
		4'b0110: begin 
			r = Xor;
			zero = (r == 0) ? 1'b1 : 1'b0;
			negative = r[31];
		end
		4'b0111: begin 
			r = Nor;
			zero = (r == 0) ? 1'b1 : 1'b0;
			negative = r[31];
		end
		4'b100x: begin 
			r = Lui;
			zero = (r == 0) ? 1'b1 : 1'b0;
			negative = r[31];
		end
		4'b1011: begin 
			r = Slt;
			zero = (minus_signed == 0) ? 1'b1 : 1'b0;
			negative = (A_signed < B_signed) ? 1'b1 : 1'b0;
		end
		4'b1010: begin 
			r = Sltu;
			zero = (minus_unsigned == 0) ? 1'b1 : 1'b0;
			carry = (a < b) ? 1'b1 : 1'b0;
			negative = r[31];
		end
		4'b1100: begin
			r = Sra;
			zero = (r == 0) ? 1'b1 : 1'b0;
			negative = r[31];
			carry = (a == 0) ? 1'b0 : b[a - 1];
		end
		4'b111x: begin 
			r = Sll_Slr;
			zero = (r == 0) ? 1'b1 : 1'b0;
			negative = r[31];
			carry = (a == 0) ? 1'b0 : b[32 - a];
		end
		4'b1101: begin 
			r = Srl;
			zero = (r == 0) ? 1'b1 : 1'b0;
			negative = r[31];
			carry = (a == 0) ? 1'b0 : b[a - 1];
		end
	   endcase
	end
endmodule