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

module DDS_10_VII(
   CLK,
   SINE
   ); // synthesis black_box

   input CLK;
   output [13 : 0] SINE;
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
   wire n9;
   wire n10;
   wire n11;
   wire n12;
   wire n13;
   wire n14;
   wire n15;
   wire n16;
   wire n17;
   wire n18;
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
   wire n43;
   wire n44;
   wire n45;
   wire n46;
   wire n47;
   wire n48;
   wire n49;
   wire n50;
   wire n51;
   wire n52;
   wire n53;
   wire n54;
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
   wire n118;
   wire n119;
   wire n120;
   wire n121;
   wire n122;
   wire n123;
   wire n124;
   wire n125;
   wire n126;
   wire n127;
   wire n128;
   wire n129;
   wire n130;
   wire n131;
   wire n132;
   wire n1129;
   wire n1130;
   wire n1131;
   wire n1132;
   wire n1133;
   wire n1134;
   wire n1135;
   wire n1136;
   wire n1137;
   wire n1138;
   wire n1139;
   wire n1140;
   wire n1179;
   wire n1180;
   wire n1181;
   wire n1182;
   wire n1183;
   wire n1184;
   wire n1185;
   wire n1186;
   wire n1187;
   wire n1188;
   wire n1189;
   wire n1230;
   wire n1231;
   wire n1232;
   wire n1233;
   wire n1234;
   wire n1235;
   wire n1236;
   wire n1237;
   wire n1238;
   wire n1239;
   wire n1240;
   wire n1241;
   wire n1242;
   wire n1243;
   wire n1244;
   wire n1245;
   wire n1246;
   wire n1247;
   wire n1248;
   wire n1285;
   wire n1286;
   wire n1287;
   wire n1288;
   wire n1289;
   wire n1290;
   wire n1291;
   wire n1292;
   wire n1293;
   wire n1294;
   wire n1295;
   wire n1338;
   wire n1339;
   wire n1340;
   wire n1341;
   wire n1342;
   wire n1343;
   wire n1344;
   wire n1345;
   wire n1346;
   wire n1974;
   wire n1975;
   wire n1976;
   wire n1977;
   wire n1978;
   wire n1979;
   wire n1980;
   wire n1981;
   wire n1982;
   wire n1983;
   wire n1984;
   wire n1985;
   wire n1986;
   wire n1987;
   wire n2008;
   wire n2009;
   wire n2010;
   wire n2011;
   wire n2012;
   wire n2013;
   wire n2014;
   wire n2015;
   wire n2016;
   wire n2017;
   wire n2021;
   wire n2022;
   wire n2023;
   wire n2024;
   wire n2025;
   wire n2026;
   wire n2027;
   wire n2028;
   wire n2029;
   wire n2030;
   wire n2031;
   wire n2032;
   wire n2033;
   wire n2034;
   wire n2035;
   wire n2036;
   wire n2037;
   wire n2038;
   wire n2053;
   wire n2271;
   wire n2288;
   wire n2304;
   assign n118 = CLK;
   assign SINE[0] = n119;
   assign SINE[1] = n120;
   assign SINE[2] = n121;
   assign SINE[3] = n122;
   assign SINE[4] = n123;
   assign SINE[5] = n124;
   assign SINE[6] = n125;
   assign SINE[7] = n126;
   assign SINE[8] = n127;
   assign SINE[9] = n128;
   assign SINE[10] = n129;
   assign SINE[11] = n130;
   assign SINE[12] = n131;
   assign SINE[13] = n132;

      wire [30 : 0] BU4_A;
         assign BU4_A[0] = n2;
         assign BU4_A[1] = n3;
         assign BU4_A[2] = n4;
         assign BU4_A[3] = n5;
         assign BU4_A[4] = n6;
         assign BU4_A[5] = n7;
         assign BU4_A[6] = n8;
         assign BU4_A[7] = n9;
         assign BU4_A[8] = n10;
         assign BU4_A[9] = n11;
         assign BU4_A[10] = n12;
         assign BU4_A[11] = n13;
         assign BU4_A[12] = n14;
         assign BU4_A[13] = n15;
         assign BU4_A[14] = n16;
         assign BU4_A[15] = n17;
         assign BU4_A[16] = n18;
         assign BU4_A[17] = n19;
         assign BU4_A[18] = n20;
         assign BU4_A[19] = n21;
         assign BU4_A[20] = n22;
         assign BU4_A[21] = n23;
         assign BU4_A[22] = n24;
         assign BU4_A[23] = n25;
         assign BU4_A[24] = n26;
         assign BU4_A[25] = n27;
         assign BU4_A[26] = n28;
         assign BU4_A[27] = n29;
         assign BU4_A[28] = n30;
         assign BU4_A[29] = n31;
         assign BU4_A[30] = n32;
      wire [30 : 0] BU4_Q;
         assign n2 = BU4_Q[0];
         assign n3 = BU4_Q[1];
         assign n4 = BU4_Q[2];
         assign n5 = BU4_Q[3];
         assign n6 = BU4_Q[4];
         assign n7 = BU4_Q[5];
         assign n8 = BU4_Q[6];
         assign n9 = BU4_Q[7];
         assign n10 = BU4_Q[8];
         assign n11 = BU4_Q[9];
         assign n12 = BU4_Q[10];
         assign n13 = BU4_Q[11];
         assign n14 = BU4_Q[12];
         assign n15 = BU4_Q[13];
         assign n16 = BU4_Q[14];
         assign n17 = BU4_Q[15];
         assign n18 = BU4_Q[16];
         assign n19 = BU4_Q[17];
         assign n20 = BU4_Q[18];
         assign n21 = BU4_Q[19];
         assign n22 = BU4_Q[20];
         assign n23 = BU4_Q[21];
         assign n24 = BU4_Q[22];
         assign n25 = BU4_Q[23];
         assign n26 = BU4_Q[24];
         assign n27 = BU4_Q[25];
         assign n28 = BU4_Q[26];
         assign n29 = BU4_Q[27];
         assign n30 = BU4_Q[28];
         assign n31 = BU4_Q[29];
         assign n32 = BU4_Q[30];
      wire BU4_CLK;
         assign BU4_CLK = n118;
      C_ADDSUB_V7_0 #(
         0    /* c_add_mode*/,
         "0000000000000000000000000000000"    /* c_ainit_val*/,
         1    /* c_a_type*/,
         31    /* c_a_width*/,
         1    /* c_bypass_enable*/,
         0    /* c_bypass_low*/,
         1    /* c_b_constant*/,
         1    /* c_b_type*/,
         "0000000000000000000000000000000"    /* c_b_value*/,
         31    /* c_b_width*/,
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
         30    /* c_high_bit*/,
         1    /* c_latency*/,
         0    /* c_low_bit*/,
         31    /* c_out_width*/,
         0    /* c_pipe_stages*/,
         "0000000000000000000000000000000"    /* c_sinit_val*/,
         0    /* c_sync_enable*/,
         0    /* c_sync_priority*/
      )
      BU4(
         .A(BU4_A),
         .Q(BU4_Q),
         .CLK(BU4_CLK)
      );

      wire BU190_CLK;
         assign BU190_CLK = n118;
      wire BU190_SDOUT;
         assign n64 = BU190_SDOUT;
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
      BU190(
         .CLK(BU190_CLK),
         .SDOUT(BU190_SDOUT)
      );

      wire [30 : 0] BU199_A;
         assign BU199_A[0] = n2;
         assign BU199_A[1] = n3;
         assign BU199_A[2] = n4;
         assign BU199_A[3] = n5;
         assign BU199_A[4] = n6;
         assign BU199_A[5] = n7;
         assign BU199_A[6] = n8;
         assign BU199_A[7] = n9;
         assign BU199_A[8] = n10;
         assign BU199_A[9] = n11;
         assign BU199_A[10] = n12;
         assign BU199_A[11] = n13;
         assign BU199_A[12] = n14;
         assign BU199_A[13] = n15;
         assign BU199_A[14] = n16;
         assign BU199_A[15] = n17;
         assign BU199_A[16] = n18;
         assign BU199_A[17] = n19;
         assign BU199_A[18] = n20;
         assign BU199_A[19] = n21;
         assign BU199_A[20] = n22;
         assign BU199_A[21] = n23;
         assign BU199_A[22] = n24;
         assign BU199_A[23] = n25;
         assign BU199_A[24] = n26;
         assign BU199_A[25] = n27;
         assign BU199_A[26] = n28;
         assign BU199_A[27] = n29;
         assign BU199_A[28] = n30;
         assign BU199_A[29] = n31;
         assign BU199_A[30] = n32;
      wire [30 : 0] BU199_Q;
         assign n43 = BU199_Q[10];
         assign n44 = BU199_Q[11];
         assign n45 = BU199_Q[12];
         assign n46 = BU199_Q[13];
         assign n47 = BU199_Q[14];
         assign n48 = BU199_Q[15];
         assign n49 = BU199_Q[16];
         assign n50 = BU199_Q[17];
         assign n51 = BU199_Q[18];
         assign n52 = BU199_Q[19];
         assign n53 = BU199_Q[20];
         assign n54 = BU199_Q[21];
         assign n55 = BU199_Q[22];
         assign n56 = BU199_Q[23];
         assign n57 = BU199_Q[24];
         assign n58 = BU199_Q[25];
         assign n59 = BU199_Q[26];
         assign n60 = BU199_Q[27];
         assign n61 = BU199_Q[28];
         assign n62 = BU199_Q[29];
         assign n63 = BU199_Q[30];
      wire BU199_CLK;
         assign BU199_CLK = n118;
      C_ADDSUB_V7_0 #(
         0    /* c_add_mode*/,
         "0000000000000000000000000000000"    /* c_ainit_val*/,
         1    /* c_a_type*/,
         31    /* c_a_width*/,
         1    /* c_bypass_enable*/,
         0    /* c_bypass_low*/,
         1    /* c_b_constant*/,
         1    /* c_b_type*/,
         "0000000000000000000000000000000"    /* c_b_value*/,
         31    /* c_b_width*/,
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
         30    /* c_high_bit*/,
         1    /* c_latency*/,
         0    /* c_low_bit*/,
         31    /* c_out_width*/,
         0    /* c_pipe_stages*/,
         "0000000000000000000000000000000"    /* c_sinit_val*/,
         0    /* c_sync_enable*/,
         0    /* c_sync_priority*/
      )
      BU199(
         .A(BU199_A),
         .Q(BU199_Q),
         .CLK(BU199_CLK)
      );

      wire [20 : 0] BU704_A;
         assign BU704_A[0] = n43;
         assign BU704_A[1] = n44;
         assign BU704_A[2] = n45;
         assign BU704_A[3] = n46;
         assign BU704_A[4] = n47;
         assign BU704_A[5] = n48;
         assign BU704_A[6] = n49;
         assign BU704_A[7] = n50;
         assign BU704_A[8] = n51;
         assign BU704_A[9] = n52;
         assign BU704_A[10] = n53;
         assign BU704_A[11] = n54;
         assign BU704_A[12] = n55;
         assign BU704_A[13] = n56;
         assign BU704_A[14] = n57;
         assign BU704_A[15] = n58;
         assign BU704_A[16] = n59;
         assign BU704_A[17] = n60;
         assign BU704_A[18] = n61;
         assign BU704_A[19] = n62;
         assign BU704_A[20] = n63;
      wire [9 : 0] BU704_B;
         assign BU704_B[0] = n77;
         assign BU704_B[1] = n78;
         assign BU704_B[2] = n79;
         assign BU704_B[3] = n80;
         assign BU704_B[4] = n81;
         assign BU704_B[5] = n82;
         assign BU704_B[6] = n83;
         assign BU704_B[7] = n84;
         assign BU704_B[8] = n85;
         assign BU704_B[9] = n86;
      wire [11 : 0] BU704_Q;
         assign n65 = BU704_Q[0];
         assign n66 = BU704_Q[1];
         assign n67 = BU704_Q[2];
         assign n68 = BU704_Q[3];
         assign n69 = BU704_Q[4];
         assign n70 = BU704_Q[5];
         assign n71 = BU704_Q[6];
         assign n72 = BU704_Q[7];
         assign n73 = BU704_Q[8];
         assign n74 = BU704_Q[9];
         assign n75 = BU704_Q[10];
         assign n76 = BU704_Q[11];
      wire BU704_CLK;
         assign BU704_CLK = n118;
      C_ADDSUB_V7_0 #(
         0    /* c_add_mode*/,
         "000000000000"    /* c_ainit_val*/,
         1    /* c_a_type*/,
         21    /* c_a_width*/,
         1    /* c_bypass_enable*/,
         0    /* c_bypass_low*/,
         0    /* c_b_constant*/,
         0    /* c_b_type*/,
         "000000000000000000000"    /* c_b_value*/,
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
         20    /* c_high_bit*/,
         1    /* c_latency*/,
         9    /* c_low_bit*/,
         12    /* c_out_width*/,
         0    /* c_pipe_stages*/,
         "000000000000"    /* c_sinit_val*/,
         0    /* c_sync_enable*/,
         0    /* c_sync_priority*/
      )
      BU704(
         .A(BU704_A),
         .B(BU704_B),
         .Q(BU704_Q),
         .CLK(BU704_CLK)
      );

      wire [8 : 0] BU643_A;
         assign BU643_A[0] = n1230;
         assign BU643_A[1] = n1231;
         assign BU643_A[2] = n1232;
         assign BU643_A[3] = n1233;
         assign BU643_A[4] = n1234;
         assign BU643_A[5] = n1235;
         assign BU643_A[6] = n1236;
         assign BU643_A[7] = n1237;
         assign BU643_A[8] = n1238;
      wire [8 : 0] BU643_B;
         assign BU643_B[0] = n1338;
         assign BU643_B[1] = n1339;
         assign BU643_B[2] = n1340;
         assign BU643_B[3] = n1341;
         assign BU643_B[4] = n1342;
         assign BU643_B[5] = n1343;
         assign BU643_B[6] = n1344;
         assign BU643_B[7] = n1345;
         assign BU643_B[8] = n1346;
      wire [9 : 0] BU643_Q;
         assign n77 = BU643_Q[0];
         assign n78 = BU643_Q[1];
         assign n79 = BU643_Q[2];
         assign n80 = BU643_Q[3];
         assign n81 = BU643_Q[4];
         assign n82 = BU643_Q[5];
         assign n83 = BU643_Q[6];
         assign n84 = BU643_Q[7];
         assign n85 = BU643_Q[8];
         assign n86 = BU643_Q[9];
      wire BU643_CLK;
         assign BU643_CLK = n118;
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
      BU643(
         .A(BU643_A),
         .B(BU643_B),
         .Q(BU643_Q),
         .CLK(BU643_CLK)
      );

      wire [7 : 0] BU457_A;
         assign BU457_A[0] = n1129;
         assign BU457_A[1] = n1130;
         assign BU457_A[2] = n1131;
         assign BU457_A[3] = n1132;
         assign BU457_A[4] = n1133;
         assign BU457_A[5] = n1134;
         assign BU457_A[6] = n1135;
         assign BU457_A[7] = n1136;
      wire [7 : 0] BU457_B;
         assign BU457_B[0] = n1179;
         assign BU457_B[1] = n1180;
         assign BU457_B[2] = n1181;
         assign BU457_B[3] = n1182;
         assign BU457_B[4] = n1183;
         assign BU457_B[5] = n1184;
         assign BU457_B[6] = n1185;
         assign BU457_B[7] = n1186;
      wire [8 : 0] BU457_Q;
         assign n1230 = BU457_Q[0];
         assign n1231 = BU457_Q[1];
         assign n1232 = BU457_Q[2];
         assign n1233 = BU457_Q[3];
         assign n1234 = BU457_Q[4];
         assign n1235 = BU457_Q[5];
         assign n1236 = BU457_Q[6];
         assign n1237 = BU457_Q[7];
         assign n1238 = BU457_Q[8];
      wire BU457_CLK;
         assign BU457_CLK = n118;
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
      BU457(
         .A(BU457_A),
         .B(BU457_B),
         .Q(BU457_Q),
         .CLK(BU457_CLK)
      );

      wire [3 : 0] BU388_I;
         assign BU388_I[0] = n1138;
         assign BU388_I[1] = n1139;
         assign BU388_I[2] = n1140;
         assign BU388_I[3] = n1136;
      wire BU388_T;
         assign BU388_T = 1'b0;
      wire BU388_EN;
         assign BU388_EN = 1'b0;
      wire BU388_Q;
      wire BU388_CLK;
         assign BU388_CLK = 1'b0;
      wire BU388_CE;
         assign BU388_CE = 1'b0;
      wire BU388_ACLR;
         assign BU388_ACLR = 1'b0;
      wire BU388_ASET;
         assign BU388_ASET = 1'b0;
      wire BU388_AINIT;
         assign BU388_AINIT = 1'b0;
      wire BU388_SCLR;
         assign BU388_SCLR = 1'b0;
      wire BU388_SSET;
         assign BU388_SSET = 1'b0;
      wire BU388_SINIT;
         assign BU388_SINIT = 1'b0;
      wire BU388_O;
         assign n1137 = BU388_O;
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
      BU388(
         .I(BU388_I),
         .T(BU388_T),
         .EN(BU388_EN),
         .Q(BU388_Q),
         .CLK(BU388_CLK),
         .CE(BU388_CE),
         .ACLR(BU388_ACLR),
         .ASET(BU388_ASET),
         .AINIT(BU388_AINIT),
         .SCLR(BU388_SCLR),
         .SSET(BU388_SSET),
         .SINIT(BU388_SINIT),
         .O(BU388_O)
      );

      wire BU393_CLK;
         assign BU393_CLK = n118;
      wire BU393_SDIN;
         assign BU393_SDIN = n1137;
      wire [12 : 0] BU393_Q;
         assign n1138 = BU393_Q[0];
         assign n1139 = BU393_Q[2];
         assign n1140 = BU393_Q[3];
         assign n1129 = BU393_Q[5];
         assign n1130 = BU393_Q[6];
         assign n1131 = BU393_Q[7];
         assign n1132 = BU393_Q[8];
         assign n1133 = BU393_Q[9];
         assign n1134 = BU393_Q[10];
         assign n1135 = BU393_Q[11];
         assign n1136 = BU393_Q[12];
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
      BU393(
         .CLK(BU393_CLK),
         .SDIN(BU393_SDIN),
         .Q(BU393_Q)
      );

      wire [3 : 0] BU422_I;
         assign BU422_I[0] = n1188;
         assign BU422_I[1] = n1189;
         assign BU422_I[2] = n1182;
         assign BU422_I[3] = n1186;
      wire BU422_T;
         assign BU422_T = 1'b0;
      wire BU422_EN;
         assign BU422_EN = 1'b0;
      wire BU422_Q;
      wire BU422_CLK;
         assign BU422_CLK = 1'b0;
      wire BU422_CE;
         assign BU422_CE = 1'b0;
      wire BU422_ACLR;
         assign BU422_ACLR = 1'b0;
      wire BU422_ASET;
         assign BU422_ASET = 1'b0;
      wire BU422_AINIT;
         assign BU422_AINIT = 1'b0;
      wire BU422_SCLR;
         assign BU422_SCLR = 1'b0;
      wire BU422_SSET;
         assign BU422_SSET = 1'b0;
      wire BU422_SINIT;
         assign BU422_SINIT = 1'b0;
      wire BU422_O;
         assign n1187 = BU422_O;
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
      BU422(
         .I(BU422_I),
         .T(BU422_T),
         .EN(BU422_EN),
         .Q(BU422_Q),
         .CLK(BU422_CLK),
         .CE(BU422_CE),
         .ACLR(BU422_ACLR),
         .ASET(BU422_ASET),
         .AINIT(BU422_AINIT),
         .SCLR(BU422_SCLR),
         .SSET(BU422_SSET),
         .SINIT(BU422_SINIT),
         .O(BU422_O)
      );

      wire BU427_CLK;
         assign BU427_CLK = n118;
      wire BU427_SDIN;
         assign BU427_SDIN = n1187;
      wire [13 : 0] BU427_Q;
         assign n1188 = BU427_Q[0];
         assign n1189 = BU427_Q[5];
         assign n1179 = BU427_Q[6];
         assign n1180 = BU427_Q[7];
         assign n1181 = BU427_Q[8];
         assign n1182 = BU427_Q[9];
         assign n1183 = BU427_Q[10];
         assign n1184 = BU427_Q[11];
         assign n1185 = BU427_Q[12];
         assign n1186 = BU427_Q[13];
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
      BU427(
         .CLK(BU427_CLK),
         .SDIN(BU427_SDIN),
         .Q(BU427_Q)
      );

      wire [7 : 0] BU589_A;
         assign BU589_A[0] = n1239;
         assign BU589_A[1] = n1240;
         assign BU589_A[2] = n1241;
         assign BU589_A[3] = n1242;
         assign BU589_A[4] = n1243;
         assign BU589_A[5] = n1244;
         assign BU589_A[6] = n1245;
         assign BU589_A[7] = n1246;
      wire [7 : 0] BU589_B;
         assign BU589_B[0] = n1285;
         assign BU589_B[1] = n1286;
         assign BU589_B[2] = n1287;
         assign BU589_B[3] = n1288;
         assign BU589_B[4] = n1289;
         assign BU589_B[5] = n1290;
         assign BU589_B[6] = n1291;
         assign BU589_B[7] = n1292;
      wire [8 : 0] BU589_Q;
         assign n1338 = BU589_Q[0];
         assign n1339 = BU589_Q[1];
         assign n1340 = BU589_Q[2];
         assign n1341 = BU589_Q[3];
         assign n1342 = BU589_Q[4];
         assign n1343 = BU589_Q[5];
         assign n1344 = BU589_Q[6];
         assign n1345 = BU589_Q[7];
         assign n1346 = BU589_Q[8];
      wire BU589_CLK;
         assign BU589_CLK = n118;
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
      BU589(
         .A(BU589_A),
         .B(BU589_B),
         .Q(BU589_Q),
         .CLK(BU589_CLK)
      );

      wire [1 : 0] BU512_I;
         assign BU512_I[0] = n1248;
         assign BU512_I[1] = n1246;
      wire BU512_T;
         assign BU512_T = 1'b0;
      wire BU512_EN;
         assign BU512_EN = 1'b0;
      wire BU512_Q;
      wire BU512_CLK;
         assign BU512_CLK = 1'b0;
      wire BU512_CE;
         assign BU512_CE = 1'b0;
      wire BU512_ACLR;
         assign BU512_ACLR = 1'b0;
      wire BU512_ASET;
         assign BU512_ASET = 1'b0;
      wire BU512_AINIT;
         assign BU512_AINIT = 1'b0;
      wire BU512_SCLR;
         assign BU512_SCLR = 1'b0;
      wire BU512_SSET;
         assign BU512_SSET = 1'b0;
      wire BU512_SINIT;
         assign BU512_SINIT = 1'b0;
      wire BU512_O;
         assign n1247 = BU512_O;
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
      BU512(
         .I(BU512_I),
         .T(BU512_T),
         .EN(BU512_EN),
         .Q(BU512_Q),
         .CLK(BU512_CLK),
         .CE(BU512_CE),
         .ACLR(BU512_ACLR),
         .ASET(BU512_ASET),
         .AINIT(BU512_AINIT),
         .SCLR(BU512_SCLR),
         .SSET(BU512_SSET),
         .SINIT(BU512_SINIT),
         .O(BU512_O)
      );

      wire BU517_CLK;
         assign BU517_CLK = n118;
      wire BU517_SDIN;
         assign BU517_SDIN = n1247;
      wire [14 : 0] BU517_Q;
         assign n1248 = BU517_Q[0];
         assign n1239 = BU517_Q[7];
         assign n1240 = BU517_Q[8];
         assign n1241 = BU517_Q[9];
         assign n1242 = BU517_Q[10];
         assign n1243 = BU517_Q[11];
         assign n1244 = BU517_Q[12];
         assign n1245 = BU517_Q[13];
         assign n1246 = BU517_Q[14];
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
      BU517(
         .CLK(BU517_CLK),
         .SDIN(BU517_SDIN),
         .Q(BU517_Q)
      );

      wire [3 : 0] BU550_I;
         assign BU550_I[0] = n1294;
         assign BU550_I[1] = n1295;
         assign BU550_I[2] = n1288;
         assign BU550_I[3] = n1292;
      wire BU550_T;
         assign BU550_T = 1'b0;
      wire BU550_EN;
         assign BU550_EN = 1'b0;
      wire BU550_Q;
      wire BU550_CLK;
         assign BU550_CLK = 1'b0;
      wire BU550_CE;
         assign BU550_CE = 1'b0;
      wire BU550_ACLR;
         assign BU550_ACLR = 1'b0;
      wire BU550_ASET;
         assign BU550_ASET = 1'b0;
      wire BU550_AINIT;
         assign BU550_AINIT = 1'b0;
      wire BU550_SCLR;
         assign BU550_SCLR = 1'b0;
      wire BU550_SSET;
         assign BU550_SSET = 1'b0;
      wire BU550_SINIT;
         assign BU550_SINIT = 1'b0;
      wire BU550_O;
         assign n1293 = BU550_O;
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
      BU550(
         .I(BU550_I),
         .T(BU550_T),
         .EN(BU550_EN),
         .Q(BU550_Q),
         .CLK(BU550_CLK),
         .CE(BU550_CE),
         .ACLR(BU550_ACLR),
         .ASET(BU550_ASET),
         .AINIT(BU550_AINIT),
         .SCLR(BU550_SCLR),
         .SSET(BU550_SSET),
         .SINIT(BU550_SINIT),
         .O(BU550_O)
      );

      wire BU555_CLK;
         assign BU555_CLK = n118;
      wire BU555_SDIN;
         assign BU555_SDIN = n1293;
      wire [15 : 0] BU555_Q;
         assign n1294 = BU555_Q[0];
         assign n1295 = BU555_Q[2];
         assign n1285 = BU555_Q[8];
         assign n1286 = BU555_Q[9];
         assign n1287 = BU555_Q[10];
         assign n1288 = BU555_Q[11];
         assign n1289 = BU555_Q[12];
         assign n1290 = BU555_Q[13];
         assign n1291 = BU555_Q[14];
         assign n1292 = BU555_Q[15];
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
      BU555(
         .CLK(BU555_CLK),
         .SDIN(BU555_SDIN),
         .Q(BU555_Q)
      );

      wire [11 : 0] BU841_D;
         assign BU841_D[0] = n65;
         assign BU841_D[1] = n66;
         assign BU841_D[2] = n67;
         assign BU841_D[3] = n68;
         assign BU841_D[4] = n69;
         assign BU841_D[5] = n70;
         assign BU841_D[6] = n71;
         assign BU841_D[7] = n72;
         assign BU841_D[8] = n73;
         assign BU841_D[9] = n74;
         assign BU841_D[10] = n75;
         assign BU841_D[11] = n76;
      wire [11 : 0] BU841_Q;
         assign n1974 = BU841_Q[0];
         assign n1975 = BU841_Q[1];
         assign n1976 = BU841_Q[2];
         assign n1977 = BU841_Q[3];
         assign n1978 = BU841_Q[4];
         assign n1979 = BU841_Q[5];
         assign n1980 = BU841_Q[6];
         assign n1981 = BU841_Q[7];
         assign n1982 = BU841_Q[8];
         assign n1983 = BU841_Q[9];
         assign n1984 = BU841_Q[10];
         assign n1985 = BU841_Q[11];
      wire BU841_CLK;
         assign BU841_CLK = n118;
      C_REG_FD_V7_0 #(
         "000000000000"    /* c_ainit_val*/,
         0    /* c_enable_rlocs*/,
         0    /* c_has_aclr*/,
         0    /* c_has_ainit*/,
         0    /* c_has_aset*/,
         0    /* c_has_ce*/,
         0    /* c_has_sclr*/,
         0    /* c_has_sinit*/,
         0    /* c_has_sset*/,
         "000000000000"    /* c_sinit_val*/,
         0    /* c_sync_enable*/,
         0    /* c_sync_priority*/,
         12    /* c_width*/
      )
      BU841(
         .D(BU841_D),
         .Q(BU841_Q),
         .CLK(BU841_CLK)
      );

      wire [9 : 0] BU868_A;
         assign BU868_A[0] = n1974;
         assign BU868_A[1] = n1975;
         assign BU868_A[2] = n1976;
         assign BU868_A[3] = n1977;
         assign BU868_A[4] = n1978;
         assign BU868_A[5] = n1979;
         assign BU868_A[6] = n1980;
         assign BU868_A[7] = n1981;
         assign BU868_A[8] = n1982;
         assign BU868_A[9] = n1983;
      wire BU868_BYPASS;
         assign BU868_BYPASS = n1984;
      wire BU868_CLK;
         assign BU868_CLK = n118;
      wire [10 : 0] BU868_Q;
         assign n2008 = BU868_Q[0];
         assign n2009 = BU868_Q[1];
         assign n2010 = BU868_Q[2];
         assign n2011 = BU868_Q[3];
         assign n2012 = BU868_Q[4];
         assign n2013 = BU868_Q[5];
         assign n2014 = BU868_Q[6];
         assign n2015 = BU868_Q[7];
         assign n2016 = BU868_Q[8];
         assign n2017 = BU868_Q[9];
      C_TWOS_COMP_V7_0 #(
         "00000000000"    /* c_ainit_val*/,
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
         "00000000000"    /* c_sinit_val*/,
         0    /* c_sync_enable*/,
         0    /* c_sync_priority*/,
         10    /* c_width*/
      )
      BU868(
         .A(BU868_A),
         .BYPASS(BU868_BYPASS),
         .CLK(BU868_CLK),
         .Q(BU868_Q)
      );

      wire BU947_CLK;
         assign BU947_CLK = n118;
      wire [0 : 0] BU947_D;
         assign BU947_D[0] = n1985;
      wire [0 : 0] BU947_Q;
         assign n1986 = BU947_Q[0];
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
      BU947(
         .CLK(BU947_CLK),
         .D(BU947_D),
         .Q(BU947_Q)
      );

      wire BU955_CLK;
         assign BU955_CLK = n118;
      wire [0 : 0] BU955_D;
         assign BU955_D[0] = n1984;
      wire [0 : 0] BU955_Q;
         assign n1987 = BU955_Q[0];
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
      BU955(
         .CLK(BU955_CLK),
         .D(BU955_D),
         .Q(BU955_Q)
      );

      defparam BU966.INIT = 'h9595;
      wire BU966_I0;
         assign BU966_I0 = n1986;
      wire BU966_I1;
         assign BU966_I1 = n1987;
      wire BU966_I2;
         assign BU966_I2 = n2022;
      wire BU966_I3;
         assign BU966_I3 = 1'b0;
      wire BU966_O;
         assign n2271 = BU966_O;
      LUT4       BU966(
         .I0(BU966_I0),
         .I1(BU966_I1),
         .I2(BU966_I2),
         .I3(BU966_I3),
         .O(BU966_O)
      );

      wire BU967_D;
         assign BU967_D = n2271;
      wire BU967_C;
         assign BU967_C = n118;
      wire BU967_CE;
         assign BU967_CE = 1'b1;
      wire BU967_PRE;
         assign BU967_PRE = 1'b0;
      wire BU967_Q;
         assign n2024 = BU967_Q;
      FDPE       BU967(
         .D(BU967_D),
         .C(BU967_C),
         .CE(BU967_CE),
         .PRE(BU967_PRE),
         .Q(BU967_Q)
      );

      defparam BU971.INIT = 'h002a;
      wire BU971_I0;
         assign BU971_I0 = n1986;
      wire BU971_I1;
         assign BU971_I1 = n1987;
      wire BU971_I2;
         assign BU971_I2 = n2022;
      wire BU971_I3;
         assign BU971_I3 = n2023;
      wire BU971_O;
         assign n2288 = BU971_O;
      LUT4       BU971(
         .I0(BU971_I0),
         .I1(BU971_I1),
         .I2(BU971_I2),
         .I3(BU971_I3),
         .O(BU971_O)
      );

      wire BU972_D;
         assign BU972_D = n2288;
      wire BU972_C;
         assign BU972_C = n118;
      wire BU972_CE;
         assign BU972_CE = 1'b1;
      wire BU972_Q;
         assign n2025 = BU972_Q;
      FDE       BU972(
         .D(BU972_D),
         .C(BU972_C),
         .CE(BU972_CE),
         .Q(BU972_Q)
      );

      defparam BU976.INIT = 'hc0c0;
      wire BU976_I0;
         assign BU976_I0 = 1'b0;
      wire BU976_I1;
         assign BU976_I1 = n1987;
      wire BU976_I2;
         assign BU976_I2 = n2022;
      wire BU976_I3;
         assign BU976_I3 = 1'b0;
      wire BU976_O;
         assign n2304 = BU976_O;
      LUT4       BU976(
         .I0(BU976_I0),
         .I1(BU976_I1),
         .I2(BU976_I2),
         .I3(BU976_I3),
         .O(BU976_O)
      );

      wire BU977_D;
         assign BU977_D = n2304;
      wire BU977_C;
         assign BU977_C = n118;
      wire BU977_CE;
         assign BU977_CE = 1'b1;
      wire BU977_Q;
         assign n2021 = BU977_Q;
      FDE       BU977(
         .D(BU977_D),
         .C(BU977_C),
         .CE(BU977_CE),
         .Q(BU977_Q)
      );

      wire [9 : 0] BU979_A;
         assign BU979_A[0] = n2008;
         assign BU979_A[1] = n2009;
         assign BU979_A[2] = n2010;
         assign BU979_A[3] = n2011;
         assign BU979_A[4] = n2012;
         assign BU979_A[5] = n2013;
         assign BU979_A[6] = n2014;
         assign BU979_A[7] = n2015;
         assign BU979_A[8] = n2016;
         assign BU979_A[9] = n2017;
      wire BU979_CLK;
         assign BU979_CLK = n118;
      wire BU979_ACLR;
         assign BU979_ACLR = 1'b0;
      wire BU979_QA_GE_B;
         assign n2023 = BU979_QA_GE_B;
      C_COMPARE_V7_0 #(
         "0"    /* c_ainit_val*/,
         1    /* c_b_constant*/,
         "1111111001"    /* c_b_value*/,
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
         10    /* c_width*/
      )
      BU979(
         .A(BU979_A),
         .CLK(BU979_CLK),
         .ACLR(BU979_ACLR),
         .QA_GE_B(BU979_QA_GE_B)
      );

      wire [9 : 0] BU1015_A;
         assign BU1015_A[0] = n2008;
         assign BU1015_A[1] = n2009;
         assign BU1015_A[2] = n2010;
         assign BU1015_A[3] = n2011;
         assign BU1015_A[4] = n2012;
         assign BU1015_A[5] = n2013;
         assign BU1015_A[6] = n2014;
         assign BU1015_A[7] = n2015;
         assign BU1015_A[8] = n2016;
         assign BU1015_A[9] = n2017;
      wire BU1015_CLK;
         assign BU1015_CLK = n118;
      wire BU1015_ACLR;
         assign BU1015_ACLR = 1'b0;
      wire BU1015_QA_EQ_B;
         assign n2022 = BU1015_QA_EQ_B;
      C_COMPARE_V7_0 #(
         "0"    /* c_ainit_val*/,
         1    /* c_b_constant*/,
         "0000000000"    /* c_b_value*/,
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
         10    /* c_width*/
      )
      BU1015(
         .A(BU1015_A),
         .CLK(BU1015_CLK),
         .ACLR(BU1015_ACLR),
         .QA_EQ_B(BU1015_QA_EQ_B)
      );

      wire [9 : 0] BU806_addr;
         assign BU806_addr[9] = n2017;
         assign BU806_addr[8] = n2016;
         assign BU806_addr[7] = n2015;
         assign BU806_addr[6] = n2014;
         assign BU806_addr[5] = n2013;
         assign BU806_addr[4] = n2012;
         assign BU806_addr[3] = n2011;
         assign BU806_addr[2] = n2010;
         assign BU806_addr[1] = n2009;
         assign BU806_addr[0] = n2008;
      wire BU806_clk;
         assign BU806_clk = n118;
      wire [12 : 0] BU806_din;
         assign BU806_din[12] = 1'b0;
         assign BU806_din[11] = 1'b0;
         assign BU806_din[10] = 1'b0;
         assign BU806_din[9] = 1'b0;
         assign BU806_din[8] = 1'b0;
         assign BU806_din[7] = 1'b0;
         assign BU806_din[6] = 1'b0;
         assign BU806_din[5] = 1'b0;
         assign BU806_din[4] = 1'b0;
         assign BU806_din[3] = 1'b0;
         assign BU806_din[2] = 1'b0;
         assign BU806_din[1] = 1'b0;
         assign BU806_din[0] = 1'b0;
      wire [12 : 0] BU806_dout;
         assign n2038 = BU806_dout[12];
         assign n2037 = BU806_dout[11];
         assign n2036 = BU806_dout[10];
         assign n2035 = BU806_dout[9];
         assign n2034 = BU806_dout[8];
         assign n2033 = BU806_dout[7];
         assign n2032 = BU806_dout[6];
         assign n2031 = BU806_dout[5];
         assign n2030 = BU806_dout[4];
         assign n2029 = BU806_dout[3];
         assign n2028 = BU806_dout[2];
         assign n2027 = BU806_dout[1];
         assign n2026 = BU806_dout[0];
      wire BU806_en;
         assign BU806_en = 1'b0;
      wire BU806_nd;
         assign BU806_nd = 1'b0;
      wire BU806_rfd;
      wire BU806_rdy;
      wire BU806_sinit;
         assign BU806_sinit = 1'b0;
      wire BU806_we;
         assign BU806_we = 1'b0;
      BLKMEMSP_V6_0 #(
         10    /* c_addr_width*/,
         "0000000000000000000"    /* c_default_data*/,
         1024    /* c_depth*/,
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
         "DDS_10_VII_SINCOS_TABLE_TRIG_ROM.mif"    /* c_mem_init_file*/,
         1    /* c_pipe_stages*/,
         0    /* c_reg_inputs*/,
         "0000000000000000000"    /* c_sinit_value*/,
         13    /* c_width*/,
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
      BU806(
         .ADDR(BU806_addr),
         .CLK(BU806_clk),
         .DIN(BU806_din),
         .DOUT(BU806_dout),
         .EN(BU806_en),
         .ND(BU806_nd),
         .RFD(BU806_rfd),
         .RDY(BU806_rdy),
         .SINIT(BU806_sinit),
         .WE(BU806_we)
      );

      wire [13 : 0] BU1031_A;
         assign BU1031_A[0] = 1'b0;
         assign BU1031_A[1] = 1'b0;
         assign BU1031_A[2] = 1'b0;
         assign BU1031_A[3] = 1'b0;
         assign BU1031_A[4] = 1'b0;
         assign BU1031_A[5] = 1'b0;
         assign BU1031_A[6] = 1'b0;
         assign BU1031_A[7] = 1'b0;
         assign BU1031_A[8] = 1'b0;
         assign BU1031_A[9] = 1'b0;
         assign BU1031_A[10] = 1'b0;
         assign BU1031_A[11] = 1'b0;
         assign BU1031_A[12] = 1'b0;
         assign BU1031_A[13] = 1'b0;
      wire [13 : 0] BU1031_B;
         assign BU1031_B[0] = n2026;
         assign BU1031_B[1] = n2027;
         assign BU1031_B[2] = n2028;
         assign BU1031_B[3] = n2029;
         assign BU1031_B[4] = n2030;
         assign BU1031_B[5] = n2031;
         assign BU1031_B[6] = n2032;
         assign BU1031_B[7] = n2033;
         assign BU1031_B[8] = n2034;
         assign BU1031_B[9] = n2035;
         assign BU1031_B[10] = n2036;
         assign BU1031_B[11] = n2037;
         assign BU1031_B[12] = n2038;
         assign BU1031_B[13] = n2021;
      wire BU1031_C_IN;
         assign BU1031_C_IN = n2025;
      wire BU1031_ADD;
         assign BU1031_ADD = n2024;
      wire [13 : 0] BU1031_Q;
         assign n119 = BU1031_Q[0];
         assign n120 = BU1031_Q[1];
         assign n121 = BU1031_Q[2];
         assign n122 = BU1031_Q[3];
         assign n123 = BU1031_Q[4];
         assign n124 = BU1031_Q[5];
         assign n125 = BU1031_Q[6];
         assign n126 = BU1031_Q[7];
         assign n127 = BU1031_Q[8];
         assign n128 = BU1031_Q[9];
         assign n129 = BU1031_Q[10];
         assign n130 = BU1031_Q[11];
         assign n131 = BU1031_Q[12];
         assign n132 = BU1031_Q[13];
      wire BU1031_CLK;
         assign BU1031_CLK = n118;
      wire BU1031_CE;
         assign BU1031_CE = n2053;
      C_ADDSUB_V7_0 #(
         2    /* c_add_mode*/,
         "00000000000000"    /* c_ainit_val*/,
         1    /* c_a_type*/,
         14    /* c_a_width*/,
         1    /* c_bypass_enable*/,
         0    /* c_bypass_low*/,
         0    /* c_b_constant*/,
         1    /* c_b_type*/,
         "00000000000000"    /* c_b_value*/,
         14    /* c_b_width*/,
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
         13    /* c_high_bit*/,
         1    /* c_latency*/,
         0    /* c_low_bit*/,
         14    /* c_out_width*/,
         0    /* c_pipe_stages*/,
         "00000000000000"    /* c_sinit_val*/,
         0    /* c_sync_enable*/,
         0    /* c_sync_priority*/
      )
      BU1031(
         .A(BU1031_A),
         .B(BU1031_B),
         .C_IN(BU1031_C_IN),
         .ADD(BU1031_ADD),
         .Q(BU1031_Q),
         .CLK(BU1031_CLK),
         .CE(BU1031_CE)
      );

      wire BU1116_CLK;
         assign BU1116_CLK = n118;
      wire BU1116_SDIN;
         assign BU1116_SDIN = n64;
      wire BU1116_SDOUT;
         assign n2053 = BU1116_SDOUT;
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
      BU1116(
         .CLK(BU1116_CLK),
         .SDIN(BU1116_SDIN),
         .SDOUT(BU1116_SDOUT)
      );

//synthesis translate_on

endmodule
