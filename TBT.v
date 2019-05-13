`define UP 5'd2         //states define
`define DOWN 5'd4
`define LEFT 5'd3
`define RIGHT 5'd1
`define IDLE 4'd0

module adderSubtractor(a, b, cin, cout, sum) ;  //combinational logic
	parameter n = 5;
	input [n - 1 : 0] a, b;
	input cin;
	output [n - 1 : 0] sum;
	output cout;

	wire mid0, mid1, mid2, mid3, mid4, c1, c2, c3, c4, p0, p1, p2, p3,
	p4, g0, g1, g2, g3, g4, addg0, addg1, addg2, addg3, addg4;

	xor befs0(mid0, a[0], cin);
	xor s0(sum[0], mid0, b[0]);

	// generate c1
	and g_0(g0, a[0], b[0]);
	or p_0(p0, a[0], b[0]);
	and add_g0(addg0, p0, cin);
	or c_1(c1, addg0, g0);

	// sum[1]
	xor befs1(mid1, a[1], c1);
	xor s1(sum[1], mid1, b[1]);

	// generate c2
	and g_1(g1, a[1], b[1]);
	or p_1(p1, a[1], b[1]);
	and add_g1(addg1, p1, c1);
	or c_2(c2, addg1, g1);

	// sum[2]
	xor befs2(mid2, a[2], c2);
	xor s2(sum[2], mid2, b[2]);

	// generate c3
	and g_2(g2, a[2], b[2]);
	or p_2(p2, a[2], b[2]);
	and add_g2(addg2, p2, c2);
	or c_3(c3, addg2, g2);

	// sum[3]
	xor befs3(mid3, a[3], c3);
	xor s3(sum[3], mid3, b[3]);

	// generate c4
	and g_3(g3, a[3], b[3]);
	or p_3(p3, a[3], b[3]);
	and add_g3(addg3, p3, c3);
	or c_4(c4, addg3, g3);

	// sum[4]
	xor befs4(mid4, a[4], c4);
	xor s4(sum[4], mid4, b[4]);

	// cout
	and g_4(g4, a[4], b[4]);
	or p_4(p4, a[4], b[4]);
	and add_g4(addg4, p4, c4);
	or c_out(cout, addg4, g4);
endmodule

module TBT(clk, rst, start, data, en, addr, fin, result);
	input clk, rst, start;
	input [4 : 0] data;
	output en, fin;
	output [4 : 0] addr, result;
	reg [3:0] state, next_state;
	reg [4:0] index, next_index;
	reg [4:0] leng, next_leng;
	reg [4:0] ans, next_ans;
	reg [4:0] state_mani;
	reg [4:0] addend;
	wire nouse;
	wire [4:0] add_sub_out;

	always @(posedge rst or posedge clk) begin
		if (rst == 1'b1) begin
			state <= `IDLE;
			index <= 5'd31;
			leng <= 5'd0;
			ans <= 5'd0;
		end
		else begin
			state <= next_state;
			index <= next_index;
			leng <= next_leng;
			ans <= next_ans;
		end
	end

	always @(*) begin
		next_index = index + 5'd1;
		next_leng = leng;
		next_ans = ans;
		next_state = state;
		case (state)
			`IDLE:begin
				next_state = (start == 1'b1)? 4'd5 : `IDLE;
				next_index = (start == 1'b1)? 5'd0 : 5'd31;
				next_leng = (start == 1'b1)? data : leng;
			end
			4'd1:begin
				case (data)
					`RIGHT:next_state = 4'd2;
					`DOWN:next_state = 4'd4;
				endcase
				addend = -5'd2;
				// next_ans = ans - 5'd2;
				next_ans = add_sub_out;
			end
			4'd2:begin
				case (data)
					`RIGHT:next_state = 4'd3;
					`DOWN:next_state = 4'd5;
					`LEFT:next_state = 4'd1;
				endcase
				addend = -5'd1;
				// next_ans = ans - 5'd1;
				next_ans = add_sub_out;
			end
			4'd3:begin
				case (data)
					`LEFT:next_state = 4'd2;
					`DOWN:next_state = 4'd6;
				endcase
				addend = 5'd2;
				// next_ans = ans + 5'd2;
				next_ans = add_sub_out;
			end
			4'd4:begin
				case (data)
					`UP:next_state = 4'd1;
					`RIGHT:next_state = 4'd5;
					`DOWN:next_state = 4'd7;	
				endcase
				addend = -5'd1;
				// next_ans = ans - 5'd1;
				next_ans = add_sub_out;
			end
			4'd5:begin
				case (data)
					`UP:next_state = 4'd2;
					`RIGHT:next_state = 4'd6;
					`DOWN:next_state = 4'd8;
					`LEFT:next_state = 4'd4;
				endcase
			end
			4'd6:begin
				case (data)
					`UP:next_state = 4'd3;
					`LEFT:next_state = 4'd5;
					`DOWN:next_state = 4'd9;
				endcase
				addend = 5'd1;
				// next_ans = ans + 5'd1;
				next_ans = add_sub_out;
			end
			4'd7:begin
				case (data)
					`UP:next_state = 4'd4;
					`RIGHT:next_state = 4'd8;
				endcase
				addend = 5'd2;
				// next_ans = ans + 5'd2;
				next_ans = add_sub_out;
			end
			4'd8:begin
				case (data)
					`UP:next_state = 4'd5;
					`LEFT:next_state = 4'd7;
					`RIGHT:next_state = 4'd9;
				endcase
				addend = 5'd1;
				// next_ans = ans + 5'd1;
				next_ans = add_sub_out;
			end
			4'd9:begin
				case (data)
					`UP:next_state = 4'd6;
					`LEFT:next_state = 4'd8;
				endcase
				addend = -5'd2;
				// next_ans = ans - 5'd2;
				next_ans = add_sub_out;
			end
		endcase
	end

	assign en = 1'b1;
	assign addr = index;
	assign fin = (start == 1'b1 && index == leng)? 1'b1: 1'b0;
	assign result = (fin == 1'b1)? next_ans : 5'd0;

	adderSubtractor as (.cin(1'b0), .a(ans), .b(addend), .cout(nouse), .sum(add_sub_out));
endmodule