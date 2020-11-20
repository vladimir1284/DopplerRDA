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

module DDS(
   DATA,
   WE,
   A,
   CLK,
   SCLR,
   SINE
   ); // synthesis black_box

   input [31 : 0] DATA;
   input WE;
   input [4 : 0] A;
   input CLK;
   input SCLR;
   output [14 : 0] SINE;
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
   wire n47;
   wire n48;
   wire n49;
   wire n50;
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
   wire n97;
   wire n98;
   wire n99;
   wire n100;
   wire n101;
   wire n102;
   wire n103;
   wire n104;
   wire n105;
   wire n106;
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
   wire n155;
   wire n156;
   wire n157;
   wire n158;
   wire n159;
   wire n160;
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
   wire n177;
   wire n178;
   wire n179;
   wire n180;
   wire n181;
   wire n182;
   wire n183;
   wire n184;
   wire n185;
   wire n186;
   wire n187;
   wire n188;
   wire n189;
   wire n190;
   wire n191;
   wire n192;
   wire n193;
   wire n250;
   wire n251;
   wire n252;
   wire n253;
   wire n254;
   wire n255;
   wire n256;
   wire n257;
   wire n258;
   wire n259;
   wire n260;
   wire n261;
   wire n262;
   wire n263;
   wire n264;
   wire n265;
   wire n266;
   wire n267;
   wire n268;
   wire n269;
   wire n270;
   wire n271;
   wire n272;
   wire n273;
   wire n274;
   wire n275;
   wire n276;
   wire n277;
   wire n278;
   wire n279;
   wire n280;
   wire n281;
   wire n1614;
   wire n1615;
   wire n1616;
   wire n1617;
   wire n1618;
   wire n1619;
   wire n1620;
   wire n1621;
   wire n1622;
   wire n1623;
   wire n1624;
   wire n1625;
   wire n1664;
   wire n1665;
   wire n1666;
   wire n1667;
   wire n1668;
   wire n1669;
   wire n1670;
   wire n1671;
   wire n1672;
   wire n1673;
   wire n1674;
   wire n1715;
   wire n1716;
   wire n1717;
   wire n1718;
   wire n1719;
   wire n1720;
   wire n1721;
   wire n1722;
   wire n1723;
   wire n1724;
   wire n1725;
   wire n1726;
   wire n1727;
   wire n1728;
   wire n1729;
   wire n1730;
   wire n1731;
   wire n1732;
   wire n1733;
   wire n1770;
   wire n1771;
   wire n1772;
   wire n1773;
   wire n1774;
   wire n1775;
   wire n1776;
   wire n1777;
   wire n1778;
   wire n1779;
   wire n1780;
   wire n1823;
   wire n1824;
   wire n1825;
   wire n1826;
   wire n1827;
   wire n1828;
   wire n1829;
   wire n1830;
   wire n1831;
   wire n2467;
   wire n2468;
   wire n2469;
   wire n2470;
   wire n2471;
   wire n2472;
   wire n2473;
   wire n2474;
   wire n2475;
   wire n2476;
   wire n2477;
   wire n2478;
   wire n2479;
   wire n2480;
   wire n2481;
   wire n2504;
   wire n2505;
   wire n2506;
   wire n2507;
   wire n2508;
   wire n2509;
   wire n2510;
   wire n2511;
   wire n2512;
   wire n2513;
   wire n2514;
   wire n2518;
   wire n2519;
   wire n2520;
   wire n2521;
   wire n2522;
   wire n2523;
   wire n2524;
   wire n2525;
   wire n2526;
   wire n2527;
   wire n2528;
   wire n2529;
   wire n2530;
   wire n2531;
   wire n2532;
   wire n2533;
   wire n2534;
   wire n2535;
   wire n2536;
   wire n2552;
   wire n2786;
   wire n2803;
   wire n2819;
   assign n139 = DATA[0];
   assign n140 = DATA[1];
   assign n141 = DATA[2];
   assign n142 = DATA[3];
   assign n143 = DATA[4];
   assign n144 = DATA[5];
   assign n145 = DATA[6];
   assign n146 = DATA[7];
   assign n147 = DATA[8];
   assign n148 = DATA[9];
   assign n149 = DATA[10];
   assign n150 = DATA[11];
   assign n151 = DATA[12];
   assign n152 = DATA[13];
   assign n153 = DATA[14];
   assign n154 = DATA[15];
   assign n155 = DATA[16];
   assign n156 = DATA[17];
   assign n157 = DATA[18];
   assign n158 = DATA[19];
   assign n159 = DATA[20];
   assign n160 = DATA[21];
   assign n161 = DATA[22];
   assign n162 = DATA[23];
   assign n163 = DATA[24];
   assign n164 = DATA[25];
   assign n165 = DATA[26];
   assign n166 = DATA[27];
   assign n167 = DATA[28];
   assign n168 = DATA[29];
   assign n169 = DATA[30];
   assign n170 = DATA[31];
   assign n8 = WE;
   assign n3 = A[0];
   assign n4 = A[1];
   assign n5 = A[2];
   assign n6 = A[3];
   assign n7 = A[4];
   assign n177 = CLK;
   assign n178 = SCLR;
   assign SINE[0] = n179;
   assign SINE[1] = n180;
   assign SINE[2] = n181;
   assign SINE[3] = n182;
   assign SINE[4] = n183;
   assign SINE[5] = n184;
   assign SINE[6] = n185;
   assign SINE[7] = n186;
   assign SINE[8] = n187;
   assign SINE[9] = n188;
   assign SINE[10] = n189;
   assign SINE[11] = n190;
   assign SINE[12] = n191;
   assign SINE[13] = n192;
   assign SINE[14] = n193;

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

      wire [31 : 0] BU12_D;
         assign BU12_D[0] = n139;
         assign BU12_D[1] = n140;
         assign BU12_D[2] = n141;
         assign BU12_D[3] = n142;
         assign BU12_D[4] = n143;
         assign BU12_D[5] = n144;
         assign BU12_D[6] = n145;
         assign BU12_D[7] = n146;
         assign BU12_D[8] = n147;
         assign BU12_D[9] = n148;
         assign BU12_D[10] = n149;
         assign BU12_D[11] = n150;
         assign BU12_D[12] = n151;
         assign BU12_D[13] = n152;
         assign BU12_D[14] = n153;
         assign BU12_D[15] = n154;
         assign BU12_D[16] = n155;
         assign BU12_D[17] = n156;
         assign BU12_D[18] = n157;
         assign BU12_D[19] = n158;
         assign BU12_D[20] = n159;
         assign BU12_D[21] = n160;
         assign BU12_D[22] = n161;
         assign BU12_D[23] = n162;
         assign BU12_D[24] = n163;
         assign BU12_D[25] = n164;
         assign BU12_D[26] = n165;
         assign BU12_D[27] = n166;
         assign BU12_D[28] = n167;
         assign BU12_D[29] = n168;
         assign BU12_D[30] = n169;
         assign BU12_D[31] = n170;
      wire [31 : 0] BU12_Q;
         assign n250 = BU12_Q[0];
         assign n251 = BU12_Q[1];
         assign n252 = BU12_Q[2];
         assign n253 = BU12_Q[3];
         assign n254 = BU12_Q[4];
         assign n255 = BU12_Q[5];
         assign n256 = BU12_Q[6];
         assign n257 = BU12_Q[7];
         assign n258 = BU12_Q[8];
         assign n259 = BU12_Q[9];
         assign n260 = BU12_Q[10];
         assign n261 = BU12_Q[11];
         assign n262 = BU12_Q[12];
         assign n263 = BU12_Q[13];
         assign n264 = BU12_Q[14];
         assign n265 = BU12_Q[15];
         assign n266 = BU12_Q[16];
         assign n267 = BU12_Q[17];
         assign n268 = BU12_Q[18];
         assign n269 = BU12_Q[19];
         assign n270 = BU12_Q[20];
         assign n271 = BU12_Q[21];
         assign n272 = BU12_Q[22];
         assign n273 = BU12_Q[23];
         assign n274 = BU12_Q[24];
         assign n275 = BU12_Q[25];
         assign n276 = BU12_Q[26];
         assign n277 = BU12_Q[27];
         assign n278 = BU12_Q[28];
         assign n279 = BU12_Q[29];
         assign n280 = BU12_Q[30];
         assign n281 = BU12_Q[31];
      wire BU12_CLK;
         assign BU12_CLK = n177;
      wire BU12_CE;
         assign BU12_CE = n2;
      C_REG_FD_V7_0 #(
         "00000000000000000000000000000000"    /* c_ainit_val*/,
         0    /* c_enable_rlocs*/,
         0    /* c_has_aclr*/,
         0    /* c_has_ainit*/,
         0    /* c_has_aset*/,
         1    /* c_has_ce*/,
         0    /* c_has_sclr*/,
         0    /* c_has_sinit*/,
         0    /* c_has_sset*/,
         "00000000000000000000000000000000"    /* c_sinit_val*/,
         0    /* c_sync_enable*/,
         0    /* c_sync_priority*/,
         32    /* c_width*/
      )
      BU12(
         .D(BU12_D),
         .Q(BU12_Q),
         .CLK(BU12_CLK),
         .CE(BU12_CE)
      );

      wire [31 : 0] BU78_A;
         assign BU78_A[0] = n19;
         assign BU78_A[1] = n20;
         assign BU78_A[2] = n21;
         assign BU78_A[3] = n22;
         assign BU78_A[4] = n23;
         assign BU78_A[5] = n24;
         assign BU78_A[6] = n25;
         assign BU78_A[7] = n26;
         assign BU78_A[8] = n27;
         assign BU78_A[9] = n28;
         assign BU78_A[10] = n29;
         assign BU78_A[11] = n30;
         assign BU78_A[12] = n31;
         assign BU78_A[13] = n32;
         assign BU78_A[14] = n33;
         assign BU78_A[15] = n34;
         assign BU78_A[16] = n35;
         assign BU78_A[17] = n36;
         assign BU78_A[18] = n37;
         assign BU78_A[19] = n38;
         assign BU78_A[20] = n39;
         assign BU78_A[21] = n40;
         assign BU78_A[22] = n41;
         assign BU78_A[23] = n42;
         assign BU78_A[24] = n43;
         assign BU78_A[25] = n44;
         assign BU78_A[26] = n45;
         assign BU78_A[27] = n46;
         assign BU78_A[28] = n47;
         assign BU78_A[29] = n48;
         assign BU78_A[30] = n49;
         assign BU78_A[31] = n50;
      wire [31 : 0] BU78_B;
         assign BU78_B[0] = n250;
         assign BU78_B[1] = n251;
         assign BU78_B[2] = n252;
         assign BU78_B[3] = n253;
         assign BU78_B[4] = n254;
         assign BU78_B[5] = n255;
         assign BU78_B[6] = n256;
         assign BU78_B[7] = n257;
         assign BU78_B[8] = n258;
         assign BU78_B[9] = n259;
         assign BU78_B[10] = n260;
         assign BU78_B[11] = n261;
         assign BU78_B[12] = n262;
         assign BU78_B[13] = n263;
         assign BU78_B[14] = n264;
         assign BU78_B[15] = n265;
         assign BU78_B[16] = n266;
         assign BU78_B[17] = n267;
         assign BU78_B[18] = n268;
         assign BU78_B[19] = n269;
         assign BU78_B[20] = n270;
         assign BU78_B[21] = n271;
         assign BU78_B[22] = n272;
         assign BU78_B[23] = n273;
         assign BU78_B[24] = n274;
         assign BU78_B[25] = n275;
         assign BU78_B[26] = n276;
         assign BU78_B[27] = n277;
         assign BU78_B[28] = n278;
         assign BU78_B[29] = n279;
         assign BU78_B[30] = n280;
         assign BU78_B[31] = n281;
      wire [31 : 0] BU78_Q;
         assign n19 = BU78_Q[0];
         assign n20 = BU78_Q[1];
         assign n21 = BU78_Q[2];
         assign n22 = BU78_Q[3];
         assign n23 = BU78_Q[4];
         assign n24 = BU78_Q[5];
         assign n25 = BU78_Q[6];
         assign n26 = BU78_Q[7];
         assign n27 = BU78_Q[8];
         assign n28 = BU78_Q[9];
         assign n29 = BU78_Q[10];
         assign n30 = BU78_Q[11];
         assign n31 = BU78_Q[12];
         assign n32 = BU78_Q[13];
         assign n33 = BU78_Q[14];
         assign n34 = BU78_Q[15];
         assign n35 = BU78_Q[16];
         assign n36 = BU78_Q[17];
         assign n37 = BU78_Q[18];
         assign n38 = BU78_Q[19];
         assign n39 = BU78_Q[20];
         assign n40 = BU78_Q[21];
         assign n41 = BU78_Q[22];
         assign n42 = BU78_Q[23];
         assign n43 = BU78_Q[24];
         assign n44 = BU78_Q[25];
         assign n45 = BU78_Q[26];
         assign n46 = BU78_Q[27];
         assign n47 = BU78_Q[28];
         assign n48 = BU78_Q[29];
         assign n49 = BU78_Q[30];
         assign n50 = BU78_Q[31];
      wire BU78_CLK;
         assign BU78_CLK = n177;
      wire BU78_SCLR;
         assign BU78_SCLR = n178;
      C_ADDSUB_V7_0 #(
         0    /* c_add_mode*/,
         "00000000000000000000000000000000"    /* c_ainit_val*/,
         1    /* c_a_type*/,
         32    /* c_a_width*/,
         1    /* c_bypass_enable*/,
         0    /* c_bypass_low*/,
         0    /* c_b_constant*/,
         1    /* c_b_type*/,
         "00000000000000000000000000000000"    /* c_b_value*/,
         32    /* c_b_width*/,
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
         1    /* c_has_sclr*/,
         0    /* c_has_sinit*/,
         0    /* c_has_sset*/,
         31    /* c_high_bit*/,
         1    /* c_latency*/,
         0    /* c_low_bit*/,
         32    /* c_out_width*/,
         0    /* c_pipe_stages*/,
         "00000000000000000000000000000000"    /* c_sinit_val*/,
         0    /* c_sync_enable*/,
         0    /* c_sync_priority*/
      )
      BU78(
         .A(BU78_A),
         .B(BU78_B),
         .Q(BU78_Q),
         .CLK(BU78_CLK),
         .SCLR(BU78_SCLR)
      );

      wire BU270_CLK;
         assign BU270_CLK = n177;
      wire BU270_SDOUT;
         assign n83 = BU270_SDOUT;
      wire BU270_SCLR;
         assign BU270_SCLR = n178;
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
         1    /* c_has_sclr*/,
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
      BU270(
         .CLK(BU270_CLK),
         .SDOUT(BU270_SDOUT),
         .SCLR(BU270_SCLR)
      );

      wire [31 : 0] BU279_A;
         assign BU279_A[0] = n19;
         assign BU279_A[1] = n20;
         assign BU279_A[2] = n21;
         assign BU279_A[3] = n22;
         assign BU279_A[4] = n23;
         assign BU279_A[5] = n24;
         assign BU279_A[6] = n25;
         assign BU279_A[7] = n26;
         assign BU279_A[8] = n27;
         assign BU279_A[9] = n28;
         assign BU279_A[10] = n29;
         assign BU279_A[11] = n30;
         assign BU279_A[12] = n31;
         assign BU279_A[13] = n32;
         assign BU279_A[14] = n33;
         assign BU279_A[15] = n34;
         assign BU279_A[16] = n35;
         assign BU279_A[17] = n36;
         assign BU279_A[18] = n37;
         assign BU279_A[19] = n38;
         assign BU279_A[20] = n39;
         assign BU279_A[21] = n40;
         assign BU279_A[22] = n41;
         assign BU279_A[23] = n42;
         assign BU279_A[24] = n43;
         assign BU279_A[25] = n44;
         assign BU279_A[26] = n45;
         assign BU279_A[27] = n46;
         assign BU279_A[28] = n47;
         assign BU279_A[29] = n48;
         assign BU279_A[30] = n49;
         assign BU279_A[31] = n50;
      wire [31 : 0] BU279_Q;
         assign n61 = BU279_Q[10];
         assign n62 = BU279_Q[11];
         assign n63 = BU279_Q[12];
         assign n64 = BU279_Q[13];
         assign n65 = BU279_Q[14];
         assign n66 = BU279_Q[15];
         assign n67 = BU279_Q[16];
         assign n68 = BU279_Q[17];
         assign n69 = BU279_Q[18];
         assign n70 = BU279_Q[19];
         assign n71 = BU279_Q[20];
         assign n72 = BU279_Q[21];
         assign n73 = BU279_Q[22];
         assign n74 = BU279_Q[23];
         assign n75 = BU279_Q[24];
         assign n76 = BU279_Q[25];
         assign n77 = BU279_Q[26];
         assign n78 = BU279_Q[27];
         assign n79 = BU279_Q[28];
         assign n80 = BU279_Q[29];
         assign n81 = BU279_Q[30];
         assign n82 = BU279_Q[31];
      wire BU279_CLK;
         assign BU279_CLK = n177;
      C_ADDSUB_V7_0 #(
         0    /* c_add_mode*/,
         "00000000000000000000000000000000"    /* c_ainit_val*/,
         1    /* c_a_type*/,
         32    /* c_a_width*/,
         1    /* c_bypass_enable*/,
         0    /* c_bypass_low*/,
         1    /* c_b_constant*/,
         1    /* c_b_type*/,
         "00000000000000000000000000000000"    /* c_b_value*/,
         32    /* c_b_width*/,
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
         31    /* c_high_bit*/,
         1    /* c_latency*/,
         0    /* c_low_bit*/,
         32    /* c_out_width*/,
         0    /* c_pipe_stages*/,
         "00000000000000000000000000000000"    /* c_sinit_val*/,
         0    /* c_sync_enable*/,
         0    /* c_sync_priority*/
      )
      BU279(
         .A(BU279_A),
         .Q(BU279_Q),
         .CLK(BU279_CLK)
      );

      wire [21 : 0] BU790_A;
         assign BU790_A[0] = n61;
         assign BU790_A[1] = n62;
         assign BU790_A[2] = n63;
         assign BU790_A[3] = n64;
         assign BU790_A[4] = n65;
         assign BU790_A[5] = n66;
         assign BU790_A[6] = n67;
         assign BU790_A[7] = n68;
         assign BU790_A[8] = n69;
         assign BU790_A[9] = n70;
         assign BU790_A[10] = n71;
         assign BU790_A[11] = n72;
         assign BU790_A[12] = n73;
         assign BU790_A[13] = n74;
         assign BU790_A[14] = n75;
         assign BU790_A[15] = n76;
         assign BU790_A[16] = n77;
         assign BU790_A[17] = n78;
         assign BU790_A[18] = n79;
         assign BU790_A[19] = n80;
         assign BU790_A[20] = n81;
         assign BU790_A[21] = n82;
      wire [9 : 0] BU790_B;
         assign BU790_B[0] = n97;
         assign BU790_B[1] = n98;
         assign BU790_B[2] = n99;
         assign BU790_B[3] = n100;
         assign BU790_B[4] = n101;
         assign BU790_B[5] = n102;
         assign BU790_B[6] = n103;
         assign BU790_B[7] = n104;
         assign BU790_B[8] = n105;
         assign BU790_B[9] = n106;
      wire [12 : 0] BU790_Q;
         assign n84 = BU790_Q[0];
         assign n85 = BU790_Q[1];
         assign n86 = BU790_Q[2];
         assign n87 = BU790_Q[3];
         assign n88 = BU790_Q[4];
         assign n89 = BU790_Q[5];
         assign n90 = BU790_Q[6];
         assign n91 = BU790_Q[7];
         assign n92 = BU790_Q[8];
         assign n93 = BU790_Q[9];
         assign n94 = BU790_Q[10];
         assign n95 = BU790_Q[11];
         assign n96 = BU790_Q[12];
      wire BU790_CLK;
         assign BU790_CLK = n177;
      wire BU790_SCLR;
         assign BU790_SCLR = n178;
      C_ADDSUB_V7_0 #(
         0    /* c_add_mode*/,
         "0000000000000"    /* c_ainit_val*/,
         1    /* c_a_type*/,
         22    /* c_a_width*/,
         1    /* c_bypass_enable*/,
         0    /* c_bypass_low*/,
         0    /* c_b_constant*/,
         0    /* c_b_type*/,
         "0000000000000000000000"    /* c_b_value*/,
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
         1    /* c_has_sclr*/,
         0    /* c_has_sinit*/,
         0    /* c_has_sset*/,
         21    /* c_high_bit*/,
         1    /* c_latency*/,
         9    /* c_low_bit*/,
         13    /* c_out_width*/,
         0    /* c_pipe_stages*/,
         "0000000000000"    /* c_sinit_val*/,
         0    /* c_sync_enable*/,
         0    /* c_sync_priority*/
      )
      BU790(
         .A(BU790_A),
         .B(BU790_B),
         .Q(BU790_Q),
         .CLK(BU790_CLK),
         .SCLR(BU790_SCLR)
      );

      wire [8 : 0] BU729_A;
         assign BU729_A[0] = n1715;
         assign BU729_A[1] = n1716;
         assign BU729_A[2] = n1717;
         assign BU729_A[3] = n1718;
         assign BU729_A[4] = n1719;
         assign BU729_A[5] = n1720;
         assign BU729_A[6] = n1721;
         assign BU729_A[7] = n1722;
         assign BU729_A[8] = n1723;
      wire [8 : 0] BU729_B;
         assign BU729_B[0] = n1823;
         assign BU729_B[1] = n1824;
         assign BU729_B[2] = n1825;
         assign BU729_B[3] = n1826;
         assign BU729_B[4] = n1827;
         assign BU729_B[5] = n1828;
         assign BU729_B[6] = n1829;
         assign BU729_B[7] = n1830;
         assign BU729_B[8] = n1831;
      wire [9 : 0] BU729_Q;
         assign n97 = BU729_Q[0];
         assign n98 = BU729_Q[1];
         assign n99 = BU729_Q[2];
         assign n100 = BU729_Q[3];
         assign n101 = BU729_Q[4];
         assign n102 = BU729_Q[5];
         assign n103 = BU729_Q[6];
         assign n104 = BU729_Q[7];
         assign n105 = BU729_Q[8];
         assign n106 = BU729_Q[9];
      wire BU729_CLK;
         assign BU729_CLK = n177;
      wire BU729_SCLR;
         assign BU729_SCLR = n178;
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
         1    /* c_has_sclr*/,
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
      BU729(
         .A(BU729_A),
         .B(BU729_B),
         .Q(BU729_Q),
         .CLK(BU729_CLK),
         .SCLR(BU729_SCLR)
      );

      wire [7 : 0] BU543_A;
         assign BU543_A[0] = n1614;
         assign BU543_A[1] = n1615;
         assign BU543_A[2] = n1616;
         assign BU543_A[3] = n1617;
         assign BU543_A[4] = n1618;
         assign BU543_A[5] = n1619;
         assign BU543_A[6] = n1620;
         assign BU543_A[7] = n1621;
      wire [7 : 0] BU543_B;
         assign BU543_B[0] = n1664;
         assign BU543_B[1] = n1665;
         assign BU543_B[2] = n1666;
         assign BU543_B[3] = n1667;
         assign BU543_B[4] = n1668;
         assign BU543_B[5] = n1669;
         assign BU543_B[6] = n1670;
         assign BU543_B[7] = n1671;
      wire [8 : 0] BU543_Q;
         assign n1715 = BU543_Q[0];
         assign n1716 = BU543_Q[1];
         assign n1717 = BU543_Q[2];
         assign n1718 = BU543_Q[3];
         assign n1719 = BU543_Q[4];
         assign n1720 = BU543_Q[5];
         assign n1721 = BU543_Q[6];
         assign n1722 = BU543_Q[7];
         assign n1723 = BU543_Q[8];
      wire BU543_CLK;
         assign BU543_CLK = n177;
      wire BU543_SCLR;
         assign BU543_SCLR = n178;
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
         1    /* c_has_sclr*/,
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
      BU543(
         .A(BU543_A),
         .B(BU543_B),
         .Q(BU543_Q),
         .CLK(BU543_CLK),
         .SCLR(BU543_SCLR)
      );

      wire [3 : 0] BU474_I;
         assign BU474_I[0] = n1623;
         assign BU474_I[1] = n1624;
         assign BU474_I[2] = n1625;
         assign BU474_I[3] = n1621;
      wire BU474_T;
         assign BU474_T = 1'b0;
      wire BU474_EN;
         assign BU474_EN = 1'b0;
      wire BU474_Q;
      wire BU474_CLK;
         assign BU474_CLK = 1'b0;
      wire BU474_CE;
         assign BU474_CE = 1'b0;
      wire BU474_ACLR;
         assign BU474_ACLR = 1'b0;
      wire BU474_ASET;
         assign BU474_ASET = 1'b0;
      wire BU474_AINIT;
         assign BU474_AINIT = 1'b0;
      wire BU474_SCLR;
         assign BU474_SCLR = 1'b0;
      wire BU474_SSET;
         assign BU474_SSET = 1'b0;
      wire BU474_SINIT;
         assign BU474_SINIT = 1'b0;
      wire BU474_O;
         assign n1622 = BU474_O;
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
      BU474(
         .I(BU474_I),
         .T(BU474_T),
         .EN(BU474_EN),
         .Q(BU474_Q),
         .CLK(BU474_CLK),
         .CE(BU474_CE),
         .ACLR(BU474_ACLR),
         .ASET(BU474_ASET),
         .AINIT(BU474_AINIT),
         .SCLR(BU474_SCLR),
         .SSET(BU474_SSET),
         .SINIT(BU474_SINIT),
         .O(BU474_O)
      );

      wire BU479_CLK;
         assign BU479_CLK = n177;
      wire BU479_SDIN;
         assign BU479_SDIN = n1622;
      wire [12 : 0] BU479_Q;
         assign n1623 = BU479_Q[0];
         assign n1624 = BU479_Q[2];
         assign n1625 = BU479_Q[3];
         assign n1614 = BU479_Q[5];
         assign n1615 = BU479_Q[6];
         assign n1616 = BU479_Q[7];
         assign n1617 = BU479_Q[8];
         assign n1618 = BU479_Q[9];
         assign n1619 = BU479_Q[10];
         assign n1620 = BU479_Q[11];
         assign n1621 = BU479_Q[12];
      wire BU479_SINIT;
         assign BU479_SINIT = n178;
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
         1    /* c_has_sinit*/,
         0    /* c_has_sset*/,
         0    /* c_shift_type*/,
         "1000000000000"    /* c_sinit_val*/,
         0    /* c_sync_enable*/,
         0    /* c_sync_priority*/,
         13    /* c_width*/
      )
      BU479(
         .CLK(BU479_CLK),
         .SDIN(BU479_SDIN),
         .Q(BU479_Q),
         .SINIT(BU479_SINIT)
      );

      wire [3 : 0] BU508_I;
         assign BU508_I[0] = n1673;
         assign BU508_I[1] = n1674;
         assign BU508_I[2] = n1667;
         assign BU508_I[3] = n1671;
      wire BU508_T;
         assign BU508_T = 1'b0;
      wire BU508_EN;
         assign BU508_EN = 1'b0;
      wire BU508_Q;
      wire BU508_CLK;
         assign BU508_CLK = 1'b0;
      wire BU508_CE;
         assign BU508_CE = 1'b0;
      wire BU508_ACLR;
         assign BU508_ACLR = 1'b0;
      wire BU508_ASET;
         assign BU508_ASET = 1'b0;
      wire BU508_AINIT;
         assign BU508_AINIT = 1'b0;
      wire BU508_SCLR;
         assign BU508_SCLR = 1'b0;
      wire BU508_SSET;
         assign BU508_SSET = 1'b0;
      wire BU508_SINIT;
         assign BU508_SINIT = 1'b0;
      wire BU508_O;
         assign n1672 = BU508_O;
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
      BU508(
         .I(BU508_I),
         .T(BU508_T),
         .EN(BU508_EN),
         .Q(BU508_Q),
         .CLK(BU508_CLK),
         .CE(BU508_CE),
         .ACLR(BU508_ACLR),
         .ASET(BU508_ASET),
         .AINIT(BU508_AINIT),
         .SCLR(BU508_SCLR),
         .SSET(BU508_SSET),
         .SINIT(BU508_SINIT),
         .O(BU508_O)
      );

      wire BU513_CLK;
         assign BU513_CLK = n177;
      wire BU513_SDIN;
         assign BU513_SDIN = n1672;
      wire [13 : 0] BU513_Q;
         assign n1673 = BU513_Q[0];
         assign n1674 = BU513_Q[5];
         assign n1664 = BU513_Q[6];
         assign n1665 = BU513_Q[7];
         assign n1666 = BU513_Q[8];
         assign n1667 = BU513_Q[9];
         assign n1668 = BU513_Q[10];
         assign n1669 = BU513_Q[11];
         assign n1670 = BU513_Q[12];
         assign n1671 = BU513_Q[13];
      wire BU513_SINIT;
         assign BU513_SINIT = n178;
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
         1    /* c_has_sinit*/,
         0    /* c_has_sset*/,
         0    /* c_shift_type*/,
         "10000000000000"    /* c_sinit_val*/,
         0    /* c_sync_enable*/,
         0    /* c_sync_priority*/,
         14    /* c_width*/
      )
      BU513(
         .CLK(BU513_CLK),
         .SDIN(BU513_SDIN),
         .Q(BU513_Q),
         .SINIT(BU513_SINIT)
      );

      wire [7 : 0] BU675_A;
         assign BU675_A[0] = n1724;
         assign BU675_A[1] = n1725;
         assign BU675_A[2] = n1726;
         assign BU675_A[3] = n1727;
         assign BU675_A[4] = n1728;
         assign BU675_A[5] = n1729;
         assign BU675_A[6] = n1730;
         assign BU675_A[7] = n1731;
      wire [7 : 0] BU675_B;
         assign BU675_B[0] = n1770;
         assign BU675_B[1] = n1771;
         assign BU675_B[2] = n1772;
         assign BU675_B[3] = n1773;
         assign BU675_B[4] = n1774;
         assign BU675_B[5] = n1775;
         assign BU675_B[6] = n1776;
         assign BU675_B[7] = n1777;
      wire [8 : 0] BU675_Q;
         assign n1823 = BU675_Q[0];
         assign n1824 = BU675_Q[1];
         assign n1825 = BU675_Q[2];
         assign n1826 = BU675_Q[3];
         assign n1827 = BU675_Q[4];
         assign n1828 = BU675_Q[5];
         assign n1829 = BU675_Q[6];
         assign n1830 = BU675_Q[7];
         assign n1831 = BU675_Q[8];
      wire BU675_CLK;
         assign BU675_CLK = n177;
      wire BU675_SCLR;
         assign BU675_SCLR = n178;
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
         1    /* c_has_sclr*/,
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
      BU675(
         .A(BU675_A),
         .B(BU675_B),
         .Q(BU675_Q),
         .CLK(BU675_CLK),
         .SCLR(BU675_SCLR)
      );

      wire [1 : 0] BU598_I;
         assign BU598_I[0] = n1733;
         assign BU598_I[1] = n1731;
      wire BU598_T;
         assign BU598_T = 1'b0;
      wire BU598_EN;
         assign BU598_EN = 1'b0;
      wire BU598_Q;
      wire BU598_CLK;
         assign BU598_CLK = 1'b0;
      wire BU598_CE;
         assign BU598_CE = 1'b0;
      wire BU598_ACLR;
         assign BU598_ACLR = 1'b0;
      wire BU598_ASET;
         assign BU598_ASET = 1'b0;
      wire BU598_AINIT;
         assign BU598_AINIT = 1'b0;
      wire BU598_SCLR;
         assign BU598_SCLR = 1'b0;
      wire BU598_SSET;
         assign BU598_SSET = 1'b0;
      wire BU598_SINIT;
         assign BU598_SINIT = 1'b0;
      wire BU598_O;
         assign n1732 = BU598_O;
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
      BU598(
         .I(BU598_I),
         .T(BU598_T),
         .EN(BU598_EN),
         .Q(BU598_Q),
         .CLK(BU598_CLK),
         .CE(BU598_CE),
         .ACLR(BU598_ACLR),
         .ASET(BU598_ASET),
         .AINIT(BU598_AINIT),
         .SCLR(BU598_SCLR),
         .SSET(BU598_SSET),
         .SINIT(BU598_SINIT),
         .O(BU598_O)
      );

      wire BU603_CLK;
         assign BU603_CLK = n177;
      wire BU603_SDIN;
         assign BU603_SDIN = n1732;
      wire [14 : 0] BU603_Q;
         assign n1733 = BU603_Q[0];
         assign n1724 = BU603_Q[7];
         assign n1725 = BU603_Q[8];
         assign n1726 = BU603_Q[9];
         assign n1727 = BU603_Q[10];
         assign n1728 = BU603_Q[11];
         assign n1729 = BU603_Q[12];
         assign n1730 = BU603_Q[13];
         assign n1731 = BU603_Q[14];
      wire BU603_SINIT;
         assign BU603_SINIT = n178;
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
         1    /* c_has_sinit*/,
         0    /* c_has_sset*/,
         0    /* c_shift_type*/,
         "100000000000000"    /* c_sinit_val*/,
         0    /* c_sync_enable*/,
         0    /* c_sync_priority*/,
         15    /* c_width*/
      )
      BU603(
         .CLK(BU603_CLK),
         .SDIN(BU603_SDIN),
         .Q(BU603_Q),
         .SINIT(BU603_SINIT)
      );

      wire [3 : 0] BU636_I;
         assign BU636_I[0] = n1779;
         assign BU636_I[1] = n1780;
         assign BU636_I[2] = n1773;
         assign BU636_I[3] = n1777;
      wire BU636_T;
         assign BU636_T = 1'b0;
      wire BU636_EN;
         assign BU636_EN = 1'b0;
      wire BU636_Q;
      wire BU636_CLK;
         assign BU636_CLK = 1'b0;
      wire BU636_CE;
         assign BU636_CE = 1'b0;
      wire BU636_ACLR;
         assign BU636_ACLR = 1'b0;
      wire BU636_ASET;
         assign BU636_ASET = 1'b0;
      wire BU636_AINIT;
         assign BU636_AINIT = 1'b0;
      wire BU636_SCLR;
         assign BU636_SCLR = 1'b0;
      wire BU636_SSET;
         assign BU636_SSET = 1'b0;
      wire BU636_SINIT;
         assign BU636_SINIT = 1'b0;
      wire BU636_O;
         assign n1778 = BU636_O;
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
      BU636(
         .I(BU636_I),
         .T(BU636_T),
         .EN(BU636_EN),
         .Q(BU636_Q),
         .CLK(BU636_CLK),
         .CE(BU636_CE),
         .ACLR(BU636_ACLR),
         .ASET(BU636_ASET),
         .AINIT(BU636_AINIT),
         .SCLR(BU636_SCLR),
         .SSET(BU636_SSET),
         .SINIT(BU636_SINIT),
         .O(BU636_O)
      );

      wire BU641_CLK;
         assign BU641_CLK = n177;
      wire BU641_SDIN;
         assign BU641_SDIN = n1778;
      wire [15 : 0] BU641_Q;
         assign n1779 = BU641_Q[0];
         assign n1780 = BU641_Q[2];
         assign n1770 = BU641_Q[8];
         assign n1771 = BU641_Q[9];
         assign n1772 = BU641_Q[10];
         assign n1773 = BU641_Q[11];
         assign n1774 = BU641_Q[12];
         assign n1775 = BU641_Q[13];
         assign n1776 = BU641_Q[14];
         assign n1777 = BU641_Q[15];
      wire BU641_SINIT;
         assign BU641_SINIT = n178;
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
         1    /* c_has_sinit*/,
         0    /* c_has_sset*/,
         0    /* c_shift_type*/,
         "1000000000000000"    /* c_sinit_val*/,
         0    /* c_sync_enable*/,
         0    /* c_sync_priority*/,
         16    /* c_width*/
      )
      BU641(
         .CLK(BU641_CLK),
         .SDIN(BU641_SDIN),
         .Q(BU641_Q),
         .SINIT(BU641_SINIT)
      );

      wire [12 : 0] BU940_D;
         assign BU940_D[0] = n84;
         assign BU940_D[1] = n85;
         assign BU940_D[2] = n86;
         assign BU940_D[3] = n87;
         assign BU940_D[4] = n88;
         assign BU940_D[5] = n89;
         assign BU940_D[6] = n90;
         assign BU940_D[7] = n91;
         assign BU940_D[8] = n92;
         assign BU940_D[9] = n93;
         assign BU940_D[10] = n94;
         assign BU940_D[11] = n95;
         assign BU940_D[12] = n96;
      wire [12 : 0] BU940_Q;
         assign n2467 = BU940_Q[0];
         assign n2468 = BU940_Q[1];
         assign n2469 = BU940_Q[2];
         assign n2470 = BU940_Q[3];
         assign n2471 = BU940_Q[4];
         assign n2472 = BU940_Q[5];
         assign n2473 = BU940_Q[6];
         assign n2474 = BU940_Q[7];
         assign n2475 = BU940_Q[8];
         assign n2476 = BU940_Q[9];
         assign n2477 = BU940_Q[10];
         assign n2478 = BU940_Q[11];
         assign n2479 = BU940_Q[12];
      wire BU940_CLK;
         assign BU940_CLK = n177;
      C_REG_FD_V7_0 #(
         "0000000000000"    /* c_ainit_val*/,
         0    /* c_enable_rlocs*/,
         0    /* c_has_aclr*/,
         0    /* c_has_ainit*/,
         0    /* c_has_aset*/,
         0    /* c_has_ce*/,
         0    /* c_has_sclr*/,
         0    /* c_has_sinit*/,
         0    /* c_has_sset*/,
         "0000000000000"    /* c_sinit_val*/,
         0    /* c_sync_enable*/,
         0    /* c_sync_priority*/,
         13    /* c_width*/
      )
      BU940(
         .D(BU940_D),
         .Q(BU940_Q),
         .CLK(BU940_CLK)
      );

      wire [10 : 0] BU969_A;
         assign BU969_A[0] = n2467;
         assign BU969_A[1] = n2468;
         assign BU969_A[2] = n2469;
         assign BU969_A[3] = n2470;
         assign BU969_A[4] = n2471;
         assign BU969_A[5] = n2472;
         assign BU969_A[6] = n2473;
         assign BU969_A[7] = n2474;
         assign BU969_A[8] = n2475;
         assign BU969_A[9] = n2476;
         assign BU969_A[10] = n2477;
      wire BU969_BYPASS;
         assign BU969_BYPASS = n2478;
      wire BU969_CLK;
         assign BU969_CLK = n177;
      wire [11 : 0] BU969_Q;
         assign n2504 = BU969_Q[0];
         assign n2505 = BU969_Q[1];
         assign n2506 = BU969_Q[2];
         assign n2507 = BU969_Q[3];
         assign n2508 = BU969_Q[4];
         assign n2509 = BU969_Q[5];
         assign n2510 = BU969_Q[6];
         assign n2511 = BU969_Q[7];
         assign n2512 = BU969_Q[8];
         assign n2513 = BU969_Q[9];
         assign n2514 = BU969_Q[10];
      C_TWOS_COMP_V7_0 #(
         "000000000000"    /* c_ainit_val*/,
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
         "000000000000"    /* c_sinit_val*/,
         0    /* c_sync_enable*/,
         0    /* c_sync_priority*/,
         11    /* c_width*/
      )
      BU969(
         .A(BU969_A),
         .BYPASS(BU969_BYPASS),
         .CLK(BU969_CLK),
         .Q(BU969_Q)
      );

      wire BU1055_CLK;
         assign BU1055_CLK = n177;
      wire [0 : 0] BU1055_D;
         assign BU1055_D[0] = n2479;
      wire [0 : 0] BU1055_Q;
         assign n2480 = BU1055_Q[0];
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
      BU1055(
         .CLK(BU1055_CLK),
         .D(BU1055_D),
         .Q(BU1055_Q)
      );

      wire BU1063_CLK;
         assign BU1063_CLK = n177;
      wire [0 : 0] BU1063_D;
         assign BU1063_D[0] = n2478;
      wire [0 : 0] BU1063_Q;
         assign n2481 = BU1063_Q[0];
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
      BU1063(
         .CLK(BU1063_CLK),
         .D(BU1063_D),
         .Q(BU1063_Q)
      );

      defparam BU1074.INIT = 'h9595;
      wire BU1074_I0;
         assign BU1074_I0 = n2480;
      wire BU1074_I1;
         assign BU1074_I1 = n2481;
      wire BU1074_I2;
         assign BU1074_I2 = n2519;
      wire BU1074_I3;
         assign BU1074_I3 = 1'b0;
      wire BU1074_O;
         assign n2786 = BU1074_O;
      LUT4       BU1074(
         .I0(BU1074_I0),
         .I1(BU1074_I1),
         .I2(BU1074_I2),
         .I3(BU1074_I3),
         .O(BU1074_O)
      );

      wire BU1075_D;
         assign BU1075_D = n2786;
      wire BU1075_C;
         assign BU1075_C = n177;
      wire BU1075_CE;
         assign BU1075_CE = 1'b1;
      wire BU1075_PRE;
         assign BU1075_PRE = 1'b0;
      wire BU1075_Q;
         assign n2521 = BU1075_Q;
      FDPE       BU1075(
         .D(BU1075_D),
         .C(BU1075_C),
         .CE(BU1075_CE),
         .PRE(BU1075_PRE),
         .Q(BU1075_Q)
      );

      defparam BU1079.INIT = 'h002a;
      wire BU1079_I0;
         assign BU1079_I0 = n2480;
      wire BU1079_I1;
         assign BU1079_I1 = n2481;
      wire BU1079_I2;
         assign BU1079_I2 = n2519;
      wire BU1079_I3;
         assign BU1079_I3 = n2520;
      wire BU1079_O;
         assign n2803 = BU1079_O;
      LUT4       BU1079(
         .I0(BU1079_I0),
         .I1(BU1079_I1),
         .I2(BU1079_I2),
         .I3(BU1079_I3),
         .O(BU1079_O)
      );

      wire BU1080_D;
         assign BU1080_D = n2803;
      wire BU1080_C;
         assign BU1080_C = n177;
      wire BU1080_CE;
         assign BU1080_CE = 1'b1;
      wire BU1080_Q;
         assign n2522 = BU1080_Q;
      FDE       BU1080(
         .D(BU1080_D),
         .C(BU1080_C),
         .CE(BU1080_CE),
         .Q(BU1080_Q)
      );

      defparam BU1084.INIT = 'hc0c0;
      wire BU1084_I0;
         assign BU1084_I0 = 1'b0;
      wire BU1084_I1;
         assign BU1084_I1 = n2481;
      wire BU1084_I2;
         assign BU1084_I2 = n2519;
      wire BU1084_I3;
         assign BU1084_I3 = 1'b0;
      wire BU1084_O;
         assign n2819 = BU1084_O;
      LUT4       BU1084(
         .I0(BU1084_I0),
         .I1(BU1084_I1),
         .I2(BU1084_I2),
         .I3(BU1084_I3),
         .O(BU1084_O)
      );

      wire BU1085_D;
         assign BU1085_D = n2819;
      wire BU1085_C;
         assign BU1085_C = n177;
      wire BU1085_CE;
         assign BU1085_CE = 1'b1;
      wire BU1085_Q;
         assign n2518 = BU1085_Q;
      FDE       BU1085(
         .D(BU1085_D),
         .C(BU1085_C),
         .CE(BU1085_CE),
         .Q(BU1085_Q)
      );

      wire [10 : 0] BU1087_A;
         assign BU1087_A[0] = n2504;
         assign BU1087_A[1] = n2505;
         assign BU1087_A[2] = n2506;
         assign BU1087_A[3] = n2507;
         assign BU1087_A[4] = n2508;
         assign BU1087_A[5] = n2509;
         assign BU1087_A[6] = n2510;
         assign BU1087_A[7] = n2511;
         assign BU1087_A[8] = n2512;
         assign BU1087_A[9] = n2513;
         assign BU1087_A[10] = n2514;
      wire BU1087_CLK;
         assign BU1087_CLK = n177;
      wire BU1087_ACLR;
         assign BU1087_ACLR = 1'b0;
      wire BU1087_QA_GE_B;
         assign n2520 = BU1087_QA_GE_B;
      C_COMPARE_V7_0 #(
         "0"    /* c_ainit_val*/,
         1    /* c_b_constant*/,
         "11111110110"    /* c_b_value*/,
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
         11    /* c_width*/
      )
      BU1087(
         .A(BU1087_A),
         .CLK(BU1087_CLK),
         .ACLR(BU1087_ACLR),
         .QA_GE_B(BU1087_QA_GE_B)
      );

      wire [10 : 0] BU1126_A;
         assign BU1126_A[0] = n2504;
         assign BU1126_A[1] = n2505;
         assign BU1126_A[2] = n2506;
         assign BU1126_A[3] = n2507;
         assign BU1126_A[4] = n2508;
         assign BU1126_A[5] = n2509;
         assign BU1126_A[6] = n2510;
         assign BU1126_A[7] = n2511;
         assign BU1126_A[8] = n2512;
         assign BU1126_A[9] = n2513;
         assign BU1126_A[10] = n2514;
      wire BU1126_CLK;
         assign BU1126_CLK = n177;
      wire BU1126_ACLR;
         assign BU1126_ACLR = 1'b0;
      wire BU1126_QA_EQ_B;
         assign n2519 = BU1126_QA_EQ_B;
      C_COMPARE_V7_0 #(
         "0"    /* c_ainit_val*/,
         1    /* c_b_constant*/,
         "00000000000"    /* c_b_value*/,
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
         11    /* c_width*/
      )
      BU1126(
         .A(BU1126_A),
         .CLK(BU1126_CLK),
         .ACLR(BU1126_ACLR),
         .QA_EQ_B(BU1126_QA_EQ_B)
      );

      wire [10 : 0] BU898_addr;
         assign BU898_addr[10] = n2514;
         assign BU898_addr[9] = n2513;
         assign BU898_addr[8] = n2512;
         assign BU898_addr[7] = n2511;
         assign BU898_addr[6] = n2510;
         assign BU898_addr[5] = n2509;
         assign BU898_addr[4] = n2508;
         assign BU898_addr[3] = n2507;
         assign BU898_addr[2] = n2506;
         assign BU898_addr[1] = n2505;
         assign BU898_addr[0] = n2504;
      wire BU898_clk;
         assign BU898_clk = n177;
      wire [13 : 0] BU898_din;
         assign BU898_din[13] = 1'b0;
         assign BU898_din[12] = 1'b0;
         assign BU898_din[11] = 1'b0;
         assign BU898_din[10] = 1'b0;
         assign BU898_din[9] = 1'b0;
         assign BU898_din[8] = 1'b0;
         assign BU898_din[7] = 1'b0;
         assign BU898_din[6] = 1'b0;
         assign BU898_din[5] = 1'b0;
         assign BU898_din[4] = 1'b0;
         assign BU898_din[3] = 1'b0;
         assign BU898_din[2] = 1'b0;
         assign BU898_din[1] = 1'b0;
         assign BU898_din[0] = 1'b0;
      wire [13 : 0] BU898_dout;
         assign n2536 = BU898_dout[13];
         assign n2535 = BU898_dout[12];
         assign n2534 = BU898_dout[11];
         assign n2533 = BU898_dout[10];
         assign n2532 = BU898_dout[9];
         assign n2531 = BU898_dout[8];
         assign n2530 = BU898_dout[7];
         assign n2529 = BU898_dout[6];
         assign n2528 = BU898_dout[5];
         assign n2527 = BU898_dout[4];
         assign n2526 = BU898_dout[3];
         assign n2525 = BU898_dout[2];
         assign n2524 = BU898_dout[1];
         assign n2523 = BU898_dout[0];
      wire BU898_en;
         assign BU898_en = 1'b0;
      wire BU898_nd;
         assign BU898_nd = 1'b0;
      wire BU898_rfd;
      wire BU898_rdy;
      wire BU898_sinit;
         assign BU898_sinit = 1'b0;
      wire BU898_we;
         assign BU898_we = 1'b0;
      BLKMEMSP_V6_0 #(
         11    /* c_addr_width*/,
         "0000000000000000000"    /* c_default_data*/,
         2048    /* c_depth*/,
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
         "DDS_SINCOS_TABLE_TRIG_ROM.mif"    /* c_mem_init_file*/,
         1    /* c_pipe_stages*/,
         0    /* c_reg_inputs*/,
         "0000000000000000000"    /* c_sinit_value*/,
         14    /* c_width*/,
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
      BU898(
         .ADDR(BU898_addr),
         .CLK(BU898_clk),
         .DIN(BU898_din),
         .DOUT(BU898_dout),
         .EN(BU898_en),
         .ND(BU898_nd),
         .RFD(BU898_rfd),
         .RDY(BU898_rdy),
         .SINIT(BU898_sinit),
         .WE(BU898_we)
      );

      wire [14 : 0] BU1145_A;
         assign BU1145_A[0] = 1'b0;
         assign BU1145_A[1] = 1'b0;
         assign BU1145_A[2] = 1'b0;
         assign BU1145_A[3] = 1'b0;
         assign BU1145_A[4] = 1'b0;
         assign BU1145_A[5] = 1'b0;
         assign BU1145_A[6] = 1'b0;
         assign BU1145_A[7] = 1'b0;
         assign BU1145_A[8] = 1'b0;
         assign BU1145_A[9] = 1'b0;
         assign BU1145_A[10] = 1'b0;
         assign BU1145_A[11] = 1'b0;
         assign BU1145_A[12] = 1'b0;
         assign BU1145_A[13] = 1'b0;
         assign BU1145_A[14] = 1'b0;
      wire [14 : 0] BU1145_B;
         assign BU1145_B[0] = n2523;
         assign BU1145_B[1] = n2524;
         assign BU1145_B[2] = n2525;
         assign BU1145_B[3] = n2526;
         assign BU1145_B[4] = n2527;
         assign BU1145_B[5] = n2528;
         assign BU1145_B[6] = n2529;
         assign BU1145_B[7] = n2530;
         assign BU1145_B[8] = n2531;
         assign BU1145_B[9] = n2532;
         assign BU1145_B[10] = n2533;
         assign BU1145_B[11] = n2534;
         assign BU1145_B[12] = n2535;
         assign BU1145_B[13] = n2536;
         assign BU1145_B[14] = n2518;
      wire BU1145_C_IN;
         assign BU1145_C_IN = n2522;
      wire BU1145_ADD;
         assign BU1145_ADD = n2521;
      wire [14 : 0] BU1145_Q;
         assign n179 = BU1145_Q[0];
         assign n180 = BU1145_Q[1];
         assign n181 = BU1145_Q[2];
         assign n182 = BU1145_Q[3];
         assign n183 = BU1145_Q[4];
         assign n184 = BU1145_Q[5];
         assign n185 = BU1145_Q[6];
         assign n186 = BU1145_Q[7];
         assign n187 = BU1145_Q[8];
         assign n188 = BU1145_Q[9];
         assign n189 = BU1145_Q[10];
         assign n190 = BU1145_Q[11];
         assign n191 = BU1145_Q[12];
         assign n192 = BU1145_Q[13];
         assign n193 = BU1145_Q[14];
      wire BU1145_CLK;
         assign BU1145_CLK = n177;
      wire BU1145_CE;
         assign BU1145_CE = n2552;
      wire BU1145_SCLR;
         assign BU1145_SCLR = n178;
      C_ADDSUB_V7_0 #(
         2    /* c_add_mode*/,
         "000000000000000"    /* c_ainit_val*/,
         1    /* c_a_type*/,
         15    /* c_a_width*/,
         1    /* c_bypass_enable*/,
         0    /* c_bypass_low*/,
         0    /* c_b_constant*/,
         1    /* c_b_type*/,
         "000000000000000"    /* c_b_value*/,
         15    /* c_b_width*/,
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
         1    /* c_has_sclr*/,
         0    /* c_has_sinit*/,
         0    /* c_has_sset*/,
         14    /* c_high_bit*/,
         1    /* c_latency*/,
         0    /* c_low_bit*/,
         15    /* c_out_width*/,
         0    /* c_pipe_stages*/,
         "000000000000000"    /* c_sinit_val*/,
         0    /* c_sync_enable*/,
         0    /* c_sync_priority*/
      )
      BU1145(
         .A(BU1145_A),
         .B(BU1145_B),
         .C_IN(BU1145_C_IN),
         .ADD(BU1145_ADD),
         .Q(BU1145_Q),
         .CLK(BU1145_CLK),
         .CE(BU1145_CE),
         .SCLR(BU1145_SCLR)
      );

      wire BU1236_CLK;
         assign BU1236_CLK = n177;
      wire BU1236_SDIN;
         assign BU1236_SDIN = n83;
      wire BU1236_SDOUT;
         assign n2552 = BU1236_SDOUT;
      wire BU1236_SCLR;
         assign BU1236_SCLR = n178;
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
         1    /* c_has_sclr*/,
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
      BU1236(
         .CLK(BU1236_CLK),
         .SDIN(BU1236_SDIN),
         .SDOUT(BU1236_SDOUT),
         .SCLR(BU1236_SCLR)
      );

//synthesis translate_on

endmodule
