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
*     (c) Copyright 1995-2006 Xilinx, Inc.                                     *
*     All rights reserved.                                                     *
*******************************************************************************/

/* Behavioural components instantiated:
C_ADDSUB_V5_0
C_DA_FIR_V7_0
C_MUX_BUS_V5_0
C_COUNTER_BINARY_V5_0
C_CIC_V3_0
C_REG_FD_V5_0
C_DDS_V4_1
C_SHIFT_RAM_V5_0
MULT_GEN_V5_0
C_GATE_BIT_V5_0
*/

`timescale 1ns/1ps

module myddc(
   DIN,
   ND,
   CLK,
   ADDR,
   LD_DIN,
   WE,
   SEL,
   RDY,
   RFD,
   DOUT_I,
   DOUT_Q
   ); // synthesis black_box

   input [13 : 0] DIN;
   input ND;
   input CLK;
   input [4 : 0] ADDR;
   input [31 : 0] LD_DIN;
   input WE;
   input SEL;
   output RDY;
   output RFD;
   output [29 : 0] DOUT_I;
   output [29 : 0] DOUT_Q;
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
   wire n54;
   wire n55;
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
   wire n107;
   wire n108;
   wire n109;
   wire n110;
   wire n111;
   wire n112;
   wire n113;
   wire n114;
   wire n115;
   wire n116;
   wire n117;
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
   wire n171;
   wire n172;
   wire n173;
   wire n174;
   wire n175;
   wire n176;
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
   wire n194;
   wire n195;
   wire n196;
   wire n197;
   wire n198;
   wire n199;
   wire n200;
   wire n201;
   wire n202;
   wire n203;
   wire n204;
   wire n205;
   wire n206;
   wire n207;
   wire n208;
   wire n209;
   wire n210;
   wire n211;
   wire n212;
   wire n213;
   wire n214;
   wire n215;
   wire n216;
   wire n217;
   wire n218;
   wire n219;
   wire n220;
   wire n221;
   wire n222;
   wire n223;
   wire n224;
   wire n225;
   wire n226;
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
   wire n282;
   wire n322;
   wire n369;
   wire n370;
   wire n371;
   wire n443;
   wire n444;
   wire n445;
   wire n446;
   wire n447;
   wire n448;
   wire n449;
   wire n450;
   wire n451;
   wire n452;
   wire n453;
   wire n454;
   wire n455;
   wire n456;
   wire n457;
   wire n488;
   wire n489;
   wire n490;
   wire n491;
   wire n492;
   wire n493;
   wire n494;
   wire n495;
   wire n496;
   wire n497;
   wire n498;
   wire n499;
   wire n500;
   wire n501;
   wire n502;
   wire n503;
   wire n504;
   wire n505;
   wire n506;
   wire n507;
   wire n508;
   wire n509;
   wire n510;
   wire n511;
   wire n512;
   wire n513;
   wire n514;
   wire n515;
   wire n516;
   wire n575;
   wire n605;
   wire n606;
   wire n607;
   wire n608;
   wire n609;
   wire n610;
   wire n611;
   wire n612;
   wire n613;
   wire n614;
   wire n615;
   wire n616;
   wire n617;
   wire n618;
   wire n647;
   wire n648;
   wire n649;
   wire n650;
   wire n651;
   wire n652;
   wire n653;
   wire n654;
   wire n655;
   wire n656;
   wire n657;
   wire n658;
   wire n659;
   wire n660;
   wire n661;
   wire n692;
   wire n693;
   wire n694;
   wire n695;
   wire n696;
   wire n697;
   wire n698;
   wire n699;
   wire n700;
   wire n701;
   wire n702;
   wire n703;
   wire n704;
   wire n705;
   wire n706;
   wire n707;
   wire n708;
   wire n709;
   wire n710;
   wire n711;
   wire n712;
   wire n713;
   wire n714;
   wire n715;
   wire n716;
   wire n717;
   wire n718;
   wire n719;
   wire n720;
   wire n955;
   wire n956;
   wire n957;
   wire n958;
   wire n959;
   wire n960;
   wire n961;
   wire n962;
   wire n963;
   wire n964;
   wire n965;
   wire n966;
   wire n967;
   wire n968;
   wire n1547;
   wire n1548;
   wire n1549;
   wire n1550;
   wire n1551;
   wire n1552;
   wire n1553;
   wire n1554;
   wire n1555;
   wire n1556;
   wire n1557;
   wire n1558;
   wire n1559;
   wire n1560;
   wire n1561;
   wire n1562;
   wire n1563;
   wire n1564;
   wire n1565;
   wire n1566;
   wire n1567;
   wire n1568;
   wire n1569;
   wire n1570;
   wire n1572;
   wire n1575;
   wire n1581;
   wire n1583;
   wire n2190;
   wire n2191;
   wire n2192;
   wire n2193;
   wire n2194;
   wire n2195;
   wire n2196;
   wire n2197;
   wire n2198;
   wire n2199;
   wire n2200;
   wire n2201;
   wire n2202;
   wire n2203;
   wire n2204;
   wire n2205;
   wire n2206;
   wire n2207;
   wire n2208;
   wire n2209;
   wire n2210;
   wire n2211;
   wire n2212;
   wire n2213;
   wire n2215;
   wire n2218;
   wire n2224;
   wire n2226;
   wire n2633;
   wire n2634;
   wire n2635;
   wire n2636;
   wire n2637;
   wire n2638;
   wire n2639;
   wire n2640;
   wire n2641;
   wire n2642;
   wire n2643;
   wire n2644;
   wire n2645;
   wire n2646;
   wire n2647;
   wire n2648;
   wire n2649;
   wire n2650;
   wire n2651;
   wire n2652;
   wire n2653;
   wire n2654;
   wire n2655;
   wire n2656;
   wire n2657;
   wire n2658;
   wire n2659;
   wire n2660;
   wire n2661;
   wire n2662;
   wire n2663;
   wire n2664;
   wire n2665;
   wire n2666;
   wire n2667;
   wire n2668;
   wire n2669;
   wire n2670;
   wire n2671;
   wire n2672;
   wire n2673;
   wire n2674;
   wire n2675;
   wire n2676;
   wire n2677;
   wire n2678;
   wire n2679;
   wire n2680;
   wire n2681;
   wire n2682;
   wire n2683;
   wire n2684;
   wire n2685;
   wire n2686;
   wire n2687;
   wire n2688;
   wire n2689;
   wire n2690;
   wire n2691;
   wire n2692;
   wire n2693;
   wire n2694;
   wire n2695;
   wire n2696;
   wire n2697;
   wire n2698;
   wire n2699;
   wire n2700;
   wire n2701;
   wire n2702;
   wire n2703;
   wire n2704;
   wire n2705;
   wire n2706;
   wire n2707;
   wire n2708;
   wire n2709;
   wire n2710;
   wire n2711;
   wire n2712;
   wire n2713;
   wire n2714;
   wire n2715;
   wire n2716;
   wire n2717;
   wire n2718;
   wire n2719;
   wire n2720;
   wire n2721;
   wire n2722;
   wire n2723;
   wire n2724;
   wire n2725;
   wire n2726;
   wire n2727;
   wire n2728;
   wire n2729;
   wire n2730;
   wire n2731;
   wire n2732;
   wire n2733;
   wire n2734;
   wire n2735;
   wire n2736;
   wire n2737;
   wire n2738;
   wire n2739;
   wire n2740;
   wire n2741;
   wire n2742;
   wire n2743;
   wire n2744;
   wire n2745;
   wire n2746;
   wire n2747;
   wire n2748;
   wire n2749;
   wire n2750;
   wire n2751;
   wire n2752;
   wire n2753;
   wire n2754;
   wire n2755;
   wire n2756;
   wire n2757;
   wire n2758;
   wire n2759;
   wire n2760;
   wire n2761;
   wire n2762;
   wire n2763;
   wire n2764;
   wire n2765;
   wire n2766;
   wire n2767;
   wire n2768;
   wire n2769;
   wire n2770;
   wire n2771;
   wire n2772;
   wire n2773;
   wire n2774;
   wire n2775;
   wire n2776;
   wire n2777;
   wire n2778;
   wire n2779;
   wire n2780;
   wire n2781;
   wire n2782;
   wire n2783;
   wire n2784;
   wire n2785;
   wire n2786;
   wire n2787;
   wire n2788;
   wire n2789;
   wire n2790;
   wire n2791;
   wire n2792;
   wire n2793;
   wire n2794;
   wire n2795;
   wire n2796;
   wire n2797;
   wire n2798;
   wire n2799;
   wire n2800;
   wire n2801;
   wire n3042;
   wire n3043;
   wire n3044;
   wire n3045;
   wire n3046;
   wire n3047;
   wire n3048;
   wire n3049;
   wire n3050;
   wire n3051;
   wire n3052;
   wire n3053;
   wire n3054;
   wire n3055;
   wire n3056;
   wire n3057;
   wire n3058;
   wire n3059;
   wire n3060;
   wire n3061;
   wire n3062;
   wire n3063;
   wire n3064;
   wire n3065;
   wire n3067;
   wire n3070;
   wire n3094;
   wire n3096;
   wire n3559;
   wire n3560;
   wire n3561;
   wire n3562;
   wire n3563;
   wire n3564;
   wire n3565;
   wire n3566;
   wire n3567;
   wire n3568;
   wire n3569;
   wire n3570;
   wire n3571;
   wire n3572;
   wire n3573;
   wire n3574;
   wire n3575;
   wire n3576;
   wire n3577;
   wire n3578;
   wire n3579;
   wire n3580;
   wire n3581;
   wire n3582;
   wire n3584;
   wire n3587;
   wire n3611;
   wire n3613;
   wire n4473;
   wire n6719;
   wire n6720;
   wire n6721;
   wire n6722;
   wire n6723;
   wire n6724;
   wire n6725;
   wire n6726;
   wire n6727;
   wire n6728;
   wire n6729;
   wire n6730;
   wire n6731;
   wire n6732;
   wire n6733;
   wire n6734;
   wire n6735;
   wire n6736;
   wire n6737;
   wire n6738;
   wire n6739;
   wire n6740;
   wire n6741;
   wire n6742;
   wire n6743;
   wire n6744;
   wire n6745;
   wire n6746;
   wire n6747;
   wire n6748;
   wire n6749;
   wire n6750;
   wire n6751;
   wire n6752;
   wire n6753;
   wire n6754;
   wire n6755;
   wire n6756;
   wire n6757;
   wire n6758;
   wire n6759;
   wire n6760;
   wire n6761;
   wire n6762;
   wire n6763;
   wire n6764;
   wire n6765;
   wire n6766;
   wire n6767;
   wire n6768;
   wire n6769;
   wire n6770;
   wire n6771;
   wire n6772;
   wire n6773;
   wire n6774;
   wire n6775;
   wire n6776;
   wire n6777;
   wire n6778;
   wire n6779;
   wire n6780;
   wire n6781;
   wire n6782;
   wire n6783;
   wire n6784;
   wire n6785;
   wire n6786;
   wire n6787;
   wire n6788;
   wire n6789;
   wire n6790;
   wire n6791;
   wire n6857;
   wire n6858;
   wire n6859;
   wire n6860;
   wire n6861;
   wire n6862;
   wire n6863;
   wire n7206;
   wire n7333;
   wire n7334;
   wire n7335;
   wire n7336;
   wire n7337;
   wire n7338;
   wire n7339;
   wire n7340;
   wire n7341;
   wire n7342;
   wire n7343;
   wire n7344;
   wire n7345;
   wire n7346;
   wire n7347;
   wire n7348;
   wire n7349;
   wire n7350;
   wire n7351;
   wire n7352;
   wire n7353;
   wire n7354;
   wire n7355;
   wire n7356;
   wire n7357;
   wire n7358;
   wire n7359;
   wire n7360;
   wire n7361;
   wire n7362;
   wire n7364;
   wire n7367;
   wire n7381;
   wire n7383;
   wire n8099;
   wire n8100;
   wire n8101;
   wire n8102;
   wire n8103;
   wire n8104;
   wire n8105;
   wire n8106;
   wire n8107;
   wire n8108;
   wire n8109;
   wire n8110;
   wire n8111;
   wire n8112;
   wire n8113;
   wire n8114;
   wire n8115;
   wire n8116;
   wire n8117;
   wire n8118;
   wire n8119;
   wire n8120;
   wire n8121;
   wire n8122;
   wire n8123;
   wire n8124;
   wire n8125;
   wire n8126;
   wire n8127;
   wire n8128;
   wire n8130;
   wire n8133;
   wire n8153;
   wire n8155;
   wire n8701;
   wire n8702;
   wire n8703;
   wire n8704;
   wire n8705;
   wire n8706;
   wire n8707;
   wire n8708;
   wire n8709;
   wire n8710;
   wire n8711;
   wire n8712;
   wire n8713;
   wire n8714;
   wire n8715;
   wire n8716;
   wire n8717;
   wire n8718;
   wire n8719;
   wire n8720;
   wire n8721;
   wire n8722;
   wire n8723;
   wire n8724;
   wire n8725;
   wire n8726;
   wire n8727;
   wire n8728;
   wire n8729;
   wire n8730;
   wire n8732;
   wire n8735;
   wire n8755;
   wire n8757;
   assign n166 = DIN[0];
   assign n167 = DIN[1];
   assign n168 = DIN[2];
   assign n169 = DIN[3];
   assign n170 = DIN[4];
   assign n171 = DIN[5];
   assign n172 = DIN[6];
   assign n173 = DIN[7];
   assign n174 = DIN[8];
   assign n175 = DIN[9];
   assign n176 = DIN[10];
   assign n177 = DIN[11];
   assign n178 = DIN[12];
   assign n179 = DIN[13];
   assign n180 = ND;
   assign n183 = CLK;
   assign n184 = ADDR[0];
   assign n185 = ADDR[1];
   assign n186 = ADDR[2];
   assign n187 = ADDR[3];
   assign n188 = ADDR[4];
   assign n189 = LD_DIN[0];
   assign n190 = LD_DIN[1];
   assign n191 = LD_DIN[2];
   assign n192 = LD_DIN[3];
   assign n193 = LD_DIN[4];
   assign n194 = LD_DIN[5];
   assign n195 = LD_DIN[6];
   assign n196 = LD_DIN[7];
   assign n197 = LD_DIN[8];
   assign n198 = LD_DIN[9];
   assign n199 = LD_DIN[10];
   assign n200 = LD_DIN[11];
   assign n201 = LD_DIN[12];
   assign n202 = LD_DIN[13];
   assign n203 = LD_DIN[14];
   assign n204 = LD_DIN[15];
   assign n205 = LD_DIN[16];
   assign n206 = LD_DIN[17];
   assign n207 = LD_DIN[18];
   assign n208 = LD_DIN[19];
   assign n209 = LD_DIN[20];
   assign n210 = LD_DIN[21];
   assign n211 = LD_DIN[22];
   assign n212 = LD_DIN[23];
   assign n213 = LD_DIN[24];
   assign n214 = LD_DIN[25];
   assign n215 = LD_DIN[26];
   assign n216 = LD_DIN[27];
   assign n217 = LD_DIN[28];
   assign n218 = LD_DIN[29];
   assign n219 = LD_DIN[30];
   assign n220 = LD_DIN[31];
   assign n221 = WE;
   assign n222 = SEL;
   assign RDY = n181;
   assign RFD = n182;
   assign DOUT_I[0] = n223;
   assign DOUT_I[1] = n224;
   assign DOUT_I[2] = n225;
   assign DOUT_I[3] = n226;
   assign DOUT_I[4] = n227;
   assign DOUT_I[5] = n228;
   assign DOUT_I[6] = n229;
   assign DOUT_I[7] = n230;
   assign DOUT_I[8] = n231;
   assign DOUT_I[9] = n232;
   assign DOUT_I[10] = n233;
   assign DOUT_I[11] = n234;
   assign DOUT_I[12] = n235;
   assign DOUT_I[13] = n236;
   assign DOUT_I[14] = n237;
   assign DOUT_I[15] = n238;
   assign DOUT_I[16] = n239;
   assign DOUT_I[17] = n240;
   assign DOUT_I[18] = n241;
   assign DOUT_I[19] = n242;
   assign DOUT_I[20] = n243;
   assign DOUT_I[21] = n244;
   assign DOUT_I[22] = n245;
   assign DOUT_I[23] = n246;
   assign DOUT_I[24] = n247;
   assign DOUT_I[25] = n248;
   assign DOUT_I[26] = n249;
   assign DOUT_I[27] = n250;
   assign DOUT_I[28] = n251;
   assign DOUT_I[29] = n252;
   assign DOUT_Q[0] = n253;
   assign DOUT_Q[1] = n254;
   assign DOUT_Q[2] = n255;
   assign DOUT_Q[3] = n256;
   assign DOUT_Q[4] = n257;
   assign DOUT_Q[5] = n258;
   assign DOUT_Q[6] = n259;
   assign DOUT_Q[7] = n260;
   assign DOUT_Q[8] = n261;
   assign DOUT_Q[9] = n262;
   assign DOUT_Q[10] = n263;
   assign DOUT_Q[11] = n264;
   assign DOUT_Q[12] = n265;
   assign DOUT_Q[13] = n266;
   assign DOUT_Q[14] = n267;
   assign DOUT_Q[15] = n268;
   assign DOUT_Q[16] = n269;
   assign DOUT_Q[17] = n270;
   assign DOUT_Q[18] = n271;
   assign DOUT_Q[19] = n272;
   assign DOUT_Q[20] = n273;
   assign DOUT_Q[21] = n274;
   assign DOUT_Q[22] = n275;
   assign DOUT_Q[23] = n276;
   assign DOUT_Q[24] = n277;
   assign DOUT_Q[25] = n278;
   assign DOUT_Q[26] = n279;
   assign DOUT_Q[27] = n280;
   assign DOUT_Q[28] = n281;
   assign DOUT_Q[29] = n282;

      defparam BU4.INIT = 'h1000;
      wire BU4_I0;
         assign BU4_I0 = n188;
      wire BU4_I1;
         assign BU4_I1 = n187;
      wire BU4_I2;
         assign BU4_I2 = n186;
      wire BU4_I3;
         assign BU4_I3 = n222;
      wire BU4_O;
         assign n54 = BU4_O;
      LUT4       BU4(
         .I0(BU4_I0),
         .I1(BU4_I1),
         .I2(BU4_I2),
         .I3(BU4_I3),
         .O(BU4_O)
      );

      defparam BU8.INIT = 'h0080;
      wire BU8_I0;
         assign BU8_I0 = n54;
      wire BU8_I1;
         assign BU8_I1 = n221;
      wire BU8_I2;
         assign BU8_I2 = n185;
      wire BU8_I3;
         assign BU8_I3 = n184;
      wire BU8_O;
         assign n322 = BU8_O;
      LUT4       BU8(
         .I0(BU8_I0),
         .I1(BU8_I1),
         .I2(BU8_I2),
         .I3(BU8_I3),
         .O(BU8_O)
      );

      defparam BU10.INIT = 'haaaa;
      wire BU10_I0;
         assign BU10_I0 = 1'b1;
      wire BU10_I1;
         assign BU10_I1 = 1'b0;
      wire BU10_I2;
         assign BU10_I2 = 1'b0;
      wire BU10_I3;
         assign BU10_I3 = 1'b0;
      wire BU10_O;
         assign n182 = BU10_O;
      LUT4       BU10(
         .I0(BU10_I0),
         .I1(BU10_I1),
         .I2(BU10_I2),
         .I3(BU10_I3),
         .O(BU10_O)
      );

      wire BU1292_D;
         assign BU1292_D = n180;
      wire BU1292_C;
         assign BU1292_C = n183;
      wire BU1292_CE;
         assign BU1292_CE = 1'b1;
      wire BU1292_Q;
         assign n371 = BU1292_Q;
      FDE       BU1292(
         .D(BU1292_D),
         .C(BU1292_C),
         .CE(BU1292_CE),
         .Q(BU1292_Q)
      );

      defparam BU14.INIT = 'h0000;
      wire BU14_D;
         assign BU14_D = n166;
      wire BU14_CE;
         assign BU14_CE = n180;
      wire BU14_CLK;
         assign BU14_CLK = n183;
      wire BU14_A0;
         assign BU14_A0 = 1'b0;
      wire BU14_A1;
         assign BU14_A1 = 1'b1;
      wire BU14_A2;
         assign BU14_A2 = 1'b0;
      wire BU14_A3;
         assign BU14_A3 = 1'b0;
      wire BU14_Q;
         assign n955 = BU14_Q;
      SRL16E       BU14(
         .D(BU14_D),
         .CE(BU14_CE),
         .CLK(BU14_CLK),
         .A0(BU14_A0),
         .A1(BU14_A1),
         .A2(BU14_A2),
         .A3(BU14_A3),
         .Q(BU14_Q)
      );

      wire BU16_D;
         assign BU16_D = n955;
      wire BU16_C;
         assign BU16_C = n183;
      wire BU16_CE;
         assign BU16_CE = n180;
      wire BU16_Q;
         assign n618 = BU16_Q;
      FDE       BU16(
         .D(BU16_D),
         .C(BU16_C),
         .CE(BU16_CE),
         .Q(BU16_Q)
      );

      defparam BU17.INIT = 'h0000;
      wire BU17_D;
         assign BU17_D = n167;
      wire BU17_CE;
         assign BU17_CE = n180;
      wire BU17_CLK;
         assign BU17_CLK = n183;
      wire BU17_A0;
         assign BU17_A0 = 1'b0;
      wire BU17_A1;
         assign BU17_A1 = 1'b1;
      wire BU17_A2;
         assign BU17_A2 = 1'b0;
      wire BU17_A3;
         assign BU17_A3 = 1'b0;
      wire BU17_Q;
         assign n956 = BU17_Q;
      SRL16E       BU17(
         .D(BU17_D),
         .CE(BU17_CE),
         .CLK(BU17_CLK),
         .A0(BU17_A0),
         .A1(BU17_A1),
         .A2(BU17_A2),
         .A3(BU17_A3),
         .Q(BU17_Q)
      );

      wire BU19_D;
         assign BU19_D = n956;
      wire BU19_C;
         assign BU19_C = n183;
      wire BU19_CE;
         assign BU19_CE = n180;
      wire BU19_Q;
         assign n617 = BU19_Q;
      FDE       BU19(
         .D(BU19_D),
         .C(BU19_C),
         .CE(BU19_CE),
         .Q(BU19_Q)
      );

      defparam BU20.INIT = 'h0000;
      wire BU20_D;
         assign BU20_D = n168;
      wire BU20_CE;
         assign BU20_CE = n180;
      wire BU20_CLK;
         assign BU20_CLK = n183;
      wire BU20_A0;
         assign BU20_A0 = 1'b0;
      wire BU20_A1;
         assign BU20_A1 = 1'b1;
      wire BU20_A2;
         assign BU20_A2 = 1'b0;
      wire BU20_A3;
         assign BU20_A3 = 1'b0;
      wire BU20_Q;
         assign n957 = BU20_Q;
      SRL16E       BU20(
         .D(BU20_D),
         .CE(BU20_CE),
         .CLK(BU20_CLK),
         .A0(BU20_A0),
         .A1(BU20_A1),
         .A2(BU20_A2),
         .A3(BU20_A3),
         .Q(BU20_Q)
      );

      wire BU22_D;
         assign BU22_D = n957;
      wire BU22_C;
         assign BU22_C = n183;
      wire BU22_CE;
         assign BU22_CE = n180;
      wire BU22_Q;
         assign n616 = BU22_Q;
      FDE       BU22(
         .D(BU22_D),
         .C(BU22_C),
         .CE(BU22_CE),
         .Q(BU22_Q)
      );

      defparam BU23.INIT = 'h0000;
      wire BU23_D;
         assign BU23_D = n169;
      wire BU23_CE;
         assign BU23_CE = n180;
      wire BU23_CLK;
         assign BU23_CLK = n183;
      wire BU23_A0;
         assign BU23_A0 = 1'b0;
      wire BU23_A1;
         assign BU23_A1 = 1'b1;
      wire BU23_A2;
         assign BU23_A2 = 1'b0;
      wire BU23_A3;
         assign BU23_A3 = 1'b0;
      wire BU23_Q;
         assign n958 = BU23_Q;
      SRL16E       BU23(
         .D(BU23_D),
         .CE(BU23_CE),
         .CLK(BU23_CLK),
         .A0(BU23_A0),
         .A1(BU23_A1),
         .A2(BU23_A2),
         .A3(BU23_A3),
         .Q(BU23_Q)
      );

      wire BU25_D;
         assign BU25_D = n958;
      wire BU25_C;
         assign BU25_C = n183;
      wire BU25_CE;
         assign BU25_CE = n180;
      wire BU25_Q;
         assign n615 = BU25_Q;
      FDE       BU25(
         .D(BU25_D),
         .C(BU25_C),
         .CE(BU25_CE),
         .Q(BU25_Q)
      );

      defparam BU26.INIT = 'h0000;
      wire BU26_D;
         assign BU26_D = n170;
      wire BU26_CE;
         assign BU26_CE = n180;
      wire BU26_CLK;
         assign BU26_CLK = n183;
      wire BU26_A0;
         assign BU26_A0 = 1'b0;
      wire BU26_A1;
         assign BU26_A1 = 1'b1;
      wire BU26_A2;
         assign BU26_A2 = 1'b0;
      wire BU26_A3;
         assign BU26_A3 = 1'b0;
      wire BU26_Q;
         assign n959 = BU26_Q;
      SRL16E       BU26(
         .D(BU26_D),
         .CE(BU26_CE),
         .CLK(BU26_CLK),
         .A0(BU26_A0),
         .A1(BU26_A1),
         .A2(BU26_A2),
         .A3(BU26_A3),
         .Q(BU26_Q)
      );

      wire BU28_D;
         assign BU28_D = n959;
      wire BU28_C;
         assign BU28_C = n183;
      wire BU28_CE;
         assign BU28_CE = n180;
      wire BU28_Q;
         assign n614 = BU28_Q;
      FDE       BU28(
         .D(BU28_D),
         .C(BU28_C),
         .CE(BU28_CE),
         .Q(BU28_Q)
      );

      defparam BU29.INIT = 'h0000;
      wire BU29_D;
         assign BU29_D = n171;
      wire BU29_CE;
         assign BU29_CE = n180;
      wire BU29_CLK;
         assign BU29_CLK = n183;
      wire BU29_A0;
         assign BU29_A0 = 1'b0;
      wire BU29_A1;
         assign BU29_A1 = 1'b1;
      wire BU29_A2;
         assign BU29_A2 = 1'b0;
      wire BU29_A3;
         assign BU29_A3 = 1'b0;
      wire BU29_Q;
         assign n960 = BU29_Q;
      SRL16E       BU29(
         .D(BU29_D),
         .CE(BU29_CE),
         .CLK(BU29_CLK),
         .A0(BU29_A0),
         .A1(BU29_A1),
         .A2(BU29_A2),
         .A3(BU29_A3),
         .Q(BU29_Q)
      );

      wire BU31_D;
         assign BU31_D = n960;
      wire BU31_C;
         assign BU31_C = n183;
      wire BU31_CE;
         assign BU31_CE = n180;
      wire BU31_Q;
         assign n613 = BU31_Q;
      FDE       BU31(
         .D(BU31_D),
         .C(BU31_C),
         .CE(BU31_CE),
         .Q(BU31_Q)
      );

      defparam BU32.INIT = 'h0000;
      wire BU32_D;
         assign BU32_D = n172;
      wire BU32_CE;
         assign BU32_CE = n180;
      wire BU32_CLK;
         assign BU32_CLK = n183;
      wire BU32_A0;
         assign BU32_A0 = 1'b0;
      wire BU32_A1;
         assign BU32_A1 = 1'b1;
      wire BU32_A2;
         assign BU32_A2 = 1'b0;
      wire BU32_A3;
         assign BU32_A3 = 1'b0;
      wire BU32_Q;
         assign n961 = BU32_Q;
      SRL16E       BU32(
         .D(BU32_D),
         .CE(BU32_CE),
         .CLK(BU32_CLK),
         .A0(BU32_A0),
         .A1(BU32_A1),
         .A2(BU32_A2),
         .A3(BU32_A3),
         .Q(BU32_Q)
      );

      wire BU34_D;
         assign BU34_D = n961;
      wire BU34_C;
         assign BU34_C = n183;
      wire BU34_CE;
         assign BU34_CE = n180;
      wire BU34_Q;
         assign n612 = BU34_Q;
      FDE       BU34(
         .D(BU34_D),
         .C(BU34_C),
         .CE(BU34_CE),
         .Q(BU34_Q)
      );

      defparam BU35.INIT = 'h0000;
      wire BU35_D;
         assign BU35_D = n173;
      wire BU35_CE;
         assign BU35_CE = n180;
      wire BU35_CLK;
         assign BU35_CLK = n183;
      wire BU35_A0;
         assign BU35_A0 = 1'b0;
      wire BU35_A1;
         assign BU35_A1 = 1'b1;
      wire BU35_A2;
         assign BU35_A2 = 1'b0;
      wire BU35_A3;
         assign BU35_A3 = 1'b0;
      wire BU35_Q;
         assign n962 = BU35_Q;
      SRL16E       BU35(
         .D(BU35_D),
         .CE(BU35_CE),
         .CLK(BU35_CLK),
         .A0(BU35_A0),
         .A1(BU35_A1),
         .A2(BU35_A2),
         .A3(BU35_A3),
         .Q(BU35_Q)
      );

      wire BU37_D;
         assign BU37_D = n962;
      wire BU37_C;
         assign BU37_C = n183;
      wire BU37_CE;
         assign BU37_CE = n180;
      wire BU37_Q;
         assign n611 = BU37_Q;
      FDE       BU37(
         .D(BU37_D),
         .C(BU37_C),
         .CE(BU37_CE),
         .Q(BU37_Q)
      );

      defparam BU38.INIT = 'h0000;
      wire BU38_D;
         assign BU38_D = n174;
      wire BU38_CE;
         assign BU38_CE = n180;
      wire BU38_CLK;
         assign BU38_CLK = n183;
      wire BU38_A0;
         assign BU38_A0 = 1'b0;
      wire BU38_A1;
         assign BU38_A1 = 1'b1;
      wire BU38_A2;
         assign BU38_A2 = 1'b0;
      wire BU38_A3;
         assign BU38_A3 = 1'b0;
      wire BU38_Q;
         assign n963 = BU38_Q;
      SRL16E       BU38(
         .D(BU38_D),
         .CE(BU38_CE),
         .CLK(BU38_CLK),
         .A0(BU38_A0),
         .A1(BU38_A1),
         .A2(BU38_A2),
         .A3(BU38_A3),
         .Q(BU38_Q)
      );

      wire BU40_D;
         assign BU40_D = n963;
      wire BU40_C;
         assign BU40_C = n183;
      wire BU40_CE;
         assign BU40_CE = n180;
      wire BU40_Q;
         assign n610 = BU40_Q;
      FDE       BU40(
         .D(BU40_D),
         .C(BU40_C),
         .CE(BU40_CE),
         .Q(BU40_Q)
      );

      defparam BU41.INIT = 'h0000;
      wire BU41_D;
         assign BU41_D = n175;
      wire BU41_CE;
         assign BU41_CE = n180;
      wire BU41_CLK;
         assign BU41_CLK = n183;
      wire BU41_A0;
         assign BU41_A0 = 1'b0;
      wire BU41_A1;
         assign BU41_A1 = 1'b1;
      wire BU41_A2;
         assign BU41_A2 = 1'b0;
      wire BU41_A3;
         assign BU41_A3 = 1'b0;
      wire BU41_Q;
         assign n964 = BU41_Q;
      SRL16E       BU41(
         .D(BU41_D),
         .CE(BU41_CE),
         .CLK(BU41_CLK),
         .A0(BU41_A0),
         .A1(BU41_A1),
         .A2(BU41_A2),
         .A3(BU41_A3),
         .Q(BU41_Q)
      );

      wire BU43_D;
         assign BU43_D = n964;
      wire BU43_C;
         assign BU43_C = n183;
      wire BU43_CE;
         assign BU43_CE = n180;
      wire BU43_Q;
         assign n609 = BU43_Q;
      FDE       BU43(
         .D(BU43_D),
         .C(BU43_C),
         .CE(BU43_CE),
         .Q(BU43_Q)
      );

      defparam BU44.INIT = 'h0000;
      wire BU44_D;
         assign BU44_D = n176;
      wire BU44_CE;
         assign BU44_CE = n180;
      wire BU44_CLK;
         assign BU44_CLK = n183;
      wire BU44_A0;
         assign BU44_A0 = 1'b0;
      wire BU44_A1;
         assign BU44_A1 = 1'b1;
      wire BU44_A2;
         assign BU44_A2 = 1'b0;
      wire BU44_A3;
         assign BU44_A3 = 1'b0;
      wire BU44_Q;
         assign n965 = BU44_Q;
      SRL16E       BU44(
         .D(BU44_D),
         .CE(BU44_CE),
         .CLK(BU44_CLK),
         .A0(BU44_A0),
         .A1(BU44_A1),
         .A2(BU44_A2),
         .A3(BU44_A3),
         .Q(BU44_Q)
      );

      wire BU46_D;
         assign BU46_D = n965;
      wire BU46_C;
         assign BU46_C = n183;
      wire BU46_CE;
         assign BU46_CE = n180;
      wire BU46_Q;
         assign n608 = BU46_Q;
      FDE       BU46(
         .D(BU46_D),
         .C(BU46_C),
         .CE(BU46_CE),
         .Q(BU46_Q)
      );

      defparam BU47.INIT = 'h0000;
      wire BU47_D;
         assign BU47_D = n177;
      wire BU47_CE;
         assign BU47_CE = n180;
      wire BU47_CLK;
         assign BU47_CLK = n183;
      wire BU47_A0;
         assign BU47_A0 = 1'b0;
      wire BU47_A1;
         assign BU47_A1 = 1'b1;
      wire BU47_A2;
         assign BU47_A2 = 1'b0;
      wire BU47_A3;
         assign BU47_A3 = 1'b0;
      wire BU47_Q;
         assign n966 = BU47_Q;
      SRL16E       BU47(
         .D(BU47_D),
         .CE(BU47_CE),
         .CLK(BU47_CLK),
         .A0(BU47_A0),
         .A1(BU47_A1),
         .A2(BU47_A2),
         .A3(BU47_A3),
         .Q(BU47_Q)
      );

      wire BU49_D;
         assign BU49_D = n966;
      wire BU49_C;
         assign BU49_C = n183;
      wire BU49_CE;
         assign BU49_CE = n180;
      wire BU49_Q;
         assign n607 = BU49_Q;
      FDE       BU49(
         .D(BU49_D),
         .C(BU49_C),
         .CE(BU49_CE),
         .Q(BU49_Q)
      );

      defparam BU50.INIT = 'h0000;
      wire BU50_D;
         assign BU50_D = n178;
      wire BU50_CE;
         assign BU50_CE = n180;
      wire BU50_CLK;
         assign BU50_CLK = n183;
      wire BU50_A0;
         assign BU50_A0 = 1'b0;
      wire BU50_A1;
         assign BU50_A1 = 1'b1;
      wire BU50_A2;
         assign BU50_A2 = 1'b0;
      wire BU50_A3;
         assign BU50_A3 = 1'b0;
      wire BU50_Q;
         assign n967 = BU50_Q;
      SRL16E       BU50(
         .D(BU50_D),
         .CE(BU50_CE),
         .CLK(BU50_CLK),
         .A0(BU50_A0),
         .A1(BU50_A1),
         .A2(BU50_A2),
         .A3(BU50_A3),
         .Q(BU50_Q)
      );

      wire BU52_D;
         assign BU52_D = n967;
      wire BU52_C;
         assign BU52_C = n183;
      wire BU52_CE;
         assign BU52_CE = n180;
      wire BU52_Q;
         assign n606 = BU52_Q;
      FDE       BU52(
         .D(BU52_D),
         .C(BU52_C),
         .CE(BU52_CE),
         .Q(BU52_Q)
      );

      defparam BU53.INIT = 'h0000;
      wire BU53_D;
         assign BU53_D = n179;
      wire BU53_CE;
         assign BU53_CE = n180;
      wire BU53_CLK;
         assign BU53_CLK = n183;
      wire BU53_A0;
         assign BU53_A0 = 1'b0;
      wire BU53_A1;
         assign BU53_A1 = 1'b1;
      wire BU53_A2;
         assign BU53_A2 = 1'b0;
      wire BU53_A3;
         assign BU53_A3 = 1'b0;
      wire BU53_Q;
         assign n968 = BU53_Q;
      SRL16E       BU53(
         .D(BU53_D),
         .CE(BU53_CE),
         .CLK(BU53_CLK),
         .A0(BU53_A0),
         .A1(BU53_A1),
         .A2(BU53_A2),
         .A3(BU53_A3),
         .Q(BU53_Q)
      );

      wire BU55_D;
         assign BU55_D = n968;
      wire BU55_C;
         assign BU55_C = n183;
      wire BU55_CE;
         assign BU55_CE = n180;
      wire BU55_Q;
         assign n605 = BU55_Q;
      FDE       BU55(
         .D(BU55_D),
         .C(BU55_C),
         .CE(BU55_CE),
         .Q(BU55_Q)
      );

      wire [31 : 0] BU57_DATA;
         assign BU57_DATA[0] = n189;
         assign BU57_DATA[1] = n190;
         assign BU57_DATA[2] = n191;
         assign BU57_DATA[3] = n192;
         assign BU57_DATA[4] = n193;
         assign BU57_DATA[5] = n194;
         assign BU57_DATA[6] = n195;
         assign BU57_DATA[7] = n196;
         assign BU57_DATA[8] = n197;
         assign BU57_DATA[9] = n198;
         assign BU57_DATA[10] = n199;
         assign BU57_DATA[11] = n200;
         assign BU57_DATA[12] = n201;
         assign BU57_DATA[13] = n202;
         assign BU57_DATA[14] = n203;
         assign BU57_DATA[15] = n204;
         assign BU57_DATA[16] = n205;
         assign BU57_DATA[17] = n206;
         assign BU57_DATA[18] = n207;
         assign BU57_DATA[19] = n208;
         assign BU57_DATA[20] = n209;
         assign BU57_DATA[21] = n210;
         assign BU57_DATA[22] = n211;
         assign BU57_DATA[23] = n212;
         assign BU57_DATA[24] = n213;
         assign BU57_DATA[25] = n214;
         assign BU57_DATA[26] = n215;
         assign BU57_DATA[27] = n216;
         assign BU57_DATA[28] = n217;
         assign BU57_DATA[29] = n218;
         assign BU57_DATA[30] = n219;
         assign BU57_DATA[31] = n220;
      wire BU57_WE;
         assign BU57_WE = n322;
      wire BU57_CLK;
         assign BU57_CLK = n183;
      wire BU57_CE;
         assign BU57_CE = n180;
      wire BU57_RDY;
         assign n370 = BU57_RDY;
      wire [14 : 0] BU57_SINE;
         assign n457 = BU57_SINE[0];
         assign n456 = BU57_SINE[1];
         assign n455 = BU57_SINE[2];
         assign n454 = BU57_SINE[3];
         assign n453 = BU57_SINE[4];
         assign n452 = BU57_SINE[5];
         assign n451 = BU57_SINE[6];
         assign n450 = BU57_SINE[7];
         assign n449 = BU57_SINE[8];
         assign n448 = BU57_SINE[9];
         assign n447 = BU57_SINE[10];
         assign n446 = BU57_SINE[11];
         assign n445 = BU57_SINE[12];
         assign n444 = BU57_SINE[13];
         assign n443 = BU57_SINE[14];
      wire [14 : 0] BU57_COSINE;
         assign n661 = BU57_COSINE[0];
         assign n660 = BU57_COSINE[1];
         assign n659 = BU57_COSINE[2];
         assign n658 = BU57_COSINE[3];
         assign n657 = BU57_COSINE[4];
         assign n656 = BU57_COSINE[5];
         assign n655 = BU57_COSINE[6];
         assign n654 = BU57_COSINE[7];
         assign n653 = BU57_COSINE[8];
         assign n652 = BU57_COSINE[9];
         assign n651 = BU57_COSINE[10];
         assign n650 = BU57_COSINE[11];
         assign n649 = BU57_COSINE[12];
         assign n648 = BU57_COSINE[13];
         assign n647 = BU57_COSINE[14];
      C_DDS_V4_1 #(
         1    /* c_accumulator_latency*/,
         32    /* c_accumulator_width*/,
         32    /* c_data_width*/,
         0    /* c_enable_rlocs*/,
         0    /* c_has_aclr*/,
         1    /* c_has_ce*/,
         1    /* c_has_rdy*/,
         0    /* c_has_rfd*/,
         0    /* c_has_sclr*/,
         4    /* c_latency*/,
         1    /* c_mem_type*/,
         0    /* c_negative_cosine*/,
         0    /* c_negative_sine*/,
         1    /* c_noise_shaping*/,
         2    /* c_outputs_required*/,
         15    /* c_output_width*/,
         13    /* c_phase_angle_width*/,
         1    /* c_phase_increment*/,
         "01001100110011001100110011001101"    /* c_phase_increment_value*/,
         0    /* c_phase_offset*/,
         "00000000000000000000000000000000"    /* c_phase_offset_value*/,
         1    /* c_pipelined*/
      )
      BU57(
         .DATA(BU57_DATA),
         .WE(BU57_WE),
         .CLK(BU57_CLK),
         .CE(BU57_CE),
         .RDY(BU57_RDY),
         .SINE(BU57_SINE),
         .COSINE(BU57_COSINE)
      );

      defparam BU1294.INIT = 'h8888;
      wire BU1294_I0;
         assign BU1294_I0 = n370;
      wire BU1294_I1;
         assign BU1294_I1 = n371;
      wire BU1294_I2;
         assign BU1294_I2 = 1'b0;
      wire BU1294_I3;
         assign BU1294_I3 = 1'b0;
      wire BU1294_O;
         assign n369 = BU1294_O;
      LUT4       BU1294(
         .I0(BU1294_I0),
         .I1(BU1294_I1),
         .I2(BU1294_I2),
         .I3(BU1294_I3),
         .O(BU1294_O)
      );

      wire BU1296_clk;
         assign BU1296_clk = n183;
      wire [13 : 0] BU1296_a;
         assign BU1296_a[13] = n605;
         assign BU1296_a[12] = n606;
         assign BU1296_a[11] = n607;
         assign BU1296_a[10] = n608;
         assign BU1296_a[9] = n609;
         assign BU1296_a[8] = n610;
         assign BU1296_a[7] = n611;
         assign BU1296_a[6] = n612;
         assign BU1296_a[5] = n613;
         assign BU1296_a[4] = n614;
         assign BU1296_a[3] = n615;
         assign BU1296_a[2] = n616;
         assign BU1296_a[1] = n617;
         assign BU1296_a[0] = n618;
      wire [14 : 0] BU1296_b;
         assign BU1296_b[14] = n443;
         assign BU1296_b[13] = n444;
         assign BU1296_b[12] = n445;
         assign BU1296_b[11] = n446;
         assign BU1296_b[10] = n447;
         assign BU1296_b[9] = n448;
         assign BU1296_b[8] = n449;
         assign BU1296_b[7] = n450;
         assign BU1296_b[6] = n451;
         assign BU1296_b[5] = n452;
         assign BU1296_b[4] = n453;
         assign BU1296_b[3] = n454;
         assign BU1296_b[2] = n455;
         assign BU1296_b[1] = n456;
         assign BU1296_b[0] = n457;
      wire [28 : 0] BU1296_o;
      wire [28 : 0] BU1296_q;
         assign n488 = BU1296_q[28];
         assign n489 = BU1296_q[27];
         assign n490 = BU1296_q[26];
         assign n491 = BU1296_q[25];
         assign n492 = BU1296_q[24];
         assign n493 = BU1296_q[23];
         assign n494 = BU1296_q[22];
         assign n495 = BU1296_q[21];
         assign n496 = BU1296_q[20];
         assign n497 = BU1296_q[19];
         assign n498 = BU1296_q[18];
         assign n499 = BU1296_q[17];
         assign n500 = BU1296_q[16];
         assign n501 = BU1296_q[15];
         assign n502 = BU1296_q[14];
         assign n503 = BU1296_q[13];
         assign n504 = BU1296_q[12];
         assign n505 = BU1296_q[11];
         assign n506 = BU1296_q[10];
         assign n507 = BU1296_q[9];
         assign n508 = BU1296_q[8];
         assign n509 = BU1296_q[7];
         assign n510 = BU1296_q[6];
         assign n511 = BU1296_q[5];
         assign n512 = BU1296_q[4];
         assign n513 = BU1296_q[3];
         assign n514 = BU1296_q[2];
         assign n515 = BU1296_q[1];
         assign n516 = BU1296_q[0];
      wire BU1296_a_signed;
         assign BU1296_a_signed = 1'b0;
      wire BU1296_loadb;
         assign BU1296_loadb = 1'b0;
      wire BU1296_load_done;
      wire BU1296_swapb;
         assign BU1296_swapb = 1'b0;
      wire BU1296_ce;
         assign BU1296_ce = 1'b1;
      wire BU1296_aclr;
         assign BU1296_aclr = 1'b0;
      wire BU1296_sclr;
         assign BU1296_sclr = 1'b0;
      wire BU1296_rfd;
      wire BU1296_nd;
         assign BU1296_nd = n369;
      wire BU1296_rdy;
         assign n575 = BU1296_rdy;
      MULT_GEN_V5_0 #(
         8    /* bram_addr_width*/,
         0    /* c_a_type*/,
         14    /* c_a_width*/,
         14    /* c_baat*/,
         0    /* c_b_constant*/,
         0    /* c_b_type*/,
         "0"    /* c_b_value*/,
         15    /* c_b_width*/,
         0    /* c_enable_rlocs*/,
         0    /* c_has_aclr*/,
         0    /* c_has_a_signed*/,
         1    /* c_has_b*/,
         0    /* c_has_ce*/,
         0    /* c_has_loadb*/,
         0    /* c_has_load_done*/,
         1    /* c_has_nd*/,
         0    /* c_has_o*/,
         1    /* c_has_q*/,
         1    /* c_has_rdy*/,
         1    /* c_has_rfd*/,
         0    /* c_has_sclr*/,
         0    /* c_has_swapb*/,
         "mem"    /* c_mem_init_prefix*/,
         0    /* c_mem_type*/,
         1    /* c_mult_type*/,
         0    /* c_output_hold*/,
         29    /* c_out_width*/,
         1    /* c_pipeline*/,
         1    /* c_reg_a_b_inputs*/,
         0    /* c_sqm_type*/,
         0    /* c_stack_adders*/,
         1    /* c_standalone*/,
         1    /* c_sync_enable*/,
         1    /* c_use_luts*/
      )
      BU1296(
         .CLK(BU1296_clk),
         .A(BU1296_a),
         .B(BU1296_b),
         .O(BU1296_o),
         .Q(BU1296_q),
         .A_SIGNED(BU1296_a_signed),
         .LOADB(BU1296_loadb),
         .LOAD_DONE(BU1296_load_done),
         .SWAPB(BU1296_swapb),
         .CE(BU1296_ce),
         .ACLR(BU1296_aclr),
         .SCLR(BU1296_sclr),
         .RFD(BU1296_rfd),
         .ND(BU1296_nd),
         .RDY(BU1296_rdy)
      );

      wire [4 : 0] BU1517_I;
         assign BU1517_I[0] = n516;
         assign BU1517_I[1] = n515;
         assign BU1517_I[2] = n514;
         assign BU1517_I[3] = n513;
         assign BU1517_I[4] = n512;
      wire BU1517_O;
         assign n1575 = BU1517_O;
      C_GATE_BIT_V5_0 #(
         "0"    /* c_ainit_val*/,
         0    /* c_enable_rlocs*/,
         0    /* c_gate_type*/,
         0    /* c_has_aclr*/,
         0    /* c_has_ainit*/,
         0    /* c_has_aset*/,
         0    /* c_has_ce*/,
         1    /* c_has_o*/,
         0    /* c_has_q*/,
         0    /* c_has_sclr*/,
         0    /* c_has_sinit*/,
         0    /* c_has_sset*/,
         5    /* c_inputs*/,
         "01111"    /* c_input_inv_mask*/,
         0    /* c_pipe_stages*/,
         "0"    /* c_sinit_val*/,
         0    /* c_sync_enable*/,
         1    /* c_sync_priority*/
      )
      BU1517(
         .I(BU1517_I),
         .O(BU1517_O)
      );

      defparam BU1526.INIT = 'h8c8c;
      wire BU1526_I0;
         assign BU1526_I0 = n511;
      wire BU1526_I1;
         assign BU1526_I1 = n512;
      wire BU1526_I2;
         assign BU1526_I2 = n1575;
      wire BU1526_I3;
         assign BU1526_I3 = 1'b0;
      wire BU1526_O;
         assign n1572 = BU1526_O;
      LUT4       BU1526(
         .I0(BU1526_I0),
         .I1(BU1526_I1),
         .I2(BU1526_I2),
         .I3(BU1526_I3),
         .O(BU1526_O)
      );

      wire [23 : 0] BU1527_A;
         assign BU1527_A[0] = n511;
         assign BU1527_A[1] = n510;
         assign BU1527_A[2] = n509;
         assign BU1527_A[3] = n508;
         assign BU1527_A[4] = n507;
         assign BU1527_A[5] = n506;
         assign BU1527_A[6] = n505;
         assign BU1527_A[7] = n504;
         assign BU1527_A[8] = n503;
         assign BU1527_A[9] = n502;
         assign BU1527_A[10] = n501;
         assign BU1527_A[11] = n500;
         assign BU1527_A[12] = n499;
         assign BU1527_A[13] = n498;
         assign BU1527_A[14] = n497;
         assign BU1527_A[15] = n496;
         assign BU1527_A[16] = n495;
         assign BU1527_A[17] = n494;
         assign BU1527_A[18] = n493;
         assign BU1527_A[19] = n492;
         assign BU1527_A[20] = n491;
         assign BU1527_A[21] = n490;
         assign BU1527_A[22] = n489;
         assign BU1527_A[23] = n488;
      wire [0 : 0] BU1527_B;
         assign BU1527_B[0] = n1572;
      wire [24 : 0] BU1527_S;
         assign n1547 = BU1527_S[0];
         assign n1548 = BU1527_S[1];
         assign n1549 = BU1527_S[2];
         assign n1550 = BU1527_S[3];
         assign n1551 = BU1527_S[4];
         assign n1552 = BU1527_S[5];
         assign n1553 = BU1527_S[6];
         assign n1554 = BU1527_S[7];
         assign n1555 = BU1527_S[8];
         assign n1556 = BU1527_S[9];
         assign n1557 = BU1527_S[10];
         assign n1558 = BU1527_S[11];
         assign n1559 = BU1527_S[12];
         assign n1560 = BU1527_S[13];
         assign n1561 = BU1527_S[14];
         assign n1562 = BU1527_S[15];
         assign n1563 = BU1527_S[16];
         assign n1564 = BU1527_S[17];
         assign n1565 = BU1527_S[18];
         assign n1566 = BU1527_S[19];
         assign n1567 = BU1527_S[20];
         assign n1568 = BU1527_S[21];
         assign n1569 = BU1527_S[22];
         assign n1570 = BU1527_S[23];
      C_ADDSUB_V5_0 #(
         0    /* c_add_mode*/,
         "0000000000000000000000000"    /* c_ainit_val*/,
         0    /* c_a_type*/,
         24    /* c_a_width*/,
         0    /* c_bypass_enable*/,
         0    /* c_bypass_low*/,
         0    /* c_b_constant*/,
         1    /* c_b_type*/,
         "0000000000000000000000000"    /* c_b_value*/,
         1    /* c_b_width*/,
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
         0    /* c_has_q*/,
         0    /* c_has_q_b_out*/,
         0    /* c_has_q_c_out*/,
         0    /* c_has_q_ovfl*/,
         1    /* c_has_s*/,
         0    /* c_has_sclr*/,
         0    /* c_has_sinit*/,
         0    /* c_has_sset*/,
         24    /* c_high_bit*/,
         1    /* c_latency*/,
         0    /* c_low_bit*/,
         25    /* c_out_width*/,
         0    /* c_pipe_stages*/,
         "0000000000000000000000000"    /* c_sinit_val*/,
         0    /* c_sync_enable*/,
         1    /* c_sync_priority*/
      )
      BU1527(
         .A(BU1527_A),
         .B(BU1527_B),
         .S(BU1527_S)
      );

      defparam BU1628.INIT = 'h0202;
      wire BU1628_I0;
         assign BU1628_I0 = n488;
      wire BU1628_I1;
         assign BU1628_I1 = n489;
      wire BU1628_I2;
         assign BU1628_I2 = n1570;
      wire BU1628_I3;
         assign BU1628_I3 = 1'b0;
      wire BU1628_O;
         assign n1581 = BU1628_O;
      LUT4       BU1628(
         .I0(BU1628_I0),
         .I1(BU1628_I1),
         .I2(BU1628_I2),
         .I3(BU1628_I3),
         .O(BU1628_O)
      );

      defparam BU1630.INIT = 'h4444;
      wire BU1630_I0;
         assign BU1630_I0 = n488;
      wire BU1630_I1;
         assign BU1630_I1 = n1570;
      wire BU1630_I2;
         assign BU1630_I2 = 1'b0;
      wire BU1630_I3;
         assign BU1630_I3 = 1'b0;
      wire BU1630_O;
         assign n1583 = BU1630_O;
      LUT4       BU1630(
         .I0(BU1630_I0),
         .I1(BU1630_I1),
         .I2(BU1630_I2),
         .I3(BU1630_I3),
         .O(BU1630_O)
      );

      wire [22 : 0] BU1631_D;
         assign BU1631_D[0] = n1547;
         assign BU1631_D[1] = n1548;
         assign BU1631_D[2] = n1549;
         assign BU1631_D[3] = n1550;
         assign BU1631_D[4] = n1551;
         assign BU1631_D[5] = n1552;
         assign BU1631_D[6] = n1553;
         assign BU1631_D[7] = n1554;
         assign BU1631_D[8] = n1555;
         assign BU1631_D[9] = n1556;
         assign BU1631_D[10] = n1557;
         assign BU1631_D[11] = n1558;
         assign BU1631_D[12] = n1559;
         assign BU1631_D[13] = n1560;
         assign BU1631_D[14] = n1561;
         assign BU1631_D[15] = n1562;
         assign BU1631_D[16] = n1563;
         assign BU1631_D[17] = n1564;
         assign BU1631_D[18] = n1565;
         assign BU1631_D[19] = n1566;
         assign BU1631_D[20] = n1567;
         assign BU1631_D[21] = n1568;
         assign BU1631_D[22] = n1569;
      wire [22 : 0] BU1631_Q;
         assign n3 = BU1631_Q[0];
         assign n4 = BU1631_Q[1];
         assign n5 = BU1631_Q[2];
         assign n6 = BU1631_Q[3];
         assign n7 = BU1631_Q[4];
         assign n8 = BU1631_Q[5];
         assign n9 = BU1631_Q[6];
         assign n10 = BU1631_Q[7];
         assign n11 = BU1631_Q[8];
         assign n12 = BU1631_Q[9];
         assign n13 = BU1631_Q[10];
         assign n14 = BU1631_Q[11];
         assign n15 = BU1631_Q[12];
         assign n16 = BU1631_Q[13];
         assign n17 = BU1631_Q[14];
         assign n18 = BU1631_Q[15];
         assign n19 = BU1631_Q[16];
         assign n20 = BU1631_Q[17];
         assign n21 = BU1631_Q[18];
         assign n22 = BU1631_Q[19];
         assign n23 = BU1631_Q[20];
         assign n24 = BU1631_Q[21];
         assign n25 = BU1631_Q[22];
      wire BU1631_CLK;
         assign BU1631_CLK = n183;
      wire BU1631_SCLR;
         assign BU1631_SCLR = n1581;
      wire BU1631_SSET;
         assign BU1631_SSET = n1583;
      C_REG_FD_V5_0 #(
         "00000000000000000000000"    /* c_ainit_val*/,
         0    /* c_enable_rlocs*/,
         0    /* c_has_aclr*/,
         0    /* c_has_ainit*/,
         0    /* c_has_aset*/,
         0    /* c_has_ce*/,
         1    /* c_has_sclr*/,
         0    /* c_has_sinit*/,
         1    /* c_has_sset*/,
         "00000000000000000000000"    /* c_sinit_val*/,
         0    /* c_sync_enable*/,
         0    /* c_sync_priority*/,
         23    /* c_width*/
      )
      BU1631(
         .D(BU1631_D),
         .Q(BU1631_Q),
         .CLK(BU1631_CLK),
         .SCLR(BU1631_SCLR),
         .SSET(BU1631_SSET)
      );

      wire [0 : 0] BU1724_D;
         assign BU1724_D[0] = n1570;
      wire [0 : 0] BU1724_Q;
         assign n26 = BU1724_Q[0];
      wire BU1724_CLK;
         assign BU1724_CLK = n183;
      wire BU1724_SCLR;
         assign BU1724_SCLR = n1583;
      wire BU1724_SSET;
         assign BU1724_SSET = n1581;
      C_REG_FD_V5_0 #(
         "0"    /* c_ainit_val*/,
         0    /* c_enable_rlocs*/,
         0    /* c_has_aclr*/,
         0    /* c_has_ainit*/,
         0    /* c_has_aset*/,
         0    /* c_has_ce*/,
         1    /* c_has_sclr*/,
         0    /* c_has_sinit*/,
         1    /* c_has_sset*/,
         "0"    /* c_sinit_val*/,
         0    /* c_sync_enable*/,
         0    /* c_sync_priority*/,
         1    /* c_width*/
      )
      BU1724(
         .D(BU1724_D),
         .Q(BU1724_Q),
         .CLK(BU1724_CLK),
         .SCLR(BU1724_SCLR),
         .SSET(BU1724_SSET)
      );

      wire BU1729_CLK;
         assign BU1729_CLK = n183;
      wire [0 : 0] BU1729_D;
         assign BU1729_D[0] = n575;
      wire [0 : 0] BU1729_Q;
         assign n2 = BU1729_Q[0];
      C_SHIFT_RAM_V5_0 #(
         0    /* c_addr_width*/,
         "0"    /* c_ainit_val*/,
         "0"    /* c_default_data*/,
         2    /* c_default_data_radix*/,
         1    /* c_depth*/,
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
      BU1729(
         .CLK(BU1729_CLK),
         .D(BU1729_D),
         .Q(BU1729_Q)
      );

      wire BU1734_clk;
         assign BU1734_clk = n183;
      wire [13 : 0] BU1734_a;
         assign BU1734_a[13] = n605;
         assign BU1734_a[12] = n606;
         assign BU1734_a[11] = n607;
         assign BU1734_a[10] = n608;
         assign BU1734_a[9] = n609;
         assign BU1734_a[8] = n610;
         assign BU1734_a[7] = n611;
         assign BU1734_a[6] = n612;
         assign BU1734_a[5] = n613;
         assign BU1734_a[4] = n614;
         assign BU1734_a[3] = n615;
         assign BU1734_a[2] = n616;
         assign BU1734_a[1] = n617;
         assign BU1734_a[0] = n618;
      wire [14 : 0] BU1734_b;
         assign BU1734_b[14] = n647;
         assign BU1734_b[13] = n648;
         assign BU1734_b[12] = n649;
         assign BU1734_b[11] = n650;
         assign BU1734_b[10] = n651;
         assign BU1734_b[9] = n652;
         assign BU1734_b[8] = n653;
         assign BU1734_b[7] = n654;
         assign BU1734_b[6] = n655;
         assign BU1734_b[5] = n656;
         assign BU1734_b[4] = n657;
         assign BU1734_b[3] = n658;
         assign BU1734_b[2] = n659;
         assign BU1734_b[1] = n660;
         assign BU1734_b[0] = n661;
      wire [28 : 0] BU1734_o;
      wire [28 : 0] BU1734_q;
         assign n692 = BU1734_q[28];
         assign n693 = BU1734_q[27];
         assign n694 = BU1734_q[26];
         assign n695 = BU1734_q[25];
         assign n696 = BU1734_q[24];
         assign n697 = BU1734_q[23];
         assign n698 = BU1734_q[22];
         assign n699 = BU1734_q[21];
         assign n700 = BU1734_q[20];
         assign n701 = BU1734_q[19];
         assign n702 = BU1734_q[18];
         assign n703 = BU1734_q[17];
         assign n704 = BU1734_q[16];
         assign n705 = BU1734_q[15];
         assign n706 = BU1734_q[14];
         assign n707 = BU1734_q[13];
         assign n708 = BU1734_q[12];
         assign n709 = BU1734_q[11];
         assign n710 = BU1734_q[10];
         assign n711 = BU1734_q[9];
         assign n712 = BU1734_q[8];
         assign n713 = BU1734_q[7];
         assign n714 = BU1734_q[6];
         assign n715 = BU1734_q[5];
         assign n716 = BU1734_q[4];
         assign n717 = BU1734_q[3];
         assign n718 = BU1734_q[2];
         assign n719 = BU1734_q[1];
         assign n720 = BU1734_q[0];
      wire BU1734_a_signed;
         assign BU1734_a_signed = 1'b0;
      wire BU1734_loadb;
         assign BU1734_loadb = 1'b0;
      wire BU1734_load_done;
      wire BU1734_swapb;
         assign BU1734_swapb = 1'b0;
      wire BU1734_ce;
         assign BU1734_ce = 1'b1;
      wire BU1734_aclr;
         assign BU1734_aclr = 1'b0;
      wire BU1734_sclr;
         assign BU1734_sclr = 1'b0;
      wire BU1734_rfd;
      wire BU1734_nd;
         assign BU1734_nd = n369;
      wire BU1734_rdy;
      MULT_GEN_V5_0 #(
         8    /* bram_addr_width*/,
         0    /* c_a_type*/,
         14    /* c_a_width*/,
         14    /* c_baat*/,
         0    /* c_b_constant*/,
         0    /* c_b_type*/,
         "0"    /* c_b_value*/,
         15    /* c_b_width*/,
         0    /* c_enable_rlocs*/,
         0    /* c_has_aclr*/,
         0    /* c_has_a_signed*/,
         1    /* c_has_b*/,
         0    /* c_has_ce*/,
         0    /* c_has_loadb*/,
         0    /* c_has_load_done*/,
         1    /* c_has_nd*/,
         0    /* c_has_o*/,
         1    /* c_has_q*/,
         1    /* c_has_rdy*/,
         1    /* c_has_rfd*/,
         0    /* c_has_sclr*/,
         0    /* c_has_swapb*/,
         "mem"    /* c_mem_init_prefix*/,
         0    /* c_mem_type*/,
         1    /* c_mult_type*/,
         0    /* c_output_hold*/,
         29    /* c_out_width*/,
         1    /* c_pipeline*/,
         1    /* c_reg_a_b_inputs*/,
         0    /* c_sqm_type*/,
         0    /* c_stack_adders*/,
         1    /* c_standalone*/,
         1    /* c_sync_enable*/,
         1    /* c_use_luts*/
      )
      BU1734(
         .CLK(BU1734_clk),
         .A(BU1734_a),
         .B(BU1734_b),
         .O(BU1734_o),
         .Q(BU1734_q),
         .A_SIGNED(BU1734_a_signed),
         .LOADB(BU1734_loadb),
         .LOAD_DONE(BU1734_load_done),
         .SWAPB(BU1734_swapb),
         .CE(BU1734_ce),
         .ACLR(BU1734_aclr),
         .SCLR(BU1734_sclr),
         .RFD(BU1734_rfd),
         .ND(BU1734_nd),
         .RDY(BU1734_rdy)
      );

      wire [4 : 0] BU1955_I;
         assign BU1955_I[0] = n720;
         assign BU1955_I[1] = n719;
         assign BU1955_I[2] = n718;
         assign BU1955_I[3] = n717;
         assign BU1955_I[4] = n716;
      wire BU1955_O;
         assign n2218 = BU1955_O;
      C_GATE_BIT_V5_0 #(
         "0"    /* c_ainit_val*/,
         0    /* c_enable_rlocs*/,
         0    /* c_gate_type*/,
         0    /* c_has_aclr*/,
         0    /* c_has_ainit*/,
         0    /* c_has_aset*/,
         0    /* c_has_ce*/,
         1    /* c_has_o*/,
         0    /* c_has_q*/,
         0    /* c_has_sclr*/,
         0    /* c_has_sinit*/,
         0    /* c_has_sset*/,
         5    /* c_inputs*/,
         "01111"    /* c_input_inv_mask*/,
         0    /* c_pipe_stages*/,
         "0"    /* c_sinit_val*/,
         0    /* c_sync_enable*/,
         1    /* c_sync_priority*/
      )
      BU1955(
         .I(BU1955_I),
         .O(BU1955_O)
      );

      defparam BU1964.INIT = 'h8c8c;
      wire BU1964_I0;
         assign BU1964_I0 = n715;
      wire BU1964_I1;
         assign BU1964_I1 = n716;
      wire BU1964_I2;
         assign BU1964_I2 = n2218;
      wire BU1964_I3;
         assign BU1964_I3 = 1'b0;
      wire BU1964_O;
         assign n2215 = BU1964_O;
      LUT4       BU1964(
         .I0(BU1964_I0),
         .I1(BU1964_I1),
         .I2(BU1964_I2),
         .I3(BU1964_I3),
         .O(BU1964_O)
      );

      wire [23 : 0] BU1965_A;
         assign BU1965_A[0] = n715;
         assign BU1965_A[1] = n714;
         assign BU1965_A[2] = n713;
         assign BU1965_A[3] = n712;
         assign BU1965_A[4] = n711;
         assign BU1965_A[5] = n710;
         assign BU1965_A[6] = n709;
         assign BU1965_A[7] = n708;
         assign BU1965_A[8] = n707;
         assign BU1965_A[9] = n706;
         assign BU1965_A[10] = n705;
         assign BU1965_A[11] = n704;
         assign BU1965_A[12] = n703;
         assign BU1965_A[13] = n702;
         assign BU1965_A[14] = n701;
         assign BU1965_A[15] = n700;
         assign BU1965_A[16] = n699;
         assign BU1965_A[17] = n698;
         assign BU1965_A[18] = n697;
         assign BU1965_A[19] = n696;
         assign BU1965_A[20] = n695;
         assign BU1965_A[21] = n694;
         assign BU1965_A[22] = n693;
         assign BU1965_A[23] = n692;
      wire [0 : 0] BU1965_B;
         assign BU1965_B[0] = n2215;
      wire [24 : 0] BU1965_S;
         assign n2190 = BU1965_S[0];
         assign n2191 = BU1965_S[1];
         assign n2192 = BU1965_S[2];
         assign n2193 = BU1965_S[3];
         assign n2194 = BU1965_S[4];
         assign n2195 = BU1965_S[5];
         assign n2196 = BU1965_S[6];
         assign n2197 = BU1965_S[7];
         assign n2198 = BU1965_S[8];
         assign n2199 = BU1965_S[9];
         assign n2200 = BU1965_S[10];
         assign n2201 = BU1965_S[11];
         assign n2202 = BU1965_S[12];
         assign n2203 = BU1965_S[13];
         assign n2204 = BU1965_S[14];
         assign n2205 = BU1965_S[15];
         assign n2206 = BU1965_S[16];
         assign n2207 = BU1965_S[17];
         assign n2208 = BU1965_S[18];
         assign n2209 = BU1965_S[19];
         assign n2210 = BU1965_S[20];
         assign n2211 = BU1965_S[21];
         assign n2212 = BU1965_S[22];
         assign n2213 = BU1965_S[23];
      C_ADDSUB_V5_0 #(
         0    /* c_add_mode*/,
         "0000000000000000000000000"    /* c_ainit_val*/,
         0    /* c_a_type*/,
         24    /* c_a_width*/,
         0    /* c_bypass_enable*/,
         0    /* c_bypass_low*/,
         0    /* c_b_constant*/,
         1    /* c_b_type*/,
         "0000000000000000000000000"    /* c_b_value*/,
         1    /* c_b_width*/,
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
         0    /* c_has_q*/,
         0    /* c_has_q_b_out*/,
         0    /* c_has_q_c_out*/,
         0    /* c_has_q_ovfl*/,
         1    /* c_has_s*/,
         0    /* c_has_sclr*/,
         0    /* c_has_sinit*/,
         0    /* c_has_sset*/,
         24    /* c_high_bit*/,
         1    /* c_latency*/,
         0    /* c_low_bit*/,
         25    /* c_out_width*/,
         0    /* c_pipe_stages*/,
         "0000000000000000000000000"    /* c_sinit_val*/,
         0    /* c_sync_enable*/,
         1    /* c_sync_priority*/
      )
      BU1965(
         .A(BU1965_A),
         .B(BU1965_B),
         .S(BU1965_S)
      );

      defparam BU2066.INIT = 'h0202;
      wire BU2066_I0;
         assign BU2066_I0 = n692;
      wire BU2066_I1;
         assign BU2066_I1 = n693;
      wire BU2066_I2;
         assign BU2066_I2 = n2213;
      wire BU2066_I3;
         assign BU2066_I3 = 1'b0;
      wire BU2066_O;
         assign n2224 = BU2066_O;
      LUT4       BU2066(
         .I0(BU2066_I0),
         .I1(BU2066_I1),
         .I2(BU2066_I2),
         .I3(BU2066_I3),
         .O(BU2066_O)
      );

      defparam BU2068.INIT = 'h4444;
      wire BU2068_I0;
         assign BU2068_I0 = n692;
      wire BU2068_I1;
         assign BU2068_I1 = n2213;
      wire BU2068_I2;
         assign BU2068_I2 = 1'b0;
      wire BU2068_I3;
         assign BU2068_I3 = 1'b0;
      wire BU2068_O;
         assign n2226 = BU2068_O;
      LUT4       BU2068(
         .I0(BU2068_I0),
         .I1(BU2068_I1),
         .I2(BU2068_I2),
         .I3(BU2068_I3),
         .O(BU2068_O)
      );

      wire [22 : 0] BU2069_D;
         assign BU2069_D[0] = n2190;
         assign BU2069_D[1] = n2191;
         assign BU2069_D[2] = n2192;
         assign BU2069_D[3] = n2193;
         assign BU2069_D[4] = n2194;
         assign BU2069_D[5] = n2195;
         assign BU2069_D[6] = n2196;
         assign BU2069_D[7] = n2197;
         assign BU2069_D[8] = n2198;
         assign BU2069_D[9] = n2199;
         assign BU2069_D[10] = n2200;
         assign BU2069_D[11] = n2201;
         assign BU2069_D[12] = n2202;
         assign BU2069_D[13] = n2203;
         assign BU2069_D[14] = n2204;
         assign BU2069_D[15] = n2205;
         assign BU2069_D[16] = n2206;
         assign BU2069_D[17] = n2207;
         assign BU2069_D[18] = n2208;
         assign BU2069_D[19] = n2209;
         assign BU2069_D[20] = n2210;
         assign BU2069_D[21] = n2211;
         assign BU2069_D[22] = n2212;
      wire [22 : 0] BU2069_Q;
         assign n27 = BU2069_Q[0];
         assign n28 = BU2069_Q[1];
         assign n29 = BU2069_Q[2];
         assign n30 = BU2069_Q[3];
         assign n31 = BU2069_Q[4];
         assign n32 = BU2069_Q[5];
         assign n33 = BU2069_Q[6];
         assign n34 = BU2069_Q[7];
         assign n35 = BU2069_Q[8];
         assign n36 = BU2069_Q[9];
         assign n37 = BU2069_Q[10];
         assign n38 = BU2069_Q[11];
         assign n39 = BU2069_Q[12];
         assign n40 = BU2069_Q[13];
         assign n41 = BU2069_Q[14];
         assign n42 = BU2069_Q[15];
         assign n43 = BU2069_Q[16];
         assign n44 = BU2069_Q[17];
         assign n45 = BU2069_Q[18];
         assign n46 = BU2069_Q[19];
         assign n47 = BU2069_Q[20];
         assign n48 = BU2069_Q[21];
         assign n49 = BU2069_Q[22];
      wire BU2069_CLK;
         assign BU2069_CLK = n183;
      wire BU2069_SCLR;
         assign BU2069_SCLR = n2224;
      wire BU2069_SSET;
         assign BU2069_SSET = n2226;
      C_REG_FD_V5_0 #(
         "00000000000000000000000"    /* c_ainit_val*/,
         0    /* c_enable_rlocs*/,
         0    /* c_has_aclr*/,
         0    /* c_has_ainit*/,
         0    /* c_has_aset*/,
         0    /* c_has_ce*/,
         1    /* c_has_sclr*/,
         0    /* c_has_sinit*/,
         1    /* c_has_sset*/,
         "00000000000000000000000"    /* c_sinit_val*/,
         0    /* c_sync_enable*/,
         0    /* c_sync_priority*/,
         23    /* c_width*/
      )
      BU2069(
         .D(BU2069_D),
         .Q(BU2069_Q),
         .CLK(BU2069_CLK),
         .SCLR(BU2069_SCLR),
         .SSET(BU2069_SSET)
      );

      wire [0 : 0] BU2162_D;
         assign BU2162_D[0] = n2213;
      wire [0 : 0] BU2162_Q;
         assign n50 = BU2162_Q[0];
      wire BU2162_CLK;
         assign BU2162_CLK = n183;
      wire BU2162_SCLR;
         assign BU2162_SCLR = n2226;
      wire BU2162_SSET;
         assign BU2162_SSET = n2224;
      C_REG_FD_V5_0 #(
         "0"    /* c_ainit_val*/,
         0    /* c_enable_rlocs*/,
         0    /* c_has_aclr*/,
         0    /* c_has_ainit*/,
         0    /* c_has_aset*/,
         0    /* c_has_ce*/,
         1    /* c_has_sclr*/,
         0    /* c_has_sinit*/,
         1    /* c_has_sset*/,
         "0"    /* c_sinit_val*/,
         0    /* c_sync_enable*/,
         0    /* c_sync_priority*/,
         1    /* c_width*/
      )
      BU2162(
         .D(BU2162_D),
         .Q(BU2162_Q),
         .CLK(BU2162_CLK),
         .SCLR(BU2162_SCLR),
         .SSET(BU2162_SSET)
      );

      wire BU2457_D;
         assign BU2457_D = n2754;
      wire BU2457_C;
         assign BU2457_C = n183;
      wire BU2457_CE;
         assign BU2457_CE = 1'b1;
      wire BU2457_Q;
         assign n2705 = BU2457_Q;
      FDE       BU2457(
         .D(BU2457_D),
         .C(BU2457_C),
         .CE(BU2457_CE),
         .Q(BU2457_Q)
      );

      wire [22 : 0] BU2461_I;
         assign BU2461_I[0] = n2707;
         assign BU2461_I[1] = n2708;
         assign BU2461_I[2] = n2709;
         assign BU2461_I[3] = n2710;
         assign BU2461_I[4] = n2711;
         assign BU2461_I[5] = n2712;
         assign BU2461_I[6] = n2713;
         assign BU2461_I[7] = n2714;
         assign BU2461_I[8] = n2715;
         assign BU2461_I[9] = n2716;
         assign BU2461_I[10] = n2717;
         assign BU2461_I[11] = n2718;
         assign BU2461_I[12] = n2719;
         assign BU2461_I[13] = n2720;
         assign BU2461_I[14] = n2721;
         assign BU2461_I[15] = n2722;
         assign BU2461_I[16] = n2723;
         assign BU2461_I[17] = n2724;
         assign BU2461_I[18] = n2725;
         assign BU2461_I[19] = n2726;
         assign BU2461_I[20] = n2727;
         assign BU2461_I[21] = n2728;
         assign BU2461_I[22] = n2729;
      wire BU2461_O;
         assign n3070 = BU2461_O;
      C_GATE_BIT_V5_0 #(
         "0"    /* c_ainit_val*/,
         0    /* c_enable_rlocs*/,
         0    /* c_gate_type*/,
         0    /* c_has_aclr*/,
         0    /* c_has_ainit*/,
         0    /* c_has_aset*/,
         0    /* c_has_ce*/,
         1    /* c_has_o*/,
         0    /* c_has_q*/,
         0    /* c_has_sclr*/,
         0    /* c_has_sinit*/,
         0    /* c_has_sset*/,
         23    /* c_inputs*/,
         "01111111111111111111111"    /* c_input_inv_mask*/,
         0    /* c_pipe_stages*/,
         "0"    /* c_sinit_val*/,
         0    /* c_sync_enable*/,
         1    /* c_sync_priority*/
      )
      BU2461(
         .I(BU2461_I),
         .O(BU2461_O)
      );

      defparam BU2489.INIT = 'h8c8c;
      wire BU2489_I0;
         assign BU2489_I0 = n2730;
      wire BU2489_I1;
         assign BU2489_I1 = n2729;
      wire BU2489_I2;
         assign BU2489_I2 = n3070;
      wire BU2489_I3;
         assign BU2489_I3 = 1'b0;
      wire BU2489_O;
         assign n3067 = BU2489_O;
      LUT4       BU2489(
         .I0(BU2489_I0),
         .I1(BU2489_I1),
         .I2(BU2489_I2),
         .I3(BU2489_I3),
         .O(BU2489_O)
      );

      wire [23 : 0] BU2490_A;
         assign BU2490_A[0] = n2730;
         assign BU2490_A[1] = n2731;
         assign BU2490_A[2] = n2732;
         assign BU2490_A[3] = n2733;
         assign BU2490_A[4] = n2734;
         assign BU2490_A[5] = n2735;
         assign BU2490_A[6] = n2736;
         assign BU2490_A[7] = n2737;
         assign BU2490_A[8] = n2738;
         assign BU2490_A[9] = n2739;
         assign BU2490_A[10] = n2740;
         assign BU2490_A[11] = n2741;
         assign BU2490_A[12] = n2742;
         assign BU2490_A[13] = n2743;
         assign BU2490_A[14] = n2744;
         assign BU2490_A[15] = n2745;
         assign BU2490_A[16] = n2746;
         assign BU2490_A[17] = n2747;
         assign BU2490_A[18] = n2748;
         assign BU2490_A[19] = n2749;
         assign BU2490_A[20] = n2750;
         assign BU2490_A[21] = n2751;
         assign BU2490_A[22] = n2752;
         assign BU2490_A[23] = n2753;
      wire [0 : 0] BU2490_B;
         assign BU2490_B[0] = n3067;
      wire [24 : 0] BU2490_S;
         assign n3042 = BU2490_S[0];
         assign n3043 = BU2490_S[1];
         assign n3044 = BU2490_S[2];
         assign n3045 = BU2490_S[3];
         assign n3046 = BU2490_S[4];
         assign n3047 = BU2490_S[5];
         assign n3048 = BU2490_S[6];
         assign n3049 = BU2490_S[7];
         assign n3050 = BU2490_S[8];
         assign n3051 = BU2490_S[9];
         assign n3052 = BU2490_S[10];
         assign n3053 = BU2490_S[11];
         assign n3054 = BU2490_S[12];
         assign n3055 = BU2490_S[13];
         assign n3056 = BU2490_S[14];
         assign n3057 = BU2490_S[15];
         assign n3058 = BU2490_S[16];
         assign n3059 = BU2490_S[17];
         assign n3060 = BU2490_S[18];
         assign n3061 = BU2490_S[19];
         assign n3062 = BU2490_S[20];
         assign n3063 = BU2490_S[21];
         assign n3064 = BU2490_S[22];
         assign n3065 = BU2490_S[23];
      C_ADDSUB_V5_0 #(
         0    /* c_add_mode*/,
         "0000000000000000000000000"    /* c_ainit_val*/,
         0    /* c_a_type*/,
         24    /* c_a_width*/,
         0    /* c_bypass_enable*/,
         0    /* c_bypass_low*/,
         0    /* c_b_constant*/,
         1    /* c_b_type*/,
         "0000000000000000000000000"    /* c_b_value*/,
         1    /* c_b_width*/,
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
         0    /* c_has_q*/,
         0    /* c_has_q_b_out*/,
         0    /* c_has_q_c_out*/,
         0    /* c_has_q_ovfl*/,
         1    /* c_has_s*/,
         0    /* c_has_sclr*/,
         0    /* c_has_sinit*/,
         0    /* c_has_sset*/,
         24    /* c_high_bit*/,
         1    /* c_latency*/,
         0    /* c_low_bit*/,
         25    /* c_out_width*/,
         0    /* c_pipe_stages*/,
         "0000000000000000000000000"    /* c_sinit_val*/,
         0    /* c_sync_enable*/,
         1    /* c_sync_priority*/
      )
      BU2490(
         .A(BU2490_A),
         .B(BU2490_B),
         .S(BU2490_S)
      );

      defparam BU2591.INIT = 'h0202;
      wire BU2591_I0;
         assign BU2591_I0 = n2753;
      wire BU2591_I1;
         assign BU2591_I1 = n2752;
      wire BU2591_I2;
         assign BU2591_I2 = n3065;
      wire BU2591_I3;
         assign BU2591_I3 = 1'b0;
      wire BU2591_O;
         assign n3094 = BU2591_O;
      LUT4       BU2591(
         .I0(BU2591_I0),
         .I1(BU2591_I1),
         .I2(BU2591_I2),
         .I3(BU2591_I3),
         .O(BU2591_O)
      );

      defparam BU2593.INIT = 'h4444;
      wire BU2593_I0;
         assign BU2593_I0 = n2753;
      wire BU2593_I1;
         assign BU2593_I1 = n3065;
      wire BU2593_I2;
         assign BU2593_I2 = 1'b0;
      wire BU2593_I3;
         assign BU2593_I3 = 1'b0;
      wire BU2593_O;
         assign n3096 = BU2593_O;
      LUT4       BU2593(
         .I0(BU2593_I0),
         .I1(BU2593_I1),
         .I2(BU2593_I2),
         .I3(BU2593_I3),
         .O(BU2593_O)
      );

      wire [22 : 0] BU2594_D;
         assign BU2594_D[0] = n3042;
         assign BU2594_D[1] = n3043;
         assign BU2594_D[2] = n3044;
         assign BU2594_D[3] = n3045;
         assign BU2594_D[4] = n3046;
         assign BU2594_D[5] = n3047;
         assign BU2594_D[6] = n3048;
         assign BU2594_D[7] = n3049;
         assign BU2594_D[8] = n3050;
         assign BU2594_D[9] = n3051;
         assign BU2594_D[10] = n3052;
         assign BU2594_D[11] = n3053;
         assign BU2594_D[12] = n3054;
         assign BU2594_D[13] = n3055;
         assign BU2594_D[14] = n3056;
         assign BU2594_D[15] = n3057;
         assign BU2594_D[16] = n3058;
         assign BU2594_D[17] = n3059;
         assign BU2594_D[18] = n3060;
         assign BU2594_D[19] = n3061;
         assign BU2594_D[20] = n3062;
         assign BU2594_D[21] = n3063;
         assign BU2594_D[22] = n3064;
      wire [22 : 0] BU2594_Q;
         assign n2633 = BU2594_Q[0];
         assign n2634 = BU2594_Q[1];
         assign n2635 = BU2594_Q[2];
         assign n2636 = BU2594_Q[3];
         assign n2637 = BU2594_Q[4];
         assign n2638 = BU2594_Q[5];
         assign n2639 = BU2594_Q[6];
         assign n2640 = BU2594_Q[7];
         assign n2641 = BU2594_Q[8];
         assign n2642 = BU2594_Q[9];
         assign n2643 = BU2594_Q[10];
         assign n2644 = BU2594_Q[11];
         assign n2645 = BU2594_Q[12];
         assign n2646 = BU2594_Q[13];
         assign n2647 = BU2594_Q[14];
         assign n2648 = BU2594_Q[15];
         assign n2649 = BU2594_Q[16];
         assign n2650 = BU2594_Q[17];
         assign n2651 = BU2594_Q[18];
         assign n2652 = BU2594_Q[19];
         assign n2653 = BU2594_Q[20];
         assign n2654 = BU2594_Q[21];
         assign n2655 = BU2594_Q[22];
      wire BU2594_CLK;
         assign BU2594_CLK = n183;
      wire BU2594_SCLR;
         assign BU2594_SCLR = n3094;
      wire BU2594_SSET;
         assign BU2594_SSET = n3096;
      C_REG_FD_V5_0 #(
         "00000000000000000000000"    /* c_ainit_val*/,
         0    /* c_enable_rlocs*/,
         0    /* c_has_aclr*/,
         0    /* c_has_ainit*/,
         0    /* c_has_aset*/,
         0    /* c_has_ce*/,
         1    /* c_has_sclr*/,
         0    /* c_has_sinit*/,
         1    /* c_has_sset*/,
         "00000000000000000000000"    /* c_sinit_val*/,
         0    /* c_sync_enable*/,
         0    /* c_sync_priority*/,
         23    /* c_width*/
      )
      BU2594(
         .D(BU2594_D),
         .Q(BU2594_Q),
         .CLK(BU2594_CLK),
         .SCLR(BU2594_SCLR),
         .SSET(BU2594_SSET)
      );

      wire [0 : 0] BU2687_D;
         assign BU2687_D[0] = n3065;
      wire [0 : 0] BU2687_Q;
         assign n2656 = BU2687_Q[0];
      wire BU2687_CLK;
         assign BU2687_CLK = n183;
      wire BU2687_SCLR;
         assign BU2687_SCLR = n3096;
      wire BU2687_SSET;
         assign BU2687_SSET = n3094;
      C_REG_FD_V5_0 #(
         "0"    /* c_ainit_val*/,
         0    /* c_enable_rlocs*/,
         0    /* c_has_aclr*/,
         0    /* c_has_ainit*/,
         0    /* c_has_aset*/,
         0    /* c_has_ce*/,
         1    /* c_has_sclr*/,
         0    /* c_has_sinit*/,
         1    /* c_has_sset*/,
         "0"    /* c_sinit_val*/,
         0    /* c_sync_enable*/,
         0    /* c_sync_priority*/,
         1    /* c_width*/
      )
      BU2687(
         .D(BU2687_D),
         .Q(BU2687_Q),
         .CLK(BU2687_CLK),
         .SCLR(BU2687_SCLR),
         .SSET(BU2687_SSET)
      );

      wire [22 : 0] BU7487_I;
         assign BU7487_I[0] = n2755;
         assign BU7487_I[1] = n2756;
         assign BU7487_I[2] = n2757;
         assign BU7487_I[3] = n2758;
         assign BU7487_I[4] = n2759;
         assign BU7487_I[5] = n2760;
         assign BU7487_I[6] = n2761;
         assign BU7487_I[7] = n2762;
         assign BU7487_I[8] = n2763;
         assign BU7487_I[9] = n2764;
         assign BU7487_I[10] = n2765;
         assign BU7487_I[11] = n2766;
         assign BU7487_I[12] = n2767;
         assign BU7487_I[13] = n2768;
         assign BU7487_I[14] = n2769;
         assign BU7487_I[15] = n2770;
         assign BU7487_I[16] = n2771;
         assign BU7487_I[17] = n2772;
         assign BU7487_I[18] = n2773;
         assign BU7487_I[19] = n2774;
         assign BU7487_I[20] = n2775;
         assign BU7487_I[21] = n2776;
         assign BU7487_I[22] = n2777;
      wire BU7487_O;
         assign n3587 = BU7487_O;
      C_GATE_BIT_V5_0 #(
         "0"    /* c_ainit_val*/,
         0    /* c_enable_rlocs*/,
         0    /* c_gate_type*/,
         0    /* c_has_aclr*/,
         0    /* c_has_ainit*/,
         0    /* c_has_aset*/,
         0    /* c_has_ce*/,
         1    /* c_has_o*/,
         0    /* c_has_q*/,
         0    /* c_has_sclr*/,
         0    /* c_has_sinit*/,
         0    /* c_has_sset*/,
         23    /* c_inputs*/,
         "01111111111111111111111"    /* c_input_inv_mask*/,
         0    /* c_pipe_stages*/,
         "0"    /* c_sinit_val*/,
         0    /* c_sync_enable*/,
         1    /* c_sync_priority*/
      )
      BU7487(
         .I(BU7487_I),
         .O(BU7487_O)
      );

      defparam BU7515.INIT = 'h8c8c;
      wire BU7515_I0;
         assign BU7515_I0 = n2778;
      wire BU7515_I1;
         assign BU7515_I1 = n2777;
      wire BU7515_I2;
         assign BU7515_I2 = n3587;
      wire BU7515_I3;
         assign BU7515_I3 = 1'b0;
      wire BU7515_O;
         assign n3584 = BU7515_O;
      LUT4       BU7515(
         .I0(BU7515_I0),
         .I1(BU7515_I1),
         .I2(BU7515_I2),
         .I3(BU7515_I3),
         .O(BU7515_O)
      );

      wire [23 : 0] BU7516_A;
         assign BU7516_A[0] = n2778;
         assign BU7516_A[1] = n2779;
         assign BU7516_A[2] = n2780;
         assign BU7516_A[3] = n2781;
         assign BU7516_A[4] = n2782;
         assign BU7516_A[5] = n2783;
         assign BU7516_A[6] = n2784;
         assign BU7516_A[7] = n2785;
         assign BU7516_A[8] = n2786;
         assign BU7516_A[9] = n2787;
         assign BU7516_A[10] = n2788;
         assign BU7516_A[11] = n2789;
         assign BU7516_A[12] = n2790;
         assign BU7516_A[13] = n2791;
         assign BU7516_A[14] = n2792;
         assign BU7516_A[15] = n2793;
         assign BU7516_A[16] = n2794;
         assign BU7516_A[17] = n2795;
         assign BU7516_A[18] = n2796;
         assign BU7516_A[19] = n2797;
         assign BU7516_A[20] = n2798;
         assign BU7516_A[21] = n2799;
         assign BU7516_A[22] = n2800;
         assign BU7516_A[23] = n2801;
      wire [0 : 0] BU7516_B;
         assign BU7516_B[0] = n3584;
      wire [24 : 0] BU7516_S;
         assign n3559 = BU7516_S[0];
         assign n3560 = BU7516_S[1];
         assign n3561 = BU7516_S[2];
         assign n3562 = BU7516_S[3];
         assign n3563 = BU7516_S[4];
         assign n3564 = BU7516_S[5];
         assign n3565 = BU7516_S[6];
         assign n3566 = BU7516_S[7];
         assign n3567 = BU7516_S[8];
         assign n3568 = BU7516_S[9];
         assign n3569 = BU7516_S[10];
         assign n3570 = BU7516_S[11];
         assign n3571 = BU7516_S[12];
         assign n3572 = BU7516_S[13];
         assign n3573 = BU7516_S[14];
         assign n3574 = BU7516_S[15];
         assign n3575 = BU7516_S[16];
         assign n3576 = BU7516_S[17];
         assign n3577 = BU7516_S[18];
         assign n3578 = BU7516_S[19];
         assign n3579 = BU7516_S[20];
         assign n3580 = BU7516_S[21];
         assign n3581 = BU7516_S[22];
         assign n3582 = BU7516_S[23];
      C_ADDSUB_V5_0 #(
         0    /* c_add_mode*/,
         "0000000000000000000000000"    /* c_ainit_val*/,
         0    /* c_a_type*/,
         24    /* c_a_width*/,
         0    /* c_bypass_enable*/,
         0    /* c_bypass_low*/,
         0    /* c_b_constant*/,
         1    /* c_b_type*/,
         "0000000000000000000000000"    /* c_b_value*/,
         1    /* c_b_width*/,
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
         0    /* c_has_q*/,
         0    /* c_has_q_b_out*/,
         0    /* c_has_q_c_out*/,
         0    /* c_has_q_ovfl*/,
         1    /* c_has_s*/,
         0    /* c_has_sclr*/,
         0    /* c_has_sinit*/,
         0    /* c_has_sset*/,
         24    /* c_high_bit*/,
         1    /* c_latency*/,
         0    /* c_low_bit*/,
         25    /* c_out_width*/,
         0    /* c_pipe_stages*/,
         "0000000000000000000000000"    /* c_sinit_val*/,
         0    /* c_sync_enable*/,
         1    /* c_sync_priority*/
      )
      BU7516(
         .A(BU7516_A),
         .B(BU7516_B),
         .S(BU7516_S)
      );

      defparam BU7617.INIT = 'h0202;
      wire BU7617_I0;
         assign BU7617_I0 = n2801;
      wire BU7617_I1;
         assign BU7617_I1 = n2800;
      wire BU7617_I2;
         assign BU7617_I2 = n3582;
      wire BU7617_I3;
         assign BU7617_I3 = 1'b0;
      wire BU7617_O;
         assign n3611 = BU7617_O;
      LUT4       BU7617(
         .I0(BU7617_I0),
         .I1(BU7617_I1),
         .I2(BU7617_I2),
         .I3(BU7617_I3),
         .O(BU7617_O)
      );

      defparam BU7619.INIT = 'h4444;
      wire BU7619_I0;
         assign BU7619_I0 = n2801;
      wire BU7619_I1;
         assign BU7619_I1 = n3582;
      wire BU7619_I2;
         assign BU7619_I2 = 1'b0;
      wire BU7619_I3;
         assign BU7619_I3 = 1'b0;
      wire BU7619_O;
         assign n3613 = BU7619_O;
      LUT4       BU7619(
         .I0(BU7619_I0),
         .I1(BU7619_I1),
         .I2(BU7619_I2),
         .I3(BU7619_I3),
         .O(BU7619_O)
      );

      wire [22 : 0] BU7620_D;
         assign BU7620_D[0] = n3559;
         assign BU7620_D[1] = n3560;
         assign BU7620_D[2] = n3561;
         assign BU7620_D[3] = n3562;
         assign BU7620_D[4] = n3563;
         assign BU7620_D[5] = n3564;
         assign BU7620_D[6] = n3565;
         assign BU7620_D[7] = n3566;
         assign BU7620_D[8] = n3567;
         assign BU7620_D[9] = n3568;
         assign BU7620_D[10] = n3569;
         assign BU7620_D[11] = n3570;
         assign BU7620_D[12] = n3571;
         assign BU7620_D[13] = n3572;
         assign BU7620_D[14] = n3573;
         assign BU7620_D[15] = n3574;
         assign BU7620_D[16] = n3575;
         assign BU7620_D[17] = n3576;
         assign BU7620_D[18] = n3577;
         assign BU7620_D[19] = n3578;
         assign BU7620_D[20] = n3579;
         assign BU7620_D[21] = n3580;
         assign BU7620_D[22] = n3581;
      wire [22 : 0] BU7620_Q;
         assign n2657 = BU7620_Q[0];
         assign n2658 = BU7620_Q[1];
         assign n2659 = BU7620_Q[2];
         assign n2660 = BU7620_Q[3];
         assign n2661 = BU7620_Q[4];
         assign n2662 = BU7620_Q[5];
         assign n2663 = BU7620_Q[6];
         assign n2664 = BU7620_Q[7];
         assign n2665 = BU7620_Q[8];
         assign n2666 = BU7620_Q[9];
         assign n2667 = BU7620_Q[10];
         assign n2668 = BU7620_Q[11];
         assign n2669 = BU7620_Q[12];
         assign n2670 = BU7620_Q[13];
         assign n2671 = BU7620_Q[14];
         assign n2672 = BU7620_Q[15];
         assign n2673 = BU7620_Q[16];
         assign n2674 = BU7620_Q[17];
         assign n2675 = BU7620_Q[18];
         assign n2676 = BU7620_Q[19];
         assign n2677 = BU7620_Q[20];
         assign n2678 = BU7620_Q[21];
         assign n2679 = BU7620_Q[22];
      wire BU7620_CLK;
         assign BU7620_CLK = n183;
      wire BU7620_SCLR;
         assign BU7620_SCLR = n3611;
      wire BU7620_SSET;
         assign BU7620_SSET = n3613;
      C_REG_FD_V5_0 #(
         "00000000000000000000000"    /* c_ainit_val*/,
         0    /* c_enable_rlocs*/,
         0    /* c_has_aclr*/,
         0    /* c_has_ainit*/,
         0    /* c_has_aset*/,
         0    /* c_has_ce*/,
         1    /* c_has_sclr*/,
         0    /* c_has_sinit*/,
         1    /* c_has_sset*/,
         "00000000000000000000000"    /* c_sinit_val*/,
         0    /* c_sync_enable*/,
         0    /* c_sync_priority*/,
         23    /* c_width*/
      )
      BU7620(
         .D(BU7620_D),
         .Q(BU7620_Q),
         .CLK(BU7620_CLK),
         .SCLR(BU7620_SCLR),
         .SSET(BU7620_SSET)
      );

      wire [0 : 0] BU7713_D;
         assign BU7713_D[0] = n3582;
      wire [0 : 0] BU7713_Q;
         assign n2680 = BU7713_Q[0];
      wire BU7713_CLK;
         assign BU7713_CLK = n183;
      wire BU7713_SCLR;
         assign BU7713_SCLR = n3613;
      wire BU7713_SSET;
         assign BU7713_SSET = n3611;
      C_REG_FD_V5_0 #(
         "0"    /* c_ainit_val*/,
         0    /* c_enable_rlocs*/,
         0    /* c_has_aclr*/,
         0    /* c_has_ainit*/,
         0    /* c_has_aset*/,
         0    /* c_has_ce*/,
         1    /* c_has_sclr*/,
         0    /* c_has_sinit*/,
         1    /* c_has_sset*/,
         "0"    /* c_sinit_val*/,
         0    /* c_sync_enable*/,
         0    /* c_sync_priority*/,
         1    /* c_width*/
      )
      BU7713(
         .D(BU7713_D),
         .Q(BU7713_Q),
         .CLK(BU7713_CLK),
         .SCLR(BU7713_SCLR),
         .SSET(BU7713_SSET)
      );

      wire BU2173_D;
         assign BU2173_D = n2657;
      wire BU2173_C;
         assign BU2173_C = n183;
      wire BU2173_CE;
         assign BU2173_CE = 1'b1;
      wire BU2173_Q;
         assign n2681 = BU2173_Q;
      FDE       BU2173(
         .D(BU2173_D),
         .C(BU2173_C),
         .CE(BU2173_CE),
         .Q(BU2173_Q)
      );

      wire BU2175_D;
         assign BU2175_D = n2658;
      wire BU2175_C;
         assign BU2175_C = n183;
      wire BU2175_CE;
         assign BU2175_CE = 1'b1;
      wire BU2175_Q;
         assign n2682 = BU2175_Q;
      FDE       BU2175(
         .D(BU2175_D),
         .C(BU2175_C),
         .CE(BU2175_CE),
         .Q(BU2175_Q)
      );

      wire BU2177_D;
         assign BU2177_D = n2659;
      wire BU2177_C;
         assign BU2177_C = n183;
      wire BU2177_CE;
         assign BU2177_CE = 1'b1;
      wire BU2177_Q;
         assign n2683 = BU2177_Q;
      FDE       BU2177(
         .D(BU2177_D),
         .C(BU2177_C),
         .CE(BU2177_CE),
         .Q(BU2177_Q)
      );

      wire BU2179_D;
         assign BU2179_D = n2660;
      wire BU2179_C;
         assign BU2179_C = n183;
      wire BU2179_CE;
         assign BU2179_CE = 1'b1;
      wire BU2179_Q;
         assign n2684 = BU2179_Q;
      FDE       BU2179(
         .D(BU2179_D),
         .C(BU2179_C),
         .CE(BU2179_CE),
         .Q(BU2179_Q)
      );

      wire BU2181_D;
         assign BU2181_D = n2661;
      wire BU2181_C;
         assign BU2181_C = n183;
      wire BU2181_CE;
         assign BU2181_CE = 1'b1;
      wire BU2181_Q;
         assign n2685 = BU2181_Q;
      FDE       BU2181(
         .D(BU2181_D),
         .C(BU2181_C),
         .CE(BU2181_CE),
         .Q(BU2181_Q)
      );

      wire BU2183_D;
         assign BU2183_D = n2662;
      wire BU2183_C;
         assign BU2183_C = n183;
      wire BU2183_CE;
         assign BU2183_CE = 1'b1;
      wire BU2183_Q;
         assign n2686 = BU2183_Q;
      FDE       BU2183(
         .D(BU2183_D),
         .C(BU2183_C),
         .CE(BU2183_CE),
         .Q(BU2183_Q)
      );

      wire BU2185_D;
         assign BU2185_D = n2663;
      wire BU2185_C;
         assign BU2185_C = n183;
      wire BU2185_CE;
         assign BU2185_CE = 1'b1;
      wire BU2185_Q;
         assign n2687 = BU2185_Q;
      FDE       BU2185(
         .D(BU2185_D),
         .C(BU2185_C),
         .CE(BU2185_CE),
         .Q(BU2185_Q)
      );

      wire BU2187_D;
         assign BU2187_D = n2664;
      wire BU2187_C;
         assign BU2187_C = n183;
      wire BU2187_CE;
         assign BU2187_CE = 1'b1;
      wire BU2187_Q;
         assign n2688 = BU2187_Q;
      FDE       BU2187(
         .D(BU2187_D),
         .C(BU2187_C),
         .CE(BU2187_CE),
         .Q(BU2187_Q)
      );

      wire BU2189_D;
         assign BU2189_D = n2665;
      wire BU2189_C;
         assign BU2189_C = n183;
      wire BU2189_CE;
         assign BU2189_CE = 1'b1;
      wire BU2189_Q;
         assign n2689 = BU2189_Q;
      FDE       BU2189(
         .D(BU2189_D),
         .C(BU2189_C),
         .CE(BU2189_CE),
         .Q(BU2189_Q)
      );

      wire BU2191_D;
         assign BU2191_D = n2666;
      wire BU2191_C;
         assign BU2191_C = n183;
      wire BU2191_CE;
         assign BU2191_CE = 1'b1;
      wire BU2191_Q;
         assign n2690 = BU2191_Q;
      FDE       BU2191(
         .D(BU2191_D),
         .C(BU2191_C),
         .CE(BU2191_CE),
         .Q(BU2191_Q)
      );

      wire BU2193_D;
         assign BU2193_D = n2667;
      wire BU2193_C;
         assign BU2193_C = n183;
      wire BU2193_CE;
         assign BU2193_CE = 1'b1;
      wire BU2193_Q;
         assign n2691 = BU2193_Q;
      FDE       BU2193(
         .D(BU2193_D),
         .C(BU2193_C),
         .CE(BU2193_CE),
         .Q(BU2193_Q)
      );

      wire BU2195_D;
         assign BU2195_D = n2668;
      wire BU2195_C;
         assign BU2195_C = n183;
      wire BU2195_CE;
         assign BU2195_CE = 1'b1;
      wire BU2195_Q;
         assign n2692 = BU2195_Q;
      FDE       BU2195(
         .D(BU2195_D),
         .C(BU2195_C),
         .CE(BU2195_CE),
         .Q(BU2195_Q)
      );

      wire BU2197_D;
         assign BU2197_D = n2669;
      wire BU2197_C;
         assign BU2197_C = n183;
      wire BU2197_CE;
         assign BU2197_CE = 1'b1;
      wire BU2197_Q;
         assign n2693 = BU2197_Q;
      FDE       BU2197(
         .D(BU2197_D),
         .C(BU2197_C),
         .CE(BU2197_CE),
         .Q(BU2197_Q)
      );

      wire BU2199_D;
         assign BU2199_D = n2670;
      wire BU2199_C;
         assign BU2199_C = n183;
      wire BU2199_CE;
         assign BU2199_CE = 1'b1;
      wire BU2199_Q;
         assign n2694 = BU2199_Q;
      FDE       BU2199(
         .D(BU2199_D),
         .C(BU2199_C),
         .CE(BU2199_CE),
         .Q(BU2199_Q)
      );

      wire BU2201_D;
         assign BU2201_D = n2671;
      wire BU2201_C;
         assign BU2201_C = n183;
      wire BU2201_CE;
         assign BU2201_CE = 1'b1;
      wire BU2201_Q;
         assign n2695 = BU2201_Q;
      FDE       BU2201(
         .D(BU2201_D),
         .C(BU2201_C),
         .CE(BU2201_CE),
         .Q(BU2201_Q)
      );

      wire BU2203_D;
         assign BU2203_D = n2672;
      wire BU2203_C;
         assign BU2203_C = n183;
      wire BU2203_CE;
         assign BU2203_CE = 1'b1;
      wire BU2203_Q;
         assign n2696 = BU2203_Q;
      FDE       BU2203(
         .D(BU2203_D),
         .C(BU2203_C),
         .CE(BU2203_CE),
         .Q(BU2203_Q)
      );

      wire BU2205_D;
         assign BU2205_D = n2673;
      wire BU2205_C;
         assign BU2205_C = n183;
      wire BU2205_CE;
         assign BU2205_CE = 1'b1;
      wire BU2205_Q;
         assign n2697 = BU2205_Q;
      FDE       BU2205(
         .D(BU2205_D),
         .C(BU2205_C),
         .CE(BU2205_CE),
         .Q(BU2205_Q)
      );

      wire BU2207_D;
         assign BU2207_D = n2674;
      wire BU2207_C;
         assign BU2207_C = n183;
      wire BU2207_CE;
         assign BU2207_CE = 1'b1;
      wire BU2207_Q;
         assign n2698 = BU2207_Q;
      FDE       BU2207(
         .D(BU2207_D),
         .C(BU2207_C),
         .CE(BU2207_CE),
         .Q(BU2207_Q)
      );

      wire BU2209_D;
         assign BU2209_D = n2675;
      wire BU2209_C;
         assign BU2209_C = n183;
      wire BU2209_CE;
         assign BU2209_CE = 1'b1;
      wire BU2209_Q;
         assign n2699 = BU2209_Q;
      FDE       BU2209(
         .D(BU2209_D),
         .C(BU2209_C),
         .CE(BU2209_CE),
         .Q(BU2209_Q)
      );

      wire BU2211_D;
         assign BU2211_D = n2676;
      wire BU2211_C;
         assign BU2211_C = n183;
      wire BU2211_CE;
         assign BU2211_CE = 1'b1;
      wire BU2211_Q;
         assign n2700 = BU2211_Q;
      FDE       BU2211(
         .D(BU2211_D),
         .C(BU2211_C),
         .CE(BU2211_CE),
         .Q(BU2211_Q)
      );

      wire BU2213_D;
         assign BU2213_D = n2677;
      wire BU2213_C;
         assign BU2213_C = n183;
      wire BU2213_CE;
         assign BU2213_CE = 1'b1;
      wire BU2213_Q;
         assign n2701 = BU2213_Q;
      FDE       BU2213(
         .D(BU2213_D),
         .C(BU2213_C),
         .CE(BU2213_CE),
         .Q(BU2213_Q)
      );

      wire BU2215_D;
         assign BU2215_D = n2678;
      wire BU2215_C;
         assign BU2215_C = n183;
      wire BU2215_CE;
         assign BU2215_CE = 1'b1;
      wire BU2215_Q;
         assign n2702 = BU2215_Q;
      FDE       BU2215(
         .D(BU2215_D),
         .C(BU2215_C),
         .CE(BU2215_CE),
         .Q(BU2215_Q)
      );

      wire BU2217_D;
         assign BU2217_D = n2679;
      wire BU2217_C;
         assign BU2217_C = n183;
      wire BU2217_CE;
         assign BU2217_CE = 1'b1;
      wire BU2217_Q;
         assign n2703 = BU2217_Q;
      FDE       BU2217(
         .D(BU2217_D),
         .C(BU2217_C),
         .CE(BU2217_CE),
         .Q(BU2217_Q)
      );

      wire BU2219_D;
         assign BU2219_D = n2680;
      wire BU2219_C;
         assign BU2219_C = n183;
      wire BU2219_CE;
         assign BU2219_CE = 1'b1;
      wire BU2219_Q;
         assign n2704 = BU2219_Q;
      FDE       BU2219(
         .D(BU2219_D),
         .C(BU2219_C),
         .CE(BU2219_CE),
         .Q(BU2219_Q)
      );

      wire [23 : 0] BU2220_MA;
         assign BU2220_MA[0] = n2681;
         assign BU2220_MA[1] = n2682;
         assign BU2220_MA[2] = n2683;
         assign BU2220_MA[3] = n2684;
         assign BU2220_MA[4] = n2685;
         assign BU2220_MA[5] = n2686;
         assign BU2220_MA[6] = n2687;
         assign BU2220_MA[7] = n2688;
         assign BU2220_MA[8] = n2689;
         assign BU2220_MA[9] = n2690;
         assign BU2220_MA[10] = n2691;
         assign BU2220_MA[11] = n2692;
         assign BU2220_MA[12] = n2693;
         assign BU2220_MA[13] = n2694;
         assign BU2220_MA[14] = n2695;
         assign BU2220_MA[15] = n2696;
         assign BU2220_MA[16] = n2697;
         assign BU2220_MA[17] = n2698;
         assign BU2220_MA[18] = n2699;
         assign BU2220_MA[19] = n2700;
         assign BU2220_MA[20] = n2701;
         assign BU2220_MA[21] = n2702;
         assign BU2220_MA[22] = n2703;
         assign BU2220_MA[23] = n2704;
      wire [23 : 0] BU2220_MB;
         assign BU2220_MB[0] = n2633;
         assign BU2220_MB[1] = n2634;
         assign BU2220_MB[2] = n2635;
         assign BU2220_MB[3] = n2636;
         assign BU2220_MB[4] = n2637;
         assign BU2220_MB[5] = n2638;
         assign BU2220_MB[6] = n2639;
         assign BU2220_MB[7] = n2640;
         assign BU2220_MB[8] = n2641;
         assign BU2220_MB[9] = n2642;
         assign BU2220_MB[10] = n2643;
         assign BU2220_MB[11] = n2644;
         assign BU2220_MB[12] = n2645;
         assign BU2220_MB[13] = n2646;
         assign BU2220_MB[14] = n2647;
         assign BU2220_MB[15] = n2648;
         assign BU2220_MB[16] = n2649;
         assign BU2220_MB[17] = n2650;
         assign BU2220_MB[18] = n2651;
         assign BU2220_MB[19] = n2652;
         assign BU2220_MB[20] = n2653;
         assign BU2220_MB[21] = n2654;
         assign BU2220_MB[22] = n2655;
         assign BU2220_MB[23] = n2656;
      wire [0 : 0] BU2220_S;
         assign BU2220_S[0] = n2705;
      wire [23 : 0] BU2220_Q;
         assign n58 = BU2220_Q[0];
         assign n59 = BU2220_Q[1];
         assign n60 = BU2220_Q[2];
         assign n61 = BU2220_Q[3];
         assign n62 = BU2220_Q[4];
         assign n63 = BU2220_Q[5];
         assign n64 = BU2220_Q[6];
         assign n65 = BU2220_Q[7];
         assign n66 = BU2220_Q[8];
         assign n67 = BU2220_Q[9];
         assign n68 = BU2220_Q[10];
         assign n69 = BU2220_Q[11];
         assign n70 = BU2220_Q[12];
         assign n71 = BU2220_Q[13];
         assign n72 = BU2220_Q[14];
         assign n73 = BU2220_Q[15];
         assign n74 = BU2220_Q[16];
         assign n75 = BU2220_Q[17];
         assign n76 = BU2220_Q[18];
         assign n77 = BU2220_Q[19];
         assign n78 = BU2220_Q[20];
         assign n79 = BU2220_Q[21];
         assign n80 = BU2220_Q[22];
         assign n81 = BU2220_Q[23];
      wire BU2220_CLK;
         assign BU2220_CLK = n183;
      C_MUX_BUS_V5_0 #(
         "000000000000000000000000"    /* c_ainit_val*/,
         0    /* c_enable_rlocs*/,
         0    /* c_has_aclr*/,
         0    /* c_has_ainit*/,
         0    /* c_has_aset*/,
         0    /* c_has_ce*/,
         0    /* c_has_en*/,
         0    /* c_has_o*/,
         1    /* c_has_q*/,
         0    /* c_has_sclr*/,
         0    /* c_has_sinit*/,
         0    /* c_has_sset*/,
         2    /* c_inputs*/,
         1    /* c_latency*/,
         0    /* c_mux_type*/,
         1    /* c_sel_width*/,
         "000000000000000000000000"    /* c_sinit_val*/,
         0    /* c_sync_enable*/,
         0    /* c_sync_priority*/,
         24    /* c_width*/
      )
      BU2220(
         .MA(BU2220_MA),
         .MB(BU2220_MB),
         .S(BU2220_S),
         .Q(BU2220_Q),
         .CLK(BU2220_CLK)
      );

      wire BU2448_D;
         assign BU2448_D = n2705;
      wire BU2448_C;
         assign BU2448_C = n183;
      wire BU2448_CE;
         assign BU2448_CE = 1'b1;
      wire BU2448_Q;
         assign n2706 = BU2448_Q;
      FDE       BU2448(
         .D(BU2448_D),
         .C(BU2448_C),
         .CE(BU2448_CE),
         .Q(BU2448_Q)
      );

      defparam BU2452.INIT = 'heeee;
      wire BU2452_I0;
         assign BU2452_I0 = n2705;
      wire BU2452_I1;
         assign BU2452_I1 = n2706;
      wire BU2452_I2;
         assign BU2452_I2 = 1'b0;
      wire BU2452_I3;
         assign BU2452_I3 = 1'b0;
      wire BU2452_O;
         assign n4473 = BU2452_O;
      LUT4       BU2452(
         .I0(BU2452_I0),
         .I1(BU2452_I1),
         .I2(BU2452_I2),
         .I3(BU2452_I3),
         .O(BU2452_O)
      );

      wire BU2453_D;
         assign BU2453_D = n4473;
      wire BU2453_C;
         assign BU2453_C = n183;
      wire BU2453_CE;
         assign BU2453_CE = 1'b1;
      wire BU2453_Q;
         assign n55 = BU2453_Q;
      FDE       BU2453(
         .D(BU2453_D),
         .C(BU2453_C),
         .CE(BU2453_CE),
         .Q(BU2453_Q)
      );

      wire [23 : 0] BU2692_DIN;
         assign BU2692_DIN[0] = n3;
         assign BU2692_DIN[1] = n4;
         assign BU2692_DIN[2] = n5;
         assign BU2692_DIN[3] = n6;
         assign BU2692_DIN[4] = n7;
         assign BU2692_DIN[5] = n8;
         assign BU2692_DIN[6] = n9;
         assign BU2692_DIN[7] = n10;
         assign BU2692_DIN[8] = n11;
         assign BU2692_DIN[9] = n12;
         assign BU2692_DIN[10] = n13;
         assign BU2692_DIN[11] = n14;
         assign BU2692_DIN[12] = n15;
         assign BU2692_DIN[13] = n16;
         assign BU2692_DIN[14] = n17;
         assign BU2692_DIN[15] = n18;
         assign BU2692_DIN[16] = n19;
         assign BU2692_DIN[17] = n20;
         assign BU2692_DIN[18] = n21;
         assign BU2692_DIN[19] = n22;
         assign BU2692_DIN[20] = n23;
         assign BU2692_DIN[21] = n24;
         assign BU2692_DIN[22] = n25;
         assign BU2692_DIN[23] = n26;
      wire BU2692_ND;
         assign BU2692_ND = n2;
      wire BU2692_RFD;
      wire BU2692_CLK;
         assign BU2692_CLK = n183;
      wire [46 : 0] BU2692_DOUT;
         assign n2707 = BU2692_DOUT[0];
         assign n2708 = BU2692_DOUT[1];
         assign n2709 = BU2692_DOUT[2];
         assign n2710 = BU2692_DOUT[3];
         assign n2711 = BU2692_DOUT[4];
         assign n2712 = BU2692_DOUT[5];
         assign n2713 = BU2692_DOUT[6];
         assign n2714 = BU2692_DOUT[7];
         assign n2715 = BU2692_DOUT[8];
         assign n2716 = BU2692_DOUT[9];
         assign n2717 = BU2692_DOUT[10];
         assign n2718 = BU2692_DOUT[11];
         assign n2719 = BU2692_DOUT[12];
         assign n2720 = BU2692_DOUT[13];
         assign n2721 = BU2692_DOUT[14];
         assign n2722 = BU2692_DOUT[15];
         assign n2723 = BU2692_DOUT[16];
         assign n2724 = BU2692_DOUT[17];
         assign n2725 = BU2692_DOUT[18];
         assign n2726 = BU2692_DOUT[19];
         assign n2727 = BU2692_DOUT[20];
         assign n2728 = BU2692_DOUT[21];
         assign n2729 = BU2692_DOUT[22];
         assign n2730 = BU2692_DOUT[23];
         assign n2731 = BU2692_DOUT[24];
         assign n2732 = BU2692_DOUT[25];
         assign n2733 = BU2692_DOUT[26];
         assign n2734 = BU2692_DOUT[27];
         assign n2735 = BU2692_DOUT[28];
         assign n2736 = BU2692_DOUT[29];
         assign n2737 = BU2692_DOUT[30];
         assign n2738 = BU2692_DOUT[31];
         assign n2739 = BU2692_DOUT[32];
         assign n2740 = BU2692_DOUT[33];
         assign n2741 = BU2692_DOUT[34];
         assign n2742 = BU2692_DOUT[35];
         assign n2743 = BU2692_DOUT[36];
         assign n2744 = BU2692_DOUT[37];
         assign n2745 = BU2692_DOUT[38];
         assign n2746 = BU2692_DOUT[39];
         assign n2747 = BU2692_DOUT[40];
         assign n2748 = BU2692_DOUT[41];
         assign n2749 = BU2692_DOUT[42];
         assign n2750 = BU2692_DOUT[43];
         assign n2751 = BU2692_DOUT[44];
         assign n2752 = BU2692_DOUT[45];
         assign n2753 = BU2692_DOUT[46];
      wire BU2692_RDY;
         assign n2754 = BU2692_RDY;
      C_CIC_V3_0 #(
         24    /* c_data_width*/,
         1    /* c_differential_delay*/,
         0    /* c_enable_rlocs*/,
         2    /* c_filter_type*/,
         1    /* c_latency*/,
         1    /* c_number_channels*/,
         47    /* c_result_width*/,
         10    /* c_sample_rate_change*/,
         16383    /* c_sample_rate_change_max*/,
         4    /* c_sample_rate_change_min*/,
         2    /* c_sample_rate_change_type*/,
         7    /* c_stages*/
      )
      BU2692(
         .DIN(BU2692_DIN),
         .ND(BU2692_ND),
         .RFD(BU2692_RFD),
         .CLK(BU2692_CLK),
         .DOUT(BU2692_DOUT),
         .RDY(BU2692_RDY)
      );

      wire [23 : 0] BU7718_DIN;
         assign BU7718_DIN[0] = n27;
         assign BU7718_DIN[1] = n28;
         assign BU7718_DIN[2] = n29;
         assign BU7718_DIN[3] = n30;
         assign BU7718_DIN[4] = n31;
         assign BU7718_DIN[5] = n32;
         assign BU7718_DIN[6] = n33;
         assign BU7718_DIN[7] = n34;
         assign BU7718_DIN[8] = n35;
         assign BU7718_DIN[9] = n36;
         assign BU7718_DIN[10] = n37;
         assign BU7718_DIN[11] = n38;
         assign BU7718_DIN[12] = n39;
         assign BU7718_DIN[13] = n40;
         assign BU7718_DIN[14] = n41;
         assign BU7718_DIN[15] = n42;
         assign BU7718_DIN[16] = n43;
         assign BU7718_DIN[17] = n44;
         assign BU7718_DIN[18] = n45;
         assign BU7718_DIN[19] = n46;
         assign BU7718_DIN[20] = n47;
         assign BU7718_DIN[21] = n48;
         assign BU7718_DIN[22] = n49;
         assign BU7718_DIN[23] = n50;
      wire BU7718_ND;
         assign BU7718_ND = n2;
      wire BU7718_RFD;
      wire BU7718_CLK;
         assign BU7718_CLK = n183;
      wire [46 : 0] BU7718_DOUT;
         assign n2755 = BU7718_DOUT[0];
         assign n2756 = BU7718_DOUT[1];
         assign n2757 = BU7718_DOUT[2];
         assign n2758 = BU7718_DOUT[3];
         assign n2759 = BU7718_DOUT[4];
         assign n2760 = BU7718_DOUT[5];
         assign n2761 = BU7718_DOUT[6];
         assign n2762 = BU7718_DOUT[7];
         assign n2763 = BU7718_DOUT[8];
         assign n2764 = BU7718_DOUT[9];
         assign n2765 = BU7718_DOUT[10];
         assign n2766 = BU7718_DOUT[11];
         assign n2767 = BU7718_DOUT[12];
         assign n2768 = BU7718_DOUT[13];
         assign n2769 = BU7718_DOUT[14];
         assign n2770 = BU7718_DOUT[15];
         assign n2771 = BU7718_DOUT[16];
         assign n2772 = BU7718_DOUT[17];
         assign n2773 = BU7718_DOUT[18];
         assign n2774 = BU7718_DOUT[19];
         assign n2775 = BU7718_DOUT[20];
         assign n2776 = BU7718_DOUT[21];
         assign n2777 = BU7718_DOUT[22];
         assign n2778 = BU7718_DOUT[23];
         assign n2779 = BU7718_DOUT[24];
         assign n2780 = BU7718_DOUT[25];
         assign n2781 = BU7718_DOUT[26];
         assign n2782 = BU7718_DOUT[27];
         assign n2783 = BU7718_DOUT[28];
         assign n2784 = BU7718_DOUT[29];
         assign n2785 = BU7718_DOUT[30];
         assign n2786 = BU7718_DOUT[31];
         assign n2787 = BU7718_DOUT[32];
         assign n2788 = BU7718_DOUT[33];
         assign n2789 = BU7718_DOUT[34];
         assign n2790 = BU7718_DOUT[35];
         assign n2791 = BU7718_DOUT[36];
         assign n2792 = BU7718_DOUT[37];
         assign n2793 = BU7718_DOUT[38];
         assign n2794 = BU7718_DOUT[39];
         assign n2795 = BU7718_DOUT[40];
         assign n2796 = BU7718_DOUT[41];
         assign n2797 = BU7718_DOUT[42];
         assign n2798 = BU7718_DOUT[43];
         assign n2799 = BU7718_DOUT[44];
         assign n2800 = BU7718_DOUT[45];
         assign n2801 = BU7718_DOUT[46];
      wire BU7718_RDY;
      C_CIC_V3_0 #(
         24    /* c_data_width*/,
         1    /* c_differential_delay*/,
         0    /* c_enable_rlocs*/,
         2    /* c_filter_type*/,
         1    /* c_latency*/,
         1    /* c_number_channels*/,
         47    /* c_result_width*/,
         10    /* c_sample_rate_change*/,
         16383    /* c_sample_rate_change_max*/,
         4    /* c_sample_rate_change_min*/,
         2    /* c_sample_rate_change_type*/,
         7    /* c_stages*/
      )
      BU7718(
         .DIN(BU7718_DIN),
         .ND(BU7718_ND),
         .RFD(BU7718_RFD),
         .CLK(BU7718_CLK),
         .DOUT(BU7718_DOUT),
         .RDY(BU7718_RDY)
      );

      defparam BU12513.INIT = 'h8888;
      wire BU12513_I0;
         assign BU12513_I0 = n6747;
      wire BU12513_I1;
         assign BU12513_I1 = n6719;
      wire BU12513_I2;
         assign BU12513_I2 = 1'b0;
      wire BU12513_I3;
         assign BU12513_I3 = 1'b0;
      wire BU12513_O;
         assign n6746 = BU12513_O;
      LUT4       BU12513(
         .I0(BU12513_I0),
         .I1(BU12513_I1),
         .I2(BU12513_I2),
         .I3(BU12513_I3),
         .O(BU12513_O)
      );

      defparam BU12518.INIT = 'h8888;
      wire BU12518_I0;
         assign BU12518_I0 = n55;
      wire BU12518_I1;
         assign BU12518_I1 = 1'b1;
      wire BU12518_I2;
         assign BU12518_I2 = 1'b0;
      wire BU12518_I3;
         assign BU12518_I3 = 1'b0;
      wire BU12518_O;
         assign n6861 = BU12518_O;
      LUT4       BU12518(
         .I0(BU12518_I0),
         .I1(BU12518_I1),
         .I2(BU12518_I2),
         .I3(BU12518_I3),
         .O(BU12518_O)
      );

      defparam BU12524.INIT = 'h0000;
      wire BU12524_D;
         assign BU12524_D = 1'b0;
      wire BU12524_CE;
         assign BU12524_CE = n6861;
      wire BU12524_CLK;
         assign BU12524_CLK = n183;
      wire BU12524_A0;
         assign BU12524_A0 = n6857;
      wire BU12524_A1;
         assign BU12524_A1 = n6858;
      wire BU12524_A2;
         assign BU12524_A2 = n6859;
      wire BU12524_A3;
         assign BU12524_A3 = n6860;
      wire BU12524_Q;
         assign n6720 = BU12524_Q;
      SRL16E       BU12524(
         .D(BU12524_D),
         .CE(BU12524_CE),
         .CLK(BU12524_CLK),
         .A0(BU12524_A0),
         .A1(BU12524_A1),
         .A2(BU12524_A2),
         .A3(BU12524_A3),
         .Q(BU12524_Q)
      );

      defparam BU12525.INIT = 'h0000;
      wire BU12525_D;
         assign BU12525_D = 1'b0;
      wire BU12525_CE;
         assign BU12525_CE = n6861;
      wire BU12525_CLK;
         assign BU12525_CLK = n183;
      wire BU12525_A0;
         assign BU12525_A0 = n6857;
      wire BU12525_A1;
         assign BU12525_A1 = n6858;
      wire BU12525_A2;
         assign BU12525_A2 = n6859;
      wire BU12525_A3;
         assign BU12525_A3 = n6860;
      wire BU12525_Q;
         assign n6721 = BU12525_Q;
      SRL16E       BU12525(
         .D(BU12525_D),
         .CE(BU12525_CE),
         .CLK(BU12525_CLK),
         .A0(BU12525_A0),
         .A1(BU12525_A1),
         .A2(BU12525_A2),
         .A3(BU12525_A3),
         .Q(BU12525_Q)
      );

      defparam BU12526.INIT = 'h0000;
      wire BU12526_D;
         assign BU12526_D = n58;
      wire BU12526_CE;
         assign BU12526_CE = n6861;
      wire BU12526_CLK;
         assign BU12526_CLK = n183;
      wire BU12526_A0;
         assign BU12526_A0 = n6857;
      wire BU12526_A1;
         assign BU12526_A1 = n6858;
      wire BU12526_A2;
         assign BU12526_A2 = n6859;
      wire BU12526_A3;
         assign BU12526_A3 = n6860;
      wire BU12526_Q;
         assign n6722 = BU12526_Q;
      SRL16E       BU12526(
         .D(BU12526_D),
         .CE(BU12526_CE),
         .CLK(BU12526_CLK),
         .A0(BU12526_A0),
         .A1(BU12526_A1),
         .A2(BU12526_A2),
         .A3(BU12526_A3),
         .Q(BU12526_Q)
      );

      defparam BU12527.INIT = 'h0000;
      wire BU12527_D;
         assign BU12527_D = n59;
      wire BU12527_CE;
         assign BU12527_CE = n6861;
      wire BU12527_CLK;
         assign BU12527_CLK = n183;
      wire BU12527_A0;
         assign BU12527_A0 = n6857;
      wire BU12527_A1;
         assign BU12527_A1 = n6858;
      wire BU12527_A2;
         assign BU12527_A2 = n6859;
      wire BU12527_A3;
         assign BU12527_A3 = n6860;
      wire BU12527_Q;
         assign n6723 = BU12527_Q;
      SRL16E       BU12527(
         .D(BU12527_D),
         .CE(BU12527_CE),
         .CLK(BU12527_CLK),
         .A0(BU12527_A0),
         .A1(BU12527_A1),
         .A2(BU12527_A2),
         .A3(BU12527_A3),
         .Q(BU12527_Q)
      );

      defparam BU12528.INIT = 'h0000;
      wire BU12528_D;
         assign BU12528_D = n60;
      wire BU12528_CE;
         assign BU12528_CE = n6861;
      wire BU12528_CLK;
         assign BU12528_CLK = n183;
      wire BU12528_A0;
         assign BU12528_A0 = n6857;
      wire BU12528_A1;
         assign BU12528_A1 = n6858;
      wire BU12528_A2;
         assign BU12528_A2 = n6859;
      wire BU12528_A3;
         assign BU12528_A3 = n6860;
      wire BU12528_Q;
         assign n6724 = BU12528_Q;
      SRL16E       BU12528(
         .D(BU12528_D),
         .CE(BU12528_CE),
         .CLK(BU12528_CLK),
         .A0(BU12528_A0),
         .A1(BU12528_A1),
         .A2(BU12528_A2),
         .A3(BU12528_A3),
         .Q(BU12528_Q)
      );

      defparam BU12529.INIT = 'h0000;
      wire BU12529_D;
         assign BU12529_D = n61;
      wire BU12529_CE;
         assign BU12529_CE = n6861;
      wire BU12529_CLK;
         assign BU12529_CLK = n183;
      wire BU12529_A0;
         assign BU12529_A0 = n6857;
      wire BU12529_A1;
         assign BU12529_A1 = n6858;
      wire BU12529_A2;
         assign BU12529_A2 = n6859;
      wire BU12529_A3;
         assign BU12529_A3 = n6860;
      wire BU12529_Q;
         assign n6725 = BU12529_Q;
      SRL16E       BU12529(
         .D(BU12529_D),
         .CE(BU12529_CE),
         .CLK(BU12529_CLK),
         .A0(BU12529_A0),
         .A1(BU12529_A1),
         .A2(BU12529_A2),
         .A3(BU12529_A3),
         .Q(BU12529_Q)
      );

      defparam BU12530.INIT = 'h0000;
      wire BU12530_D;
         assign BU12530_D = n62;
      wire BU12530_CE;
         assign BU12530_CE = n6861;
      wire BU12530_CLK;
         assign BU12530_CLK = n183;
      wire BU12530_A0;
         assign BU12530_A0 = n6857;
      wire BU12530_A1;
         assign BU12530_A1 = n6858;
      wire BU12530_A2;
         assign BU12530_A2 = n6859;
      wire BU12530_A3;
         assign BU12530_A3 = n6860;
      wire BU12530_Q;
         assign n6726 = BU12530_Q;
      SRL16E       BU12530(
         .D(BU12530_D),
         .CE(BU12530_CE),
         .CLK(BU12530_CLK),
         .A0(BU12530_A0),
         .A1(BU12530_A1),
         .A2(BU12530_A2),
         .A3(BU12530_A3),
         .Q(BU12530_Q)
      );

      defparam BU12531.INIT = 'h0000;
      wire BU12531_D;
         assign BU12531_D = n63;
      wire BU12531_CE;
         assign BU12531_CE = n6861;
      wire BU12531_CLK;
         assign BU12531_CLK = n183;
      wire BU12531_A0;
         assign BU12531_A0 = n6857;
      wire BU12531_A1;
         assign BU12531_A1 = n6858;
      wire BU12531_A2;
         assign BU12531_A2 = n6859;
      wire BU12531_A3;
         assign BU12531_A3 = n6860;
      wire BU12531_Q;
         assign n6727 = BU12531_Q;
      SRL16E       BU12531(
         .D(BU12531_D),
         .CE(BU12531_CE),
         .CLK(BU12531_CLK),
         .A0(BU12531_A0),
         .A1(BU12531_A1),
         .A2(BU12531_A2),
         .A3(BU12531_A3),
         .Q(BU12531_Q)
      );

      defparam BU12532.INIT = 'h0000;
      wire BU12532_D;
         assign BU12532_D = n64;
      wire BU12532_CE;
         assign BU12532_CE = n6861;
      wire BU12532_CLK;
         assign BU12532_CLK = n183;
      wire BU12532_A0;
         assign BU12532_A0 = n6857;
      wire BU12532_A1;
         assign BU12532_A1 = n6858;
      wire BU12532_A2;
         assign BU12532_A2 = n6859;
      wire BU12532_A3;
         assign BU12532_A3 = n6860;
      wire BU12532_Q;
         assign n6728 = BU12532_Q;
      SRL16E       BU12532(
         .D(BU12532_D),
         .CE(BU12532_CE),
         .CLK(BU12532_CLK),
         .A0(BU12532_A0),
         .A1(BU12532_A1),
         .A2(BU12532_A2),
         .A3(BU12532_A3),
         .Q(BU12532_Q)
      );

      defparam BU12533.INIT = 'h0000;
      wire BU12533_D;
         assign BU12533_D = n65;
      wire BU12533_CE;
         assign BU12533_CE = n6861;
      wire BU12533_CLK;
         assign BU12533_CLK = n183;
      wire BU12533_A0;
         assign BU12533_A0 = n6857;
      wire BU12533_A1;
         assign BU12533_A1 = n6858;
      wire BU12533_A2;
         assign BU12533_A2 = n6859;
      wire BU12533_A3;
         assign BU12533_A3 = n6860;
      wire BU12533_Q;
         assign n6729 = BU12533_Q;
      SRL16E       BU12533(
         .D(BU12533_D),
         .CE(BU12533_CE),
         .CLK(BU12533_CLK),
         .A0(BU12533_A0),
         .A1(BU12533_A1),
         .A2(BU12533_A2),
         .A3(BU12533_A3),
         .Q(BU12533_Q)
      );

      defparam BU12534.INIT = 'h0000;
      wire BU12534_D;
         assign BU12534_D = n66;
      wire BU12534_CE;
         assign BU12534_CE = n6861;
      wire BU12534_CLK;
         assign BU12534_CLK = n183;
      wire BU12534_A0;
         assign BU12534_A0 = n6857;
      wire BU12534_A1;
         assign BU12534_A1 = n6858;
      wire BU12534_A2;
         assign BU12534_A2 = n6859;
      wire BU12534_A3;
         assign BU12534_A3 = n6860;
      wire BU12534_Q;
         assign n6730 = BU12534_Q;
      SRL16E       BU12534(
         .D(BU12534_D),
         .CE(BU12534_CE),
         .CLK(BU12534_CLK),
         .A0(BU12534_A0),
         .A1(BU12534_A1),
         .A2(BU12534_A2),
         .A3(BU12534_A3),
         .Q(BU12534_Q)
      );

      defparam BU12535.INIT = 'h0000;
      wire BU12535_D;
         assign BU12535_D = n67;
      wire BU12535_CE;
         assign BU12535_CE = n6861;
      wire BU12535_CLK;
         assign BU12535_CLK = n183;
      wire BU12535_A0;
         assign BU12535_A0 = n6857;
      wire BU12535_A1;
         assign BU12535_A1 = n6858;
      wire BU12535_A2;
         assign BU12535_A2 = n6859;
      wire BU12535_A3;
         assign BU12535_A3 = n6860;
      wire BU12535_Q;
         assign n6731 = BU12535_Q;
      SRL16E       BU12535(
         .D(BU12535_D),
         .CE(BU12535_CE),
         .CLK(BU12535_CLK),
         .A0(BU12535_A0),
         .A1(BU12535_A1),
         .A2(BU12535_A2),
         .A3(BU12535_A3),
         .Q(BU12535_Q)
      );

      defparam BU12536.INIT = 'h0000;
      wire BU12536_D;
         assign BU12536_D = n68;
      wire BU12536_CE;
         assign BU12536_CE = n6861;
      wire BU12536_CLK;
         assign BU12536_CLK = n183;
      wire BU12536_A0;
         assign BU12536_A0 = n6857;
      wire BU12536_A1;
         assign BU12536_A1 = n6858;
      wire BU12536_A2;
         assign BU12536_A2 = n6859;
      wire BU12536_A3;
         assign BU12536_A3 = n6860;
      wire BU12536_Q;
         assign n6732 = BU12536_Q;
      SRL16E       BU12536(
         .D(BU12536_D),
         .CE(BU12536_CE),
         .CLK(BU12536_CLK),
         .A0(BU12536_A0),
         .A1(BU12536_A1),
         .A2(BU12536_A2),
         .A3(BU12536_A3),
         .Q(BU12536_Q)
      );

      defparam BU12537.INIT = 'h0000;
      wire BU12537_D;
         assign BU12537_D = n69;
      wire BU12537_CE;
         assign BU12537_CE = n6861;
      wire BU12537_CLK;
         assign BU12537_CLK = n183;
      wire BU12537_A0;
         assign BU12537_A0 = n6857;
      wire BU12537_A1;
         assign BU12537_A1 = n6858;
      wire BU12537_A2;
         assign BU12537_A2 = n6859;
      wire BU12537_A3;
         assign BU12537_A3 = n6860;
      wire BU12537_Q;
         assign n6733 = BU12537_Q;
      SRL16E       BU12537(
         .D(BU12537_D),
         .CE(BU12537_CE),
         .CLK(BU12537_CLK),
         .A0(BU12537_A0),
         .A1(BU12537_A1),
         .A2(BU12537_A2),
         .A3(BU12537_A3),
         .Q(BU12537_Q)
      );

      defparam BU12538.INIT = 'h0000;
      wire BU12538_D;
         assign BU12538_D = n70;
      wire BU12538_CE;
         assign BU12538_CE = n6861;
      wire BU12538_CLK;
         assign BU12538_CLK = n183;
      wire BU12538_A0;
         assign BU12538_A0 = n6857;
      wire BU12538_A1;
         assign BU12538_A1 = n6858;
      wire BU12538_A2;
         assign BU12538_A2 = n6859;
      wire BU12538_A3;
         assign BU12538_A3 = n6860;
      wire BU12538_Q;
         assign n6734 = BU12538_Q;
      SRL16E       BU12538(
         .D(BU12538_D),
         .CE(BU12538_CE),
         .CLK(BU12538_CLK),
         .A0(BU12538_A0),
         .A1(BU12538_A1),
         .A2(BU12538_A2),
         .A3(BU12538_A3),
         .Q(BU12538_Q)
      );

      defparam BU12539.INIT = 'h0000;
      wire BU12539_D;
         assign BU12539_D = n71;
      wire BU12539_CE;
         assign BU12539_CE = n6861;
      wire BU12539_CLK;
         assign BU12539_CLK = n183;
      wire BU12539_A0;
         assign BU12539_A0 = n6857;
      wire BU12539_A1;
         assign BU12539_A1 = n6858;
      wire BU12539_A2;
         assign BU12539_A2 = n6859;
      wire BU12539_A3;
         assign BU12539_A3 = n6860;
      wire BU12539_Q;
         assign n6735 = BU12539_Q;
      SRL16E       BU12539(
         .D(BU12539_D),
         .CE(BU12539_CE),
         .CLK(BU12539_CLK),
         .A0(BU12539_A0),
         .A1(BU12539_A1),
         .A2(BU12539_A2),
         .A3(BU12539_A3),
         .Q(BU12539_Q)
      );

      defparam BU12540.INIT = 'h0000;
      wire BU12540_D;
         assign BU12540_D = n72;
      wire BU12540_CE;
         assign BU12540_CE = n6861;
      wire BU12540_CLK;
         assign BU12540_CLK = n183;
      wire BU12540_A0;
         assign BU12540_A0 = n6857;
      wire BU12540_A1;
         assign BU12540_A1 = n6858;
      wire BU12540_A2;
         assign BU12540_A2 = n6859;
      wire BU12540_A3;
         assign BU12540_A3 = n6860;
      wire BU12540_Q;
         assign n6736 = BU12540_Q;
      SRL16E       BU12540(
         .D(BU12540_D),
         .CE(BU12540_CE),
         .CLK(BU12540_CLK),
         .A0(BU12540_A0),
         .A1(BU12540_A1),
         .A2(BU12540_A2),
         .A3(BU12540_A3),
         .Q(BU12540_Q)
      );

      defparam BU12541.INIT = 'h0000;
      wire BU12541_D;
         assign BU12541_D = n73;
      wire BU12541_CE;
         assign BU12541_CE = n6861;
      wire BU12541_CLK;
         assign BU12541_CLK = n183;
      wire BU12541_A0;
         assign BU12541_A0 = n6857;
      wire BU12541_A1;
         assign BU12541_A1 = n6858;
      wire BU12541_A2;
         assign BU12541_A2 = n6859;
      wire BU12541_A3;
         assign BU12541_A3 = n6860;
      wire BU12541_Q;
         assign n6737 = BU12541_Q;
      SRL16E       BU12541(
         .D(BU12541_D),
         .CE(BU12541_CE),
         .CLK(BU12541_CLK),
         .A0(BU12541_A0),
         .A1(BU12541_A1),
         .A2(BU12541_A2),
         .A3(BU12541_A3),
         .Q(BU12541_Q)
      );

      defparam BU12542.INIT = 'h0000;
      wire BU12542_D;
         assign BU12542_D = n74;
      wire BU12542_CE;
         assign BU12542_CE = n6861;
      wire BU12542_CLK;
         assign BU12542_CLK = n183;
      wire BU12542_A0;
         assign BU12542_A0 = n6857;
      wire BU12542_A1;
         assign BU12542_A1 = n6858;
      wire BU12542_A2;
         assign BU12542_A2 = n6859;
      wire BU12542_A3;
         assign BU12542_A3 = n6860;
      wire BU12542_Q;
         assign n6738 = BU12542_Q;
      SRL16E       BU12542(
         .D(BU12542_D),
         .CE(BU12542_CE),
         .CLK(BU12542_CLK),
         .A0(BU12542_A0),
         .A1(BU12542_A1),
         .A2(BU12542_A2),
         .A3(BU12542_A3),
         .Q(BU12542_Q)
      );

      defparam BU12543.INIT = 'h0000;
      wire BU12543_D;
         assign BU12543_D = n75;
      wire BU12543_CE;
         assign BU12543_CE = n6861;
      wire BU12543_CLK;
         assign BU12543_CLK = n183;
      wire BU12543_A0;
         assign BU12543_A0 = n6857;
      wire BU12543_A1;
         assign BU12543_A1 = n6858;
      wire BU12543_A2;
         assign BU12543_A2 = n6859;
      wire BU12543_A3;
         assign BU12543_A3 = n6860;
      wire BU12543_Q;
         assign n6739 = BU12543_Q;
      SRL16E       BU12543(
         .D(BU12543_D),
         .CE(BU12543_CE),
         .CLK(BU12543_CLK),
         .A0(BU12543_A0),
         .A1(BU12543_A1),
         .A2(BU12543_A2),
         .A3(BU12543_A3),
         .Q(BU12543_Q)
      );

      defparam BU12544.INIT = 'h0000;
      wire BU12544_D;
         assign BU12544_D = n76;
      wire BU12544_CE;
         assign BU12544_CE = n6861;
      wire BU12544_CLK;
         assign BU12544_CLK = n183;
      wire BU12544_A0;
         assign BU12544_A0 = n6857;
      wire BU12544_A1;
         assign BU12544_A1 = n6858;
      wire BU12544_A2;
         assign BU12544_A2 = n6859;
      wire BU12544_A3;
         assign BU12544_A3 = n6860;
      wire BU12544_Q;
         assign n6740 = BU12544_Q;
      SRL16E       BU12544(
         .D(BU12544_D),
         .CE(BU12544_CE),
         .CLK(BU12544_CLK),
         .A0(BU12544_A0),
         .A1(BU12544_A1),
         .A2(BU12544_A2),
         .A3(BU12544_A3),
         .Q(BU12544_Q)
      );

      defparam BU12545.INIT = 'h0000;
      wire BU12545_D;
         assign BU12545_D = n77;
      wire BU12545_CE;
         assign BU12545_CE = n6861;
      wire BU12545_CLK;
         assign BU12545_CLK = n183;
      wire BU12545_A0;
         assign BU12545_A0 = n6857;
      wire BU12545_A1;
         assign BU12545_A1 = n6858;
      wire BU12545_A2;
         assign BU12545_A2 = n6859;
      wire BU12545_A3;
         assign BU12545_A3 = n6860;
      wire BU12545_Q;
         assign n6741 = BU12545_Q;
      SRL16E       BU12545(
         .D(BU12545_D),
         .CE(BU12545_CE),
         .CLK(BU12545_CLK),
         .A0(BU12545_A0),
         .A1(BU12545_A1),
         .A2(BU12545_A2),
         .A3(BU12545_A3),
         .Q(BU12545_Q)
      );

      defparam BU12546.INIT = 'h0000;
      wire BU12546_D;
         assign BU12546_D = n78;
      wire BU12546_CE;
         assign BU12546_CE = n6861;
      wire BU12546_CLK;
         assign BU12546_CLK = n183;
      wire BU12546_A0;
         assign BU12546_A0 = n6857;
      wire BU12546_A1;
         assign BU12546_A1 = n6858;
      wire BU12546_A2;
         assign BU12546_A2 = n6859;
      wire BU12546_A3;
         assign BU12546_A3 = n6860;
      wire BU12546_Q;
         assign n6742 = BU12546_Q;
      SRL16E       BU12546(
         .D(BU12546_D),
         .CE(BU12546_CE),
         .CLK(BU12546_CLK),
         .A0(BU12546_A0),
         .A1(BU12546_A1),
         .A2(BU12546_A2),
         .A3(BU12546_A3),
         .Q(BU12546_Q)
      );

      defparam BU12547.INIT = 'h0000;
      wire BU12547_D;
         assign BU12547_D = n79;
      wire BU12547_CE;
         assign BU12547_CE = n6861;
      wire BU12547_CLK;
         assign BU12547_CLK = n183;
      wire BU12547_A0;
         assign BU12547_A0 = n6857;
      wire BU12547_A1;
         assign BU12547_A1 = n6858;
      wire BU12547_A2;
         assign BU12547_A2 = n6859;
      wire BU12547_A3;
         assign BU12547_A3 = n6860;
      wire BU12547_Q;
         assign n6743 = BU12547_Q;
      SRL16E       BU12547(
         .D(BU12547_D),
         .CE(BU12547_CE),
         .CLK(BU12547_CLK),
         .A0(BU12547_A0),
         .A1(BU12547_A1),
         .A2(BU12547_A2),
         .A3(BU12547_A3),
         .Q(BU12547_Q)
      );

      defparam BU12548.INIT = 'h0000;
      wire BU12548_D;
         assign BU12548_D = n80;
      wire BU12548_CE;
         assign BU12548_CE = n6861;
      wire BU12548_CLK;
         assign BU12548_CLK = n183;
      wire BU12548_A0;
         assign BU12548_A0 = n6857;
      wire BU12548_A1;
         assign BU12548_A1 = n6858;
      wire BU12548_A2;
         assign BU12548_A2 = n6859;
      wire BU12548_A3;
         assign BU12548_A3 = n6860;
      wire BU12548_Q;
         assign n6744 = BU12548_Q;
      SRL16E       BU12548(
         .D(BU12548_D),
         .CE(BU12548_CE),
         .CLK(BU12548_CLK),
         .A0(BU12548_A0),
         .A1(BU12548_A1),
         .A2(BU12548_A2),
         .A3(BU12548_A3),
         .Q(BU12548_Q)
      );

      defparam BU12549.INIT = 'h0000;
      wire BU12549_D;
         assign BU12549_D = n81;
      wire BU12549_CE;
         assign BU12549_CE = n6861;
      wire BU12549_CLK;
         assign BU12549_CLK = n183;
      wire BU12549_A0;
         assign BU12549_A0 = n6857;
      wire BU12549_A1;
         assign BU12549_A1 = n6858;
      wire BU12549_A2;
         assign BU12549_A2 = n6859;
      wire BU12549_A3;
         assign BU12549_A3 = n6860;
      wire BU12549_Q;
         assign n6745 = BU12549_Q;
      SRL16E       BU12549(
         .D(BU12549_D),
         .CE(BU12549_CE),
         .CLK(BU12549_CLK),
         .A0(BU12549_A0),
         .A1(BU12549_A1),
         .A2(BU12549_A2),
         .A3(BU12549_A3),
         .Q(BU12549_Q)
      );

      wire [3 : 0] BU12550_Q;
         assign n6857 = BU12550_Q[0];
         assign n6858 = BU12550_Q[1];
         assign n6859 = BU12550_Q[2];
         assign n6860 = BU12550_Q[3];
      wire BU12550_CLK;
         assign BU12550_CLK = n183;
      wire BU12550_UP;
         assign BU12550_UP = n6861;
      wire BU12550_CE;
         assign BU12550_CE = n6862;
      C_COUNTER_BINARY_V5_0 #(
         "0000"    /* c_ainit_val*/,
         "0001"    /* c_count_by*/,
         2    /* c_count_mode*/,
         "0000"    /* c_count_to*/,
         0    /* c_enable_rlocs*/,
         0    /* c_has_aclr*/,
         0    /* c_has_ainit*/,
         0    /* c_has_aset*/,
         1    /* c_has_ce*/,
         0    /* c_has_iv*/,
         0    /* c_has_l*/,
         0    /* c_has_load*/,
         0    /* c_has_q_thresh0*/,
         0    /* c_has_q_thresh1*/,
         0    /* c_has_sclr*/,
         0    /* c_has_sinit*/,
         0    /* c_has_sset*/,
         0    /* c_has_thresh0*/,
         0    /* c_has_thresh1*/,
         0    /* c_has_up*/,
         0    /* c_load_enable*/,
         0    /* c_load_low*/,
         0    /* c_pipe_stages*/,
         0    /* c_restrict_count*/,
         "0000"    /* c_sinit_val*/,
         0    /* c_sync_enable*/,
         0    /* c_sync_priority*/,
         "0000"    /* c_thresh0_value*/,
         "0000"    /* c_thresh1_value*/,
         0    /* c_thresh_early*/,
         4    /* c_width*/
      )
      BU12550(
         .Q(BU12550_Q),
         .CLK(BU12550_CLK),
         .UP(BU12550_UP),
         .CE(BU12550_CE)
      );

      defparam BU12579.INIT = 'h4060;
      wire BU12579_I0;
         assign BU12579_I0 = n6746;
      wire BU12579_I1;
         assign BU12579_I1 = n6861;
      wire BU12579_I2;
         assign BU12579_I2 = n6747;
      wire BU12579_I3;
         assign BU12579_I3 = n6863;
      wire BU12579_O;
         assign n6862 = BU12579_O;
      LUT4       BU12579(
         .I0(BU12579_I0),
         .I1(BU12579_I1),
         .I2(BU12579_I2),
         .I3(BU12579_I3),
         .O(BU12579_O)
      );

      defparam BU12583.INIT = 'he2ea;
      wire BU12583_I0;
         assign BU12583_I0 = n6747;
      wire BU12583_I1;
         assign BU12583_I1 = n6863;
      wire BU12583_I2;
         assign BU12583_I2 = n6861;
      wire BU12583_I3;
         assign BU12583_I3 = n6746;
      wire BU12583_O;
         assign n7206 = BU12583_O;
      LUT4       BU12583(
         .I0(BU12583_I0),
         .I1(BU12583_I1),
         .I2(BU12583_I2),
         .I3(BU12583_I3),
         .O(BU12583_O)
      );

      wire BU12584_D;
         assign BU12584_D = n7206;
      wire BU12584_C;
         assign BU12584_C = n183;
      wire BU12584_CE;
         assign BU12584_CE = 1'b1;
      wire BU12584_Q;
         assign n6747 = BU12584_Q;
      FDE       BU12584(
         .D(BU12584_D),
         .C(BU12584_C),
         .CE(BU12584_CE),
         .Q(BU12584_Q)
      );

      defparam BU12587.INIT = 'h0001;
      wire BU12587_I0;
         assign BU12587_I0 = n6857;
      wire BU12587_I1;
         assign BU12587_I1 = n6858;
      wire BU12587_I2;
         assign BU12587_I2 = n6859;
      wire BU12587_I3;
         assign BU12587_I3 = n6860;
      wire BU12587_O;
         assign n6863 = BU12587_O;
      LUT4       BU12587(
         .I0(BU12587_I0),
         .I1(BU12587_I1),
         .I2(BU12587_I2),
         .I3(BU12587_I3),
         .O(BU12587_O)
      );

      wire BU12588_ND;
         assign BU12588_ND = n6747;
      wire BU12588_RDY;
         assign n6791 = BU12588_RDY;
      wire BU12588_CLK;
         assign BU12588_CLK = n183;
      wire BU12588_RFD;
         assign n6719 = BU12588_RFD;
      wire [25 : 0] BU12588_DIN;
         assign BU12588_DIN[0] = n6720;
         assign BU12588_DIN[1] = n6721;
         assign BU12588_DIN[2] = n6722;
         assign BU12588_DIN[3] = n6723;
         assign BU12588_DIN[4] = n6724;
         assign BU12588_DIN[5] = n6725;
         assign BU12588_DIN[6] = n6726;
         assign BU12588_DIN[7] = n6727;
         assign BU12588_DIN[8] = n6728;
         assign BU12588_DIN[9] = n6729;
         assign BU12588_DIN[10] = n6730;
         assign BU12588_DIN[11] = n6731;
         assign BU12588_DIN[12] = n6732;
         assign BU12588_DIN[13] = n6733;
         assign BU12588_DIN[14] = n6734;
         assign BU12588_DIN[15] = n6735;
         assign BU12588_DIN[16] = n6736;
         assign BU12588_DIN[17] = n6737;
         assign BU12588_DIN[18] = n6738;
         assign BU12588_DIN[19] = n6739;
         assign BU12588_DIN[20] = n6740;
         assign BU12588_DIN[21] = n6741;
         assign BU12588_DIN[22] = n6742;
         assign BU12588_DIN[23] = n6743;
         assign BU12588_DIN[24] = n6744;
         assign BU12588_DIN[25] = n6745;
      wire [42 : 0] BU12588_DOUT;
         assign n6748 = BU12588_DOUT[0];
         assign n6749 = BU12588_DOUT[1];
         assign n6750 = BU12588_DOUT[2];
         assign n6751 = BU12588_DOUT[3];
         assign n6752 = BU12588_DOUT[4];
         assign n6753 = BU12588_DOUT[5];
         assign n6754 = BU12588_DOUT[6];
         assign n6755 = BU12588_DOUT[7];
         assign n6756 = BU12588_DOUT[8];
         assign n6757 = BU12588_DOUT[9];
         assign n6758 = BU12588_DOUT[10];
         assign n6759 = BU12588_DOUT[11];
         assign n6760 = BU12588_DOUT[12];
         assign n6761 = BU12588_DOUT[13];
         assign n6762 = BU12588_DOUT[14];
         assign n6763 = BU12588_DOUT[15];
         assign n6764 = BU12588_DOUT[16];
         assign n6765 = BU12588_DOUT[17];
         assign n6766 = BU12588_DOUT[18];
         assign n6767 = BU12588_DOUT[19];
         assign n6768 = BU12588_DOUT[20];
         assign n6769 = BU12588_DOUT[21];
         assign n6770 = BU12588_DOUT[22];
         assign n6771 = BU12588_DOUT[23];
         assign n6772 = BU12588_DOUT[24];
         assign n6773 = BU12588_DOUT[25];
         assign n6774 = BU12588_DOUT[26];
         assign n6775 = BU12588_DOUT[27];
         assign n6776 = BU12588_DOUT[28];
         assign n6777 = BU12588_DOUT[29];
         assign n6778 = BU12588_DOUT[30];
         assign n6779 = BU12588_DOUT[31];
         assign n6780 = BU12588_DOUT[32];
         assign n6781 = BU12588_DOUT[33];
         assign n6782 = BU12588_DOUT[34];
         assign n6783 = BU12588_DOUT[35];
         assign n6784 = BU12588_DOUT[36];
         assign n6785 = BU12588_DOUT[37];
         assign n6786 = BU12588_DOUT[38];
         assign n6787 = BU12588_DOUT[39];
         assign n6788 = BU12588_DOUT[40];
         assign n6789 = BU12588_DOUT[41];
         assign n6790 = BU12588_DOUT[42];
      C_DA_FIR_V7_0 #(
         6    /* c_baat*/,
         2    /* c_channels*/,
         0    /* c_coeff_type*/,
         16    /* c_coeff_width*/,
         0    /* c_data_type*/,
         26    /* c_data_width*/,
         0    /* c_enable_rlocs*/,
         0    /* c_filter_type*/,
         0    /* c_has_reset*/,
         0    /* c_has_sel_i*/,
         0    /* c_has_sel_o*/,
         0    /* c_has_sin_f*/,
         0    /* c_has_sin_r*/,
         0    /* c_has_sout_f*/,
         0    /* c_has_sout_r*/,
         15    /* c_latency*/,
         "myddc_CFIR.mif"    /* c_mem_init_file*/,
         1    /* c_optimize*/,
         1    /* c_polyphase_factor*/,
         0    /* c_reg_output*/,
         0    /* c_reload*/,
         401    /* c_reload_delay*/,
         2    /* c_reload_mem_type*/,
         0    /* c_response*/,
         43    /* c_result_width*/,
         0    /* c_saturate*/,
         0    /* c_shape*/,
         45    /* c_taps*/,
         0    /* c_use_model_func*/,
         1    /* c_zpf*/
      )
      BU12588(
         .ND(BU12588_ND),
         .RDY(BU12588_RDY),
         .CLK(BU12588_CLK),
         .RFD(BU12588_RFD),
         .DIN(BU12588_DIN),
         .DOUT(BU12588_DOUT)
      );

      wire [12 : 0] BU19118_I;
         assign BU19118_I[0] = n6748;
         assign BU19118_I[1] = n6749;
         assign BU19118_I[2] = n6750;
         assign BU19118_I[3] = n6751;
         assign BU19118_I[4] = n6752;
         assign BU19118_I[5] = n6753;
         assign BU19118_I[6] = n6754;
         assign BU19118_I[7] = n6755;
         assign BU19118_I[8] = n6756;
         assign BU19118_I[9] = n6757;
         assign BU19118_I[10] = n6758;
         assign BU19118_I[11] = n6759;
         assign BU19118_I[12] = n6760;
      wire BU19118_O;
         assign n7367 = BU19118_O;
      C_GATE_BIT_V5_0 #(
         "0"    /* c_ainit_val*/,
         0    /* c_enable_rlocs*/,
         0    /* c_gate_type*/,
         0    /* c_has_aclr*/,
         0    /* c_has_ainit*/,
         0    /* c_has_aset*/,
         0    /* c_has_ce*/,
         1    /* c_has_o*/,
         0    /* c_has_q*/,
         0    /* c_has_sclr*/,
         0    /* c_has_sinit*/,
         0    /* c_has_sset*/,
         13    /* c_inputs*/,
         "0111111111111"    /* c_input_inv_mask*/,
         0    /* c_pipe_stages*/,
         "0"    /* c_sinit_val*/,
         0    /* c_sync_enable*/,
         1    /* c_sync_priority*/
      )
      BU19118(
         .I(BU19118_I),
         .O(BU19118_O)
      );

      defparam BU19133.INIT = 'h8c8c;
      wire BU19133_I0;
         assign BU19133_I0 = n6761;
      wire BU19133_I1;
         assign BU19133_I1 = n6760;
      wire BU19133_I2;
         assign BU19133_I2 = n7367;
      wire BU19133_I3;
         assign BU19133_I3 = 1'b0;
      wire BU19133_O;
         assign n7364 = BU19133_O;
      LUT4       BU19133(
         .I0(BU19133_I0),
         .I1(BU19133_I1),
         .I2(BU19133_I2),
         .I3(BU19133_I3),
         .O(BU19133_O)
      );

      wire [29 : 0] BU19134_A;
         assign BU19134_A[0] = n6761;
         assign BU19134_A[1] = n6762;
         assign BU19134_A[2] = n6763;
         assign BU19134_A[3] = n6764;
         assign BU19134_A[4] = n6765;
         assign BU19134_A[5] = n6766;
         assign BU19134_A[6] = n6767;
         assign BU19134_A[7] = n6768;
         assign BU19134_A[8] = n6769;
         assign BU19134_A[9] = n6770;
         assign BU19134_A[10] = n6771;
         assign BU19134_A[11] = n6772;
         assign BU19134_A[12] = n6773;
         assign BU19134_A[13] = n6774;
         assign BU19134_A[14] = n6775;
         assign BU19134_A[15] = n6776;
         assign BU19134_A[16] = n6777;
         assign BU19134_A[17] = n6778;
         assign BU19134_A[18] = n6779;
         assign BU19134_A[19] = n6780;
         assign BU19134_A[20] = n6781;
         assign BU19134_A[21] = n6782;
         assign BU19134_A[22] = n6783;
         assign BU19134_A[23] = n6784;
         assign BU19134_A[24] = n6785;
         assign BU19134_A[25] = n6786;
         assign BU19134_A[26] = n6787;
         assign BU19134_A[27] = n6788;
         assign BU19134_A[28] = n6789;
         assign BU19134_A[29] = n6790;
      wire [0 : 0] BU19134_B;
         assign BU19134_B[0] = n7364;
      wire [30 : 0] BU19134_S;
         assign n7333 = BU19134_S[0];
         assign n7334 = BU19134_S[1];
         assign n7335 = BU19134_S[2];
         assign n7336 = BU19134_S[3];
         assign n7337 = BU19134_S[4];
         assign n7338 = BU19134_S[5];
         assign n7339 = BU19134_S[6];
         assign n7340 = BU19134_S[7];
         assign n7341 = BU19134_S[8];
         assign n7342 = BU19134_S[9];
         assign n7343 = BU19134_S[10];
         assign n7344 = BU19134_S[11];
         assign n7345 = BU19134_S[12];
         assign n7346 = BU19134_S[13];
         assign n7347 = BU19134_S[14];
         assign n7348 = BU19134_S[15];
         assign n7349 = BU19134_S[16];
         assign n7350 = BU19134_S[17];
         assign n7351 = BU19134_S[18];
         assign n7352 = BU19134_S[19];
         assign n7353 = BU19134_S[20];
         assign n7354 = BU19134_S[21];
         assign n7355 = BU19134_S[22];
         assign n7356 = BU19134_S[23];
         assign n7357 = BU19134_S[24];
         assign n7358 = BU19134_S[25];
         assign n7359 = BU19134_S[26];
         assign n7360 = BU19134_S[27];
         assign n7361 = BU19134_S[28];
         assign n7362 = BU19134_S[29];
      C_ADDSUB_V5_0 #(
         0    /* c_add_mode*/,
         "0000000000000000000000000000000"    /* c_ainit_val*/,
         0    /* c_a_type*/,
         30    /* c_a_width*/,
         0    /* c_bypass_enable*/,
         0    /* c_bypass_low*/,
         0    /* c_b_constant*/,
         1    /* c_b_type*/,
         "0000000000000000000000000000000"    /* c_b_value*/,
         1    /* c_b_width*/,
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
         0    /* c_has_q*/,
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
         1    /* c_sync_priority*/
      )
      BU19134(
         .A(BU19134_A),
         .B(BU19134_B),
         .S(BU19134_S)
      );

      defparam BU19259.INIT = 'h0202;
      wire BU19259_I0;
         assign BU19259_I0 = n6790;
      wire BU19259_I1;
         assign BU19259_I1 = n6789;
      wire BU19259_I2;
         assign BU19259_I2 = n7362;
      wire BU19259_I3;
         assign BU19259_I3 = 1'b0;
      wire BU19259_O;
         assign n7381 = BU19259_O;
      LUT4       BU19259(
         .I0(BU19259_I0),
         .I1(BU19259_I1),
         .I2(BU19259_I2),
         .I3(BU19259_I3),
         .O(BU19259_O)
      );

      defparam BU19261.INIT = 'h4444;
      wire BU19261_I0;
         assign BU19261_I0 = n6790;
      wire BU19261_I1;
         assign BU19261_I1 = n7362;
      wire BU19261_I2;
         assign BU19261_I2 = 1'b0;
      wire BU19261_I3;
         assign BU19261_I3 = 1'b0;
      wire BU19261_O;
         assign n7383 = BU19261_O;
      LUT4       BU19261(
         .I0(BU19261_I0),
         .I1(BU19261_I1),
         .I2(BU19261_I2),
         .I3(BU19261_I3),
         .O(BU19261_O)
      );

      wire [28 : 0] BU19262_D;
         assign BU19262_D[0] = n7333;
         assign BU19262_D[1] = n7334;
         assign BU19262_D[2] = n7335;
         assign BU19262_D[3] = n7336;
         assign BU19262_D[4] = n7337;
         assign BU19262_D[5] = n7338;
         assign BU19262_D[6] = n7339;
         assign BU19262_D[7] = n7340;
         assign BU19262_D[8] = n7341;
         assign BU19262_D[9] = n7342;
         assign BU19262_D[10] = n7343;
         assign BU19262_D[11] = n7344;
         assign BU19262_D[12] = n7345;
         assign BU19262_D[13] = n7346;
         assign BU19262_D[14] = n7347;
         assign BU19262_D[15] = n7348;
         assign BU19262_D[16] = n7349;
         assign BU19262_D[17] = n7350;
         assign BU19262_D[18] = n7351;
         assign BU19262_D[19] = n7352;
         assign BU19262_D[20] = n7353;
         assign BU19262_D[21] = n7354;
         assign BU19262_D[22] = n7355;
         assign BU19262_D[23] = n7356;
         assign BU19262_D[24] = n7357;
         assign BU19262_D[25] = n7358;
         assign BU19262_D[26] = n7359;
         assign BU19262_D[27] = n7360;
         assign BU19262_D[28] = n7361;
      wire [28 : 0] BU19262_Q;
         assign n82 = BU19262_Q[0];
         assign n83 = BU19262_Q[1];
         assign n84 = BU19262_Q[2];
         assign n85 = BU19262_Q[3];
         assign n86 = BU19262_Q[4];
         assign n87 = BU19262_Q[5];
         assign n88 = BU19262_Q[6];
         assign n89 = BU19262_Q[7];
         assign n90 = BU19262_Q[8];
         assign n91 = BU19262_Q[9];
         assign n92 = BU19262_Q[10];
         assign n93 = BU19262_Q[11];
         assign n94 = BU19262_Q[12];
         assign n95 = BU19262_Q[13];
         assign n96 = BU19262_Q[14];
         assign n97 = BU19262_Q[15];
         assign n98 = BU19262_Q[16];
         assign n99 = BU19262_Q[17];
         assign n100 = BU19262_Q[18];
         assign n101 = BU19262_Q[19];
         assign n102 = BU19262_Q[20];
         assign n103 = BU19262_Q[21];
         assign n104 = BU19262_Q[22];
         assign n105 = BU19262_Q[23];
         assign n106 = BU19262_Q[24];
         assign n107 = BU19262_Q[25];
         assign n108 = BU19262_Q[26];
         assign n109 = BU19262_Q[27];
         assign n110 = BU19262_Q[28];
      wire BU19262_CLK;
         assign BU19262_CLK = n183;
      wire BU19262_SCLR;
         assign BU19262_SCLR = n7381;
      wire BU19262_SSET;
         assign BU19262_SSET = n7383;
      C_REG_FD_V5_0 #(
         "00000000000000000000000000000"    /* c_ainit_val*/,
         0    /* c_enable_rlocs*/,
         0    /* c_has_aclr*/,
         0    /* c_has_ainit*/,
         0    /* c_has_aset*/,
         0    /* c_has_ce*/,
         1    /* c_has_sclr*/,
         0    /* c_has_sinit*/,
         1    /* c_has_sset*/,
         "00000000000000000000000000000"    /* c_sinit_val*/,
         0    /* c_sync_enable*/,
         0    /* c_sync_priority*/,
         29    /* c_width*/
      )
      BU19262(
         .D(BU19262_D),
         .Q(BU19262_Q),
         .CLK(BU19262_CLK),
         .SCLR(BU19262_SCLR),
         .SSET(BU19262_SSET)
      );

      wire [0 : 0] BU19379_D;
         assign BU19379_D[0] = n7362;
      wire [0 : 0] BU19379_Q;
         assign n111 = BU19379_Q[0];
      wire BU19379_CLK;
         assign BU19379_CLK = n183;
      wire BU19379_SCLR;
         assign BU19379_SCLR = n7383;
      wire BU19379_SSET;
         assign BU19379_SSET = n7381;
      C_REG_FD_V5_0 #(
         "0"    /* c_ainit_val*/,
         0    /* c_enable_rlocs*/,
         0    /* c_has_aclr*/,
         0    /* c_has_ainit*/,
         0    /* c_has_aset*/,
         0    /* c_has_ce*/,
         1    /* c_has_sclr*/,
         0    /* c_has_sinit*/,
         1    /* c_has_sset*/,
         "0"    /* c_sinit_val*/,
         0    /* c_sync_enable*/,
         0    /* c_sync_priority*/,
         1    /* c_width*/
      )
      BU19379(
         .D(BU19379_D),
         .Q(BU19379_Q),
         .CLK(BU19379_CLK),
         .SCLR(BU19379_SCLR),
         .SSET(BU19379_SSET)
      );

      wire BU19386_D;
         assign BU19386_D = n6791;
      wire BU19386_C;
         assign BU19386_C = n183;
      wire BU19386_CE;
         assign BU19386_CE = 1'b1;
      wire BU19386_Q;
         assign n112 = BU19386_Q;
      FDE       BU19386(
         .D(BU19386_D),
         .C(BU19386_C),
         .CE(BU19386_CE),
         .Q(BU19386_Q)
      );

      wire BU19389_ND;
         assign BU19389_ND = n112;
      wire BU19389_RDY;
         assign n162 = BU19389_RDY;
      wire BU19389_CLK;
         assign BU19389_CLK = n183;
      wire BU19389_RFD;
      wire [29 : 0] BU19389_DIN;
         assign BU19389_DIN[0] = n82;
         assign BU19389_DIN[1] = n83;
         assign BU19389_DIN[2] = n84;
         assign BU19389_DIN[3] = n85;
         assign BU19389_DIN[4] = n86;
         assign BU19389_DIN[5] = n87;
         assign BU19389_DIN[6] = n88;
         assign BU19389_DIN[7] = n89;
         assign BU19389_DIN[8] = n90;
         assign BU19389_DIN[9] = n91;
         assign BU19389_DIN[10] = n92;
         assign BU19389_DIN[11] = n93;
         assign BU19389_DIN[12] = n94;
         assign BU19389_DIN[13] = n95;
         assign BU19389_DIN[14] = n96;
         assign BU19389_DIN[15] = n97;
         assign BU19389_DIN[16] = n98;
         assign BU19389_DIN[17] = n99;
         assign BU19389_DIN[18] = n100;
         assign BU19389_DIN[19] = n101;
         assign BU19389_DIN[20] = n102;
         assign BU19389_DIN[21] = n103;
         assign BU19389_DIN[22] = n104;
         assign BU19389_DIN[23] = n105;
         assign BU19389_DIN[24] = n106;
         assign BU19389_DIN[25] = n107;
         assign BU19389_DIN[26] = n108;
         assign BU19389_DIN[27] = n109;
         assign BU19389_DIN[28] = n110;
         assign BU19389_DIN[29] = n111;
      wire [0 : 0] BU19389_SEL_O;
         assign n163 = BU19389_SEL_O[0];
      wire [48 : 0] BU19389_DOUT;
         assign n113 = BU19389_DOUT[0];
         assign n114 = BU19389_DOUT[1];
         assign n115 = BU19389_DOUT[2];
         assign n116 = BU19389_DOUT[3];
         assign n117 = BU19389_DOUT[4];
         assign n118 = BU19389_DOUT[5];
         assign n119 = BU19389_DOUT[6];
         assign n120 = BU19389_DOUT[7];
         assign n121 = BU19389_DOUT[8];
         assign n122 = BU19389_DOUT[9];
         assign n123 = BU19389_DOUT[10];
         assign n124 = BU19389_DOUT[11];
         assign n125 = BU19389_DOUT[12];
         assign n126 = BU19389_DOUT[13];
         assign n127 = BU19389_DOUT[14];
         assign n128 = BU19389_DOUT[15];
         assign n129 = BU19389_DOUT[16];
         assign n130 = BU19389_DOUT[17];
         assign n131 = BU19389_DOUT[18];
         assign n132 = BU19389_DOUT[19];
         assign n133 = BU19389_DOUT[20];
         assign n134 = BU19389_DOUT[21];
         assign n135 = BU19389_DOUT[22];
         assign n136 = BU19389_DOUT[23];
         assign n137 = BU19389_DOUT[24];
         assign n138 = BU19389_DOUT[25];
         assign n139 = BU19389_DOUT[26];
         assign n140 = BU19389_DOUT[27];
         assign n141 = BU19389_DOUT[28];
         assign n142 = BU19389_DOUT[29];
         assign n143 = BU19389_DOUT[30];
         assign n144 = BU19389_DOUT[31];
         assign n145 = BU19389_DOUT[32];
         assign n146 = BU19389_DOUT[33];
         assign n147 = BU19389_DOUT[34];
         assign n148 = BU19389_DOUT[35];
         assign n149 = BU19389_DOUT[36];
         assign n150 = BU19389_DOUT[37];
         assign n151 = BU19389_DOUT[38];
         assign n152 = BU19389_DOUT[39];
         assign n153 = BU19389_DOUT[40];
         assign n154 = BU19389_DOUT[41];
         assign n155 = BU19389_DOUT[42];
         assign n156 = BU19389_DOUT[43];
         assign n157 = BU19389_DOUT[44];
         assign n158 = BU19389_DOUT[45];
         assign n159 = BU19389_DOUT[46];
         assign n160 = BU19389_DOUT[47];
         assign n161 = BU19389_DOUT[48];
      C_DA_FIR_V7_0 #(
         2    /* c_baat*/,
         2    /* c_channels*/,
         0    /* c_coeff_type*/,
         16    /* c_coeff_width*/,
         0    /* c_data_type*/,
         30    /* c_data_width*/,
         0    /* c_enable_rlocs*/,
         2    /* c_filter_type*/,
         0    /* c_has_reset*/,
         0    /* c_has_sel_i*/,
         1    /* c_has_sel_o*/,
         0    /* c_has_sin_f*/,
         0    /* c_has_sin_r*/,
         0    /* c_has_sout_f*/,
         0    /* c_has_sout_r*/,
         26    /* c_latency*/,
         "myddc_PFIR.mif"    /* c_mem_init_file*/,
         1    /* c_optimize*/,
         5    /* c_polyphase_factor*/,
         0    /* c_reg_output*/,
         0    /* c_reload*/,
         657    /* c_reload_delay*/,
         2    /* c_reload_mem_type*/,
         0    /* c_response*/,
         49    /* c_result_width*/,
         0    /* c_saturate*/,
         0    /* c_shape*/,
         55    /* c_taps*/,
         0    /* c_use_model_func*/,
         1    /* c_zpf*/
      )
      BU19389(
         .ND(BU19389_ND),
         .RDY(BU19389_RDY),
         .CLK(BU19389_CLK),
         .RFD(BU19389_RFD),
         .DIN(BU19389_DIN),
         .SEL_O(BU19389_SEL_O),
         .DOUT(BU19389_DOUT)
      );

      defparam BU25395.INIT = 'h2222;
      wire BU25395_I0;
         assign BU25395_I0 = n162;
      wire BU25395_I1;
         assign BU25395_I1 = n163;
      wire BU25395_I2;
         assign BU25395_I2 = 1'b0;
      wire BU25395_I3;
         assign BU25395_I3 = 1'b0;
      wire BU25395_O;
         assign n164 = BU25395_O;
      LUT4       BU25395(
         .I0(BU25395_I0),
         .I1(BU25395_I1),
         .I2(BU25395_I2),
         .I3(BU25395_I3),
         .O(BU25395_O)
      );

      defparam BU25397.INIT = 'h8888;
      wire BU25397_I0;
         assign BU25397_I0 = n162;
      wire BU25397_I1;
         assign BU25397_I1 = n163;
      wire BU25397_I2;
         assign BU25397_I2 = 1'b0;
      wire BU25397_I3;
         assign BU25397_I3 = 1'b0;
      wire BU25397_O;
         assign n165 = BU25397_O;
      LUT4       BU25397(
         .I0(BU25397_I0),
         .I1(BU25397_I1),
         .I2(BU25397_I2),
         .I3(BU25397_I3),
         .O(BU25397_O)
      );

      wire BU25400_D;
         assign BU25400_D = n165;
      wire BU25400_C;
         assign BU25400_C = n183;
      wire BU25400_CE;
         assign BU25400_CE = 1'b1;
      wire BU25400_Q;
         assign n181 = BU25400_Q;
      FDE       BU25400(
         .D(BU25400_D),
         .C(BU25400_C),
         .CE(BU25400_CE),
         .Q(BU25400_Q)
      );

      wire [18 : 0] BU25405_I;
         assign BU25405_I[0] = n113;
         assign BU25405_I[1] = n114;
         assign BU25405_I[2] = n115;
         assign BU25405_I[3] = n116;
         assign BU25405_I[4] = n117;
         assign BU25405_I[5] = n118;
         assign BU25405_I[6] = n119;
         assign BU25405_I[7] = n120;
         assign BU25405_I[8] = n121;
         assign BU25405_I[9] = n122;
         assign BU25405_I[10] = n123;
         assign BU25405_I[11] = n124;
         assign BU25405_I[12] = n125;
         assign BU25405_I[13] = n126;
         assign BU25405_I[14] = n127;
         assign BU25405_I[15] = n128;
         assign BU25405_I[16] = n129;
         assign BU25405_I[17] = n130;
         assign BU25405_I[18] = n131;
      wire BU25405_O;
         assign n8133 = BU25405_O;
      C_GATE_BIT_V5_0 #(
         "0"    /* c_ainit_val*/,
         0    /* c_enable_rlocs*/,
         0    /* c_gate_type*/,
         0    /* c_has_aclr*/,
         0    /* c_has_ainit*/,
         0    /* c_has_aset*/,
         0    /* c_has_ce*/,
         1    /* c_has_o*/,
         0    /* c_has_q*/,
         0    /* c_has_sclr*/,
         0    /* c_has_sinit*/,
         0    /* c_has_sset*/,
         19    /* c_inputs*/,
         "0111111111111111111"    /* c_input_inv_mask*/,
         0    /* c_pipe_stages*/,
         "0"    /* c_sinit_val*/,
         0    /* c_sync_enable*/,
         1    /* c_sync_priority*/
      )
      BU25405(
         .I(BU25405_I),
         .O(BU25405_O)
      );

      defparam BU25427.INIT = 'h8c8c;
      wire BU25427_I0;
         assign BU25427_I0 = n132;
      wire BU25427_I1;
         assign BU25427_I1 = n131;
      wire BU25427_I2;
         assign BU25427_I2 = n8133;
      wire BU25427_I3;
         assign BU25427_I3 = 1'b0;
      wire BU25427_O;
         assign n8130 = BU25427_O;
      LUT4       BU25427(
         .I0(BU25427_I0),
         .I1(BU25427_I1),
         .I2(BU25427_I2),
         .I3(BU25427_I3),
         .O(BU25427_O)
      );

      wire [29 : 0] BU25428_A;
         assign BU25428_A[0] = n132;
         assign BU25428_A[1] = n133;
         assign BU25428_A[2] = n134;
         assign BU25428_A[3] = n135;
         assign BU25428_A[4] = n136;
         assign BU25428_A[5] = n137;
         assign BU25428_A[6] = n138;
         assign BU25428_A[7] = n139;
         assign BU25428_A[8] = n140;
         assign BU25428_A[9] = n141;
         assign BU25428_A[10] = n142;
         assign BU25428_A[11] = n143;
         assign BU25428_A[12] = n144;
         assign BU25428_A[13] = n145;
         assign BU25428_A[14] = n146;
         assign BU25428_A[15] = n147;
         assign BU25428_A[16] = n148;
         assign BU25428_A[17] = n149;
         assign BU25428_A[18] = n150;
         assign BU25428_A[19] = n151;
         assign BU25428_A[20] = n152;
         assign BU25428_A[21] = n153;
         assign BU25428_A[22] = n154;
         assign BU25428_A[23] = n155;
         assign BU25428_A[24] = n156;
         assign BU25428_A[25] = n157;
         assign BU25428_A[26] = n158;
         assign BU25428_A[27] = n159;
         assign BU25428_A[28] = n160;
         assign BU25428_A[29] = n161;
      wire [0 : 0] BU25428_B;
         assign BU25428_B[0] = n8130;
      wire [30 : 0] BU25428_S;
         assign n8099 = BU25428_S[0];
         assign n8100 = BU25428_S[1];
         assign n8101 = BU25428_S[2];
         assign n8102 = BU25428_S[3];
         assign n8103 = BU25428_S[4];
         assign n8104 = BU25428_S[5];
         assign n8105 = BU25428_S[6];
         assign n8106 = BU25428_S[7];
         assign n8107 = BU25428_S[8];
         assign n8108 = BU25428_S[9];
         assign n8109 = BU25428_S[10];
         assign n8110 = BU25428_S[11];
         assign n8111 = BU25428_S[12];
         assign n8112 = BU25428_S[13];
         assign n8113 = BU25428_S[14];
         assign n8114 = BU25428_S[15];
         assign n8115 = BU25428_S[16];
         assign n8116 = BU25428_S[17];
         assign n8117 = BU25428_S[18];
         assign n8118 = BU25428_S[19];
         assign n8119 = BU25428_S[20];
         assign n8120 = BU25428_S[21];
         assign n8121 = BU25428_S[22];
         assign n8122 = BU25428_S[23];
         assign n8123 = BU25428_S[24];
         assign n8124 = BU25428_S[25];
         assign n8125 = BU25428_S[26];
         assign n8126 = BU25428_S[27];
         assign n8127 = BU25428_S[28];
         assign n8128 = BU25428_S[29];
      C_ADDSUB_V5_0 #(
         0    /* c_add_mode*/,
         "0000000000000000000000000000000"    /* c_ainit_val*/,
         0    /* c_a_type*/,
         30    /* c_a_width*/,
         0    /* c_bypass_enable*/,
         0    /* c_bypass_low*/,
         0    /* c_b_constant*/,
         1    /* c_b_type*/,
         "0000000000000000000000000000000"    /* c_b_value*/,
         1    /* c_b_width*/,
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
         0    /* c_has_q*/,
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
         1    /* c_sync_priority*/
      )
      BU25428(
         .A(BU25428_A),
         .B(BU25428_B),
         .S(BU25428_S)
      );

      defparam BU25553.INIT = 'h0200;
      wire BU25553_I0;
         assign BU25553_I0 = n161;
      wire BU25553_I1;
         assign BU25553_I1 = n160;
      wire BU25553_I2;
         assign BU25553_I2 = n8128;
      wire BU25553_I3;
         assign BU25553_I3 = n164;
      wire BU25553_O;
         assign n8153 = BU25553_O;
      LUT4       BU25553(
         .I0(BU25553_I0),
         .I1(BU25553_I1),
         .I2(BU25553_I2),
         .I3(BU25553_I3),
         .O(BU25553_O)
      );

      defparam BU25555.INIT = 'h4040;
      wire BU25555_I0;
         assign BU25555_I0 = n161;
      wire BU25555_I1;
         assign BU25555_I1 = n8128;
      wire BU25555_I2;
         assign BU25555_I2 = n164;
      wire BU25555_I3;
         assign BU25555_I3 = 1'b0;
      wire BU25555_O;
         assign n8155 = BU25555_O;
      LUT4       BU25555(
         .I0(BU25555_I0),
         .I1(BU25555_I1),
         .I2(BU25555_I2),
         .I3(BU25555_I3),
         .O(BU25555_O)
      );

      wire [28 : 0] BU25556_D;
         assign BU25556_D[0] = n8099;
         assign BU25556_D[1] = n8100;
         assign BU25556_D[2] = n8101;
         assign BU25556_D[3] = n8102;
         assign BU25556_D[4] = n8103;
         assign BU25556_D[5] = n8104;
         assign BU25556_D[6] = n8105;
         assign BU25556_D[7] = n8106;
         assign BU25556_D[8] = n8107;
         assign BU25556_D[9] = n8108;
         assign BU25556_D[10] = n8109;
         assign BU25556_D[11] = n8110;
         assign BU25556_D[12] = n8111;
         assign BU25556_D[13] = n8112;
         assign BU25556_D[14] = n8113;
         assign BU25556_D[15] = n8114;
         assign BU25556_D[16] = n8115;
         assign BU25556_D[17] = n8116;
         assign BU25556_D[18] = n8117;
         assign BU25556_D[19] = n8118;
         assign BU25556_D[20] = n8119;
         assign BU25556_D[21] = n8120;
         assign BU25556_D[22] = n8121;
         assign BU25556_D[23] = n8122;
         assign BU25556_D[24] = n8123;
         assign BU25556_D[25] = n8124;
         assign BU25556_D[26] = n8125;
         assign BU25556_D[27] = n8126;
         assign BU25556_D[28] = n8127;
      wire [28 : 0] BU25556_Q;
         assign n223 = BU25556_Q[0];
         assign n224 = BU25556_Q[1];
         assign n225 = BU25556_Q[2];
         assign n226 = BU25556_Q[3];
         assign n227 = BU25556_Q[4];
         assign n228 = BU25556_Q[5];
         assign n229 = BU25556_Q[6];
         assign n230 = BU25556_Q[7];
         assign n231 = BU25556_Q[8];
         assign n232 = BU25556_Q[9];
         assign n233 = BU25556_Q[10];
         assign n234 = BU25556_Q[11];
         assign n235 = BU25556_Q[12];
         assign n236 = BU25556_Q[13];
         assign n237 = BU25556_Q[14];
         assign n238 = BU25556_Q[15];
         assign n239 = BU25556_Q[16];
         assign n240 = BU25556_Q[17];
         assign n241 = BU25556_Q[18];
         assign n242 = BU25556_Q[19];
         assign n243 = BU25556_Q[20];
         assign n244 = BU25556_Q[21];
         assign n245 = BU25556_Q[22];
         assign n246 = BU25556_Q[23];
         assign n247 = BU25556_Q[24];
         assign n248 = BU25556_Q[25];
         assign n249 = BU25556_Q[26];
         assign n250 = BU25556_Q[27];
         assign n251 = BU25556_Q[28];
      wire BU25556_CLK;
         assign BU25556_CLK = n183;
      wire BU25556_CE;
         assign BU25556_CE = n164;
      wire BU25556_SCLR;
         assign BU25556_SCLR = n8153;
      wire BU25556_SSET;
         assign BU25556_SSET = n8155;
      C_REG_FD_V5_0 #(
         "00000000000000000000000000000"    /* c_ainit_val*/,
         0    /* c_enable_rlocs*/,
         0    /* c_has_aclr*/,
         0    /* c_has_ainit*/,
         0    /* c_has_aset*/,
         1    /* c_has_ce*/,
         1    /* c_has_sclr*/,
         0    /* c_has_sinit*/,
         1    /* c_has_sset*/,
         "00000000000000000000000000000"    /* c_sinit_val*/,
         0    /* c_sync_enable*/,
         0    /* c_sync_priority*/,
         29    /* c_width*/
      )
      BU25556(
         .D(BU25556_D),
         .Q(BU25556_Q),
         .CLK(BU25556_CLK),
         .CE(BU25556_CE),
         .SCLR(BU25556_SCLR),
         .SSET(BU25556_SSET)
      );

      wire [0 : 0] BU25676_D;
         assign BU25676_D[0] = n8128;
      wire [0 : 0] BU25676_Q;
         assign n252 = BU25676_Q[0];
      wire BU25676_CLK;
         assign BU25676_CLK = n183;
      wire BU25676_CE;
         assign BU25676_CE = n164;
      wire BU25676_SCLR;
         assign BU25676_SCLR = n8155;
      wire BU25676_SSET;
         assign BU25676_SSET = n8153;
      C_REG_FD_V5_0 #(
         "0"    /* c_ainit_val*/,
         0    /* c_enable_rlocs*/,
         0    /* c_has_aclr*/,
         0    /* c_has_ainit*/,
         0    /* c_has_aset*/,
         1    /* c_has_ce*/,
         1    /* c_has_sclr*/,
         0    /* c_has_sinit*/,
         1    /* c_has_sset*/,
         "0"    /* c_sinit_val*/,
         0    /* c_sync_enable*/,
         0    /* c_sync_priority*/,
         1    /* c_width*/
      )
      BU25676(
         .D(BU25676_D),
         .Q(BU25676_Q),
         .CLK(BU25676_CLK),
         .CE(BU25676_CE),
         .SCLR(BU25676_SCLR),
         .SSET(BU25676_SSET)
      );

      wire [18 : 0] BU25688_I;
         assign BU25688_I[0] = n113;
         assign BU25688_I[1] = n114;
         assign BU25688_I[2] = n115;
         assign BU25688_I[3] = n116;
         assign BU25688_I[4] = n117;
         assign BU25688_I[5] = n118;
         assign BU25688_I[6] = n119;
         assign BU25688_I[7] = n120;
         assign BU25688_I[8] = n121;
         assign BU25688_I[9] = n122;
         assign BU25688_I[10] = n123;
         assign BU25688_I[11] = n124;
         assign BU25688_I[12] = n125;
         assign BU25688_I[13] = n126;
         assign BU25688_I[14] = n127;
         assign BU25688_I[15] = n128;
         assign BU25688_I[16] = n129;
         assign BU25688_I[17] = n130;
         assign BU25688_I[18] = n131;
      wire BU25688_O;
         assign n8735 = BU25688_O;
      C_GATE_BIT_V5_0 #(
         "0"    /* c_ainit_val*/,
         0    /* c_enable_rlocs*/,
         0    /* c_gate_type*/,
         0    /* c_has_aclr*/,
         0    /* c_has_ainit*/,
         0    /* c_has_aset*/,
         0    /* c_has_ce*/,
         1    /* c_has_o*/,
         0    /* c_has_q*/,
         0    /* c_has_sclr*/,
         0    /* c_has_sinit*/,
         0    /* c_has_sset*/,
         19    /* c_inputs*/,
         "0111111111111111111"    /* c_input_inv_mask*/,
         0    /* c_pipe_stages*/,
         "0"    /* c_sinit_val*/,
         0    /* c_sync_enable*/,
         1    /* c_sync_priority*/
      )
      BU25688(
         .I(BU25688_I),
         .O(BU25688_O)
      );

      defparam BU25710.INIT = 'h8c8c;
      wire BU25710_I0;
         assign BU25710_I0 = n132;
      wire BU25710_I1;
         assign BU25710_I1 = n131;
      wire BU25710_I2;
         assign BU25710_I2 = n8735;
      wire BU25710_I3;
         assign BU25710_I3 = 1'b0;
      wire BU25710_O;
         assign n8732 = BU25710_O;
      LUT4       BU25710(
         .I0(BU25710_I0),
         .I1(BU25710_I1),
         .I2(BU25710_I2),
         .I3(BU25710_I3),
         .O(BU25710_O)
      );

      wire [29 : 0] BU25711_A;
         assign BU25711_A[0] = n132;
         assign BU25711_A[1] = n133;
         assign BU25711_A[2] = n134;
         assign BU25711_A[3] = n135;
         assign BU25711_A[4] = n136;
         assign BU25711_A[5] = n137;
         assign BU25711_A[6] = n138;
         assign BU25711_A[7] = n139;
         assign BU25711_A[8] = n140;
         assign BU25711_A[9] = n141;
         assign BU25711_A[10] = n142;
         assign BU25711_A[11] = n143;
         assign BU25711_A[12] = n144;
         assign BU25711_A[13] = n145;
         assign BU25711_A[14] = n146;
         assign BU25711_A[15] = n147;
         assign BU25711_A[16] = n148;
         assign BU25711_A[17] = n149;
         assign BU25711_A[18] = n150;
         assign BU25711_A[19] = n151;
         assign BU25711_A[20] = n152;
         assign BU25711_A[21] = n153;
         assign BU25711_A[22] = n154;
         assign BU25711_A[23] = n155;
         assign BU25711_A[24] = n156;
         assign BU25711_A[25] = n157;
         assign BU25711_A[26] = n158;
         assign BU25711_A[27] = n159;
         assign BU25711_A[28] = n160;
         assign BU25711_A[29] = n161;
      wire [0 : 0] BU25711_B;
         assign BU25711_B[0] = n8732;
      wire [30 : 0] BU25711_S;
         assign n8701 = BU25711_S[0];
         assign n8702 = BU25711_S[1];
         assign n8703 = BU25711_S[2];
         assign n8704 = BU25711_S[3];
         assign n8705 = BU25711_S[4];
         assign n8706 = BU25711_S[5];
         assign n8707 = BU25711_S[6];
         assign n8708 = BU25711_S[7];
         assign n8709 = BU25711_S[8];
         assign n8710 = BU25711_S[9];
         assign n8711 = BU25711_S[10];
         assign n8712 = BU25711_S[11];
         assign n8713 = BU25711_S[12];
         assign n8714 = BU25711_S[13];
         assign n8715 = BU25711_S[14];
         assign n8716 = BU25711_S[15];
         assign n8717 = BU25711_S[16];
         assign n8718 = BU25711_S[17];
         assign n8719 = BU25711_S[18];
         assign n8720 = BU25711_S[19];
         assign n8721 = BU25711_S[20];
         assign n8722 = BU25711_S[21];
         assign n8723 = BU25711_S[22];
         assign n8724 = BU25711_S[23];
         assign n8725 = BU25711_S[24];
         assign n8726 = BU25711_S[25];
         assign n8727 = BU25711_S[26];
         assign n8728 = BU25711_S[27];
         assign n8729 = BU25711_S[28];
         assign n8730 = BU25711_S[29];
      C_ADDSUB_V5_0 #(
         0    /* c_add_mode*/,
         "0000000000000000000000000000000"    /* c_ainit_val*/,
         0    /* c_a_type*/,
         30    /* c_a_width*/,
         0    /* c_bypass_enable*/,
         0    /* c_bypass_low*/,
         0    /* c_b_constant*/,
         1    /* c_b_type*/,
         "0000000000000000000000000000000"    /* c_b_value*/,
         1    /* c_b_width*/,
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
         0    /* c_has_q*/,
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
         1    /* c_sync_priority*/
      )
      BU25711(
         .A(BU25711_A),
         .B(BU25711_B),
         .S(BU25711_S)
      );

      defparam BU25836.INIT = 'h0200;
      wire BU25836_I0;
         assign BU25836_I0 = n161;
      wire BU25836_I1;
         assign BU25836_I1 = n160;
      wire BU25836_I2;
         assign BU25836_I2 = n8730;
      wire BU25836_I3;
         assign BU25836_I3 = n165;
      wire BU25836_O;
         assign n8755 = BU25836_O;
      LUT4       BU25836(
         .I0(BU25836_I0),
         .I1(BU25836_I1),
         .I2(BU25836_I2),
         .I3(BU25836_I3),
         .O(BU25836_O)
      );

      defparam BU25838.INIT = 'h4040;
      wire BU25838_I0;
         assign BU25838_I0 = n161;
      wire BU25838_I1;
         assign BU25838_I1 = n8730;
      wire BU25838_I2;
         assign BU25838_I2 = n165;
      wire BU25838_I3;
         assign BU25838_I3 = 1'b0;
      wire BU25838_O;
         assign n8757 = BU25838_O;
      LUT4       BU25838(
         .I0(BU25838_I0),
         .I1(BU25838_I1),
         .I2(BU25838_I2),
         .I3(BU25838_I3),
         .O(BU25838_O)
      );

      wire [28 : 0] BU25839_D;
         assign BU25839_D[0] = n8701;
         assign BU25839_D[1] = n8702;
         assign BU25839_D[2] = n8703;
         assign BU25839_D[3] = n8704;
         assign BU25839_D[4] = n8705;
         assign BU25839_D[5] = n8706;
         assign BU25839_D[6] = n8707;
         assign BU25839_D[7] = n8708;
         assign BU25839_D[8] = n8709;
         assign BU25839_D[9] = n8710;
         assign BU25839_D[10] = n8711;
         assign BU25839_D[11] = n8712;
         assign BU25839_D[12] = n8713;
         assign BU25839_D[13] = n8714;
         assign BU25839_D[14] = n8715;
         assign BU25839_D[15] = n8716;
         assign BU25839_D[16] = n8717;
         assign BU25839_D[17] = n8718;
         assign BU25839_D[18] = n8719;
         assign BU25839_D[19] = n8720;
         assign BU25839_D[20] = n8721;
         assign BU25839_D[21] = n8722;
         assign BU25839_D[22] = n8723;
         assign BU25839_D[23] = n8724;
         assign BU25839_D[24] = n8725;
         assign BU25839_D[25] = n8726;
         assign BU25839_D[26] = n8727;
         assign BU25839_D[27] = n8728;
         assign BU25839_D[28] = n8729;
      wire [28 : 0] BU25839_Q;
         assign n253 = BU25839_Q[0];
         assign n254 = BU25839_Q[1];
         assign n255 = BU25839_Q[2];
         assign n256 = BU25839_Q[3];
         assign n257 = BU25839_Q[4];
         assign n258 = BU25839_Q[5];
         assign n259 = BU25839_Q[6];
         assign n260 = BU25839_Q[7];
         assign n261 = BU25839_Q[8];
         assign n262 = BU25839_Q[9];
         assign n263 = BU25839_Q[10];
         assign n264 = BU25839_Q[11];
         assign n265 = BU25839_Q[12];
         assign n266 = BU25839_Q[13];
         assign n267 = BU25839_Q[14];
         assign n268 = BU25839_Q[15];
         assign n269 = BU25839_Q[16];
         assign n270 = BU25839_Q[17];
         assign n271 = BU25839_Q[18];
         assign n272 = BU25839_Q[19];
         assign n273 = BU25839_Q[20];
         assign n274 = BU25839_Q[21];
         assign n275 = BU25839_Q[22];
         assign n276 = BU25839_Q[23];
         assign n277 = BU25839_Q[24];
         assign n278 = BU25839_Q[25];
         assign n279 = BU25839_Q[26];
         assign n280 = BU25839_Q[27];
         assign n281 = BU25839_Q[28];
      wire BU25839_CLK;
         assign BU25839_CLK = n183;
      wire BU25839_CE;
         assign BU25839_CE = n165;
      wire BU25839_SCLR;
         assign BU25839_SCLR = n8755;
      wire BU25839_SSET;
         assign BU25839_SSET = n8757;
      C_REG_FD_V5_0 #(
         "00000000000000000000000000000"    /* c_ainit_val*/,
         0    /* c_enable_rlocs*/,
         0    /* c_has_aclr*/,
         0    /* c_has_ainit*/,
         0    /* c_has_aset*/,
         1    /* c_has_ce*/,
         1    /* c_has_sclr*/,
         0    /* c_has_sinit*/,
         1    /* c_has_sset*/,
         "00000000000000000000000000000"    /* c_sinit_val*/,
         0    /* c_sync_enable*/,
         0    /* c_sync_priority*/,
         29    /* c_width*/
      )
      BU25839(
         .D(BU25839_D),
         .Q(BU25839_Q),
         .CLK(BU25839_CLK),
         .CE(BU25839_CE),
         .SCLR(BU25839_SCLR),
         .SSET(BU25839_SSET)
      );

      wire [0 : 0] BU25959_D;
         assign BU25959_D[0] = n8730;
      wire [0 : 0] BU25959_Q;
         assign n282 = BU25959_Q[0];
      wire BU25959_CLK;
         assign BU25959_CLK = n183;
      wire BU25959_CE;
         assign BU25959_CE = n165;
      wire BU25959_SCLR;
         assign BU25959_SCLR = n8757;
      wire BU25959_SSET;
         assign BU25959_SSET = n8755;
      C_REG_FD_V5_0 #(
         "0"    /* c_ainit_val*/,
         0    /* c_enable_rlocs*/,
         0    /* c_has_aclr*/,
         0    /* c_has_ainit*/,
         0    /* c_has_aset*/,
         1    /* c_has_ce*/,
         1    /* c_has_sclr*/,
         0    /* c_has_sinit*/,
         1    /* c_has_sset*/,
         "0"    /* c_sinit_val*/,
         0    /* c_sync_enable*/,
         0    /* c_sync_priority*/,
         1    /* c_width*/
      )
      BU25959(
         .D(BU25959_D),
         .Q(BU25959_Q),
         .CLK(BU25959_CLK),
         .CE(BU25959_CE),
         .SCLR(BU25959_SCLR),
         .SSET(BU25959_SSET)
      );

//synthesis translate_on

endmodule
