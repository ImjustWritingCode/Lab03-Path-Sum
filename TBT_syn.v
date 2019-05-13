/////////////////////////////////////////////////////////////
// Created by: Synopsys DC Expert(TM) in wire load mode
// Version   : K-2015.06-SP1
// Date      : Thu May  9 10:53:42 2019
/////////////////////////////////////////////////////////////


module adderSubtractor ( a, b, cin, cout, sum );
  input [4:0] a;
  input [4:0] b;
  output [4:0] sum;
  input cin;
  output cout;
  wire   n1, n2, n3, n4, n5, n6, n7, n8, n9, n10, n11, n12, n13, n14;

  AO22X1 U1 ( .A0(n10), .A1(b[4]), .B0(n2), .B1(a[4]), .Y(cout) );
  XNOR2X1 U2 ( .A(n1), .B(n2), .Y(sum[4]) );
  XNOR2X1 U3 ( .A(a[4]), .B(b[4]), .Y(n1) );
  OAI2BB1X1 U4 ( .A0N(a[0]), .A1N(b[0]), .B0(n14), .Y(n8) );
  OAI21XL U5 ( .A0(a[0]), .A1(b[0]), .B0(cin), .Y(n14) );
  OAI2BB1X1 U6 ( .A0N(n8), .A1N(a[1]), .B0(n13), .Y(n6) );
  OAI21XL U7 ( .A0(a[1]), .A1(n8), .B0(b[1]), .Y(n13) );
  OAI2BB1X1 U8 ( .A0N(n4), .A1N(a[3]), .B0(n11), .Y(n2) );
  OAI21XL U9 ( .A0(a[3]), .A1(n4), .B0(b[3]), .Y(n11) );
  AO22X1 U10 ( .A0(n6), .A1(a[2]), .B0(n12), .B1(b[2]), .Y(n4) );
  OR2X1 U11 ( .A(a[2]), .B(n6), .Y(n12) );
  XOR2X1 U12 ( .A(a[0]), .B(n9), .Y(sum[0]) );
  XOR2X1 U13 ( .A(cin), .B(b[0]), .Y(n9) );
  XNOR2X1 U14 ( .A(n7), .B(n8), .Y(sum[1]) );
  XNOR2X1 U15 ( .A(a[1]), .B(b[1]), .Y(n7) );
  XNOR2X1 U16 ( .A(n5), .B(n6), .Y(sum[2]) );
  XNOR2X1 U17 ( .A(a[2]), .B(b[2]), .Y(n5) );
  XNOR2X1 U18 ( .A(n3), .B(n4), .Y(sum[3]) );
  XNOR2X1 U19 ( .A(a[3]), .B(b[3]), .Y(n3) );
  OR2X1 U20 ( .A(a[4]), .B(n2), .Y(n10) );
endmodule


module TBT ( clk, rst, start, data, en, addr, fin, result );
  input [4:0] data;
  output [4:0] addr;
  output [4:0] result;
  input clk, rst, start;
  output en, fin;
  wire   N26, N27, N28, N29, N82, N83, N93, N94, N95, N96, N110, N111, N112,
         N113, N116, N117, N118, N119, N123, N124, N125, N126, N129, N140,
         N141, N142, N158, N159, N161, N163, n5, n10, n11, n12, n13, n14, n15,
         n16, n17, n18, n21, n23, n24, n25, n26, n27, n28, n29, n31, n32, n33,
         n37, n38, n39, n40, n41, n42, n43, n44, n45, n46, n48, n49, n50, n51,
         n52, n53, n54, n55, n56, n57, n58, n60, n61, n62, n63, n64, n65, n66,
         n67, n68, n242, n243, n244, n245, n246, n247, n248, n249, n250, n251,
         n252, n253, n254, n255, n256, n257, n258, n259, n260, n261, n262,
         n263, n264, n265, n266, n267, n268, n269, n270, n271, n272, n273,
         n274, n275, n276, n277, n278, n279, n280, n281, n282, n283, n284,
         n285, n286, n287, n288, n289, n290;
  wire   [3:0] state;
  wire   [4:0] ans;
  wire   [3:0] next_state;
  wire   [4:0] next_index;
  wire   [4:0] next_ans;
  wire   [4:0] add_sub_out;
  wire   [4:0] addend;
  wire   [4:2] \add_97/carry ;
  assign en = 1'b1;
  assign N141 = data[1];
  assign fin = N163;

  adderSubtractor as ( .a(ans), .b(addend), .cin(1'b0), .sum(add_sub_out) );
  TLATX1 \addend_reg[2]  ( .G(N158), .D(N161), .Q(addend[2]) );
  TLATX1 \addend_reg[4]  ( .G(N158), .D(N161), .Q(addend[4]) );
  TLATX1 \addend_reg[3]  ( .G(N158), .D(N161), .Q(addend[3]) );
  TLATX1 \addend_reg[1]  ( .G(N158), .D(n287), .Q(addend[1]) );
  TLATX1 \addend_reg[0]  ( .G(N158), .D(N159), .Q(addend[0]) );
  DFFSX1 \index_reg[4]  ( .D(next_index[4]), .CK(clk), .SN(n278), .Q(addr[4])
         );
  DFFRX1 \leng_reg[0]  ( .D(n63), .CK(clk), .RN(n278), .QN(n57) );
  DFFRX1 \leng_reg[1]  ( .D(n62), .CK(clk), .RN(n278), .QN(n56) );
  DFFRX1 \leng_reg[2]  ( .D(n61), .CK(clk), .RN(n278), .QN(n55) );
  DFFRX1 \leng_reg[4]  ( .D(n64), .CK(clk), .RN(n278), .QN(n58) );
  DFFRX1 \leng_reg[3]  ( .D(n60), .CK(clk), .RN(n278), .QN(n54) );
  DFFRX1 \ans_reg[4]  ( .D(next_ans[4]), .CK(clk), .RN(n278), .Q(ans[4]) );
  DFFRX1 \ans_reg[2]  ( .D(next_ans[2]), .CK(clk), .RN(n278), .Q(ans[2]) );
  DFFRX1 \ans_reg[3]  ( .D(next_ans[3]), .CK(clk), .RN(n278), .Q(ans[3]) );
  DFFRX1 \ans_reg[1]  ( .D(next_ans[1]), .CK(clk), .RN(n278), .Q(ans[1]) );
  DFFSX1 \index_reg[1]  ( .D(next_index[1]), .CK(clk), .SN(n278), .Q(addr[1]), 
        .QN(n52) );
  DFFSX1 \index_reg[3]  ( .D(next_index[3]), .CK(clk), .SN(n278), .Q(addr[3])
         );
  DFFSX1 \index_reg[2]  ( .D(next_index[2]), .CK(clk), .SN(n278), .Q(addr[2])
         );
  DFFSX1 \index_reg[0]  ( .D(next_index[0]), .CK(clk), .SN(n278), .Q(addr[0]), 
        .QN(n53) );
  DFFRX1 \ans_reg[0]  ( .D(next_ans[0]), .CK(clk), .RN(n278), .Q(ans[0]) );
  DFFRX1 \state_reg[1]  ( .D(n65), .CK(clk), .RN(n278), .Q(state[1]), .QN(n243) );
  DFFRX1 \state_reg[2]  ( .D(n66), .CK(clk), .RN(n278), .Q(state[2]), .QN(n242) );
  DFFRX1 \state_reg[0]  ( .D(n68), .CK(clk), .RN(n278), .Q(state[0]), .QN(n244) );
  DFFRX1 \state_reg[3]  ( .D(n67), .CK(clk), .RN(n278), .Q(state[3]), .QN(n245) );
  NOR3BXL U265 ( .AN(n18), .B(N161), .C(n29), .Y(n44) );
  NAND2X1 U266 ( .A(n44), .B(n46), .Y(N158) );
  CLKINVX1 U267 ( .A(n33), .Y(n279) );
  CLKINVX1 U268 ( .A(n247), .Y(n277) );
  CLKINVX1 U269 ( .A(n249), .Y(n276) );
  OAI2BB1X1 U270 ( .A0N(n49), .A1N(N96), .B0(n25), .Y(N119) );
  NAND3X1 U271 ( .A(n21), .B(n25), .C(n49), .Y(n51) );
  CLKINVX1 U272 ( .A(n49), .Y(n281) );
  CLKINVX1 U273 ( .A(n44), .Y(n287) );
  OAI21XL U274 ( .A0(n242), .A1(n37), .B0(n25), .Y(N95) );
  OAI21XL U275 ( .A0(n242), .A1(n48), .B0(n28), .Y(N125) );
  OAI211X1 U276 ( .A0(n242), .A1(n51), .B0(n21), .C0(n25), .Y(N112) );
  NOR3X1 U277 ( .A(N158), .B(n280), .C(n289), .Y(n33) );
  OAI211X1 U278 ( .A0(n37), .A1(n50), .B0(n28), .C0(n21), .Y(N118) );
  CLKINVX1 U279 ( .A(n25), .Y(n282) );
  OAI21XL U280 ( .A0(n290), .A1(n17), .B0(n32), .Y(N161) );
  CLKINVX1 U281 ( .A(n31), .Y(n290) );
  AOI211X1 U282 ( .A0(n27), .A1(n26), .B0(n45), .C0(n23), .Y(n32) );
  NOR2BX1 U283 ( .AN(n26), .B(n16), .Y(n23) );
  CLKINVX1 U284 ( .A(n27), .Y(n289) );
  CLKINVX1 U285 ( .A(n248), .Y(n275) );
  AOI211X1 U286 ( .A0(N82), .A1(n18), .B0(n284), .C0(n281), .Y(n14) );
  CLKINVX1 U287 ( .A(n21), .Y(n284) );
  AOI2BB2X1 U288 ( .B0(n244), .B1(n31), .A0N(n16), .A1N(n17), .Y(n46) );
  NOR3X1 U289 ( .A(n243), .B(n244), .C(n289), .Y(n29) );
  OAI21XL U290 ( .A0(n243), .A1(n37), .B0(n21), .Y(N94) );
  NOR3X1 U291 ( .A(n37), .B(n281), .C(n244), .Y(N116) );
  OAI21XL U292 ( .A0(n245), .A1(n48), .B0(n25), .Y(N126) );
  OAI21XL U293 ( .A0(n16), .A1(n17), .B0(n18), .Y(n15) );
  NAND2X1 U294 ( .A(n244), .B(n243), .Y(n17) );
  NOR2X1 U295 ( .A(n37), .B(n245), .Y(N96) );
  NOR2X1 U296 ( .A(n245), .B(n51), .Y(N113) );
  AOI32X1 U297 ( .A0(n26), .A1(n21), .A2(n27), .B0(n28), .B1(n29), .Y(n24) );
  NAND2X1 U298 ( .A(N83), .B(n285), .Y(n25) );
  NAND3X1 U299 ( .A(n21), .B(n25), .C(n28), .Y(n37) );
  NAND2X1 U300 ( .A(N129), .B(n283), .Y(n49) );
  NAND2X1 U301 ( .A(N82), .B(n285), .Y(n21) );
  NAND3X1 U302 ( .A(n49), .B(n25), .C(n28), .Y(n48) );
  NAND2BX1 U303 ( .AN(n45), .B(n46), .Y(N159) );
  NOR2X1 U304 ( .A(n286), .B(n285), .Y(N140) );
  AND2X2 U305 ( .A(next_ans[0]), .B(N163), .Y(result[0]) );
  AND2X2 U306 ( .A(next_ans[1]), .B(N163), .Y(result[1]) );
  AND2X2 U307 ( .A(next_ans[2]), .B(N163), .Y(result[2]) );
  AND2X2 U308 ( .A(next_ans[3]), .B(N163), .Y(result[3]) );
  AND2X2 U309 ( .A(next_ans[4]), .B(N163), .Y(result[4]) );
  NOR2X1 U310 ( .A(n242), .B(state[3]), .Y(n31) );
  OAI22XL U311 ( .A0(n55), .A1(n33), .B0(n283), .B1(n279), .Y(n61) );
  OAI22XL U312 ( .A0(n57), .A1(n33), .B0(n286), .B1(n279), .Y(n63) );
  OAI22XL U313 ( .A0(n56), .A1(n33), .B0(n285), .B1(n279), .Y(n62) );
  AND4X1 U314 ( .A(n10), .B(n11), .C(n12), .D(n13), .Y(n5) );
  OAI21XL U315 ( .A0(data[2]), .A1(n285), .B0(n23), .Y(n12) );
  NAND2BX1 U316 ( .AN(n24), .B(n25), .Y(n11) );
  OAI31XL U317 ( .A0(n14), .A1(data[4]), .A2(data[3]), .B0(n15), .Y(n13) );
  NAND3X1 U318 ( .A(state[0]), .B(n31), .C(state[1]), .Y(n18) );
  NOR2X1 U319 ( .A(state[2]), .B(state[3]), .Y(n27) );
  NAND2X1 U320 ( .A(state[3]), .B(n242), .Y(n16) );
  NOR3X1 U321 ( .A(n243), .B(state[0]), .C(n289), .Y(n45) );
  OAI2BB2XL U322 ( .B0(n5), .B1(n242), .A0N(next_state[2]), .A1N(n5), .Y(n66)
         );
  OAI2BB2XL U323 ( .B0(n54), .B1(n33), .A0N(n33), .A1N(data[3]), .Y(n60) );
  OAI2BB2XL U324 ( .B0(n58), .B1(n33), .A0N(n33), .A1N(data[4]), .Y(n64) );
  OAI2BB2XL U325 ( .B0(n5), .B1(n244), .A0N(next_state[0]), .A1N(n5), .Y(n68)
         );
  OAI2BB2XL U326 ( .B0(n5), .B1(n243), .A0N(next_state[1]), .A1N(n5), .Y(n65)
         );
  OAI2BB2XL U327 ( .B0(n5), .B1(n245), .A0N(next_state[3]), .A1N(n5), .Y(n67)
         );
  NOR2X1 U328 ( .A(n244), .B(state[1]), .Y(n26) );
  NAND2X1 U329 ( .A(state[2]), .B(n49), .Y(n50) );
  OAI32X1 U330 ( .A0(n288), .A1(n31), .A2(n29), .B0(data[3]), .B1(data[4]), 
        .Y(n10) );
  CLKINVX1 U331 ( .A(n32), .Y(n288) );
  OR2X1 U332 ( .A(n51), .B(state[0]), .Y(N110) );
  NAND2BX1 U333 ( .AN(n37), .B(n244), .Y(N93) );
  NAND2BX1 U334 ( .AN(n48), .B(n244), .Y(N123) );
  OAI21XL U335 ( .A0(n243), .A1(n48), .B0(n49), .Y(N124) );
  ADDHXL U336 ( .A(addr[1]), .B(addr[0]), .CO(\add_97/carry [2]), .S(N26) );
  ADDHXL U337 ( .A(addr[2]), .B(\add_97/carry [2]), .CO(\add_97/carry [3]), 
        .S(N27) );
  OAI21XL U338 ( .A0(n243), .A1(n51), .B0(n25), .Y(N111) );
  NAND2BX1 U339 ( .AN(N94), .B(n49), .Y(N117) );
  ADDHXL U340 ( .A(addr[3]), .B(\add_97/carry [3]), .CO(\add_97/carry [4]), 
        .S(N28) );
  CLKINVX1 U341 ( .A(rst), .Y(n278) );
  NOR2X1 U342 ( .A(n286), .B(data[2]), .Y(N82) );
  CLKINVX1 U343 ( .A(N141), .Y(n285) );
  NAND2X1 U344 ( .A(N141), .B(N82), .Y(n28) );
  NOR3X1 U345 ( .A(n42), .B(n280), .C(n43), .Y(n41) );
  XOR2X1 U346 ( .A(n53), .B(n57), .Y(n43) );
  XOR2X1 U347 ( .A(n52), .B(n56), .Y(n42) );
  AND4X1 U348 ( .A(n38), .B(n39), .C(n40), .D(n41), .Y(N163) );
  XOR2X1 U349 ( .A(addr[3]), .B(n54), .Y(n39) );
  XOR2X1 U350 ( .A(addr[2]), .B(n55), .Y(n38) );
  XOR2X1 U351 ( .A(addr[4]), .B(n58), .Y(n40) );
  NOR2X1 U352 ( .A(n283), .B(data[0]), .Y(N83) );
  NOR2X1 U353 ( .A(n285), .B(data[0]), .Y(N129) );
  CLKINVX1 U354 ( .A(data[0]), .Y(n286) );
  CLKINVX1 U355 ( .A(data[2]), .Y(n283) );
  CLKINVX1 U356 ( .A(start), .Y(n280) );
  NOR2X1 U357 ( .A(N141), .B(n286), .Y(N142) );
  NOR2X1 U358 ( .A(state[1]), .B(state[2]), .Y(n264) );
  NAND3X1 U359 ( .A(n264), .B(n245), .C(n244), .Y(n267) );
  NOR2X1 U360 ( .A(n267), .B(start), .Y(n246) );
  AO21X1 U361 ( .A0(n53), .A1(n267), .B0(n246), .Y(next_index[0]) );
  AO21X1 U362 ( .A0(N26), .A1(n267), .B0(n246), .Y(next_index[1]) );
  AO21X1 U363 ( .A0(N27), .A1(n267), .B0(n246), .Y(next_index[2]) );
  AO21X1 U364 ( .A0(N28), .A1(n267), .B0(n246), .Y(next_index[3]) );
  AO21X1 U365 ( .A0(N29), .A1(n267), .B0(n246), .Y(next_index[4]) );
  NAND2X1 U366 ( .A(state[2]), .B(n243), .Y(n248) );
  NOR2X1 U367 ( .A(n264), .B(n245), .Y(n249) );
  OAI211X1 U368 ( .A0(n248), .A1(n244), .B0(n276), .C0(n267), .Y(n247) );
  AO22X1 U369 ( .A0(ans[0]), .A1(n247), .B0(add_sub_out[0]), .B1(n277), .Y(
        next_ans[0]) );
  AO22X1 U370 ( .A0(ans[1]), .A1(n247), .B0(add_sub_out[1]), .B1(n277), .Y(
        next_ans[1]) );
  AO22X1 U371 ( .A0(ans[2]), .A1(n247), .B0(add_sub_out[2]), .B1(n277), .Y(
        next_ans[2]) );
  AO22X1 U372 ( .A0(ans[3]), .A1(n247), .B0(add_sub_out[3]), .B1(n277), .Y(
        next_ans[3]) );
  AO22X1 U373 ( .A0(ans[4]), .A1(n247), .B0(add_sub_out[4]), .B1(n277), .Y(
        next_ans[4]) );
  AOI21X1 U374 ( .A0(N116), .A1(n275), .B0(n249), .Y(n254) );
  AOI22X1 U375 ( .A0(N93), .A1(n242), .B0(N123), .B1(state[2]), .Y(n252) );
  NAND2X1 U376 ( .A(n280), .B(n245), .Y(n250) );
  AOI32X1 U377 ( .A0(state[2]), .A1(n245), .A2(N110), .B0(n250), .B1(n242), 
        .Y(n251) );
  OAI32X1 U378 ( .A0(n252), .A1(state[3]), .A2(n243), .B0(state[1]), .B1(n251), 
        .Y(n253) );
  OAI2BB2XL U379 ( .B0(n244), .B1(n254), .A0N(n253), .A1N(n244), .Y(
        next_state[0]) );
  NAND2X1 U380 ( .A(N82), .B(n245), .Y(n255) );
  OAI211X1 U381 ( .A0(data[0]), .A1(n245), .B0(n255), .C0(n243), .Y(n256) );
  AOI32X1 U382 ( .A0(state[3]), .A1(n244), .A2(N140), .B0(n256), .B1(state[0]), 
        .Y(n261) );
  AO22X1 U383 ( .A0(N117), .A1(state[0]), .B0(N111), .B1(n244), .Y(n257) );
  NAND3X1 U384 ( .A(n275), .B(n245), .C(n257), .Y(n260) );
  AOI32X1 U385 ( .A0(state[2]), .A1(n244), .A2(N124), .B0(N94), .B1(n242), .Y(
        n258) );
  AO21X1 U386 ( .A0(n258), .A1(n245), .B0(n243), .Y(n259) );
  OAI211X1 U387 ( .A0(state[2]), .A1(n261), .B0(n260), .C0(n259), .Y(
        next_state[1]) );
  AOI2BB2X1 U388 ( .B0(N141), .B1(n244), .A0N(n244), .A1N(data[0]), .Y(n262)
         );
  OA21XL U389 ( .A0(state[1]), .A1(n262), .B0(n242), .Y(n269) );
  NOR2X1 U390 ( .A(n243), .B(state[2]), .Y(n270) );
  NOR2X1 U391 ( .A(n243), .B(n242), .Y(n271) );
  AOI222XL U392 ( .A0(N112), .A1(n275), .B0(N95), .B1(n270), .C0(N125), .C1(
        n271), .Y(n266) );
  AO22X1 U393 ( .A0(N129), .A1(n271), .B0(n282), .B1(n270), .Y(n263) );
  AOI221XL U394 ( .A0(N118), .A1(n275), .B0(N83), .B1(n264), .C0(n263), .Y(
        n265) );
  OA22X1 U395 ( .A0(state[0]), .A1(n266), .B0(n244), .B1(n265), .Y(n268) );
  OAI222XL U396 ( .A0(n245), .A1(n269), .B0(state[3]), .B1(n268), .C0(n267), 
        .C1(n280), .Y(next_state[2]) );
  AOI222XL U397 ( .A0(data[0]), .A1(state[3]), .B0(N142), .B1(n271), .C0(N119), 
        .C1(n275), .Y(n274) );
  AO22X1 U398 ( .A0(N126), .A1(n271), .B0(N96), .B1(n270), .Y(n272) );
  AOI221XL U399 ( .A0(N113), .A1(n275), .B0(N142), .B1(state[3]), .C0(n272), 
        .Y(n273) );
  OAI221XL U400 ( .A0(n274), .A1(n244), .B0(state[0]), .B1(n273), .C0(n276), 
        .Y(next_state[3]) );
  XOR2X1 U401 ( .A(\add_97/carry [4]), .B(addr[4]), .Y(N29) );
endmodule

