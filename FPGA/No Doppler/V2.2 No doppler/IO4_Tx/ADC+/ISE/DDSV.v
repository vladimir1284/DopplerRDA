/*******************************************************************************
*     This file is owned and controlled by Xilinx and must be used             *
*     solely for design, simulation, implementation and creation of            *
*     design files limited to Xilinx devices or technologies. Use              *
*     with non-Xilinx devices or technologies is expressly prohibited          *
*     and immediately terminates your license.                                 *
*                                                                              *
*     XILINX IS PROVIDING THIS DESIGN, CODE, OR INFORMATION "AS IS"            *
*     SOLELY FOR USE IN DEVELOPING PROGRAMS AND SOLUTIONS FOR                  *
*     XILINX DEVICES.  BY PROVIDING THIS DESIGN, CODE, OR INFORMATION          *
*     AS ONE POSSIBLE IMPLEMENTATION OF THIS FEATURE, APPLICATION              *
*     OR STANDARD, XILINX IS MAKING NO REPRESENTATION THAT THIS                *
*     IMPLEMENTATION IS FREE FROM ANY CLAIMS OF INFRINGEMENT,                  *
*     AND YOU ARE RESPONSIBLE FOR OBTAINING ANY RIGHTS YOU MAY REQUIRE         *
*     FOR YOUR IMPLEMENTATION.  XILINX EXPRESSLY DISCLAIMS ANY                 *
*     WARRANTY WHATSOEVER WITH RESPECT TO THE ADEQUACY OF THE                  *
*     IMPLEMENTATION, INCLUDING BUT NOT LIMITED TO ANY WARRANTIES OR           *
*     REPRESENTATIONS THAT THIS IMPLEMENTATION IS FREE FROM CLAIMS OF          *
*     INFRINGEMENT, IMPLIED WARRANTIES OF MERCHANTABILITY AND FITNESS          *
*     FOR A PARTICULAR PURPOSE.                                                *
*                                                                              *
*     Xilinx products are not intended for use in life support                 *
*     appliances, devices, or systems. Use in such applications are            *
*     expressly prohibited.                                                    *
*                                                                              *
*     (c) Copyright 1995-2007 Xilinx, Inc.                                     *
*     All rights reserved.                                                     *
*******************************************************************************/

/* Behavioural components instantiated:
C_COMPARE_V7_0
C_SHIFT_RAM_V7_0
C_REG_FD_V7_0
BLKMEMSP_V6_0
C_TWOS_COMP_V7_0
C_GATE_BIT_V7_0
C_SHIFT_FD_V7_0
C_ADDSUB_V7_0
*/

`timescale 1ns/1ps

module DDSV(
   DATA,
   WE,
   A,
   CLK,
   SINE
   ); // synthesis black_box

   input [27 : 0] DATA;
   input WE;
   input [4 : 0] A;
   input CLK;
   output [12 : 0] SINE;
//synthesis translate_off
   wire n0 = 1'b0;
   wire n1 = 1'b1;
   wire n2;
   wire n3;
   wire n4;
   wire n5;
   wire n6;
   wire n7;
   wire n8;
   wire n19;
   wire n20;
   wire n21;
   wire n22;
   wire n23;
   wire n24;
   wire n25;
   wire n26;
   wire n27;
   wire n28;
   wire n29;
   wire n30;
   wire n31;
   wire n32;
   wire n33;
   wire n34;
   wire n35;
   wire n36;
   wire n37;
   wire n38;
   wire n39;
   wire n40;
   wire n41;
   wire n42;
   wire n43;
   wire n44;
   wire n45;
   wire n46;
   wire n55;
   wire n56;
   wire n57;
   wire n58;
   wire n59;
   wire n60;
   wire n61;
   wire n62;
   wire n63;
   wire n64;
   wire n65;
   wire n66;
   wire n67;
   wire n68;
   wire n69;
   wire n70;
   wire n71;
   wire n72;
   wire n73;
   wire n74;
   wire n75;
   wire n76;
   wire n77;
   wire n78;
   wire n79;
   wire n80;
   wire n81;
   wire n82;
   wire n83;
   wire n84;
   wire n85;
   wire n86;
   wire n87;
   wire n88;
   wire n89;
   wire n90;
   wire n91;
   wire n92;
   wire n93;
   wire n94;
   wire n95;
   wire n96;
   wire n127;
   wire n128;
   wire n129;
   wire n130;
   wire n131;
   wire n132;
   wire n133;
   wire n134;
   wire n135;
   wire n136;
   wire n137;
   wire n138;
   wire n139;
   wire n140;
   wire n141;
   wire n142;
   wire n143;
   wire n144;
   wire n145;
   wire n146;
   wire n147;
   wire n148;
   wire n149;
   wire n150;
   wire n151;
   wire n152;
   wire n153;
   wire n154;
   wire n161;
   wire n162;
   wire n163;
   wire n164;
   wire n165;
   wire n166;
   wire n167;
   wire n168;
   wire n169;
   wire n170;
   wire n171;
   wire n172;
   wire n173;
   wire n174;
   wire n227;
   wire n228;
   wire n229;
   wire n230;
   wire n231;
   wire n232;
   wire n233;
   wire n234;
   wire n235;
   wire n236;
   wire n237;
   wire n238;
   wire n239;
   wire n240;
   wire n241;
   wire n242;
   wire n243;
   wire n244;
   wire n245;
   wire n246;
   wire n247;
   wire n248;
   wire n249;
   wire n250;
   wire n251;
   wire n252;
   wire n253;
   wire n254;
   wire n1422;
   wire n1423;
   wire n1424;
   wire n1425;
   wire n1426;
   wire n1427;
   wire n1428;
   wire n1429;
   wire n1430;
   wire n1431;
   wire n1432;
   wire n1433;
   wire n1472;
   wire n1473;
   wire n1474;
   wire n1475;
   wire n1476;
   wire n1477;
   wire n1478;
   wire n1479;
   wire n1480;
   wire n1481;
   wire n1482;
   wire n1523;
   wire n1524;
   wire n1525;
   wire n1526;
   wire n1527;
   wire n1528;
   wire n1529;
   wire n1530;
   wire n1531;
   wire n1532;
   wire n1533;
   wire n1534;
   wire n1535;
   wire n1536;
   wire n1537;
   wire n1538;
   wire n1539;
   wire n1540;
   wire n1541;
   wire n1578;
   wire n1579;
   wire n1580;
   wire n1581;
   wire n1582;
   wire n1583;
   wire n1584;
   wire n1585;
   wire n1586;
   wire n1587;
   wire n1588;
   wire n1631;
   wire n1632;
   wire n1633;
   wire n1634;
   wire n1635;
   wire n1636;
   wire n1637;
   wire n1638;
   wire n1639;
   wire n2267;
   wire n2268;
   wire n2269;
   wire n2270;
   wire n2271;
   wire n2272;
   wire n2273;
   wire n2274;
   wire n2275;
   wire n2276;
   wire n2277;
   wire n2278;
   wire n2279;
   wire n2298;
   wire n2299;
   wire n2300;
   wire n2301;
   wire n2302;
   wire n2303;
   wire n2304;
   wire n2305;
   wire n2306;
   wire n2310;
   wire n2311;
   wire n2312;
   wire n2313;
   wire n2314;
   wire n2315;
   wire n2316;
   wire n2317;
   wire n2318;
   wire n2319;
   wire n2320;
   wire n2321;
   wire n2322;
   wire n2323;
   wire n2324;
   wire n2325;
   wire n2326;
   wire n2340;
   wire n2543;
   wire n2560;
   wire n2576;
   assign n127 = DATA[0];
   assign n128 = DATA[1];
   assign n129 = DATA[2];
   assign n130 = DATA[3];
   assign n131 = DATA[4];
   assign n132 = DATA[5];
   assign n133 = DATA[6];
   assign n134 = DATA[7];
   assign n135 = DATA[8];
   assign n136 = DATA[9];
   assign n137 = DATA[10];
   assign n138 = DATA[11];
   assign n139 = DATA[12];
   assign n140 = DATA[13];
   assign n141 = DATA[14];
   assign n142 = DATA[15];
   assign n143 = DATA[16];
   assign n144 = DATA[17];
   assign n145 = DATA[18];
   assign n146 = DATA[19];
   assign n147 = DATA[20];
   assign n148 = DATA[21];
   assign n149 = DATA[22];
   assign n150 = DATA[23];
   assign n151 = DATA[24];
   assign n152 = DATA[25];
   assign n153 = DATA[26];
   assign n154 = DATA[27];
   assign n8 = WE;
   assign n3 = A[0];
   assign n4 = A[1];
   assign n5 = A[2];
   assign n6 = A[3];
   assign n7 = A[4];
   assign n161 = CLK;
   assign SINE[0] = n162;
   assign SINE[1] = n163;
   assign SINE[2] = n164;
   assign SINE[3] = n165;
   assign SINE[4] = n166;
   assign SINE[5] = n167;
   assign SINE[6] = n168;
   assign SINE[7] = n169;
   assign SINE[8] = n170;
   assign SINE[9] = n171;
   assign SINE[10] = n172;
   assign SINE[11] = n173;
   assign SINE[12] = n174;

      wire [5 : 0] BU2_I;
         assign BU2_I[0] = n3;
         assign BU2_I[1] = n4;
         assign BU2_I[2] = n5;
         assign BU2_I[3] = n6;
         assign BU2_I[4] = n7;
         assign BU2_I[5] = n8;
      wire BU2_T;
         assign BU2_T = 1'b0;
      wire BU2_EN;
         assign BU2_EN = 1'b0;
      wire BU2_Q;
      wire BU2_CLK;
         assign BU2_CLK = 1'b0;
      wire BU2_CE;
         assign BU2_CE = 1'b0;
      wire BU2_ACLR;
         assign BU2_ACLR = 1'b0;
      wire BU2_ASET;
         assign BU2_ASET = 1'b0;
      wire BU2_AINIT;
         assign BU2_AINIT = 1'b0;
      wire BU2_SCLR;
         assign BU2_SCLR = 1'b0;
      wire BU2_SSET;
         assign BU2_SSET = 1'b0;
      wire BU2_SINIT;
         assign BU2_SINIT = 1'b0;
      wire BU2_O;
         assign n2 = BU2_O;
      C_GATE_BIT_V7_0 #(
         "0"    /* c_ainit_val*/,
         0    /* c_enable_rlocs*/,
         0    /* c_gate_type*/,
         0    /* c_has_aclr*/,
         0    /* c_has_ainit*/,
         0    /* c_has_aset*/,
         0    /* c_has_ce*/,
         1    /* c_has_o*/,
         1    /* c_has_q*/,
         0    /* c_has_sclr*/,
         0    /* c_has_sinit*/,
         0    /* c_has_sset*/,
         6    /* c_inputs*/,
         "011111"    /* c_input_inv_mask*/,
         0    /* c_pipe_stages*/,
         "0"    /* c_sinit_val*/,
         0    /* c_sync_enable*/,
         1    /* c_sync_priority*/
      )
      BU2(
         .I(BU2_I),
         .T(BU2_T),
         .EN(BU2_EN),
         .Q(BU2_Q),
         .CLK(BU2_CLK),
         .CE(BU2_CE),
         .ACLR(BU2_ACLR),
         .ASET(BU2_ASET),
         .AINIT(BU2_AINIT),
         .SCLR(BU2_SCLR),
         .SSET(BU2_SSET),
         .SINIT(BU2_SINIT),
         .O(BU2_O)
      );

      wire [27 : 0] BU12_D;
         assign BU12_D[0] = n127;
         assign BU12_D[1] = n128;
         assign BU12_D[2] = n129;
         assign BU12_D[3] = n130;
         assign BU12_D[4] = n131;
         assign BU12_D[5] = n132;
         assign BU12_D[6] = n133;
         assign BU12_D[7] = n134;
         assign BU12_D[8] = n135;
         assign BU12_D[9] = n136;
         assign BU12_D[10] = n137;
         assign BU12_D[11] = n138;
         assign BU12_D[12] = n139;
         assign BU12_D[13] = n140;
         assign BU12_D[14] = n141;
         assign BU12_D[15] = n142;
         assign BU12_D[16] = n143;
         assign BU12_D[17] = n144;
         assign BU12_D[18] = n145;
         assign BU12_D[19] = n146;
         assign BU12_D[20] = n147;
         assign BU12_D[21] = n148;
         assign BU12_D[22] = n149;
         assign BU12_D[23] = n150;
         assign BU12_D[24] = n151;
         assign BU12_D[25] = n152;
         assign BU12_D[26] = n153;
         assign BU12_D[27] = n154;
      wire [27 : 0] BU12_Q;
         assign n227 = BU12_Q[0];
         assign n228 = BU12_Q[1];
         assign n229 = BU12_Q[2];
         assign n230 = BU12_Q[3];
         assign n231 = BU12_Q[4];
         assign n232 = BU12_Q[5];
         assign n233 = BU12_Q[6];
         assign n234 = BU12_Q[7];
         assign n235 = BU12_Q[8];
         assign n236 = BU12_Q[9];
         assign n237 = BU12_Q[10];
         assign n238 = BU12_Q[11];
         assign n239 = BU12_Q[12];
         assign n240 = BU12_Q[13];
         assign n241 = BU12_Q[14];
         assign n242 = BU12_Q[15];
         assign n243 = BU12_Q[16];
         assign n244 = BU12_Q[17];
         assign n245 = BU12_Q[18];
         assign n246 = BU12_Q[19];
         assign n247 = BU12_Q[20];
         assign n248 = BU12_Q[21];
         assign n249 = BU12_Q[22];
         assign n250 = BU12_Q[23];
         assign n251 = BU12_Q[24];
         assign n252 = BU12_Q[25];
         assign n253 = BU12_Q[26];
         assign n254 = BU12_Q[27];
      wire BU12_CLK;
         assign BU12_CLK = n161;
      wire BU12_CE;
         assign BU12_CE = n2;
      C_REG_FD_V7_0 #(
         "0000000000000000000000000000"    /* c_ainit_val*/,
         0    /* c_enable_rlocs*/,
         0    /* c_has_aclr*/,
         0    /* c_has_ainit*/,
         0    /* c_has_aset*/,
         1    /* c_has_ce*/,
         0    /* c_has_sclr*/,
         0    /* c_has_sinit*/,
         0    /* c_has_sset*/,
         "0000000000000000000000000000"    /* c_sinit_val*/,
         0    /* c_sync_enable*/,
         0    /* c_sync_priority*/,
         28    /* c_width*/
      )
      BU12(
         .D(BU12_D),
         .Q(BU12_Q),
         .CLK(BU12_CLK),
         .CE(BU12_CE)
      );

      wire [27 : 0] BU70_A;
         assign BU70_A[0] = n19;
         assign BU70_A[1] = n20;
         assign BU70_A[2] = n21;
         assign BU70_A[3] = n22;
         assign BU70_A[4] = n23;
         assign BU70_A[5] = n24;
         assign BU70_A[6] = n25;
         assign BU70_A[7] = n26;
         assign BU70_A[8] = n27;
         assign BU70_A[9] = n28;
         assign BU70_A[10] = n29;
         assign BU70_A[11] = n30;
         assign BU70_A[12] = n31;
         assign BU70_A[13] = n32;
         assign BU70_A[14] = n33;
         assign BU70_A[15] = n34;
         assign BU70_A[16] = n35;
         assign BU70_A[17] = n36;
         assign BU70_A[18] = n37;
         assign BU70_A[19] = n38;
         assign BU70_A[20] = n39;
         assign BU70_A[21] = n40;
         assign BU70_A[22] = n41;
         assign BU70_A[23] = n42;
         assign BU70_A[24] = n43;
         assign BU70_A[25] = n44;
         assign BU70_A[26] = n45;
         assign BU70_A[27] = n46;
      wire [27 : 0] BU70_B;
         assign BU70_B[0] = n227;
         assign BU70_B[1] = n228;
         assign BU70_B[2] = n229;
         assign BU70_B[3] = n230;
         assign BU70_B[4] = n231;
         assign BU70_B[5] = n232;
         assign BU70_B[6] = n233;
         assign BU70_B[7] = n234;
         assign BU70_B[8] = n235;
         assign BU70_B[9] = n236;
         assign BU70_B[10] = n237;
         assign BU70_B[11] = n238;
         assign BU70_B[12] = n239;
         assign BU70_B[13] = n240;
         assign BU70_B[14] = n241;
         assign BU70_B[15] = n242;
         assign BU70_B[16] = n243;
         assign BU70_B[17] = n244;
         assign BU70_B[18] = n245;
         assign BU70_B[19] = n246;
         assign BU70_B[20] = n247;
         assign BU70_B[21] = n248;
         assign BU70_B[22] = n249;
         assign BU70_B[23] = n250;
         assign BU70_B[24] = n251;
         assign BU70_B[25] = n252;
         assign BU70_B[26] = n253;
         assign BU70_B[27] = n254;
      wire [27 : 0] BU70_Q;
         assign n19 = BU70_Q[0];
         assign n20 = BU70_Q[1];
         assign n21 = BU70_Q[2];
         assign n22 = BU70_Q[3];
         assign n23 = BU70_Q[4];
         assign n24 = BU70_Q[5];
         assign n25 = BU70_Q[6];
         assign n26 = BU70_Q[7];
         assign n27 = BU70_Q[8];
         assign n28 = BU70_Q[9];
         assign n29 = BU70_Q[10];
         assign n30 = BU70_Q[11];
         assign n31 = BU70_Q[12];
         assign n32 = BU70_Q[13];
         assign n33 = BU70_Q[14];
         assign n34 = BU70_Q[15];
         assign n35 = BU70_Q[16];
         assign n36 = BU70_Q[17];
         assign n37 = BU70_Q[18];
         assign n38 = BU70_Q[19];
         assign n39 = BU70_Q[20];
         assign n40 = BU70_Q[21];
         assign n41 = BU70_Q[22];
         assign n42 = BU70_Q[23];
         assign n43 = BU70_Q[24];
         assign n44 = BU70_Q[25];
         assign n45 = BU70_Q[26];
         assign n46 = BU70_Q[27];
      wire BU70_CLK;
         assign BU70_CLK = n161;
      C_ADDSUB_V7_0 #(
         0    /* c_add_mode*/,
         "0000000000000000000000000000"    /* c_ainit_val*/,
         1    /* c_a_type*/,
         28    /* c_a_width*/,
         1    /* c_bypass_enable*/,
         0    /* c_bypass_low*/,
         0    /* c_b_constant*/,
         1    /* c_b_type*/,
         "0000000000000000000000000000"    /* c_b_value*/,
         28    /* c_b_width*/,
         0    /* c_enable_rlocs*/,
         0    /* c_has_aclr*/,
         0    /* c_has_add*/,
         0    /* c_has_ainit*/,
         0    /* c_has_aset*/,
         0    /* c_has_a_signed*/,
         0    /* c_has_bypass*/,
         0    /* c_has_bypass_with_cin*/,
         0    /* c_has_b_in*/,
         0    /* c_has_b_out*/,
         0    /* c_has_b_signed*/,
         0    /* c_has_ce*/,
         0    /* c_has_c_in*/,
         0    /* c_has_c_out*/,
         0    /* c_has_ovfl*/,
         1    /* c_has_q*/,
         0    /* c_has_q_b_out*/,
         0    /* c_has_q_c_out*/,
         0    /* c_has_q_ovfl*/,
         1    /* c_has_s*/,
         0    /* c_has_sclr*/,
         0    /* c_has_sinit*/,
         0    /* c_has_sset*/,
         27    /* c_high_bit*/,
         1    /* c_latency*/,
         0    /* c_low_bit*/,
         28    /* c_out_width*/,
         0    /* c_pipe_stages*/,
         "0000000000000000000000000000"    /* c_sinit_val*/,
         0    /* c_sync_enable*/,
         0    /* c_sync_priority*/
      )
      BU70(
         .A(BU70_A),
         .B(BU70_B),
         .Q(BU70_Q),
         .CLK(BU70_CLK)
      );

      wire BU238_CLK;
         assign BU238_CLK = n161;
      wire BU238_SDOUT;
         assign n75 = BU238_SDOUT;
      C_SHIFT_FD_V7_0 #(
         "00"    /* c_ainit_val*/,
         0    /* c_enable_rlocs*/,
         1    /* c_fill_data*/,
         0    /* c_has_aclr*/,
         0    /* c_has_ainit*/,
         0    /* c_has_aset*/,
         0    /* c_has_ce*/,
         0    /* c_has_d*/,
         0    /* c_has_lsb_2_msb*/,
         0    /* c_has_q*/,
         0    /* c_has_sclr*/,
         0    /* c_has_sdin*/,
         1    /* c_has_sdout*/,
         0    /* c_has_sinit*/,
         0    /* c_has_sset*/,
         1    /* c_shift_type*/,
         "00"    /* c_sinit_val*/,
         0    /* c_sync_enable*/,
         1    /* c_sync_priority*/,
         2    /* c_width*/
      )
      BU238(
         .CLK(BU238_CLK),
         .SDOUT(BU238_SDOUT)
      );

      wire [27 : 0] BU247_A;
         assign BU247_A[0] = n19;
         assign BU247_A[1] = n20;
         assign BU247_A[2] = n21;
         assign BU247_A[3] = n22;
         assign BU247_A[4] = n23;
         assign BU247_A[5] = n24;
         assign BU247_A[6] = n25;
         assign BU247_A[7] = n26;
         assign BU247_A[8] = n27;
         assign BU247_A[9] = n28;
         assign BU247_A[10] = n29;
         assign BU247_A[11] = n30;
         assign BU247_A[12] = n31;
         assign BU247_A[13] = n32;
         assign BU247_A[14] = n33;
         assign BU247_A[15] = n34;
         assign BU247_A[16] = n35;
         assign BU247_A[17] = n36;
         assign BU247_A[18] = n37;
         assign BU247_A[19] = n38;
         assign BU247_A[20] = n39;
         assign BU247_A[21] = n40;
         assign BU247_A[22] = n41;
         assign BU247_A[23] = n42;
         assign BU247_A[24] = n43;
         assign BU247_A[25] = n44;
         assign BU247_A[26] = n45;
         assign BU247_A[27] = n46;
      wire [27 : 0] BU247_Q;
         assign n55 = BU247_Q[8];
         assign n56 = BU247_Q[9];
         assign n57 = BU247_Q[10];
         assign n58 = BU247_Q[11];
         assign n59 = BU247_Q[12];
         assign n60 = BU247_Q[13];
         assign n61 = BU247_Q[14];
         assign n62 = BU247_Q[15];
         assign n63 = BU247_Q[16];
         assign n64 = BU247_Q[17];
         assign n65 = BU247_Q[18];
         assign n66 = BU247_Q[19];
         assign n67 = BU247_Q[20];
         assign n68 = BU247_Q[21];
         assign n69 = BU247_Q[22];
         assign n70 = BU247_Q[23];
         assign n71 = BU247_Q[24];
         assign n72 = BU247_Q[25];
         assign n73 = BU247_Q[26];
         assign n74 = BU247_Q[27];
      wire BU247_CLK;
         assign BU247_CLK = n161;
      C_ADDSUB_V7_0 #(
         0    /* c_add_mode*/,
         "0000000000000000000000000000"    /* c_ainit_val*/,
         1    /* c_a_type*/,
         28    /* c_a_width*/,
         1    /* c_bypass_enable*/,
         0    /* c_bypass_low*/,
         1    /* c_b_constant*/,
         1    /* c_b_type*/,
         "0000000000000000000000000000"    /* c_b_value*/,
         28    /* c_b_width*/,
         0    /* c_enable_rlocs*/,
         0    /* c_has_aclr*/,
         0    /* c_has_add*/,
         0    /* c_has_ainit*/,
         0    /* c_has_aset*/,
         0    /* c_has_a_signed*/,
         0    /* c_has_bypass*/,
         0    /* c_has_bypass_with_cin*/,
         0    /* c_has_b_in*/,
         0    /* c_has_b_out*/,
         0    /* c_has_b_signed*/,
         0    /* c_has_ce*/,
         0    /* c_has_c_in*/,
         0    /* c_has_c_out*/,
         0    /* c_has_ovfl*/,
         1    /* c_has_q*/,
         0    /* c_has_q_b_out*/,
         0    /* c_has_q_c_out*/,
         0    /* c_has_q_ovfl*/,
         1    /* c_has_s*/,
         0    /* c_has_sclr*/,
         0    /* c_has_sinit*/,
         0    /* c_has_sset*/,
         27    /* c_high_bit*/,
         1    /* c_latency*/,
         0    /* c_low_bit*/,
         28    /* c_out_width*/,
         0    /* c_pipe_stages*/,
         "0000000000000000000000000000"    /* c_sinit_val*/,
         0    /* c_sync_enable*/,
         0    /* c_sync_priority*/
      )
      BU247(
         .A(BU247_A),
         .Q(BU247_Q),
         .CLK(BU247_CLK)
      );

      wire [19 : 0] BU734_A;
         assign BU734_A[0] = n55;
         assign BU734_A[1] = n56;
         assign BU734_A[2] = n57;
         assign BU734_A[3] = n58;
         assign BU734_A[4] = n59;
         assign BU734_A[5] = n60;
         assign BU734_A[6] = n61;
         assign BU734_A[7] = n62;
         assign BU734_A[8] = n63;
         assign BU734_A[9] = n64;
         assign BU734_A[10] = n65;
         assign BU734_A[11] = n66;
         assign BU734_A[12] = n67;
         assign BU734_A[13] = n68;
         assign BU734_A[14] = n69;
         assign BU734_A[15] = n70;
         assign BU734_A[16] = n71;
         assign BU734_A[17] = n72;
         assign BU734_A[18] = n73;
         assign BU734_A[19] = n74;
      wire [9 : 0] BU734_B;
         assign BU734_B[0] = n87;
         assign BU734_B[1] = n88;
         assign BU734_B[2] = n89;
         assign BU734_B[3] = n90;
         assign BU734_B[4] = n91;
         assign BU734_B[5] = n92;
         assign BU734_B[6] = n93;
         assign BU734_B[7] = n94;
         assign BU734_B[8] = n95;
         assign BU734_B[9] = n96;
      wire [10 : 0] BU734_Q;
         assign n76 = BU734_Q[0];
         assign n77 = BU734_Q[1];
         assign n78 = BU734_Q[2];
         assign n79 = BU734_Q[3];
         assign n80 = BU734_Q[4];
         assign n81 = BU734_Q[5];
         assign n82 = BU734_Q[6];
         assign n83 = BU734_Q[7];
         assign n84 = BU734_Q[8];
         assign n85 = BU734_Q[9];
         assign n86 = BU734_Q[10];
      wire BU734_CLK;
         assign BU734_CLK = n161;
      C_ADDSUB_V7_0 #(
         0    /* c_add_mode*/,
         "00000000000"    /* c_ainit_val*/,
         1    /* c_a_type*/,
         20    /* c_a_width*/,
         1    /* c_bypass_enable*/,
         0    /* c_bypass_low*/,
         0    /* c_b_constant*/,
         0    /* c_b_type*/,
         "00000000000000000000"    /* c_b_value*/,
         10    /* c_b_width*/,
         0    /* c_enable_rlocs*/,
         0    /* c_has_aclr*/,
         0    /* c_has_add*/,
         0    /* c_has_ainit*/,
         0    /* c_has_aset*/,
         0    /* c_has_a_signed*/,
         0    /* c_has_bypass*/,
         0    /* c_has_bypass_with_cin*/,
         0    /* c_has_b_in*/,
         0    /* c_has_b_out*/,
         0    /* c_has_b_signed*/,
         0    /* c_has_ce*/,
         0    /* c_has_c_in*/,
         0    /* c_has_c_out*/,
         0    /* c_has_ovfl*/,
         1    /* c_has_q*/,
         0    /* c_has_q_b_out*/,
         0    /* c_has_q_c_out*/,
         0    /* c_has_q_ovfl*/,
         1    /* c_has_s*/,
         0    /* c_has_sclr*/,
         0    /* c_has_sinit*/,
         0    /* c_has_sset*/,
         19    /* c_high_bit*/,
         1    /* c_latency*/,
         9    /* c_low_bit*/,
         11    /* c_out_width*/,
         0    /* c_pipe_stages*/,
         "00000000000"    /* c_sinit_val*/,
         0    /* c_sync_enable*/,
         0    /* c_sync_priority*/
      )
      BU734(
         .A(BU734_A),
         .B(BU734_B),
         .Q(BU734_Q),
         .CLK(BU734_CLK)
      );

      wire [8 : 0] BU673_A;
         assign BU673_A[0] = n1523;
         assign BU673_A[1] = n1524;
         assign BU673_A[2] = n1525;
         assign BU673_A[3] = n1526;
         assign BU673_A[4] = n1527;
         assign BU673_A[5] = n1528;
         assign BU673_A[6] = n1529;
         assign BU673_A[7] = n1530;
         assign BU673_A[8] = n1531;
      wire [8 : 0] BU673_B;
         assign BU673_B[0] = n1631;
         assign BU673_B[1] = n1632;
         assign BU673_B[2] = n1633;
         assign BU673_B[3] = n1634;
         assign BU673_B[4] = n1635;
         assign BU673_B[5] = n1636;
         assign BU673_B[6] = n1637;
         assign BU673_B[7] = n1638;
         assign BU673_B[8] = n1639;
      wire [9 : 0] BU673_Q;
         assign n87 = BU673_Q[0];
         assign n88 = BU673_Q[1];
         assign n89 = BU673_Q[2];
         assign n90 = BU673_Q[3];
         assign n91 = BU673_Q[4];
         assign n92 = BU673_Q[5];
         assign n93 = BU673_Q[6];
         assign n94 = BU673_Q[7];
         assign n95 = BU673_Q[8];
         assign n96 = BU673_Q[9];
      wire BU673_CLK;
         assign BU673_CLK = n161;
      C_ADDSUB_V7_0 #(
         0    /* c_add_mode*/,
         "0000000000"    /* c_ainit_val*/,
         0    /* c_a_type*/,
         9    /* c_a_width*/,
         0    /* c_bypass_enable*/,
         0    /* c_bypass_low*/,
         0    /* c_b_constant*/,
         0    /* c_b_type*/,
         "0000000000"    /* c_b_value*/,
         9    /* c_b_width*/,
         0    /* c_enable_rlocs*/,
         0    /* c_has_aclr*/,
         0    /* c_has_add*/,
         0    /* c_has_ainit*/,
         0    /* c_has_aset*/,
         0    /* c_has_a_signed*/,
         0    /* c_has_bypass*/,
         0    /* c_has_bypass_with_cin*/,
         0    /* c_has_b_in*/,
         0    /* c_has_b_out*/,
         0    /* c_has_b_signed*/,
         0    /* c_has_ce*/,
         0    /* c_has_c_in*/,
         0    /* c_has_c_out*/,
         0    /* c_has_ovfl*/,
         1    /* c_has_q*/,
         0    /* c_has_q_b_out*/,
         0    /* c_has_q_c_out*/,
         0    /* c_has_q_ovfl*/,
         1    /* c_has_s*/,
         0    /* c_has_sclr*/,
         0    /* c_has_sinit*/,
         0    /* c_has_sset*/,
         9    /* c_high_bit*/,
         1    /* c_latency*/,
         0    /* c_low_bit*/,
         10    /* c_out_width*/,
         0    /* c_pipe_stages*/,
         "0000000000"    /* c_sinit_val*/,
         0    /* c_sync_enable*/,
         0    /* c_sync_priority*/
      )
      BU673(
         .A(BU673_A),
         .B(BU673_B),
         .Q(BU673_Q),
         .CLK(BU673_CLK)
      );

      wire [7 : 0] BU487_A;
         assign BU487_A[0] = n1422;
         assign BU487_A[1] = n1423;
         assign BU487_A[2] = n1424;
         assign BU487_A[3] = n1425;
         assign BU487_A[4] = n1426;
         assign BU487_A[5] = n1427;
         assign BU487_A[6] = n1428;
         assign BU487_A[7] = n1429;
      wire [7 : 0] BU487_B;
         assign BU487_B[0] = n1472;
         assign BU487_B[1] = n1473;
         assign BU487_B[2] = n1474;
         assign BU487_B[3] = n1475;
         assign BU487_B[4] = n1476;
         assign BU487_B[5] = n1477;
         assign BU487_B[6] = n1478;
         assign BU487_B[7] = n1479;
      wire [8 : 0] BU487_Q;
         assign n1523 = BU487_Q[0];
         assign n1524 = BU487_Q[1];
         assign n1525 = BU487_Q[2];
         assign n1526 = BU487_Q[3];
         assign n1527 = BU487_Q[4];
         assign n1528 = BU487_Q[5];
         assign n1529 = BU487_Q[6];
         assign n1530 = BU487_Q[7];
         assign n1531 = BU487_Q[8];
      wire BU487_CLK;
         assign BU487_CLK = n161;
      C_ADDSUB_V7_0 #(
         0    /* c_add_mode*/,
         "000000000"    /* c_ainit_val*/,
         0    /* c_a_type*/,
         8    /* c_a_width*/,
         0    /* c_bypass_enable*/,
         0    /* c_bypass_low*/,
         0    /* c_b_constant*/,
         0    /* c_b_type*/,
         "000000000"    /* c_b_value*/,
         8    /* c_b_width*/,
         0    /* c_enable_rlocs*/,
         0    /* c_has_aclr*/,
         0    /* c_has_add*/,
         0    /* c_has_ainit*/,
         0    /* c_has_aset*/,
         0    /* c_has_a_signed*/,
         0    /* c_has_bypass*/,
         0    /* c_has_bypass_with_cin*/,
         0    /* c_has_b_in*/,
         0    /* c_has_b_out*/,
         0    /* c_has_b_signed*/,
         0    /* c_has_ce*/,
         0    /* c_has_c_in*/,
         0    /* c_has_c_out*/,
         0    /* c_has_ovfl*/,
         1    /* c_has_q*/,
         0    /* c_has_q_b_out*/,
         0    /* c_has_q_c_out*/,
         0    /* c_has_q_ovfl*/,
         1    /* c_has_s*/,
         0    /* c_has_sclr*/,
         0    /* c_has_sinit*/,
         0    /* c_has_sset*/,
         8    /* c_high_bit*/,
         1    /* c_latency*/,
         0    /* c_low_bit*/,
         9    /* c_out_width*/,
         0    /* c_pipe_stages*/,
         "000000000"    /* c_sinit_val*/,
         0    /* c_sync_enable*/,
         0    /* c_sync_priority*/
      )
      BU487(
         .A(BU487_A),
         .B(BU487_B),
         .Q(BU487_Q),
         .CLK(BU487_CLK)
      );

      wire [3 : 0] BU418_I;
         assign BU418_I[0] = n1431;
         assign BU418_I[1] = n1432;
         assign BU418_I[2] = n1433;
         assign BU418_I[3] = n1429;
      wire BU418_T;
         assign BU418_T = 1'b0;
      wire BU418_EN;
         assign BU418_EN = 1'b0;
      wire BU418_Q;
      wire BU418_CLK;
         assign BU418_CLK = 1'b0;
      wire BU418_CE;
         assign BU418_CE = 1'b0;
      wire BU418_ACLR;
         assign BU418_ACLR = 1'b0;
      wire BU418_ASET;
         assign BU418_ASET = 1'b0;
      wire BU418_AINIT;
         assign BU418_AINIT = 1'b0;
      wire BU418_SCLR;
         assign BU418_SCLR = 1'b0;
      wire BU418_SSET;
         assign BU418_SSET = 1'b0;
      wire BU418_SINIT;
         assign BU418_SINIT = 1'b0;
      wire BU418_O;
         assign n1430 = BU418_O;
      C_GATE_BIT_V7_0 #(
         "0"    /* c_ainit_val*/,
         0    /* c_enable_rlocs*/,
         4    /* c_gate_type*/,
         0    /* c_has_aclr*/,
         0    /* c_has_ainit*/,
         0    /* c_has_aset*/,
         0    /* c_has_ce*/,
         1    /* c_has_o*/,
         1    /* c_has_q*/,
         0    /* c_has_sclr*/,
         0    /* c_has_sinit*/,
         0    /* c_has_sset*/,
         4    /* c_inputs*/,
         "0000"    /* c_input_inv_mask*/,
         0    /* c_pipe_stages*/,
         "0"    /* c_sinit_val*/,
         0    /* c_sync_enable*/,
         1    /* c_sync_priority*/
      )
      BU418(
         .I(BU418_I),
         .T(BU418_T),
         .EN(BU418_EN),
         .Q(BU418_Q),
         .CLK(BU418_CLK),
         .CE(BU418_CE),
         .ACLR(BU418_ACLR),
         .ASET(BU418_ASET),
         .AINIT(BU418_AINIT),
         .SCLR(BU418_SCLR),
         .SSET(BU418_SSET),
         .SINIT(BU418_SINIT),
         .O(BU418_O)
      );

      wire BU423_CLK;
         assign BU423_CLK = n161;
      wire BU423_SDIN;
         assign BU423_SDIN = n1430;
      wire [12 : 0] BU423_Q;
         assign n1431 = BU423_Q[0];
         assign n1432 = BU423_Q[2];
         assign n1433 = BU423_Q[3];
         assign n1422 = BU423_Q[5];
         assign n1423 = BU423_Q[6];
         assign n1424 = BU423_Q[7];
         assign n1425 = BU423_Q[8];
         assign n1426 = BU423_Q[9];
         assign n1427 = BU423_Q[10];
         assign n1428 = BU423_Q[11];
         assign n1429 = BU423_Q[12];
      C_SHIFT_FD_V7_0 #(
         "1000000000000"    /* c_ainit_val*/,
         0    /* c_enable_rlocs*/,
         5    /* c_fill_data*/,
         0    /* c_has_aclr*/,
         0    /* c_has_ainit*/,
         0    /* c_has_aset*/,
         0    /* c_has_ce*/,
         0    /* c_has_d*/,
         0    /* c_has_lsb_2_msb*/,
         1    /* c_has_q*/,
         0    /* c_has_sclr*/,
         1    /* c_has_sdin*/,
         0    /* c_has_sdout*/,
         0    /* c_has_sinit*/,
         0    /* c_has_sset*/,
         0    /* c_shift_type*/,
         "1000000000000"    /* c_sinit_val*/,
         0    /* c_sync_enable*/,
         0    /* c_sync_priority*/,
         13    /* c_width*/
      )
      BU423(
         .CLK(BU423_CLK),
         .SDIN(BU423_SDIN),
         .Q(BU423_Q)
      );

      wire [3 : 0] BU452_I;
         assign BU452_I[0] = n1481;
         assign BU452_I[1] = n1482;
         assign BU452_I[2] = n1475;
         assign BU452_I[3] = n1479;
      wire BU452_T;
         assign BU452_T = 1'b0;
      wire BU452_EN;
         assign BU452_EN = 1'b0;
      wire BU452_Q;
      wire BU452_CLK;
         assign BU452_CLK = 1'b0;
      wire BU452_CE;
         assign BU452_CE = 1'b0;
      wire BU452_ACLR;
         assign BU452_ACLR = 1'b0;
      wire BU452_ASET;
         assign BU452_ASET = 1'b0;
      wire BU452_AINIT;
         assign BU452_AINIT = 1'b0;
      wire BU452_SCLR;
         assign BU452_SCLR = 1'b0;
      wire BU452_SSET;
         assign BU452_SSET = 1'b0;
      wire BU452_SINIT;
         assign BU452_SINIT = 1'b0;
      wire BU452_O;
         assign n1480 = BU452_O;
      C_GATE_BIT_V7_0 #(
         "0"    /* c_ainit_val*/,
         0    /* c_enable_rlocs*/,
         4    /* c_gate_type*/,
         0    /* c_has_aclr*/,
         0    /* c_has_ainit*/,
         0    /* c_has_aset*/,
         0    /* c_has_ce*/,
         1    /* c_has_o*/,
         1    /* c_has_q*/,
         0    /* c_has_sclr*/,
         0    /* c_has_sinit*/,
         0    /* c_has_sset*/,
         4    /* c_inputs*/,
         "0000"    /* c_input_inv_mask*/,
         0    /* c_pipe_stages*/,
         "0"    /* c_sinit_val*/,
         0    /* c_sync_enable*/,
         1    /* c_sync_priority*/
      )
      BU452(
         .I(BU452_I),
         .T(BU452_T),
         .EN(BU452_EN),
         .Q(BU452_Q),
         .CLK(BU452_CLK),
         .CE(BU452_CE),
         .ACLR(BU452_ACLR),
         .ASET(BU452_ASET),
         .AINIT(BU452_AINIT),
         .SCLR(BU452_SCLR),
         .SSET(BU452_SSET),
         .SINIT(BU452_SINIT),
         .O(BU452_O)
      );

      wire BU457_CLK;
         assign BU457_CLK = n161;
      wire BU457_SDIN;
         assign BU457_SDIN = n1480;
      wire [13 : 0] BU457_Q;
         assign n1481 = BU457_Q[0];
         assign n1482 = BU457_Q[5];
         assign n1472 = BU457_Q[6];
         assign n1473 = BU457_Q[7];
         assign n1474 = BU457_Q[8];
         assign n1475 = BU457_Q[9];
         assign n1476 = BU457_Q[10];
         assign n1477 = BU457_Q[11];
         assign n1478 = BU457_Q[12];
         assign n1479 = BU457_Q[13];
      C_SHIFT_FD_V7_0 #(
         "10000000000000"    /* c_ainit_val*/,
         0    /* c_enable_rlocs*/,
         5    /* c_fill_data*/,
         0    /* c_has_aclr*/,
         0    /* c_has_ainit*/,
         0    /* c_has_aset*/,
         0    /* c_has_ce*/,
         0    /* c_has_d*/,
         0    /* c_has_lsb_2_msb*/,
         1    /* c_has_q*/,
         0    /* c_has_sclr*/,
         1    /* c_has_sdin*/,
         0    /* c_has_sdout*/,
         0    /* c_has_sinit*/,
         0    /* c_has_sset*/,
         0    /* c_shift_type*/,
         "10000000000000"    /* c_sinit_val*/,
         0    /* c_sync_enable*/,
         0    /* c_sync_priority*/,
         14    /* c_width*/
      )
      BU457(
         .CLK(BU457_CLK),
         .SDIN(BU457_SDIN),
         .Q(BU457_Q)
      );

      wire [7 : 0] BU619_A;
         assign BU619_A[0] = n1532;
         assign BU619_A[1] = n1533;
         assign BU619_A[2] = n1534;
         assign BU619_A[3] = n1535;
         assign BU619_A[4] = n1536;
         assign BU619_A[5] = n1537;
         assign BU619_A[6] = n1538;
         assign BU619_A[7] = n1539;
      wire [7 : 0] BU619_B;
         assign BU619_B[0] = n1578;
         assign BU619_B[1] = n1579;
         assign BU619_B[2] = n1580;
         assign BU619_B[3] = n1581;
         assign BU619_B[4] = n1582;
         assign BU619_B[5] = n1583;
         assign BU619_B[6] = n1584;
         assign BU619_B[7] = n1585;
      wire [8 : 0] BU619_Q;
         assign n1631 = BU619_Q[0];
         assign n1632 = BU619_Q[1];
         assign n1633 = BU619_Q[2];
         assign n1634 = BU619_Q[3];
         assign n1635 = BU619_Q[4];
         assign n1636 = BU619_Q[5];
         assign n1637 = BU619_Q[6];
         assign n1638 = BU619_Q[7];
         assign n1639 = BU619_Q[8];
      wire BU619_CLK;
         assign BU619_CLK = n161;
      C_ADDSUB_V7_0 #(
         0    /* c_add_mode*/,
         "000000000"    /* c_ainit_val*/,
         0    /* c_a_type*/,
         8    /* c_a_width*/,
         0    /* c_bypass_enable*/,
         0    /* c_bypass_low*/,
         0    /* c_b_constant*/,
         0    /* c_b_type*/,
         "000000000"    /* c_b_value*/,
         8    /* c_b_width*/,
         0    /* c_enable_rlocs*/,
         0    /* c_has_aclr*/,
         0    /* c_has_add*/,
         0    /* c_has_ainit*/,
         0    /* c_has_aset*/,
         0    /* c_has_a_signed*/,
         0    /* c_has_bypass*/,
         0    /* c_has_bypass_with_cin*/,
         0    /* c_has_b_in*/,
         0    /* c_has_b_out*/,
         0    /* c_has_b_signed*/,
         0    /* c_has_ce*/,
         0    /* c_has_c_in*/,
         0    /* c_has_c_out*/,
         0    /* c_has_ovfl*/,
         1    /* c_has_q*/,
         0    /* c_has_q_b_out*/,
         0    /* c_has_q_c_out*/,
         0    /* c_has_q_ovfl*/,
         1    /* c_has_s*/,
         0    /* c_has_sclr*/,
         0    /* c_has_sinit*/,
         0    /* c_has_sset*/,
         8    /* c_high_bit*/,
         1    /* c_latency*/,
         0    /* c_low_bit*/,
         9    /* c_out_width*/,
         0    /* c_pipe_stages*/,
         "000000000"    /* c_sinit_val*/,
         0    /* c_sync_enable*/,
         0    /* c_sync_priority*/
      )
      BU619(
         .A(BU619_A),
         .B(BU619_B),
         .Q(BU619_Q),
         .CLK(BU619_CLK)
      );

      wire [1 : 0] BU542_I;
         assign BU542_I[0] = n1541;
         assign BU542_I[1] = n1539;
      wire BU542_T;
         assign BU542_T = 1'b0;
      wire BU542_EN;
         assign BU542_EN = 1'b0;
      wire BU542_Q;
      wire BU542_CLK;
         assign BU542_CLK = 1'b0;
      wire BU542_CE;
         assign BU542_CE = 1'b0;
      wire BU542_ACLR;
         assign BU542_ACLR = 1'b0;
      wire BU542_ASET;
         assign BU542_ASET = 1'b0;
      wire BU542_AINIT;
         assign BU542_AINIT = 1'b0;
      wire BU542_SCLR;
         assign BU542_SCLR = 1'b0;
      wire BU542_SSET;
         assign BU542_SSET = 1'b0;
      wire BU542_SINIT;
         assign BU542_SINIT = 1'b0;
      wire BU542_O;
         assign n1540 = BU542_O;
      C_GATE_BIT_V7_0 #(
         "0"    /* c_ainit_val*/,
         0    /* c_enable_rlocs*/,
         4    /* c_gate_type*/,
         0    /* c_has_aclr*/,
         0    /* c_has_ainit*/,
         0    /* c_has_aset*/,
         0    /* c_has_ce*/,
         1    /* c_has_o*/,
         1    /* c_has_q*/,
         0    /* c_has_sclr*/,
         0    /* c_has_sinit*/,
         0    /* c_has_sset*/,
         2    /* c_inputs*/,
         "00"    /* c_input_inv_mask*/,
         0    /* c_pipe_stages*/,
         "0"    /* c_sinit_val*/,
         0    /* c_sync_enable*/,
         1    /* c_sync_priority*/
      )
      BU542(
         .I(BU542_I),
         .T(BU542_T),
         .EN(BU542_EN),
         .Q(BU542_Q),
         .CLK(BU542_CLK),
         .CE(BU542_CE),
         .ACLR(BU542_ACLR),
         .ASET(BU542_ASET),
         .AINIT(BU542_AINIT),
         .SCLR(BU542_SCLR),
         .SSET(BU542_SSET),
         .SINIT(BU542_SINIT),
         .O(BU542_O)
      );

      wire BU547_CLK;
         assign BU547_CLK = n161;
      wire BU547_SDIN;
         assign BU547_SDIN = n1540;
      wire [14 : 0] BU547_Q;
         assign n1541 = BU547_Q[0];
         assign n1532 = BU547_Q[7];
         assign n1533 = BU547_Q[8];
         assign n1534 = BU547_Q[9];
         assign n1535 = BU547_Q[10];
         assign n1536 = BU547_Q[11];
         assign n1537 = BU547_Q[12];
         assign n1538 = BU547_Q[13];
         assign n1539 = BU547_Q[14];
      C_SHIFT_FD_V7_0 #(
         "100000000000000"    /* c_ainit_val*/,
         0    /* c_enable_rlocs*/,
         5    /* c_fill_data*/,
         0    /* c_has_aclr*/,
         0    /* c_has_ainit*/,
         0    /* c_has_aset*/,
         0    /* c_has_ce*/,
         0    /* c_has_d*/,
         0    /* c_has_lsb_2_msb*/,
         1    /* c_has_q*/,
         0    /* c_has_sclr*/,
         1    /* c_has_sdin*/,
         0    /* c_has_sdout*/,
         0    /* c_has_sinit*/,
         0    /* c_has_sset*/,
         0    /* c_shift_type*/,
         "100000000000000"    /* c_sinit_val*/,
         0    /* c_sync_enable*/,
         0    /* c_sync_priority*/,
         15    /* c_width*/
      )
      BU547(
         .CLK(BU547_CLK),
         .SDIN(BU547_SDIN),
         .Q(BU547_Q)
      );

      wire [3 : 0] BU580_I;
         assign BU580_I[0] = n1587;
         assign BU580_I[1] = n1588;
         assign BU580_I[2] = n1581;
         assign BU580_I[3] = n1585;
      wire BU580_T;
         assign BU580_T = 1'b0;
      wire BU580_EN;
         assign BU580_EN = 1'b0;
      wire BU580_Q;
      wire BU580_CLK;
         assign BU580_CLK = 1'b0;
      wire BU580_CE;
         assign BU580_CE = 1'b0;
      wire BU580_ACLR;
         assign BU580_ACLR = 1'b0;
      wire BU580_ASET;
         assign BU580_ASET = 1'b0;
      wire BU580_AINIT;
         assign BU580_AINIT = 1'b0;
      wire BU580_SCLR;
         assign BU580_SCLR = 1'b0;
      wire BU580_SSET;
         assign BU580_SSET = 1'b0;
      wire BU580_SINIT;
         assign BU580_SINIT = 1'b0;
      wire BU580_O;
         assign n1586 = BU580_O;
      C_GATE_BIT_V7_0 #(
         "0"    /* c_ainit_val*/,
         0    /* c_enable_rlocs*/,
         4    /* c_gate_type*/,
         0    /* c_has_aclr*/,
         0    /* c_has_ainit*/,
         0    /* c_has_aset*/,
         0    /* c_has_ce*/,
         1    /* c_has_o*/,
         1    /* c_has_q*/,
         0    /* c_has_sclr*/,
         0    /* c_has_sinit*/,
         0    /* c_has_sset*/,
         4    /* c_inputs*/,
         "0000"    /* c_input_inv_mask*/,
         0    /* c_pipe_stages*/,
         "0"    /* c_sinit_val*/,
         0    /* c_sync_enable*/,
         1    /* c_sync_priority*/
      )
      BU580(
         .I(BU580_I),
         .T(BU580_T),
         .EN(BU580_EN),
         .Q(BU580_Q),
         .CLK(BU580_CLK),
         .CE(BU580_CE),
         .ACLR(BU580_ACLR),
         .ASET(BU580_ASET),
         .AINIT(BU580_AINIT),
         .SCLR(BU580_SCLR),
         .SSET(BU580_SSET),
         .SINIT(BU580_SINIT),
         .O(BU580_O)
      );

      wire BU585_CLK;
         assign BU585_CLK = n161;
      wire BU585_SDIN;
         assign BU585_SDIN = n1586;
      wire [15 : 0] BU585_Q;
         assign n1587 = BU585_Q[0];
         assign n1588 = BU585_Q[2];
         assign n1578 = BU585_Q[8];
         assign n1579 = BU585_Q[9];
         assign n1580 = BU585_Q[10];
         assign n1581 = BU585_Q[11];
         assign n1582 = BU585_Q[12];
         assign n1583 = BU585_Q[13];
         assign n1584 = BU585_Q[14];
         assign n1585 = BU585_Q[15];
      C_SHIFT_FD_V7_0 #(
         "1000000000000000"    /* c_ainit_val*/,
         0    /* c_enable_rlocs*/,
         5    /* c_fill_data*/,
         0    /* c_has_aclr*/,
         0    /* c_has_ainit*/,
         0    /* c_has_aset*/,
         0    /* c_has_ce*/,
         0    /* c_has_d*/,
         0    /* c_has_lsb_2_msb*/,
         1    /* c_has_q*/,
         0    /* c_has_sclr*/,
         1    /* c_has_sdin*/,
         0    /* c_has_sdout*/,
         0    /* c_has_sinit*/,
         0    /* c_has_sset*/,
         0    /* c_shift_type*/,
         "1000000000000000"    /* c_sinit_val*/,
         0    /* c_sync_enable*/,
         0    /* c_sync_priority*/,
         16    /* c_width*/
      )
      BU585(
         .CLK(BU585_CLK),
         .SDIN(BU585_SDIN),
         .Q(BU585_Q)
      );

      wire [10 : 0] BU863_D;
         assign BU863_D[0] = n76;
         assign BU863_D[1] = n77;
         assign BU863_D[2] = n78;
         assign BU863_D[3] = n79;
         assign BU863_D[4] = n80;
         assign BU863_D[5] = n81;
         assign BU863_D[6] = n82;
         assign BU863_D[7] = n83;
         assign BU863_D[8] = n84;
         assign BU863_D[9] = n85;
         assign BU863_D[10] = n86;
      wire [10 : 0] BU863_Q;
         assign n2267 = BU863_Q[0];
         assign n2268 = BU863_Q[1];
         assign n2269 = BU863_Q[2];
         assign n2270 = BU863_Q[3];
         assign n2271 = BU863_Q[4];
         assign n2272 = BU863_Q[5];
         assign n2273 = BU863_Q[6];
         assign n2274 = BU863_Q[7];
         assign n2275 = BU863_Q[8];
         assign n2276 = BU863_Q[9];
         assign n2277 = BU863_Q[10];
      wire BU863_CLK;
         assign BU863_CLK = n161;
      C_REG_FD_V7_0 #(
         "00000000000"    /* c_ainit_val*/,
         0    /* c_enable_rlocs*/,
         0    /* c_has_aclr*/,
         0    /* c_has_ainit*/,
         0    /* c_has_aset*/,
         0    /* c_has_ce*/,
         0    /* c_has_sclr*/,
         0    /* c_has_sinit*/,
         0    /* c_has_sset*/,
         "00000000000"    /* c_sinit_val*/,
         0    /* c_sync_enable*/,
         0    /* c_sync_priority*/,
         11    /* c_width*/
      )
      BU863(
         .D(BU863_D),
         .Q(BU863_Q),
         .CLK(BU863_CLK)
      );

      wire [8 : 0] BU888_A;
         assign BU888_A[0] = n2267;
         assign BU888_A[1] = n2268;
         assign BU888_A[2] = n2269;
         assign BU888_A[3] = n2270;
         assign BU888_A[4] = n2271;
         assign BU888_A[5] = n2272;
         assign BU888_A[6] = n2273;
         assign BU888_A[7] = n2274;
         assign BU888_A[8] = n2275;
      wire BU888_BYPASS;
         assign BU888_BYPASS = n2276;
      wire BU888_CLK;
         assign BU888_CLK = n161;
      wire [9 : 0] BU888_Q;
         assign n2298 = BU888_Q[0];
         assign n2299 = BU888_Q[1];
         assign n2300 = BU888_Q[2];
         assign n2301 = BU888_Q[3];
         assign n2302 = BU888_Q[4];
         assign n2303 = BU888_Q[5];
         assign n2304 = BU888_Q[6];
         assign n2305 = BU888_Q[7];
         assign n2306 = BU888_Q[8];
      C_TWOS_COMP_V7_0 #(
         "0000000000"    /* c_ainit_val*/,
         1    /* c_bypass_enable*/,
         1    /* c_bypass_low*/,
         0    /* c_enable_rlocs*/,
         0    /* c_has_aclr*/,
         0    /* c_has_ainit*/,
         0    /* c_has_aset*/,
         1    /* c_has_bypass*/,
         0    /* c_has_ce*/,
         1    /* c_has_q*/,
         0    /* c_has_s*/,
         0    /* c_has_sclr*/,
         0    /* c_has_sinit*/,
         0    /* c_has_sset*/,
         0    /* c_pipe_stages*/,
         "0000000000"    /* c_sinit_val*/,
         0    /* c_sync_enable*/,
         0    /* c_sync_priority*/,
         9    /* c_width*/
      )
      BU888(
         .A(BU888_A),
         .BYPASS(BU888_BYPASS),
         .CLK(BU888_CLK),
         .Q(BU888_Q)
      );

      wire BU960_CLK;
         assign BU960_CLK = n161;
      wire [0 : 0] BU960_D;
         assign BU960_D[0] = n2277;
      wire [0 : 0] BU960_Q;
         assign n2278 = BU960_Q[0];
      C_SHIFT_RAM_V7_0 #(
         1    /* c_addr_width*/,
         "0"    /* c_ainit_val*/,
         "0"    /* c_default_data*/,
         2    /* c_default_data_radix*/,
         2    /* c_depth*/,
         0    /* c_enable_rlocs*/,
         0    /* c_generate_mif*/,
         0    /* c_has_a*/,
         0    /* c_has_aclr*/,
         0    /* c_has_ainit*/,
         0    /* c_has_aset*/,
         0    /* c_has_ce*/,
         0    /* c_has_sclr*/,
         0    /* c_has_sinit*/,
         0    /* c_has_sset*/,
         "null"    /* c_mem_init_file*/,
         2    /* c_mem_init_radix*/,
         0    /* c_read_mif*/,
         1    /* c_reg_last_bit*/,
         0    /* c_shift_type*/,
         "0"    /* c_sinit_val*/,
         0    /* c_sync_enable*/,
         0    /* c_sync_priority*/,
         1    /* c_width*/
      )
      BU960(
         .CLK(BU960_CLK),
         .D(BU960_D),
         .Q(BU960_Q)
      );

      wire BU968_CLK;
         assign BU968_CLK = n161;
      wire [0 : 0] BU968_D;
         assign BU968_D[0] = n2276;
      wire [0 : 0] BU968_Q;
         assign n2279 = BU968_Q[0];
      C_SHIFT_RAM_V7_0 #(
         1    /* c_addr_width*/,
         "0"    /* c_ainit_val*/,
         "0"    /* c_default_data*/,
         2    /* c_default_data_radix*/,
         2    /* c_depth*/,
         0    /* c_enable_rlocs*/,
         0    /* c_generate_mif*/,
         0    /* c_has_a*/,
         0    /* c_has_aclr*/,
         0    /* c_has_ainit*/,
         0    /* c_has_aset*/,
         0    /* c_has_ce*/,
         0    /* c_has_sclr*/,
         0    /* c_has_sinit*/,
         0    /* c_has_sset*/,
         "null"    /* c_mem_init_file*/,
         2    /* c_mem_init_radix*/,
         0    /* c_read_mif*/,
         1    /* c_reg_last_bit*/,
         0    /* c_shift_type*/,
         "0"    /* c_sinit_val*/,
         0    /* c_sync_enable*/,
         0    /* c_sync_priority*/,
         1    /* c_width*/
      )
      BU968(
         .CLK(BU968_CLK),
         .D(BU968_D),
         .Q(BU968_Q)
      );

      defparam BU979.INIT = 'h9595;
      wire BU979_I0;
         assign BU979_I0 = n2278;
      wire BU979_I1;
         assign BU979_I1 = n2279;
      wire BU979_I2;
         assign BU979_I2 = n2311;
      wire BU979_I3;
         assign BU979_I3 = 1'b0;
      wire BU979_O;
         assign n2543 = BU979_O;
      LUT4       BU979(
         .I0(BU979_I0),
         .I1(BU979_I1),
         .I2(BU979_I2),
         .I3(BU979_I3),
         .O(BU979_O)
      );

      wire BU980_D;
         assign BU980_D = n2543;
      wire BU980_C;
         assign BU980_C = n161;
      wire BU980_CE;
         assign BU980_CE = 1'b1;
      wire BU980_PRE;
         assign BU980_PRE = 1'b0;
      wire BU980_Q;
         assign n2313 = BU980_Q;
      FDPE       BU980(
         .D(BU980_D),
         .C(BU980_C),
         .CE(BU980_CE),
         .PRE(BU980_PRE),
         .Q(BU980_Q)
      );

      defparam BU984.INIT = 'h002a;
      wire BU984_I0;
         assign BU984_I0 = n2278;
      wire BU984_I1;
         assign BU984_I1 = n2279;
      wire BU984_I2;
         assign BU984_I2 = n2311;
      wire BU984_I3;
         assign BU984_I3 = n2312;
      wire BU984_O;
         assign n2560 = BU984_O;
      LUT4       BU984(
         .I0(BU984_I0),
         .I1(BU984_I1),
         .I2(BU984_I2),
         .I3(BU984_I3),
         .O(BU984_O)
      );

      wire BU985_D;
         assign BU985_D = n2560;
      wire BU985_C;
         assign BU985_C = n161;
      wire BU985_CE;
         assign BU985_CE = 1'b1;
      wire BU985_Q;
         assign n2314 = BU985_Q;
      FDE       BU985(
         .D(BU985_D),
         .C(BU985_C),
         .CE(BU985_CE),
         .Q(BU985_Q)
      );

      defparam BU989.INIT = 'hc0c0;
      wire BU989_I0;
         assign BU989_I0 = 1'b0;
      wire BU989_I1;
         assign BU989_I1 = n2279;
      wire BU989_I2;
         assign BU989_I2 = n2311;
      wire BU989_I3;
         assign BU989_I3 = 1'b0;
      wire BU989_O;
         assign n2576 = BU989_O;
      LUT4       BU989(
         .I0(BU989_I0),
         .I1(BU989_I1),
         .I2(BU989_I2),
         .I3(BU989_I3),
         .O(BU989_O)
      );

      wire BU990_D;
         assign BU990_D = n2576;
      wire BU990_C;
         assign BU990_C = n161;
      wire BU990_CE;
         assign BU990_CE = 1'b1;
      wire BU990_Q;
         assign n2310 = BU990_Q;
      FDE       BU990(
         .D(BU990_D),
         .C(BU990_C),
         .CE(BU990_CE),
         .Q(BU990_Q)
      );

      wire [8 : 0] BU992_A;
         assign BU992_A[0] = n2298;
         assign BU992_A[1] = n2299;
         assign BU992_A[2] = n2300;
         assign BU992_A[3] = n2301;
         assign BU992_A[4] = n2302;
         assign BU992_A[5] = n2303;
         assign BU992_A[6] = n2304;
         assign BU992_A[7] = n2305;
         assign BU992_A[8] = n2306;
      wire BU992_CLK;
         assign BU992_CLK = n161;
      wire BU992_ACLR;
         assign BU992_ACLR = 1'b0;
      wire BU992_QA_GE_B;
         assign n2312 = BU992_QA_GE_B;
      C_COMPARE_V7_0 #(
         "0"    /* c_ainit_val*/,
         1    /* c_b_constant*/,
         "111111011"    /* c_b_value*/,
         1    /* c_data_type*/,
         0    /* c_enable_rlocs*/,
         1    /* c_has_aclr*/,
         0    /* c_has_aset*/,
         0    /* c_has_a_eq_b*/,
         0    /* c_has_a_ge_b*/,
         0    /* c_has_a_gt_b*/,
         0    /* c_has_a_le_b*/,
         0    /* c_has_a_lt_b*/,
         0    /* c_has_a_ne_b*/,
         0    /* c_has_ce*/,
         0    /* c_has_qa_eq_b*/,
         1    /* c_has_qa_ge_b*/,
         0    /* c_has_qa_gt_b*/,
         0    /* c_has_qa_le_b*/,
         0    /* c_has_qa_lt_b*/,
         0    /* c_has_qa_ne_b*/,
         0    /* c_has_sclr*/,
         0    /* c_has_sset*/,
         0    /* c_pipe_stages*/,
         0    /* c_sync_enable*/,
         0    /* c_sync_priority*/,
         9    /* c_width*/
      )
      BU992(
         .A(BU992_A),
         .CLK(BU992_CLK),
         .ACLR(BU992_ACLR),
         .QA_GE_B(BU992_QA_GE_B)
      );

      wire [8 : 0] BU1025_A;
         assign BU1025_A[0] = n2298;
         assign BU1025_A[1] = n2299;
         assign BU1025_A[2] = n2300;
         assign BU1025_A[3] = n2301;
         assign BU1025_A[4] = n2302;
         assign BU1025_A[5] = n2303;
         assign BU1025_A[6] = n2304;
         assign BU1025_A[7] = n2305;
         assign BU1025_A[8] = n2306;
      wire BU1025_CLK;
         assign BU1025_CLK = n161;
      wire BU1025_ACLR;
         assign BU1025_ACLR = 1'b0;
      wire BU1025_QA_EQ_B;
         assign n2311 = BU1025_QA_EQ_B;
      C_COMPARE_V7_0 #(
         "0"    /* c_ainit_val*/,
         1    /* c_b_constant*/,
         "000000000"    /* c_b_value*/,
         1    /* c_data_type*/,
         0    /* c_enable_rlocs*/,
         1    /* c_has_aclr*/,
         0    /* c_has_aset*/,
         0    /* c_has_a_eq_b*/,
         0    /* c_has_a_ge_b*/,
         0    /* c_has_a_gt_b*/,
         0    /* c_has_a_le_b*/,
         0    /* c_has_a_lt_b*/,
         0    /* c_has_a_ne_b*/,
         0    /* c_has_ce*/,
         1    /* c_has_qa_eq_b*/,
         0    /* c_has_qa_ge_b*/,
         0    /* c_has_qa_gt_b*/,
         0    /* c_has_qa_le_b*/,
         0    /* c_has_qa_lt_b*/,
         0    /* c_has_qa_ne_b*/,
         0    /* c_has_sclr*/,
         0    /* c_has_sset*/,
         0    /* c_pipe_stages*/,
         0    /* c_sync_enable*/,
         0    /* c_sync_priority*/,
         9    /* c_width*/
      )
      BU1025(
         .A(BU1025_A),
         .CLK(BU1025_CLK),
         .ACLR(BU1025_ACLR),
         .QA_EQ_B(BU1025_QA_EQ_B)
      );

      wire [8 : 0] BU830_addr;
         assign BU830_addr[8] = n2306;
         assign BU830_addr[7] = n2305;
         assign BU830_addr[6] = n2304;
         assign BU830_addr[5] = n2303;
         assign BU830_addr[4] = n2302;
         assign BU830_addr[3] = n2301;
         assign BU830_addr[2] = n2300;
         assign BU830_addr[1] = n2299;
         assign BU830_addr[0] = n2298;
      wire BU830_clk;
         assign BU830_clk = n161;
      wire [11 : 0] BU830_din;
         assign BU830_din[11] = 1'b0;
         assign BU830_din[10] = 1'b0;
         assign BU830_din[9] = 1'b0;
         assign BU830_din[8] = 1'b0;
         assign BU830_din[7] = 1'b0;
         assign BU830_din[6] = 1'b0;
         assign BU830_din[5] = 1'b0;
         assign BU830_din[4] = 1'b0;
         assign BU830_din[3] = 1'b0;
         assign BU830_din[2] = 1'b0;
         assign BU830_din[1] = 1'b0;
         assign BU830_din[0] = 1'b0;
      wire [11 : 0] BU830_dout;
         assign n2326 = BU830_dout[11];
         assign n2325 = BU830_dout[10];
         assign n2324 = BU830_dout[9];
         assign n2323 = BU830_dout[8];
         assign n2322 = BU830_dout[7];
         assign n2321 = BU830_dout[6];
         assign n2320 = BU830_dout[5];
         assign n2319 = BU830_dout[4];
         assign n2318 = BU830_dout[3];
         assign n2317 = BU830_dout[2];
         assign n2316 = BU830_dout[1];
         assign n2315 = BU830_dout[0];
      wire BU830_en;
         assign BU830_en = 1'b0;
      wire BU830_nd;
         assign BU830_nd = 1'b0;
      wire BU830_rfd;
      wire BU830_rdy;
      wire BU830_sinit;
         assign BU830_sinit = 1'b0;
      wire BU830_we;
         assign BU830_we = 1'b0;
      BLKMEMSP_V6_0 #(
         9    /* c_addr_width*/,
         "0000000000000000000"    /* c_default_data*/,
         512    /* c_depth*/,
         0    /* c_enable_rlocs*/,
         0    /* c_has_default_data*/,
         0    /* c_has_din*/,
         0    /* c_has_en*/,
         0    /* c_has_limit_data_pitch*/,
         0    /* c_has_nd*/,
         0    /* c_has_rdy*/,
         0    /* c_has_rfd*/,
         0    /* c_has_sinit*/,
         0    /* c_has_we*/,
         18    /* c_limit_data_pitch*/,
         "DDSV_SINCOS_TABLE_TRIG_ROM.mif"    /* c_mem_init_file*/,
         1    /* c_pipe_stages*/,
         0    /* c_reg_inputs*/,
         "0000000000000000000"    /* c_sinit_value*/,
         12    /* c_width*/,
         0    /* c_write_mode*/,
         "0"    /* c_ybottom_addr*/,
         1    /* c_yclk_is_rising*/,
         1    /* c_yen_is_high*/,
         "hierarchy1"    /* c_yhierarchy*/,
         0    /* c_ymake_bmm*/,
         "4kx4"    /* c_yprimitive_type*/,
         1    /* c_ysinit_is_high*/,
         "1024"    /* c_ytop_addr*/,
         0    /* c_yuse_single_primitive*/,
         1    /* c_ywe_is_high*/,
         1    /* c_yydisable_warnings*/
      )
      BU830(
         .ADDR(BU830_addr),
         .CLK(BU830_clk),
         .DIN(BU830_din),
         .DOUT(BU830_dout),
         .EN(BU830_en),
         .ND(BU830_nd),
         .RFD(BU830_rfd),
         .RDY(BU830_rdy),
         .SINIT(BU830_sinit),
         .WE(BU830_we)
      );

      wire [12 : 0] BU1041_A;
         assign BU1041_A[0] = 1'b0;
         assign BU1041_A[1] = 1'b0;
         assign BU1041_A[2] = 1'b0;
         assign BU1041_A[3] = 1'b0;
         assign BU1041_A[4] = 1'b0;
         assign BU1041_A[5] = 1'b0;
         assign BU1041_A[6] = 1'b0;
         assign BU1041_A[7] = 1'b0;
         assign BU1041_A[8] = 1'b0;
         assign BU1041_A[9] = 1'b0;
         assign BU1041_A[10] = 1'b0;
         assign BU1041_A[11] = 1'b0;
         assign BU1041_A[12] = 1'b0;
      wire [12 : 0] BU1041_B;
         assign BU1041_B[0] = n2315;
         assign BU1041_B[1] = n2316;
         assign BU1041_B[2] = n2317;
         assign BU1041_B[3] = n2318;
         assign BU1041_B[4] = n2319;
         assign BU1041_B[5] = n2320;
         assign BU1041_B[6] = n2321;
         assign BU1041_B[7] = n2322;
         assign BU1041_B[8] = n2323;
         assign BU1041_B[9] = n2324;
         assign BU1041_B[10] = n2325;
         assign BU1041_B[11] = n2326;
         assign BU1041_B[12] = n2310;
      wire BU1041_C_IN;
         assign BU1041_C_IN = n2314;
      wire BU1041_ADD;
         assign BU1041_ADD = n2313;
      wire [12 : 0] BU1041_Q;
         assign n162 = BU1041_Q[0];
         assign n163 = BU1041_Q[1];
         assign n164 = BU1041_Q[2];
         assign n165 = BU1041_Q[3];
         assign n166 = BU1041_Q[4];
         assign n167 = BU1041_Q[5];
         assign n168 = BU1041_Q[6];
         assign n169 = BU1041_Q[7];
         assign n170 = BU1041_Q[8];
         assign n171 = BU1041_Q[9];
         assign n172 = BU1041_Q[10];
         assign n173 = BU1041_Q[11];
         assign n174 = BU1041_Q[12];
      wire BU1041_CLK;
         assign BU1041_CLK = n161;
      wire BU1041_CE;
         assign BU1041_CE = n2340;
      C_ADDSUB_V7_0 #(
         2    /* c_add_mode*/,
         "0000000000000"    /* c_ainit_val*/,
         1    /* c_a_type*/,
         13    /* c_a_width*/,
         1    /* c_bypass_enable*/,
         0    /* c_bypass_low*/,
         0    /* c_b_constant*/,
         1    /* c_b_type*/,
         "0000000000000"    /* c_b_value*/,
         13    /* c_b_width*/,
         0    /* c_enable_rlocs*/,
         0    /* c_has_aclr*/,
         1    /* c_has_add*/,
         0    /* c_has_ainit*/,
         0    /* c_has_aset*/,
         0    /* c_has_a_signed*/,
         0    /* c_has_bypass*/,
         0    /* c_has_bypass_with_cin*/,
         0    /* c_has_b_in*/,
         0    /* c_has_b_out*/,
         0    /* c_has_b_signed*/,
         1    /* c_has_ce*/,
         1    /* c_has_c_in*/,
         0    /* c_has_c_out*/,
         0    /* c_has_ovfl*/,
         1    /* c_has_q*/,
         0    /* c_has_q_b_out*/,
         0    /* c_has_q_c_out*/,
         0    /* c_has_q_ovfl*/,
         1    /* c_has_s*/,
         0    /* c_has_sclr*/,
         0    /* c_has_sinit*/,
         0    /* c_has_sset*/,
         12    /* c_high_bit*/,
         1    /* c_latency*/,
         0    /* c_low_bit*/,
         13    /* c_out_width*/,
         0    /* c_pipe_stages*/,
         "0000000000000"    /* c_sinit_val*/,
         0    /* c_sync_enable*/,
         0    /* c_sync_priority*/
      )
      BU1041(
         .A(BU1041_A),
         .B(BU1041_B),
         .C_IN(BU1041_C_IN),
         .ADD(BU1041_ADD),
         .Q(BU1041_Q),
         .CLK(BU1041_CLK),
         .CE(BU1041_CE)
      );

      wire BU1120_CLK;
         assign BU1120_CLK = n161;
      wire BU1120_SDIN;
         assign BU1120_SDIN = n75;
      wire BU1120_SDOUT;
         assign n2340 = BU1120_SDOUT;
      C_SHIFT_FD_V7_0 #(
         "0000"    /* c_ainit_val*/,
         0    /* c_enable_rlocs*/,
         5    /* c_fill_data*/,
         0    /* c_has_aclr*/,
         0    /* c_has_ainit*/,
         0    /* c_has_aset*/,
         0    /* c_has_ce*/,
         0    /* c_has_d*/,
         0    /* c_has_lsb_2_msb*/,
         0    /* c_has_q*/,
         0    /* c_has_sclr*/,
         1    /* c_has_sdin*/,
         1    /* c_has_sdout*/,
         0    /* c_has_sinit*/,
         0    /* c_has_sset*/,
         1    /* c_shift_type*/,
         "0000"    /* c_sinit_val*/,
         0    /* c_sync_enable*/,
         0    /* c_sync_priority*/,
         4    /* c_width*/
      )
      BU1120(
         .CLK(BU1120_CLK),
         .SDIN(BU1120_SDIN),
         .SDOUT(BU1120_SDOUT)
      );

//synthesis translate_on

endmodule
