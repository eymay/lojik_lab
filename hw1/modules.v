// PART 1

module and_gate (i_1 , i_2 , o);
 // Inputs
 input wire i_1 ;
 input wire i_2 ;

 // Outputs
 output wire o;

 assign o = i_1 & i_2;
endmodule

module and3_gate(input i_1 , i_2 , i_3 , output o);
wire temp1;

and_gate and1(.i_1(i_1), .i_2(i_2),.o(temp1));
and_gate and2(.i_1(temp1),.i_2(i_3),.o(o));
endmodule

 module and4_gate (i_1 , i_2, i_3, i_4, o);
 // Inputs
 input wire i_1 ;
 input wire i_2 ;
 input wire i_3 ;
 input wire i_4;
    
wire temp1, temp2;
 // Outputs
 output wire o;

and_gate and1(i_1, i_2, temp1);
and_gate and2(i_4, i_3, temp2);
and_gate and3(temp1, temp2, o);
 endmodule

 module or_gate (i_1 , i_2 , o);
 // Inputs
 input wire i_1 ;
 input wire i_2 ;

 // Outputs
 output wire o;

 assign o = i_1 | i_2;
 endmodule

module or3_gate(input i_1 , i_2 , i_3 , output o);
wire temp1;

or_gate or1(.i_1(i_1), .i_2(i_2),.o(temp1));
or_gate or2(.i_1(temp1),.i_2(i_3),.o(o));
endmodule

module not_gate (i_1 , o);
 // Inputs
 input wire i_1 ;

 // Outputs
 output wire o;

 assign o = ~i_1;
 endmodule

module xor_gate (i_1 , i_2 , o);   // XOR gate
// Inputs   
input wire i_1 ;
input wire i_2 ;

wire temp1, temp2, temp3, temp4; 
// Outputs
output wire o;

not_gate not1(.i_1(i_2), .o(temp1));
not_gate not2(.i_1(i_1), .o(temp2));
and_gate and1(.i_1(temp1), .i_2(i_1), .o(temp3));
and_gate and2(.i_1(temp2), .i_2(i_2), .o(temp4));
or_gate or1(.i_1(temp3), .i_2(temp4), .o(o));
endmodule

module nand_gate (i_1 , i_2 , o);
// Inputs
input wire i_1 ;
input wire i_2 ;

wire temp1;
// Outputs
output wire o;

and_gate and1(.i_1(i_1), .i_2(i_2), .o(temp1));
not_gate not1(.i_1(temp1), .o(o));

endmodule

module nand3_gate(input i_1 , i_2 , i_3 , output o);
wire temp1;
and_gate and1(.i_1(i_1), .i_2(i_2),.o(temp1));
nand_gate nand1(.i_1(temp1),.i_2(i_3),.o(o));
endmodule

module mux2_1(input i_1, i_2, s_1, output o);
wire temp1, temp2, temp3;

not_gate not1(.i_1(s_1), .o(temp2));

and_gate and1(.i_1(i_2), .i_2(s_1), .o(temp1));
and_gate and2(.i_1(temp2), .i_2(i_1), .o(temp3));
or_gate or1(.i_1(temp1), .i_2(temp3), .o(o));

endmodule

module mux4_1(input i_1, i_2, i_3, i_4, s_1, s_2, output o);
wire temp1, temp2;

mux2_1 mux2_1_1(.i_1(i_1), .i_2(i_2), .s_1(s_1), .o(temp1));
mux2_1 mux2_1_2(.i_1(i_3), .i_2(i_4), .s_1(s_1), .o(temp2));

mux2_1 mux2_1_12(.i_1(temp1), .i_2(temp2), .s_1(s_2), .o(o));
endmodule

module mux8_1(input i_1, i_2, i_3, i_4, i_5, i_6, i_7, i_8, s_1, s_2, s_3, output o);
wire temp1, temp2;

mux4_1 mux4_1_1(.i_1(i_1), .i_2(i_2), .i_3(i_3), .i_4(i_4), .s_1(s_2), .s_2(s_1), .o(temp1));
mux4_1 mux4_1_2(.i_1(i_5), .i_2(i_6), .i_3(i_7), .i_4(i_8), .s_1(s_2), .s_2(s_1), .o(temp2));
mux2_1 mux2_1_1(.i_1(temp1), .i_2(temp2), .s_1(s_3), .o(o));

endmodule


module decoder2_4(input i_1, i_2, en,  output o_1, o_2,  o_3,  o_4);
wire temp1, temp2;
not_gate not1(.i_1(i_1), .o(temp1));
not_gate not2(.i_1(i_2), .o(temp2));
and3_gate and3_1(.i_1(i_1), .i_2(i_2), .i_3(en), .o(o_4)); //most significant bit
and3_gate and3_2(.i_1(temp1), .i_2(i_2), .i_3(en), .o(o_2));
and3_gate and3_3(.i_1(i_1), .i_2(temp2), .i_3(en), .o(o_3));
and3_gate and3_4(.i_1(temp1), .i_2(temp2), .i_3(en), .o(o_1));

endmodule

module decoder3_8(input i_1, i_2, i_3,  output o_1, output o_2, output o_3, output o_4, output o_5, output o_6, output o_7, output o_8);
wire temp1;
not_gate not1(.i_1(i_3), .o(temp1));
decoder2_4 decoder2_4_1(.i_1(i_1), .i_2(i_2), .en(i_3), .o_1(o_2), .o_2(o_4), .o_3(o_6), .o_4(o_8));
decoder2_4 decoder2_4_2(.i_1(i_1), .i_2(i_2), .en(temp1), .o_1(o_1), .o_2(o_3), .o_3(o_5), .o_4(o_7));
endmodule

//PART 2

module F1_d(input a, b, c, d, output o);

wire not_a, not_b, not_d;
wire l2_1, l2_2, l2_3;

not_gate not1(.i_1(a), .o(not_a));
not_gate not2(.i_1(b), .o(not_b));
not_gate not3(.i_1(d), .o(not_d));

and3_gate and1(.i_1(not_a), .i_2(b), .i_3(c), .o(l2_1));
and_gate and2(.i_1(not_b), .i_2(not_d), .o(l2_2));
and3_gate and3(.i_1(a), .i_2(c), .i_3(d), .o(l2_3));

or3_gate or1(.i_1(l2_1), .i_2(l2_2), .i_3(l2_3), .o(o));

endmodule

//PART 3

module F1_e(input a, b, c, d, output o);

wire l1_1, l1_2, l1_3, l2_1, l2_2, l2_3;

nand_gate nand1_1(.i_1(a), .i_2(a), .o(l1_1));
nand_gate nand1_2(.i_1(b), .i_2(b), .o(l1_2));
nand_gate nand1_3(.i_1(d), .i_2(d), .o(l1_3));

nand3_gate nand2_1(.i_1(l1_1), .i_2(b), .i_3(c), .o(l2_1));
nand_gate nand2_2(.i_1(l1_2), .i_2(l1_3), .o(l2_2));
nand3_gate nand2_3(.i_1(a), .i_2(c), .i_3(d), .o(l2_3));

nand3_gate nand3(.i_1(l2_1), .i_2(l2_2), .i_3(l2_3), .o(o));

endmodule

//PART 4
 

//PART 5

module F2_F3(input a, b, c, output o_1,o_2);
wire l1_1, l1_2, l1_3, l1_4, l1_5;
wire l2;

decoder3_8 decoder3_8_1(.i_1(a), .i_2(b), .i_3(c), .o_4(l1_1), .o_6(l1_2), .o_7(l1_3), .o_8(l1_4));


or_gate F1(.i_1(l1_1), .i_2(l1_2), .o(o_1));
or_gate F2(.i_1(l1_3), .i_2(l1_4), .o(o_2));

endmodule

//PART 6

module half_adder(input a, b, output s, c);

xor_gate xor1(.i_1(a), .i_2(b), .o(s));
and_gate and1(.i_1(a), .i_2(b), .o(c));

endmodule

//PART 7

module full_adder(input a, b, c_in, output s, c_out);

    wire x ,y ,z;

half_adder half_adder1(.a(a), .b(b), .s(x), .c(y));
half_adder half_adder2(.a(x), .b(c_in), .s(s), .c(z));
or_gate or1(.i_1(y), .i_2(z), .o(c_out));

endmodule

//PART 8

module Four_b_full_adder(input [3:0] a,
                     input [3:0] b,
                     input c_in,
                     output [3:0] s,
                     output c_out);


wire c1, c2, c3;

full_adder full_adder1(.a(a[0]), .b(b[0]), .c_in(c_in), .s(s[0]), .c_out(c1));
full_adder full_adder2(.a(a[1]), .b(b[1]), .c_in(c1), .s(s[1]), .c_out(c2));
full_adder full_adder3(.a(a[2]), .b(b[2]), .c_in(c2), .s(s[2]), .c_out(c3));
full_adder full_adder4(.a(a[3]), .b(b[3]), .c_in(c3), .s(s[3]), .c_out(c_out));

endmodule

//PART 9

module Eight_b_full_adder(input [7:0] a,
                     input [7:0] b,
                     input c_in,
                     output [7:0] s,
                     output c_out);

wire c1, c2, c3, c4, c5, c6, c7;

full_adder full_adder1(.a(a[0]), .b(b[0]), .c_in(c_in), .s(s[0]), .c_out(c1));
full_adder full_adder2(.a(a[1]), .b(b[1]), .c_in(c1), .s(s[1]), .c_out(c2));
full_adder full_adder3(.a(a[2]), .b(b[2]), .c_in(c2), .s(s[2]), .c_out(c3));
full_adder full_adder4(.a(a[3]), .b(b[3]), .c_in(c3), .s(s[3]), .c_out(c4));
full_adder full_adder5(.a(a[4]), .b(b[4]), .c_in(c4), .s(s[4]), .c_out(c5));
full_adder full_adder6(.a(a[5]), .b(b[5]), .c_in(c5), .s(s[5]), .c_out(c6));
full_adder full_adder7(.a(a[6]), .b(b[6]), .c_in(c6), .s(s[6]), .c_out(c7));
full_adder full_adder8(.a(a[7]), .b(b[7]), .c_in(c7), .s(s[7]), .c_out(c_out));

endmodule

//PART 10

module Sixteen_b_full_adder(input [15:0] a,
                     input [15:0] b,
                     input X,
                     output [15:0] s,
                     output c_out);

wire c1;
wire [15:0] b_xor;

xor_gate xor1(.i_1(X), .i_2(b[0]), .o(b_xor[0]));
xor_gate xor2(.i_1(X), .i_2(b[1]), .o(b_xor[1]));
xor_gate xor3(.i_1(X), .i_2(b[2]), .o(b_xor[2]));
xor_gate xor4(.i_1(X), .i_2(b[3]), .o(b_xor[3]));
xor_gate xor5(.i_1(X), .i_2(b[4]), .o(b_xor[4]));
xor_gate xor6(.i_1(X), .i_2(b[5]), .o(b_xor[5]));
xor_gate xor7(.i_1(X), .i_2(b[6]), .o(b_xor[6]));
xor_gate xor8(.i_1(X), .i_2(b[7]), .o(b_xor[7]));
xor_gate xor9(.i_1(X), .i_2(b[8]), .o(b_xor[8]));
xor_gate xor10(.i_1(X), .i_2(b[9]), .o(b_xor[9]));
xor_gate xor11(.i_1(X), .i_2(b[10]), .o(b_xor[10]));
xor_gate xor12(.i_1(X), .i_2(b[11]), .o(b_xor[11]));
xor_gate xor13(.i_1(X), .i_2(b[12]), .o(b_xor[12]));
xor_gate xor14(.i_1(X), .i_2(b[13]), .o(b_xor[13]));
xor_gate xor15(.i_1(X), .i_2(b[14]), .o(b_xor[14]));
xor_gate xor16(.i_1(X), .i_2(b[15]), .o(b_xor[15]));

Eight_b_full_adder Eight_b_full_adder1(.a(a[7:0]), .b(b_xor[7:0]), .c_in(X), .s(s[7:0]), .c_out(c1));
Eight_b_full_adder Eight_b_full_adder2(.a(a[15:8]), .b(b_xor[15:8]), .c_in(c1), .s(s[15:8]), .c_out(c_out));

endmodule

//PART 11

module BA(input signed [15:0] A,
                     input signed [15:0] B,
                     output signed [15:0] s,
                     output c_out);
wire signed [15:0] int_sum1;
wire int_c, borrow;
Sixteen_b_full_adder Sixteen_b_full_adder1(.a(B[15:0]), .b(A[15:0]), .X(1'b1), .s(int_sum1[15:0]), .c_out(int_c));
Sixteen_b_full_adder Sixteen_b_full_adder3(.a(int_sum1[15:0]), .b(A[15:0]), .X(1'b1), .s(s[15:0]), .c_out(c_out));

endmodule