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
*     (c) Copyright 1995-2004 Xilinx, Inc.                                     *
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

module ddcv_orig(
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
//synopsys translate_off
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
   wire n294;
   wire n341;
   wire n342;
   wire n343;
   wire n415;
   wire n416;
   wire n417;
   wire n418;
   wire n419;
   wire n420;
   wire n421;
   wire n422;
   wire n423;
   wire n424;
   wire n425;
   wire n426;
   wire n427;
   wire n428;
   wire n429;
   wire n460;
   wire n461;
   wire n462;
   wire n463;
   wire n464;
   wire n465;
   wire n466;
   wire n467;
   wire n468;
   wire n469;
   wire n470;
   wire n471;
   wire n472;
   wire n473;
   wire n474;
   wire n475;
   wire n476;
   wire n477;
   wire n478;
   wire n479;
   wire n480;
   wire n481;
   wire n482;
   wire n483;
   wire n484;
   wire n485;
   wire n486;
   wire n487;
   wire n488;
   wire n547;
   wire n577;
   wire n578;
   wire n579;
   wire n580;
   wire n581;
   wire n582;
   wire n583;
   wire n584;
   wire n585;
   wire n586;
   wire n587;
   wire n588;
   wire n589;
   wire n590;
   wire n619;
   wire n620;
   wire n621;
   wire n622;
   wire n623;
   wire n624;
   wire n625;
   wire n626;
   wire n627;
   wire n628;
   wire n629;
   wire n630;
   wire n631;
   wire n632;
   wire n633;
   wire n664;
   wire n665;
   wire n666;
   wire n667;
   wire n668;
   wire n669;
   wire n670;
   wire n671;
   wire n672;
   wire n673;
   wire n674;
   wire n675;
   wire n676;
   wire n677;
   wire n678;
   wire n679;
   wire n680;
   wire n681;
   wire n682;
   wire n683;
   wire n684;
   wire n685;
   wire n686;
   wire n687;
   wire n688;
   wire n689;
   wire n690;
   wire n691;
   wire n692;
   wire n927;
   wire n928;
   wire n929;
   wire n930;
   wire n931;
   wire n932;
   wire n933;
   wire n934;
   wire n935;
   wire n936;
   wire n937;
   wire n938;
   wire n939;
   wire n940;
   wire n1519;
   wire n1520;
   wire n1521;
   wire n1522;
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
   wire n1542;
   wire n1544;
   wire n1547;
   wire n1553;
   wire n1555;
   wire n2162;
   wire n2163;
   wire n2164;
   wire n2165;
   wire n2166;
   wire n2167;
   wire n2168;
   wire n2169;
   wire n2170;
   wire n2171;
   wire n2172;
   wire n2173;
   wire n2174;
   wire n2175;
   wire n2176;
   wire n2177;
   wire n2178;
   wire n2179;
   wire n2180;
   wire n2181;
   wire n2182;
   wire n2183;
   wire n2184;
   wire n2185;
   wire n2187;
   wire n2190;
   wire n2196;
   wire n2198;
   wire n2605;
   wire n2606;
   wire n2607;
   wire n2608;
   wire n2609;
   wire n2610;
   wire n2611;
   wire n2612;
   wire n2613;
   wire n2614;
   wire n2615;
   wire n2616;
   wire n2617;
   wire n2618;
   wire n2619;
   wire n2620;
   wire n2621;
   wire n2622;
   wire n2623;
   wire n2624;
   wire n2625;
   wire n2626;
   wire n2627;
   wire n2628;
   wire n2629;
   wire n2630;
   wire n2631;
   wire n2632;
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
   wire n3014;
   wire n3015;
   wire n3016;
   wire n3017;
   wire n3018;
   wire n3019;
   wire n3020;
   wire n3021;
   wire n3022;
   wire n3023;
   wire n3024;
   wire n3025;
   wire n3026;
   wire n3027;
   wire n3028;
   wire n3029;
   wire n3030;
   wire n3031;
   wire n3032;
   wire n3033;
   wire n3034;
   wire n3035;
   wire n3036;
   wire n3037;
   wire n3039;
   wire n3042;
   wire n3066;
   wire n3068;
   wire n3531;
   wire n3532;
   wire n3533;
   wire n3534;
   wire n3535;
   wire n3536;
   wire n3537;
   wire n3538;
   wire n3539;
   wire n3540;
   wire n3541;
   wire n3542;
   wire n3543;
   wire n3544;
   wire n3545;
   wire n3546;
   wire n3547;
   wire n3548;
   wire n3549;
   wire n3550;
   wire n3551;
   wire n3552;
   wire n3553;
   wire n3554;
   wire n3556;
   wire n3559;
   wire n3583;
   wire n3585;
   wire n4445;
   wire n6691;
   wire n6692;
   wire n6693;
   wire n6694;
   wire n6695;
   wire n6696;
   wire n6697;
   wire n6698;
   wire n6699;
   wire n6700;
   wire n6701;
   wire n6702;
   wire n6703;
   wire n6704;
   wire n6705;
   wire n6706;
   wire n6707;
   wire n6708;
   wire n6709;
   wire n6710;
   wire n6711;
   wire n6712;
   wire n6713;
   wire n6714;
   wire n6715;
   wire n6716;
   wire n6717;
   wire n6718;
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
   wire n6815;
   wire n6816;
   wire n6817;
   wire n6818;
   wire n6819;
   wire n6820;
   wire n6821;
   wire n7164;
   wire n7277;
   wire n7278;
   wire n7279;
   wire n7280;
   wire n7281;
   wire n7282;
   wire n7283;
   wire n7284;
   wire n7285;
   wire n7286;
   wire n7287;
   wire n7288;
   wire n7289;
   wire n7290;
   wire n7291;
   wire n7292;
   wire n7294;
   wire n7297;
   wire n7325;
   wire n7327;
   wire n7834;
   wire n7835;
   wire n7836;
   wire n7837;
   wire n7838;
   wire n7839;
   wire n7840;
   wire n7841;
   wire n7842;
   wire n7843;
   wire n7844;
   wire n7845;
   wire n7846;
   wire n7847;
   wire n7848;
   wire n7849;
   wire n7850;
   wire n7851;
   wire n7852;
   wire n7853;
   wire n7854;
   wire n7855;
   wire n7856;
   wire n7857;
   wire n7858;
   wire n7859;
   wire n7860;
   wire n7861;
   wire n7862;
   wire n7863;
   wire n7865;
   wire n7868;
   wire n7874;
   wire n7876;
   wire n8379;
   wire n8380;
   wire n8381;
   wire n8382;
   wire n8383;
   wire n8384;
   wire n8385;
   wire n8386;
   wire n8387;
   wire n8388;
   wire n8389;
   wire n8390;
   wire n8391;
   wire n8392;
   wire n8393;
   wire n8394;
   wire n8395;
   wire n8396;
   wire n8397;
   wire n8398;
   wire n8399;
   wire n8400;
   wire n8401;
   wire n8402;
   wire n8403;
   wire n8404;
   wire n8405;
   wire n8406;
   wire n8407;
   wire n8408;
   wire n8410;
   wire n8413;
   wire n8419;
   wire n8421;
   assign n138 = DIN[0];
   assign n139 = DIN[1];
   assign n140 = DIN[2];
   assign n141 = DIN[3];
   assign n142 = DIN[4];
   assign n143 = DIN[5];
   assign n144 = DIN[6];
   assign n145 = DIN[7];
   assign n146 = DIN[8];
   assign n147 = DIN[9];
   assign n148 = DIN[10];
   assign n149 = DIN[11];
   assign n150 = DIN[12];
   assign n151 = DIN[13];
   assign n152 = ND;
   assign n155 = CLK;
   assign n156 = ADDR[0];
   assign n157 = ADDR[1];
   assign n158 = ADDR[2];
   assign n159 = ADDR[3];
   assign n160 = ADDR[4];
   assign n161 = LD_DIN[0];
   assign n162 = LD_DIN[1];
   assign n163 = LD_DIN[2];
   assign n164 = LD_DIN[3];
   assign n165 = LD_DIN[4];
   assign n166 = LD_DIN[5];
   assign n167 = LD_DIN[6];
   assign n168 = LD_DIN[7];
   assign n169 = LD_DIN[8];
   assign n170 = LD_DIN[9];
   assign n171 = LD_DIN[10];
   assign n172 = LD_DIN[11];
   assign n173 = LD_DIN[12];
   assign n174 = LD_DIN[13];
   assign n175 = LD_DIN[14];
   assign n176 = LD_DIN[15];
   assign n177 = LD_DIN[16];
   assign n178 = LD_DIN[17];
   assign n179 = LD_DIN[18];
   assign n180 = LD_DIN[19];
   assign n181 = LD_DIN[20];
   assign n182 = LD_DIN[21];
   assign n183 = LD_DIN[22];
   assign n184 = LD_DIN[23];
   assign n185 = LD_DIN[24];
   assign n186 = LD_DIN[25];
   assign n187 = LD_DIN[26];
   assign n188 = LD_DIN[27];
   assign n189 = LD_DIN[28];
   assign n190 = LD_DIN[29];
   assign n191 = LD_DIN[30];
   assign n192 = LD_DIN[31];
   assign n193 = WE;
   assign n194 = SEL;
   assign RDY = n153;
   assign RFD = n154;
   assign DOUT_I[0] = n195;
   assign DOUT_I[1] = n196;
   assign DOUT_I[2] = n197;
   assign DOUT_I[3] = n198;
   assign DOUT_I[4] = n199;
   assign DOUT_I[5] = n200;
   assign DOUT_I[6] = n201;
   assign DOUT_I[7] = n202;
   assign DOUT_I[8] = n203;
   assign DOUT_I[9] = n204;
   assign DOUT_I[10] = n205;
   assign DOUT_I[11] = n206;
   assign DOUT_I[12] = n207;
   assign DOUT_I[13] = n208;
   assign DOUT_I[14] = n209;
   assign DOUT_I[15] = n210;
   assign DOUT_I[16] = n211;
   assign DOUT_I[17] = n212;
   assign DOUT_I[18] = n213;
   assign DOUT_I[19] = n214;
   assign DOUT_I[20] = n215;
   assign DOUT_I[21] = n216;
   assign DOUT_I[22] = n217;
   assign DOUT_I[23] = n218;
   assign DOUT_I[24] = n219;
   assign DOUT_I[25] = n220;
   assign DOUT_I[26] = n221;
   assign DOUT_I[27] = n222;
   assign DOUT_I[28] = n223;
   assign DOUT_I[29] = n224;
   assign DOUT_Q[0] = n225;
   assign DOUT_Q[1] = n226;
   assign DOUT_Q[2] = n227;
   assign DOUT_Q[3] = n228;
   assign DOUT_Q[4] = n229;
   assign DOUT_Q[5] = n230;
   assign DOUT_Q[6] = n231;
   assign DOUT_Q[7] = n232;
   assign DOUT_Q[8] = n233;
   assign DOUT_Q[9] = n234;
   assign DOUT_Q[10] = n235;
   assign DOUT_Q[11] = n236;
   assign DOUT_Q[12] = n237;
   assign DOUT_Q[13] = n238;
   assign DOUT_Q[14] = n239;
   assign DOUT_Q[15] = n240;
   assign DOUT_Q[16] = n241;
   assign DOUT_Q[17] = n242;
   assign DOUT_Q[18] = n243;
   assign DOUT_Q[19] = n244;
   assign DOUT_Q[20] = n245;
   assign DOUT_Q[21] = n246;
   assign DOUT_Q[22] = n247;
   assign DOUT_Q[23] = n248;
   assign DOUT_Q[24] = n249;
   assign DOUT_Q[25] = n250;
   assign DOUT_Q[26] = n251;
   assign DOUT_Q[27] = n252;
   assign DOUT_Q[28] = n253;
   assign DOUT_Q[29] = n254;

      defparam BU4.INIT = 'h1000;
      wire BU4_I0;
         assign BU4_I0 = n160;
      wire BU4_I1;
         assign BU4_I1 = n159;
      wire BU4_I2;
         assign BU4_I2 = n158;
      wire BU4_I3;
         assign BU4_I3 = n194;
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
         assign BU8_I1 = n193;
      wire BU8_I2;
         assign BU8_I2 = n157;
      wire BU8_I3;
         assign BU8_I3 = n156;
      wire BU8_O;
         assign n294 = BU8_O;
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
         assign n154 = BU10_O;
      LUT4       BU10(
         .I0(BU10_I0),
         .I1(BU10_I1),
         .I2(BU10_I2),
         .I3(BU10_I3),
         .O(BU10_O)
      );

      wire BU1292_D;
         assign BU1292_D = n152;
      wire BU1292_C;
         assign BU1292_C = n155;
      wire BU1292_CE;
         assign BU1292_CE = 1'b1;
      wire BU1292_Q;
         assign n343 = BU1292_Q;
      FDE       BU1292(
         .D(BU1292_D),
         .C(BU1292_C),
         .CE(BU1292_CE),
         .Q(BU1292_Q)
      );

      defparam BU14.INIT = 'h0000;
      wire BU14_D;
         assign BU14_D = n138;
      wire BU14_CE;
         assign BU14_CE = n152;
      wire BU14_CLK;
         assign BU14_CLK = n155;
      wire BU14_A0;
         assign BU14_A0 = 1'b0;
      wire BU14_A1;
         assign BU14_A1 = 1'b1;
      wire BU14_A2;
         assign BU14_A2 = 1'b0;
      wire BU14_A3;
         assign BU14_A3 = 1'b0;
      wire BU14_Q;
         assign n927 = BU14_Q;
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
         assign BU16_D = n927;
      wire BU16_C;
         assign BU16_C = n155;
      wire BU16_CE;
         assign BU16_CE = n152;
      wire BU16_Q;
         assign n590 = BU16_Q;
      FDE       BU16(
         .D(BU16_D),
         .C(BU16_C),
         .CE(BU16_CE),
         .Q(BU16_Q)
      );

      defparam BU17.INIT = 'h0000;
      wire BU17_D;
         assign BU17_D = n139;
      wire BU17_CE;
         assign BU17_CE = n152;
      wire BU17_CLK;
         assign BU17_CLK = n155;
      wire BU17_A0;
         assign BU17_A0 = 1'b0;
      wire BU17_A1;
         assign BU17_A1 = 1'b1;
      wire BU17_A2;
         assign BU17_A2 = 1'b0;
      wire BU17_A3;
         assign BU17_A3 = 1'b0;
      wire BU17_Q;
         assign n928 = BU17_Q;
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
         assign BU19_D = n928;
      wire BU19_C;
         assign BU19_C = n155;
      wire BU19_CE;
         assign BU19_CE = n152;
      wire BU19_Q;
         assign n589 = BU19_Q;
      FDE       BU19(
         .D(BU19_D),
         .C(BU19_C),
         .CE(BU19_CE),
         .Q(BU19_Q)
      );

      defparam BU20.INIT = 'h0000;
      wire BU20_D;
         assign BU20_D = n140;
      wire BU20_CE;
         assign BU20_CE = n152;
      wire BU20_CLK;
         assign BU20_CLK = n155;
      wire BU20_A0;
         assign BU20_A0 = 1'b0;
      wire BU20_A1;
         assign BU20_A1 = 1'b1;
      wire BU20_A2;
         assign BU20_A2 = 1'b0;
      wire BU20_A3;
         assign BU20_A3 = 1'b0;
      wire BU20_Q;
         assign n929 = BU20_Q;
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
         assign BU22_D = n929;
      wire BU22_C;
         assign BU22_C = n155;
      wire BU22_CE;
         assign BU22_CE = n152;
      wire BU22_Q;
         assign n588 = BU22_Q;
      FDE       BU22(
         .D(BU22_D),
         .C(BU22_C),
         .CE(BU22_CE),
         .Q(BU22_Q)
      );

      defparam BU23.INIT = 'h0000;
      wire BU23_D;
         assign BU23_D = n141;
      wire BU23_CE;
         assign BU23_CE = n152;
      wire BU23_CLK;
         assign BU23_CLK = n155;
      wire BU23_A0;
         assign BU23_A0 = 1'b0;
      wire BU23_A1;
         assign BU23_A1 = 1'b1;
      wire BU23_A2;
         assign BU23_A2 = 1'b0;
      wire BU23_A3;
         assign BU23_A3 = 1'b0;
      wire BU23_Q;
         assign n930 = BU23_Q;
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
         assign BU25_D = n930;
      wire BU25_C;
         assign BU25_C = n155;
      wire BU25_CE;
         assign BU25_CE = n152;
      wire BU25_Q;
         assign n587 = BU25_Q;
      FDE       BU25(
         .D(BU25_D),
         .C(BU25_C),
         .CE(BU25_CE),
         .Q(BU25_Q)
      );

      defparam BU26.INIT = 'h0000;
      wire BU26_D;
         assign BU26_D = n142;
      wire BU26_CE;
         assign BU26_CE = n152;
      wire BU26_CLK;
         assign BU26_CLK = n155;
      wire BU26_A0;
         assign BU26_A0 = 1'b0;
      wire BU26_A1;
         assign BU26_A1 = 1'b1;
      wire BU26_A2;
         assign BU26_A2 = 1'b0;
      wire BU26_A3;
         assign BU26_A3 = 1'b0;
      wire BU26_Q;
         assign n931 = BU26_Q;
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
         assign BU28_D = n931;
      wire BU28_C;
         assign BU28_C = n155;
      wire BU28_CE;
         assign BU28_CE = n152;
      wire BU28_Q;
         assign n586 = BU28_Q;
      FDE       BU28(
         .D(BU28_D),
         .C(BU28_C),
         .CE(BU28_CE),
         .Q(BU28_Q)
      );

      defparam BU29.INIT = 'h0000;
      wire BU29_D;
         assign BU29_D = n143;
      wire BU29_CE;
         assign BU29_CE = n152;
      wire BU29_CLK;
         assign BU29_CLK = n155;
      wire BU29_A0;
         assign BU29_A0 = 1'b0;
      wire BU29_A1;
         assign BU29_A1 = 1'b1;
      wire BU29_A2;
         assign BU29_A2 = 1'b0;
      wire BU29_A3;
         assign BU29_A3 = 1'b0;
      wire BU29_Q;
         assign n932 = BU29_Q;
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
         assign BU31_D = n932;
      wire BU31_C;
         assign BU31_C = n155;
      wire BU31_CE;
         assign BU31_CE = n152;
      wire BU31_Q;
         assign n585 = BU31_Q;
      FDE       BU31(
         .D(BU31_D),
         .C(BU31_C),
         .CE(BU31_CE),
         .Q(BU31_Q)
      );

      defparam BU32.INIT = 'h0000;
      wire BU32_D;
         assign BU32_D = n144;
      wire BU32_CE;
         assign BU32_CE = n152;
      wire BU32_CLK;
         assign BU32_CLK = n155;
      wire BU32_A0;
         assign BU32_A0 = 1'b0;
      wire BU32_A1;
         assign BU32_A1 = 1'b1;
      wire BU32_A2;
         assign BU32_A2 = 1'b0;
      wire BU32_A3;
         assign BU32_A3 = 1'b0;
      wire BU32_Q;
         assign n933 = BU32_Q;
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
         assign BU34_D = n933;
      wire BU34_C;
         assign BU34_C = n155;
      wire BU34_CE;
         assign BU34_CE = n152;
      wire BU34_Q;
         assign n584 = BU34_Q;
      FDE       BU34(
         .D(BU34_D),
         .C(BU34_C),
         .CE(BU34_CE),
         .Q(BU34_Q)
      );

      defparam BU35.INIT = 'h0000;
      wire BU35_D;
         assign BU35_D = n145;
      wire BU35_CE;
         assign BU35_CE = n152;
      wire BU35_CLK;
         assign BU35_CLK = n155;
      wire BU35_A0;
         assign BU35_A0 = 1'b0;
      wire BU35_A1;
         assign BU35_A1 = 1'b1;
      wire BU35_A2;
         assign BU35_A2 = 1'b0;
      wire BU35_A3;
         assign BU35_A3 = 1'b0;
      wire BU35_Q;
         assign n934 = BU35_Q;
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
         assign BU37_D = n934;
      wire BU37_C;
         assign BU37_C = n155;
      wire BU37_CE;
         assign BU37_CE = n152;
      wire BU37_Q;
         assign n583 = BU37_Q;
      FDE       BU37(
         .D(BU37_D),
         .C(BU37_C),
         .CE(BU37_CE),
         .Q(BU37_Q)
      );

      defparam BU38.INIT = 'h0000;
      wire BU38_D;
         assign BU38_D = n146;
      wire BU38_CE;
         assign BU38_CE = n152;
      wire BU38_CLK;
         assign BU38_CLK = n155;
      wire BU38_A0;
         assign BU38_A0 = 1'b0;
      wire BU38_A1;
         assign BU38_A1 = 1'b1;
      wire BU38_A2;
         assign BU38_A2 = 1'b0;
      wire BU38_A3;
         assign BU38_A3 = 1'b0;
      wire BU38_Q;
         assign n935 = BU38_Q;
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
         assign BU40_D = n935;
      wire BU40_C;
         assign BU40_C = n155;
      wire BU40_CE;
         assign BU40_CE = n152;
      wire BU40_Q;
         assign n582 = BU40_Q;
      FDE       BU40(
         .D(BU40_D),
         .C(BU40_C),
         .CE(BU40_CE),
         .Q(BU40_Q)
      );

      defparam BU41.INIT = 'h0000;
      wire BU41_D;
         assign BU41_D = n147;
      wire BU41_CE;
         assign BU41_CE = n152;
      wire BU41_CLK;
         assign BU41_CLK = n155;
      wire BU41_A0;
         assign BU41_A0 = 1'b0;
      wire BU41_A1;
         assign BU41_A1 = 1'b1;
      wire BU41_A2;
         assign BU41_A2 = 1'b0;
      wire BU41_A3;
         assign BU41_A3 = 1'b0;
      wire BU41_Q;
         assign n936 = BU41_Q;
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
         assign BU43_D = n936;
      wire BU43_C;
         assign BU43_C = n155;
      wire BU43_CE;
         assign BU43_CE = n152;
      wire BU43_Q;
         assign n581 = BU43_Q;
      FDE       BU43(
         .D(BU43_D),
         .C(BU43_C),
         .CE(BU43_CE),
         .Q(BU43_Q)
      );

      defparam BU44.INIT = 'h0000;
      wire BU44_D;
         assign BU44_D = n148;
      wire BU44_CE;
         assign BU44_CE = n152;
      wire BU44_CLK;
         assign BU44_CLK = n155;
      wire BU44_A0;
         assign BU44_A0 = 1'b0;
      wire BU44_A1;
         assign BU44_A1 = 1'b1;
      wire BU44_A2;
         assign BU44_A2 = 1'b0;
      wire BU44_A3;
         assign BU44_A3 = 1'b0;
      wire BU44_Q;
         assign n937 = BU44_Q;
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
         assign BU46_D = n937;
      wire BU46_C;
         assign BU46_C = n155;
      wire BU46_CE;
         assign BU46_CE = n152;
      wire BU46_Q;
         assign n580 = BU46_Q;
      FDE       BU46(
         .D(BU46_D),
         .C(BU46_C),
         .CE(BU46_CE),
         .Q(BU46_Q)
      );

      defparam BU47.INIT = 'h0000;
      wire BU47_D;
         assign BU47_D = n149;
      wire BU47_CE;
         assign BU47_CE = n152;
      wire BU47_CLK;
         assign BU47_CLK = n155;
      wire BU47_A0;
         assign BU47_A0 = 1'b0;
      wire BU47_A1;
         assign BU47_A1 = 1'b1;
      wire BU47_A2;
         assign BU47_A2 = 1'b0;
      wire BU47_A3;
         assign BU47_A3 = 1'b0;
      wire BU47_Q;
         assign n938 = BU47_Q;
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
         assign BU49_D = n938;
      wire BU49_C;
         assign BU49_C = n155;
      wire BU49_CE;
         assign BU49_CE = n152;
      wire BU49_Q;
         assign n579 = BU49_Q;
      FDE       BU49(
         .D(BU49_D),
         .C(BU49_C),
         .CE(BU49_CE),
         .Q(BU49_Q)
      );

      defparam BU50.INIT = 'h0000;
      wire BU50_D;
         assign BU50_D = n150;
      wire BU50_CE;
         assign BU50_CE = n152;
      wire BU50_CLK;
         assign BU50_CLK = n155;
      wire BU50_A0;
         assign BU50_A0 = 1'b0;
      wire BU50_A1;
         assign BU50_A1 = 1'b1;
      wire BU50_A2;
         assign BU50_A2 = 1'b0;
      wire BU50_A3;
         assign BU50_A3 = 1'b0;
      wire BU50_Q;
         assign n939 = BU50_Q;
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
         assign BU52_D = n939;
      wire BU52_C;
         assign BU52_C = n155;
      wire BU52_CE;
         assign BU52_CE = n152;
      wire BU52_Q;
         assign n578 = BU52_Q;
      FDE       BU52(
         .D(BU52_D),
         .C(BU52_C),
         .CE(BU52_CE),
         .Q(BU52_Q)
      );

      defparam BU53.INIT = 'h0000;
      wire BU53_D;
         assign BU53_D = n151;
      wire BU53_CE;
         assign BU53_CE = n152;
      wire BU53_CLK;
         assign BU53_CLK = n155;
      wire BU53_A0;
         assign BU53_A0 = 1'b0;
      wire BU53_A1;
         assign BU53_A1 = 1'b1;
      wire BU53_A2;
         assign BU53_A2 = 1'b0;
      wire BU53_A3;
         assign BU53_A3 = 1'b0;
      wire BU53_Q;
         assign n940 = BU53_Q;
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
         assign BU55_D = n940;
      wire BU55_C;
         assign BU55_C = n155;
      wire BU55_CE;
         assign BU55_CE = n152;
      wire BU55_Q;
         assign n577 = BU55_Q;
      FDE       BU55(
         .D(BU55_D),
         .C(BU55_C),
         .CE(BU55_CE),
         .Q(BU55_Q)
      );

      wire [31 : 0] BU57_DATA;
         assign BU57_DATA[0] = n161;
         assign BU57_DATA[1] = n162;
         assign BU57_DATA[2] = n163;
         assign BU57_DATA[3] = n164;
         assign BU57_DATA[4] = n165;
         assign BU57_DATA[5] = n166;
         assign BU57_DATA[6] = n167;
         assign BU57_DATA[7] = n168;
         assign BU57_DATA[8] = n169;
         assign BU57_DATA[9] = n170;
         assign BU57_DATA[10] = n171;
         assign BU57_DATA[11] = n172;
         assign BU57_DATA[12] = n173;
         assign BU57_DATA[13] = n174;
         assign BU57_DATA[14] = n175;
         assign BU57_DATA[15] = n176;
         assign BU57_DATA[16] = n177;
         assign BU57_DATA[17] = n178;
         assign BU57_DATA[18] = n179;
         assign BU57_DATA[19] = n180;
         assign BU57_DATA[20] = n181;
         assign BU57_DATA[21] = n182;
         assign BU57_DATA[22] = n183;
         assign BU57_DATA[23] = n184;
         assign BU57_DATA[24] = n185;
         assign BU57_DATA[25] = n186;
         assign BU57_DATA[26] = n187;
         assign BU57_DATA[27] = n188;
         assign BU57_DATA[28] = n189;
         assign BU57_DATA[29] = n190;
         assign BU57_DATA[30] = n191;
         assign BU57_DATA[31] = n192;
      wire BU57_WE;
         assign BU57_WE = n294;
      wire BU57_CLK;
         assign BU57_CLK = n155;
      wire BU57_CE;
         assign BU57_CE = n152;
      wire BU57_RDY;
         assign n342 = BU57_RDY;
      wire [14 : 0] BU57_SINE;
         assign n429 = BU57_SINE[0];
         assign n428 = BU57_SINE[1];
         assign n427 = BU57_SINE[2];
         assign n426 = BU57_SINE[3];
         assign n425 = BU57_SINE[4];
         assign n424 = BU57_SINE[5];
         assign n423 = BU57_SINE[6];
         assign n422 = BU57_SINE[7];
         assign n421 = BU57_SINE[8];
         assign n420 = BU57_SINE[9];
         assign n419 = BU57_SINE[10];
         assign n418 = BU57_SINE[11];
         assign n417 = BU57_SINE[12];
         assign n416 = BU57_SINE[13];
         assign n415 = BU57_SINE[14];
      wire [14 : 0] BU57_COSINE;
         assign n633 = BU57_COSINE[0];
         assign n632 = BU57_COSINE[1];
         assign n631 = BU57_COSINE[2];
         assign n630 = BU57_COSINE[3];
         assign n629 = BU57_COSINE[4];
         assign n628 = BU57_COSINE[5];
         assign n627 = BU57_COSINE[6];
         assign n626 = BU57_COSINE[7];
         assign n625 = BU57_COSINE[8];
         assign n624 = BU57_COSINE[9];
         assign n623 = BU57_COSINE[10];
         assign n622 = BU57_COSINE[11];
         assign n621 = BU57_COSINE[12];
         assign n620 = BU57_COSINE[13];
         assign n619 = BU57_COSINE[14];
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
         assign BU1294_I0 = n342;
      wire BU1294_I1;
         assign BU1294_I1 = n343;
      wire BU1294_I2;
         assign BU1294_I2 = 1'b0;
      wire BU1294_I3;
         assign BU1294_I3 = 1'b0;
      wire BU1294_O;
         assign n341 = BU1294_O;
      LUT4       BU1294(
         .I0(BU1294_I0),
         .I1(BU1294_I1),
         .I2(BU1294_I2),
         .I3(BU1294_I3),
         .O(BU1294_O)
      );

      wire BU1296_clk;
         assign BU1296_clk = n155;
      wire [13 : 0] BU1296_a;
         assign BU1296_a[13] = n577;
         assign BU1296_a[12] = n578;
         assign BU1296_a[11] = n579;
         assign BU1296_a[10] = n580;
         assign BU1296_a[9] = n581;
         assign BU1296_a[8] = n582;
         assign BU1296_a[7] = n583;
         assign BU1296_a[6] = n584;
         assign BU1296_a[5] = n585;
         assign BU1296_a[4] = n586;
         assign BU1296_a[3] = n587;
         assign BU1296_a[2] = n588;
         assign BU1296_a[1] = n589;
         assign BU1296_a[0] = n590;
      wire [14 : 0] BU1296_b;
         assign BU1296_b[14] = n415;
         assign BU1296_b[13] = n416;
         assign BU1296_b[12] = n417;
         assign BU1296_b[11] = n418;
         assign BU1296_b[10] = n419;
         assign BU1296_b[9] = n420;
         assign BU1296_b[8] = n421;
         assign BU1296_b[7] = n422;
         assign BU1296_b[6] = n423;
         assign BU1296_b[5] = n424;
         assign BU1296_b[4] = n425;
         assign BU1296_b[3] = n426;
         assign BU1296_b[2] = n427;
         assign BU1296_b[1] = n428;
         assign BU1296_b[0] = n429;
      wire [28 : 0] BU1296_o;
      wire [28 : 0] BU1296_q;
         assign n460 = BU1296_q[28];
         assign n461 = BU1296_q[27];
         assign n462 = BU1296_q[26];
         assign n463 = BU1296_q[25];
         assign n464 = BU1296_q[24];
         assign n465 = BU1296_q[23];
         assign n466 = BU1296_q[22];
         assign n467 = BU1296_q[21];
         assign n468 = BU1296_q[20];
         assign n469 = BU1296_q[19];
         assign n470 = BU1296_q[18];
         assign n471 = BU1296_q[17];
         assign n472 = BU1296_q[16];
         assign n473 = BU1296_q[15];
         assign n474 = BU1296_q[14];
         assign n475 = BU1296_q[13];
         assign n476 = BU1296_q[12];
         assign n477 = BU1296_q[11];
         assign n478 = BU1296_q[10];
         assign n479 = BU1296_q[9];
         assign n480 = BU1296_q[8];
         assign n481 = BU1296_q[7];
         assign n482 = BU1296_q[6];
         assign n483 = BU1296_q[5];
         assign n484 = BU1296_q[4];
         assign n485 = BU1296_q[3];
         assign n486 = BU1296_q[2];
         assign n487 = BU1296_q[1];
         assign n488 = BU1296_q[0];
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
         assign BU1296_nd = n341;
      wire BU1296_rdy;
         assign n547 = BU1296_rdy;
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
         assign BU1517_I[0] = n488;
         assign BU1517_I[1] = n487;
         assign BU1517_I[2] = n486;
         assign BU1517_I[3] = n485;
         assign BU1517_I[4] = n484;
      wire BU1517_O;
         assign n1547 = BU1517_O;
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
         assign BU1526_I0 = n483;
      wire BU1526_I1;
         assign BU1526_I1 = n484;
      wire BU1526_I2;
         assign BU1526_I2 = n1547;
      wire BU1526_I3;
         assign BU1526_I3 = 1'b0;
      wire BU1526_O;
         assign n1544 = BU1526_O;
      LUT4       BU1526(
         .I0(BU1526_I0),
         .I1(BU1526_I1),
         .I2(BU1526_I2),
         .I3(BU1526_I3),
         .O(BU1526_O)
      );

      wire [23 : 0] BU1527_A;
         assign BU1527_A[0] = n483;
         assign BU1527_A[1] = n482;
         assign BU1527_A[2] = n481;
         assign BU1527_A[3] = n480;
         assign BU1527_A[4] = n479;
         assign BU1527_A[5] = n478;
         assign BU1527_A[6] = n477;
         assign BU1527_A[7] = n476;
         assign BU1527_A[8] = n475;
         assign BU1527_A[9] = n474;
         assign BU1527_A[10] = n473;
         assign BU1527_A[11] = n472;
         assign BU1527_A[12] = n471;
         assign BU1527_A[13] = n470;
         assign BU1527_A[14] = n469;
         assign BU1527_A[15] = n468;
         assign BU1527_A[16] = n467;
         assign BU1527_A[17] = n466;
         assign BU1527_A[18] = n465;
         assign BU1527_A[19] = n464;
         assign BU1527_A[20] = n463;
         assign BU1527_A[21] = n462;
         assign BU1527_A[22] = n461;
         assign BU1527_A[23] = n460;
      wire [0 : 0] BU1527_B;
         assign BU1527_B[0] = n1544;
      wire [24 : 0] BU1527_S;
         assign n1519 = BU1527_S[0];
         assign n1520 = BU1527_S[1];
         assign n1521 = BU1527_S[2];
         assign n1522 = BU1527_S[3];
         assign n1523 = BU1527_S[4];
         assign n1524 = BU1527_S[5];
         assign n1525 = BU1527_S[6];
         assign n1526 = BU1527_S[7];
         assign n1527 = BU1527_S[8];
         assign n1528 = BU1527_S[9];
         assign n1529 = BU1527_S[10];
         assign n1530 = BU1527_S[11];
         assign n1531 = BU1527_S[12];
         assign n1532 = BU1527_S[13];
         assign n1533 = BU1527_S[14];
         assign n1534 = BU1527_S[15];
         assign n1535 = BU1527_S[16];
         assign n1536 = BU1527_S[17];
         assign n1537 = BU1527_S[18];
         assign n1538 = BU1527_S[19];
         assign n1539 = BU1527_S[20];
         assign n1540 = BU1527_S[21];
         assign n1541 = BU1527_S[22];
         assign n1542 = BU1527_S[23];
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
         assign BU1628_I0 = n460;
      wire BU1628_I1;
         assign BU1628_I1 = n461;
      wire BU1628_I2;
         assign BU1628_I2 = n1542;
      wire BU1628_I3;
         assign BU1628_I3 = 1'b0;
      wire BU1628_O;
         assign n1553 = BU1628_O;
      LUT4       BU1628(
         .I0(BU1628_I0),
         .I1(BU1628_I1),
         .I2(BU1628_I2),
         .I3(BU1628_I3),
         .O(BU1628_O)
      );

      defparam BU1630.INIT = 'h4444;
      wire BU1630_I0;
         assign BU1630_I0 = n460;
      wire BU1630_I1;
         assign BU1630_I1 = n1542;
      wire BU1630_I2;
         assign BU1630_I2 = 1'b0;
      wire BU1630_I3;
         assign BU1630_I3 = 1'b0;
      wire BU1630_O;
         assign n1555 = BU1630_O;
      LUT4       BU1630(
         .I0(BU1630_I0),
         .I1(BU1630_I1),
         .I2(BU1630_I2),
         .I3(BU1630_I3),
         .O(BU1630_O)
      );

      wire [22 : 0] BU1631_D;
         assign BU1631_D[0] = n1519;
         assign BU1631_D[1] = n1520;
         assign BU1631_D[2] = n1521;
         assign BU1631_D[3] = n1522;
         assign BU1631_D[4] = n1523;
         assign BU1631_D[5] = n1524;
         assign BU1631_D[6] = n1525;
         assign BU1631_D[7] = n1526;
         assign BU1631_D[8] = n1527;
         assign BU1631_D[9] = n1528;
         assign BU1631_D[10] = n1529;
         assign BU1631_D[11] = n1530;
         assign BU1631_D[12] = n1531;
         assign BU1631_D[13] = n1532;
         assign BU1631_D[14] = n1533;
         assign BU1631_D[15] = n1534;
         assign BU1631_D[16] = n1535;
         assign BU1631_D[17] = n1536;
         assign BU1631_D[18] = n1537;
         assign BU1631_D[19] = n1538;
         assign BU1631_D[20] = n1539;
         assign BU1631_D[21] = n1540;
         assign BU1631_D[22] = n1541;
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
         assign BU1631_CLK = n155;
      wire BU1631_SCLR;
         assign BU1631_SCLR = n1553;
      wire BU1631_SSET;
         assign BU1631_SSET = n1555;
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
         assign BU1724_D[0] = n1542;
      wire [0 : 0] BU1724_Q;
         assign n26 = BU1724_Q[0];
      wire BU1724_CLK;
         assign BU1724_CLK = n155;
      wire BU1724_SCLR;
         assign BU1724_SCLR = n1555;
      wire BU1724_SSET;
         assign BU1724_SSET = n1553;
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
         assign BU1729_CLK = n155;
      wire [0 : 0] BU1729_D;
         assign BU1729_D[0] = n547;
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
         assign BU1734_clk = n155;
      wire [13 : 0] BU1734_a;
         assign BU1734_a[13] = n577;
         assign BU1734_a[12] = n578;
         assign BU1734_a[11] = n579;
         assign BU1734_a[10] = n580;
         assign BU1734_a[9] = n581;
         assign BU1734_a[8] = n582;
         assign BU1734_a[7] = n583;
         assign BU1734_a[6] = n584;
         assign BU1734_a[5] = n585;
         assign BU1734_a[4] = n586;
         assign BU1734_a[3] = n587;
         assign BU1734_a[2] = n588;
         assign BU1734_a[1] = n589;
         assign BU1734_a[0] = n590;
      wire [14 : 0] BU1734_b;
         assign BU1734_b[14] = n619;
         assign BU1734_b[13] = n620;
         assign BU1734_b[12] = n621;
         assign BU1734_b[11] = n622;
         assign BU1734_b[10] = n623;
         assign BU1734_b[9] = n624;
         assign BU1734_b[8] = n625;
         assign BU1734_b[7] = n626;
         assign BU1734_b[6] = n627;
         assign BU1734_b[5] = n628;
         assign BU1734_b[4] = n629;
         assign BU1734_b[3] = n630;
         assign BU1734_b[2] = n631;
         assign BU1734_b[1] = n632;
         assign BU1734_b[0] = n633;
      wire [28 : 0] BU1734_o;
      wire [28 : 0] BU1734_q;
         assign n664 = BU1734_q[28];
         assign n665 = BU1734_q[27];
         assign n666 = BU1734_q[26];
         assign n667 = BU1734_q[25];
         assign n668 = BU1734_q[24];
         assign n669 = BU1734_q[23];
         assign n670 = BU1734_q[22];
         assign n671 = BU1734_q[21];
         assign n672 = BU1734_q[20];
         assign n673 = BU1734_q[19];
         assign n674 = BU1734_q[18];
         assign n675 = BU1734_q[17];
         assign n676 = BU1734_q[16];
         assign n677 = BU1734_q[15];
         assign n678 = BU1734_q[14];
         assign n679 = BU1734_q[13];
         assign n680 = BU1734_q[12];
         assign n681 = BU1734_q[11];
         assign n682 = BU1734_q[10];
         assign n683 = BU1734_q[9];
         assign n684 = BU1734_q[8];
         assign n685 = BU1734_q[7];
         assign n686 = BU1734_q[6];
         assign n687 = BU1734_q[5];
         assign n688 = BU1734_q[4];
         assign n689 = BU1734_q[3];
         assign n690 = BU1734_q[2];
         assign n691 = BU1734_q[1];
         assign n692 = BU1734_q[0];
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
         assign BU1734_nd = n341;
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
         assign BU1955_I[0] = n692;
         assign BU1955_I[1] = n691;
         assign BU1955_I[2] = n690;
         assign BU1955_I[3] = n689;
         assign BU1955_I[4] = n688;
      wire BU1955_O;
         assign n2190 = BU1955_O;
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
         assign BU1964_I0 = n687;
      wire BU1964_I1;
         assign BU1964_I1 = n688;
      wire BU1964_I2;
         assign BU1964_I2 = n2190;
      wire BU1964_I3;
         assign BU1964_I3 = 1'b0;
      wire BU1964_O;
         assign n2187 = BU1964_O;
      LUT4       BU1964(
         .I0(BU1964_I0),
         .I1(BU1964_I1),
         .I2(BU1964_I2),
         .I3(BU1964_I3),
         .O(BU1964_O)
      );

      wire [23 : 0] BU1965_A;
         assign BU1965_A[0] = n687;
         assign BU1965_A[1] = n686;
         assign BU1965_A[2] = n685;
         assign BU1965_A[3] = n684;
         assign BU1965_A[4] = n683;
         assign BU1965_A[5] = n682;
         assign BU1965_A[6] = n681;
         assign BU1965_A[7] = n680;
         assign BU1965_A[8] = n679;
         assign BU1965_A[9] = n678;
         assign BU1965_A[10] = n677;
         assign BU1965_A[11] = n676;
         assign BU1965_A[12] = n675;
         assign BU1965_A[13] = n674;
         assign BU1965_A[14] = n673;
         assign BU1965_A[15] = n672;
         assign BU1965_A[16] = n671;
         assign BU1965_A[17] = n670;
         assign BU1965_A[18] = n669;
         assign BU1965_A[19] = n668;
         assign BU1965_A[20] = n667;
         assign BU1965_A[21] = n666;
         assign BU1965_A[22] = n665;
         assign BU1965_A[23] = n664;
      wire [0 : 0] BU1965_B;
         assign BU1965_B[0] = n2187;
      wire [24 : 0] BU1965_S;
         assign n2162 = BU1965_S[0];
         assign n2163 = BU1965_S[1];
         assign n2164 = BU1965_S[2];
         assign n2165 = BU1965_S[3];
         assign n2166 = BU1965_S[4];
         assign n2167 = BU1965_S[5];
         assign n2168 = BU1965_S[6];
         assign n2169 = BU1965_S[7];
         assign n2170 = BU1965_S[8];
         assign n2171 = BU1965_S[9];
         assign n2172 = BU1965_S[10];
         assign n2173 = BU1965_S[11];
         assign n2174 = BU1965_S[12];
         assign n2175 = BU1965_S[13];
         assign n2176 = BU1965_S[14];
         assign n2177 = BU1965_S[15];
         assign n2178 = BU1965_S[16];
         assign n2179 = BU1965_S[17];
         assign n2180 = BU1965_S[18];
         assign n2181 = BU1965_S[19];
         assign n2182 = BU1965_S[20];
         assign n2183 = BU1965_S[21];
         assign n2184 = BU1965_S[22];
         assign n2185 = BU1965_S[23];
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
         assign BU2066_I0 = n664;
      wire BU2066_I1;
         assign BU2066_I1 = n665;
      wire BU2066_I2;
         assign BU2066_I2 = n2185;
      wire BU2066_I3;
         assign BU2066_I3 = 1'b0;
      wire BU2066_O;
         assign n2196 = BU2066_O;
      LUT4       BU2066(
         .I0(BU2066_I0),
         .I1(BU2066_I1),
         .I2(BU2066_I2),
         .I3(BU2066_I3),
         .O(BU2066_O)
      );

      defparam BU2068.INIT = 'h4444;
      wire BU2068_I0;
         assign BU2068_I0 = n664;
      wire BU2068_I1;
         assign BU2068_I1 = n2185;
      wire BU2068_I2;
         assign BU2068_I2 = 1'b0;
      wire BU2068_I3;
         assign BU2068_I3 = 1'b0;
      wire BU2068_O;
         assign n2198 = BU2068_O;
      LUT4       BU2068(
         .I0(BU2068_I0),
         .I1(BU2068_I1),
         .I2(BU2068_I2),
         .I3(BU2068_I3),
         .O(BU2068_O)
      );

      wire [22 : 0] BU2069_D;
         assign BU2069_D[0] = n2162;
         assign BU2069_D[1] = n2163;
         assign BU2069_D[2] = n2164;
         assign BU2069_D[3] = n2165;
         assign BU2069_D[4] = n2166;
         assign BU2069_D[5] = n2167;
         assign BU2069_D[6] = n2168;
         assign BU2069_D[7] = n2169;
         assign BU2069_D[8] = n2170;
         assign BU2069_D[9] = n2171;
         assign BU2069_D[10] = n2172;
         assign BU2069_D[11] = n2173;
         assign BU2069_D[12] = n2174;
         assign BU2069_D[13] = n2175;
         assign BU2069_D[14] = n2176;
         assign BU2069_D[15] = n2177;
         assign BU2069_D[16] = n2178;
         assign BU2069_D[17] = n2179;
         assign BU2069_D[18] = n2180;
         assign BU2069_D[19] = n2181;
         assign BU2069_D[20] = n2182;
         assign BU2069_D[21] = n2183;
         assign BU2069_D[22] = n2184;
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
         assign BU2069_CLK = n155;
      wire BU2069_SCLR;
         assign BU2069_SCLR = n2196;
      wire BU2069_SSET;
         assign BU2069_SSET = n2198;
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
         assign BU2162_D[0] = n2185;
      wire [0 : 0] BU2162_Q;
         assign n50 = BU2162_Q[0];
      wire BU2162_CLK;
         assign BU2162_CLK = n155;
      wire BU2162_SCLR;
         assign BU2162_SCLR = n2198;
      wire BU2162_SSET;
         assign BU2162_SSET = n2196;
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
         assign BU2457_D = n2726;
      wire BU2457_C;
         assign BU2457_C = n155;
      wire BU2457_CE;
         assign BU2457_CE = 1'b1;
      wire BU2457_Q;
         assign n2677 = BU2457_Q;
      FDE       BU2457(
         .D(BU2457_D),
         .C(BU2457_C),
         .CE(BU2457_CE),
         .Q(BU2457_Q)
      );

      wire [22 : 0] BU2461_I;
         assign BU2461_I[0] = n2679;
         assign BU2461_I[1] = n2680;
         assign BU2461_I[2] = n2681;
         assign BU2461_I[3] = n2682;
         assign BU2461_I[4] = n2683;
         assign BU2461_I[5] = n2684;
         assign BU2461_I[6] = n2685;
         assign BU2461_I[7] = n2686;
         assign BU2461_I[8] = n2687;
         assign BU2461_I[9] = n2688;
         assign BU2461_I[10] = n2689;
         assign BU2461_I[11] = n2690;
         assign BU2461_I[12] = n2691;
         assign BU2461_I[13] = n2692;
         assign BU2461_I[14] = n2693;
         assign BU2461_I[15] = n2694;
         assign BU2461_I[16] = n2695;
         assign BU2461_I[17] = n2696;
         assign BU2461_I[18] = n2697;
         assign BU2461_I[19] = n2698;
         assign BU2461_I[20] = n2699;
         assign BU2461_I[21] = n2700;
         assign BU2461_I[22] = n2701;
      wire BU2461_O;
         assign n3042 = BU2461_O;
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
         assign BU2489_I0 = n2702;
      wire BU2489_I1;
         assign BU2489_I1 = n2701;
      wire BU2489_I2;
         assign BU2489_I2 = n3042;
      wire BU2489_I3;
         assign BU2489_I3 = 1'b0;
      wire BU2489_O;
         assign n3039 = BU2489_O;
      LUT4       BU2489(
         .I0(BU2489_I0),
         .I1(BU2489_I1),
         .I2(BU2489_I2),
         .I3(BU2489_I3),
         .O(BU2489_O)
      );

      wire [23 : 0] BU2490_A;
         assign BU2490_A[0] = n2702;
         assign BU2490_A[1] = n2703;
         assign BU2490_A[2] = n2704;
         assign BU2490_A[3] = n2705;
         assign BU2490_A[4] = n2706;
         assign BU2490_A[5] = n2707;
         assign BU2490_A[6] = n2708;
         assign BU2490_A[7] = n2709;
         assign BU2490_A[8] = n2710;
         assign BU2490_A[9] = n2711;
         assign BU2490_A[10] = n2712;
         assign BU2490_A[11] = n2713;
         assign BU2490_A[12] = n2714;
         assign BU2490_A[13] = n2715;
         assign BU2490_A[14] = n2716;
         assign BU2490_A[15] = n2717;
         assign BU2490_A[16] = n2718;
         assign BU2490_A[17] = n2719;
         assign BU2490_A[18] = n2720;
         assign BU2490_A[19] = n2721;
         assign BU2490_A[20] = n2722;
         assign BU2490_A[21] = n2723;
         assign BU2490_A[22] = n2724;
         assign BU2490_A[23] = n2725;
      wire [0 : 0] BU2490_B;
         assign BU2490_B[0] = n3039;
      wire [24 : 0] BU2490_S;
         assign n3014 = BU2490_S[0];
         assign n3015 = BU2490_S[1];
         assign n3016 = BU2490_S[2];
         assign n3017 = BU2490_S[3];
         assign n3018 = BU2490_S[4];
         assign n3019 = BU2490_S[5];
         assign n3020 = BU2490_S[6];
         assign n3021 = BU2490_S[7];
         assign n3022 = BU2490_S[8];
         assign n3023 = BU2490_S[9];
         assign n3024 = BU2490_S[10];
         assign n3025 = BU2490_S[11];
         assign n3026 = BU2490_S[12];
         assign n3027 = BU2490_S[13];
         assign n3028 = BU2490_S[14];
         assign n3029 = BU2490_S[15];
         assign n3030 = BU2490_S[16];
         assign n3031 = BU2490_S[17];
         assign n3032 = BU2490_S[18];
         assign n3033 = BU2490_S[19];
         assign n3034 = BU2490_S[20];
         assign n3035 = BU2490_S[21];
         assign n3036 = BU2490_S[22];
         assign n3037 = BU2490_S[23];
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
         assign BU2591_I0 = n2725;
      wire BU2591_I1;
         assign BU2591_I1 = n2724;
      wire BU2591_I2;
         assign BU2591_I2 = n3037;
      wire BU2591_I3;
         assign BU2591_I3 = 1'b0;
      wire BU2591_O;
         assign n3066 = BU2591_O;
      LUT4       BU2591(
         .I0(BU2591_I0),
         .I1(BU2591_I1),
         .I2(BU2591_I2),
         .I3(BU2591_I3),
         .O(BU2591_O)
      );

      defparam BU2593.INIT = 'h4444;
      wire BU2593_I0;
         assign BU2593_I0 = n2725;
      wire BU2593_I1;
         assign BU2593_I1 = n3037;
      wire BU2593_I2;
         assign BU2593_I2 = 1'b0;
      wire BU2593_I3;
         assign BU2593_I3 = 1'b0;
      wire BU2593_O;
         assign n3068 = BU2593_O;
      LUT4       BU2593(
         .I0(BU2593_I0),
         .I1(BU2593_I1),
         .I2(BU2593_I2),
         .I3(BU2593_I3),
         .O(BU2593_O)
      );

      wire [22 : 0] BU2594_D;
         assign BU2594_D[0] = n3014;
         assign BU2594_D[1] = n3015;
         assign BU2594_D[2] = n3016;
         assign BU2594_D[3] = n3017;
         assign BU2594_D[4] = n3018;
         assign BU2594_D[5] = n3019;
         assign BU2594_D[6] = n3020;
         assign BU2594_D[7] = n3021;
         assign BU2594_D[8] = n3022;
         assign BU2594_D[9] = n3023;
         assign BU2594_D[10] = n3024;
         assign BU2594_D[11] = n3025;
         assign BU2594_D[12] = n3026;
         assign BU2594_D[13] = n3027;
         assign BU2594_D[14] = n3028;
         assign BU2594_D[15] = n3029;
         assign BU2594_D[16] = n3030;
         assign BU2594_D[17] = n3031;
         assign BU2594_D[18] = n3032;
         assign BU2594_D[19] = n3033;
         assign BU2594_D[20] = n3034;
         assign BU2594_D[21] = n3035;
         assign BU2594_D[22] = n3036;
      wire [22 : 0] BU2594_Q;
         assign n2605 = BU2594_Q[0];
         assign n2606 = BU2594_Q[1];
         assign n2607 = BU2594_Q[2];
         assign n2608 = BU2594_Q[3];
         assign n2609 = BU2594_Q[4];
         assign n2610 = BU2594_Q[5];
         assign n2611 = BU2594_Q[6];
         assign n2612 = BU2594_Q[7];
         assign n2613 = BU2594_Q[8];
         assign n2614 = BU2594_Q[9];
         assign n2615 = BU2594_Q[10];
         assign n2616 = BU2594_Q[11];
         assign n2617 = BU2594_Q[12];
         assign n2618 = BU2594_Q[13];
         assign n2619 = BU2594_Q[14];
         assign n2620 = BU2594_Q[15];
         assign n2621 = BU2594_Q[16];
         assign n2622 = BU2594_Q[17];
         assign n2623 = BU2594_Q[18];
         assign n2624 = BU2594_Q[19];
         assign n2625 = BU2594_Q[20];
         assign n2626 = BU2594_Q[21];
         assign n2627 = BU2594_Q[22];
      wire BU2594_CLK;
         assign BU2594_CLK = n155;
      wire BU2594_SCLR;
         assign BU2594_SCLR = n3066;
      wire BU2594_SSET;
         assign BU2594_SSET = n3068;
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
         assign BU2687_D[0] = n3037;
      wire [0 : 0] BU2687_Q;
         assign n2628 = BU2687_Q[0];
      wire BU2687_CLK;
         assign BU2687_CLK = n155;
      wire BU2687_SCLR;
         assign BU2687_SCLR = n3068;
      wire BU2687_SSET;
         assign BU2687_SSET = n3066;
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
         assign BU7487_I[0] = n2727;
         assign BU7487_I[1] = n2728;
         assign BU7487_I[2] = n2729;
         assign BU7487_I[3] = n2730;
         assign BU7487_I[4] = n2731;
         assign BU7487_I[5] = n2732;
         assign BU7487_I[6] = n2733;
         assign BU7487_I[7] = n2734;
         assign BU7487_I[8] = n2735;
         assign BU7487_I[9] = n2736;
         assign BU7487_I[10] = n2737;
         assign BU7487_I[11] = n2738;
         assign BU7487_I[12] = n2739;
         assign BU7487_I[13] = n2740;
         assign BU7487_I[14] = n2741;
         assign BU7487_I[15] = n2742;
         assign BU7487_I[16] = n2743;
         assign BU7487_I[17] = n2744;
         assign BU7487_I[18] = n2745;
         assign BU7487_I[19] = n2746;
         assign BU7487_I[20] = n2747;
         assign BU7487_I[21] = n2748;
         assign BU7487_I[22] = n2749;
      wire BU7487_O;
         assign n3559 = BU7487_O;
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
         assign BU7515_I0 = n2750;
      wire BU7515_I1;
         assign BU7515_I1 = n2749;
      wire BU7515_I2;
         assign BU7515_I2 = n3559;
      wire BU7515_I3;
         assign BU7515_I3 = 1'b0;
      wire BU7515_O;
         assign n3556 = BU7515_O;
      LUT4       BU7515(
         .I0(BU7515_I0),
         .I1(BU7515_I1),
         .I2(BU7515_I2),
         .I3(BU7515_I3),
         .O(BU7515_O)
      );

      wire [23 : 0] BU7516_A;
         assign BU7516_A[0] = n2750;
         assign BU7516_A[1] = n2751;
         assign BU7516_A[2] = n2752;
         assign BU7516_A[3] = n2753;
         assign BU7516_A[4] = n2754;
         assign BU7516_A[5] = n2755;
         assign BU7516_A[6] = n2756;
         assign BU7516_A[7] = n2757;
         assign BU7516_A[8] = n2758;
         assign BU7516_A[9] = n2759;
         assign BU7516_A[10] = n2760;
         assign BU7516_A[11] = n2761;
         assign BU7516_A[12] = n2762;
         assign BU7516_A[13] = n2763;
         assign BU7516_A[14] = n2764;
         assign BU7516_A[15] = n2765;
         assign BU7516_A[16] = n2766;
         assign BU7516_A[17] = n2767;
         assign BU7516_A[18] = n2768;
         assign BU7516_A[19] = n2769;
         assign BU7516_A[20] = n2770;
         assign BU7516_A[21] = n2771;
         assign BU7516_A[22] = n2772;
         assign BU7516_A[23] = n2773;
      wire [0 : 0] BU7516_B;
         assign BU7516_B[0] = n3556;
      wire [24 : 0] BU7516_S;
         assign n3531 = BU7516_S[0];
         assign n3532 = BU7516_S[1];
         assign n3533 = BU7516_S[2];
         assign n3534 = BU7516_S[3];
         assign n3535 = BU7516_S[4];
         assign n3536 = BU7516_S[5];
         assign n3537 = BU7516_S[6];
         assign n3538 = BU7516_S[7];
         assign n3539 = BU7516_S[8];
         assign n3540 = BU7516_S[9];
         assign n3541 = BU7516_S[10];
         assign n3542 = BU7516_S[11];
         assign n3543 = BU7516_S[12];
         assign n3544 = BU7516_S[13];
         assign n3545 = BU7516_S[14];
         assign n3546 = BU7516_S[15];
         assign n3547 = BU7516_S[16];
         assign n3548 = BU7516_S[17];
         assign n3549 = BU7516_S[18];
         assign n3550 = BU7516_S[19];
         assign n3551 = BU7516_S[20];
         assign n3552 = BU7516_S[21];
         assign n3553 = BU7516_S[22];
         assign n3554 = BU7516_S[23];
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
         assign BU7617_I0 = n2773;
      wire BU7617_I1;
         assign BU7617_I1 = n2772;
      wire BU7617_I2;
         assign BU7617_I2 = n3554;
      wire BU7617_I3;
         assign BU7617_I3 = 1'b0;
      wire BU7617_O;
         assign n3583 = BU7617_O;
      LUT4       BU7617(
         .I0(BU7617_I0),
         .I1(BU7617_I1),
         .I2(BU7617_I2),
         .I3(BU7617_I3),
         .O(BU7617_O)
      );

      defparam BU7619.INIT = 'h4444;
      wire BU7619_I0;
         assign BU7619_I0 = n2773;
      wire BU7619_I1;
         assign BU7619_I1 = n3554;
      wire BU7619_I2;
         assign BU7619_I2 = 1'b0;
      wire BU7619_I3;
         assign BU7619_I3 = 1'b0;
      wire BU7619_O;
         assign n3585 = BU7619_O;
      LUT4       BU7619(
         .I0(BU7619_I0),
         .I1(BU7619_I1),
         .I2(BU7619_I2),
         .I3(BU7619_I3),
         .O(BU7619_O)
      );

      wire [22 : 0] BU7620_D;
         assign BU7620_D[0] = n3531;
         assign BU7620_D[1] = n3532;
         assign BU7620_D[2] = n3533;
         assign BU7620_D[3] = n3534;
         assign BU7620_D[4] = n3535;
         assign BU7620_D[5] = n3536;
         assign BU7620_D[6] = n3537;
         assign BU7620_D[7] = n3538;
         assign BU7620_D[8] = n3539;
         assign BU7620_D[9] = n3540;
         assign BU7620_D[10] = n3541;
         assign BU7620_D[11] = n3542;
         assign BU7620_D[12] = n3543;
         assign BU7620_D[13] = n3544;
         assign BU7620_D[14] = n3545;
         assign BU7620_D[15] = n3546;
         assign BU7620_D[16] = n3547;
         assign BU7620_D[17] = n3548;
         assign BU7620_D[18] = n3549;
         assign BU7620_D[19] = n3550;
         assign BU7620_D[20] = n3551;
         assign BU7620_D[21] = n3552;
         assign BU7620_D[22] = n3553;
      wire [22 : 0] BU7620_Q;
         assign n2629 = BU7620_Q[0];
         assign n2630 = BU7620_Q[1];
         assign n2631 = BU7620_Q[2];
         assign n2632 = BU7620_Q[3];
         assign n2633 = BU7620_Q[4];
         assign n2634 = BU7620_Q[5];
         assign n2635 = BU7620_Q[6];
         assign n2636 = BU7620_Q[7];
         assign n2637 = BU7620_Q[8];
         assign n2638 = BU7620_Q[9];
         assign n2639 = BU7620_Q[10];
         assign n2640 = BU7620_Q[11];
         assign n2641 = BU7620_Q[12];
         assign n2642 = BU7620_Q[13];
         assign n2643 = BU7620_Q[14];
         assign n2644 = BU7620_Q[15];
         assign n2645 = BU7620_Q[16];
         assign n2646 = BU7620_Q[17];
         assign n2647 = BU7620_Q[18];
         assign n2648 = BU7620_Q[19];
         assign n2649 = BU7620_Q[20];
         assign n2650 = BU7620_Q[21];
         assign n2651 = BU7620_Q[22];
      wire BU7620_CLK;
         assign BU7620_CLK = n155;
      wire BU7620_SCLR;
         assign BU7620_SCLR = n3583;
      wire BU7620_SSET;
         assign BU7620_SSET = n3585;
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
         assign BU7713_D[0] = n3554;
      wire [0 : 0] BU7713_Q;
         assign n2652 = BU7713_Q[0];
      wire BU7713_CLK;
         assign BU7713_CLK = n155;
      wire BU7713_SCLR;
         assign BU7713_SCLR = n3585;
      wire BU7713_SSET;
         assign BU7713_SSET = n3583;
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
         assign BU2173_D = n2629;
      wire BU2173_C;
         assign BU2173_C = n155;
      wire BU2173_CE;
         assign BU2173_CE = 1'b1;
      wire BU2173_Q;
         assign n2653 = BU2173_Q;
      FDE       BU2173(
         .D(BU2173_D),
         .C(BU2173_C),
         .CE(BU2173_CE),
         .Q(BU2173_Q)
      );

      wire BU2175_D;
         assign BU2175_D = n2630;
      wire BU2175_C;
         assign BU2175_C = n155;
      wire BU2175_CE;
         assign BU2175_CE = 1'b1;
      wire BU2175_Q;
         assign n2654 = BU2175_Q;
      FDE       BU2175(
         .D(BU2175_D),
         .C(BU2175_C),
         .CE(BU2175_CE),
         .Q(BU2175_Q)
      );

      wire BU2177_D;
         assign BU2177_D = n2631;
      wire BU2177_C;
         assign BU2177_C = n155;
      wire BU2177_CE;
         assign BU2177_CE = 1'b1;
      wire BU2177_Q;
         assign n2655 = BU2177_Q;
      FDE       BU2177(
         .D(BU2177_D),
         .C(BU2177_C),
         .CE(BU2177_CE),
         .Q(BU2177_Q)
      );

      wire BU2179_D;
         assign BU2179_D = n2632;
      wire BU2179_C;
         assign BU2179_C = n155;
      wire BU2179_CE;
         assign BU2179_CE = 1'b1;
      wire BU2179_Q;
         assign n2656 = BU2179_Q;
      FDE       BU2179(
         .D(BU2179_D),
         .C(BU2179_C),
         .CE(BU2179_CE),
         .Q(BU2179_Q)
      );

      wire BU2181_D;
         assign BU2181_D = n2633;
      wire BU2181_C;
         assign BU2181_C = n155;
      wire BU2181_CE;
         assign BU2181_CE = 1'b1;
      wire BU2181_Q;
         assign n2657 = BU2181_Q;
      FDE       BU2181(
         .D(BU2181_D),
         .C(BU2181_C),
         .CE(BU2181_CE),
         .Q(BU2181_Q)
      );

      wire BU2183_D;
         assign BU2183_D = n2634;
      wire BU2183_C;
         assign BU2183_C = n155;
      wire BU2183_CE;
         assign BU2183_CE = 1'b1;
      wire BU2183_Q;
         assign n2658 = BU2183_Q;
      FDE       BU2183(
         .D(BU2183_D),
         .C(BU2183_C),
         .CE(BU2183_CE),
         .Q(BU2183_Q)
      );

      wire BU2185_D;
         assign BU2185_D = n2635;
      wire BU2185_C;
         assign BU2185_C = n155;
      wire BU2185_CE;
         assign BU2185_CE = 1'b1;
      wire BU2185_Q;
         assign n2659 = BU2185_Q;
      FDE       BU2185(
         .D(BU2185_D),
         .C(BU2185_C),
         .CE(BU2185_CE),
         .Q(BU2185_Q)
      );

      wire BU2187_D;
         assign BU2187_D = n2636;
      wire BU2187_C;
         assign BU2187_C = n155;
      wire BU2187_CE;
         assign BU2187_CE = 1'b1;
      wire BU2187_Q;
         assign n2660 = BU2187_Q;
      FDE       BU2187(
         .D(BU2187_D),
         .C(BU2187_C),
         .CE(BU2187_CE),
         .Q(BU2187_Q)
      );

      wire BU2189_D;
         assign BU2189_D = n2637;
      wire BU2189_C;
         assign BU2189_C = n155;
      wire BU2189_CE;
         assign BU2189_CE = 1'b1;
      wire BU2189_Q;
         assign n2661 = BU2189_Q;
      FDE       BU2189(
         .D(BU2189_D),
         .C(BU2189_C),
         .CE(BU2189_CE),
         .Q(BU2189_Q)
      );

      wire BU2191_D;
         assign BU2191_D = n2638;
      wire BU2191_C;
         assign BU2191_C = n155;
      wire BU2191_CE;
         assign BU2191_CE = 1'b1;
      wire BU2191_Q;
         assign n2662 = BU2191_Q;
      FDE       BU2191(
         .D(BU2191_D),
         .C(BU2191_C),
         .CE(BU2191_CE),
         .Q(BU2191_Q)
      );

      wire BU2193_D;
         assign BU2193_D = n2639;
      wire BU2193_C;
         assign BU2193_C = n155;
      wire BU2193_CE;
         assign BU2193_CE = 1'b1;
      wire BU2193_Q;
         assign n2663 = BU2193_Q;
      FDE       BU2193(
         .D(BU2193_D),
         .C(BU2193_C),
         .CE(BU2193_CE),
         .Q(BU2193_Q)
      );

      wire BU2195_D;
         assign BU2195_D = n2640;
      wire BU2195_C;
         assign BU2195_C = n155;
      wire BU2195_CE;
         assign BU2195_CE = 1'b1;
      wire BU2195_Q;
         assign n2664 = BU2195_Q;
      FDE       BU2195(
         .D(BU2195_D),
         .C(BU2195_C),
         .CE(BU2195_CE),
         .Q(BU2195_Q)
      );

      wire BU2197_D;
         assign BU2197_D = n2641;
      wire BU2197_C;
         assign BU2197_C = n155;
      wire BU2197_CE;
         assign BU2197_CE = 1'b1;
      wire BU2197_Q;
         assign n2665 = BU2197_Q;
      FDE       BU2197(
         .D(BU2197_D),
         .C(BU2197_C),
         .CE(BU2197_CE),
         .Q(BU2197_Q)
      );

      wire BU2199_D;
         assign BU2199_D = n2642;
      wire BU2199_C;
         assign BU2199_C = n155;
      wire BU2199_CE;
         assign BU2199_CE = 1'b1;
      wire BU2199_Q;
         assign n2666 = BU2199_Q;
      FDE       BU2199(
         .D(BU2199_D),
         .C(BU2199_C),
         .CE(BU2199_CE),
         .Q(BU2199_Q)
      );

      wire BU2201_D;
         assign BU2201_D = n2643;
      wire BU2201_C;
         assign BU2201_C = n155;
      wire BU2201_CE;
         assign BU2201_CE = 1'b1;
      wire BU2201_Q;
         assign n2667 = BU2201_Q;
      FDE       BU2201(
         .D(BU2201_D),
         .C(BU2201_C),
         .CE(BU2201_CE),
         .Q(BU2201_Q)
      );

      wire BU2203_D;
         assign BU2203_D = n2644;
      wire BU2203_C;
         assign BU2203_C = n155;
      wire BU2203_CE;
         assign BU2203_CE = 1'b1;
      wire BU2203_Q;
         assign n2668 = BU2203_Q;
      FDE       BU2203(
         .D(BU2203_D),
         .C(BU2203_C),
         .CE(BU2203_CE),
         .Q(BU2203_Q)
      );

      wire BU2205_D;
         assign BU2205_D = n2645;
      wire BU2205_C;
         assign BU2205_C = n155;
      wire BU2205_CE;
         assign BU2205_CE = 1'b1;
      wire BU2205_Q;
         assign n2669 = BU2205_Q;
      FDE       BU2205(
         .D(BU2205_D),
         .C(BU2205_C),
         .CE(BU2205_CE),
         .Q(BU2205_Q)
      );

      wire BU2207_D;
         assign BU2207_D = n2646;
      wire BU2207_C;
         assign BU2207_C = n155;
      wire BU2207_CE;
         assign BU2207_CE = 1'b1;
      wire BU2207_Q;
         assign n2670 = BU2207_Q;
      FDE       BU2207(
         .D(BU2207_D),
         .C(BU2207_C),
         .CE(BU2207_CE),
         .Q(BU2207_Q)
      );

      wire BU2209_D;
         assign BU2209_D = n2647;
      wire BU2209_C;
         assign BU2209_C = n155;
      wire BU2209_CE;
         assign BU2209_CE = 1'b1;
      wire BU2209_Q;
         assign n2671 = BU2209_Q;
      FDE       BU2209(
         .D(BU2209_D),
         .C(BU2209_C),
         .CE(BU2209_CE),
         .Q(BU2209_Q)
      );

      wire BU2211_D;
         assign BU2211_D = n2648;
      wire BU2211_C;
         assign BU2211_C = n155;
      wire BU2211_CE;
         assign BU2211_CE = 1'b1;
      wire BU2211_Q;
         assign n2672 = BU2211_Q;
      FDE       BU2211(
         .D(BU2211_D),
         .C(BU2211_C),
         .CE(BU2211_CE),
         .Q(BU2211_Q)
      );

      wire BU2213_D;
         assign BU2213_D = n2649;
      wire BU2213_C;
         assign BU2213_C = n155;
      wire BU2213_CE;
         assign BU2213_CE = 1'b1;
      wire BU2213_Q;
         assign n2673 = BU2213_Q;
      FDE       BU2213(
         .D(BU2213_D),
         .C(BU2213_C),
         .CE(BU2213_CE),
         .Q(BU2213_Q)
      );

      wire BU2215_D;
         assign BU2215_D = n2650;
      wire BU2215_C;
         assign BU2215_C = n155;
      wire BU2215_CE;
         assign BU2215_CE = 1'b1;
      wire BU2215_Q;
         assign n2674 = BU2215_Q;
      FDE       BU2215(
         .D(BU2215_D),
         .C(BU2215_C),
         .CE(BU2215_CE),
         .Q(BU2215_Q)
      );

      wire BU2217_D;
         assign BU2217_D = n2651;
      wire BU2217_C;
         assign BU2217_C = n155;
      wire BU2217_CE;
         assign BU2217_CE = 1'b1;
      wire BU2217_Q;
         assign n2675 = BU2217_Q;
      FDE       BU2217(
         .D(BU2217_D),
         .C(BU2217_C),
         .CE(BU2217_CE),
         .Q(BU2217_Q)
      );

      wire BU2219_D;
         assign BU2219_D = n2652;
      wire BU2219_C;
         assign BU2219_C = n155;
      wire BU2219_CE;
         assign BU2219_CE = 1'b1;
      wire BU2219_Q;
         assign n2676 = BU2219_Q;
      FDE       BU2219(
         .D(BU2219_D),
         .C(BU2219_C),
         .CE(BU2219_CE),
         .Q(BU2219_Q)
      );

      wire [23 : 0] BU2220_MA;
         assign BU2220_MA[0] = n2653;
         assign BU2220_MA[1] = n2654;
         assign BU2220_MA[2] = n2655;
         assign BU2220_MA[3] = n2656;
         assign BU2220_MA[4] = n2657;
         assign BU2220_MA[5] = n2658;
         assign BU2220_MA[6] = n2659;
         assign BU2220_MA[7] = n2660;
         assign BU2220_MA[8] = n2661;
         assign BU2220_MA[9] = n2662;
         assign BU2220_MA[10] = n2663;
         assign BU2220_MA[11] = n2664;
         assign BU2220_MA[12] = n2665;
         assign BU2220_MA[13] = n2666;
         assign BU2220_MA[14] = n2667;
         assign BU2220_MA[15] = n2668;
         assign BU2220_MA[16] = n2669;
         assign BU2220_MA[17] = n2670;
         assign BU2220_MA[18] = n2671;
         assign BU2220_MA[19] = n2672;
         assign BU2220_MA[20] = n2673;
         assign BU2220_MA[21] = n2674;
         assign BU2220_MA[22] = n2675;
         assign BU2220_MA[23] = n2676;
      wire [23 : 0] BU2220_MB;
         assign BU2220_MB[0] = n2605;
         assign BU2220_MB[1] = n2606;
         assign BU2220_MB[2] = n2607;
         assign BU2220_MB[3] = n2608;
         assign BU2220_MB[4] = n2609;
         assign BU2220_MB[5] = n2610;
         assign BU2220_MB[6] = n2611;
         assign BU2220_MB[7] = n2612;
         assign BU2220_MB[8] = n2613;
         assign BU2220_MB[9] = n2614;
         assign BU2220_MB[10] = n2615;
         assign BU2220_MB[11] = n2616;
         assign BU2220_MB[12] = n2617;
         assign BU2220_MB[13] = n2618;
         assign BU2220_MB[14] = n2619;
         assign BU2220_MB[15] = n2620;
         assign BU2220_MB[16] = n2621;
         assign BU2220_MB[17] = n2622;
         assign BU2220_MB[18] = n2623;
         assign BU2220_MB[19] = n2624;
         assign BU2220_MB[20] = n2625;
         assign BU2220_MB[21] = n2626;
         assign BU2220_MB[22] = n2627;
         assign BU2220_MB[23] = n2628;
      wire [0 : 0] BU2220_S;
         assign BU2220_S[0] = n2677;
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
         assign BU2220_CLK = n155;
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
         assign BU2448_D = n2677;
      wire BU2448_C;
         assign BU2448_C = n155;
      wire BU2448_CE;
         assign BU2448_CE = 1'b1;
      wire BU2448_Q;
         assign n2678 = BU2448_Q;
      FDE       BU2448(
         .D(BU2448_D),
         .C(BU2448_C),
         .CE(BU2448_CE),
         .Q(BU2448_Q)
      );

      defparam BU2452.INIT = 'heeee;
      wire BU2452_I0;
         assign BU2452_I0 = n2677;
      wire BU2452_I1;
         assign BU2452_I1 = n2678;
      wire BU2452_I2;
         assign BU2452_I2 = 1'b0;
      wire BU2452_I3;
         assign BU2452_I3 = 1'b0;
      wire BU2452_O;
         assign n4445 = BU2452_O;
      LUT4       BU2452(
         .I0(BU2452_I0),
         .I1(BU2452_I1),
         .I2(BU2452_I2),
         .I3(BU2452_I3),
         .O(BU2452_O)
      );

      wire BU2453_D;
         assign BU2453_D = n4445;
      wire BU2453_C;
         assign BU2453_C = n155;
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
         assign BU2692_CLK = n155;
      wire [46 : 0] BU2692_DOUT;
         assign n2679 = BU2692_DOUT[0];
         assign n2680 = BU2692_DOUT[1];
         assign n2681 = BU2692_DOUT[2];
         assign n2682 = BU2692_DOUT[3];
         assign n2683 = BU2692_DOUT[4];
         assign n2684 = BU2692_DOUT[5];
         assign n2685 = BU2692_DOUT[6];
         assign n2686 = BU2692_DOUT[7];
         assign n2687 = BU2692_DOUT[8];
         assign n2688 = BU2692_DOUT[9];
         assign n2689 = BU2692_DOUT[10];
         assign n2690 = BU2692_DOUT[11];
         assign n2691 = BU2692_DOUT[12];
         assign n2692 = BU2692_DOUT[13];
         assign n2693 = BU2692_DOUT[14];
         assign n2694 = BU2692_DOUT[15];
         assign n2695 = BU2692_DOUT[16];
         assign n2696 = BU2692_DOUT[17];
         assign n2697 = BU2692_DOUT[18];
         assign n2698 = BU2692_DOUT[19];
         assign n2699 = BU2692_DOUT[20];
         assign n2700 = BU2692_DOUT[21];
         assign n2701 = BU2692_DOUT[22];
         assign n2702 = BU2692_DOUT[23];
         assign n2703 = BU2692_DOUT[24];
         assign n2704 = BU2692_DOUT[25];
         assign n2705 = BU2692_DOUT[26];
         assign n2706 = BU2692_DOUT[27];
         assign n2707 = BU2692_DOUT[28];
         assign n2708 = BU2692_DOUT[29];
         assign n2709 = BU2692_DOUT[30];
         assign n2710 = BU2692_DOUT[31];
         assign n2711 = BU2692_DOUT[32];
         assign n2712 = BU2692_DOUT[33];
         assign n2713 = BU2692_DOUT[34];
         assign n2714 = BU2692_DOUT[35];
         assign n2715 = BU2692_DOUT[36];
         assign n2716 = BU2692_DOUT[37];
         assign n2717 = BU2692_DOUT[38];
         assign n2718 = BU2692_DOUT[39];
         assign n2719 = BU2692_DOUT[40];
         assign n2720 = BU2692_DOUT[41];
         assign n2721 = BU2692_DOUT[42];
         assign n2722 = BU2692_DOUT[43];
         assign n2723 = BU2692_DOUT[44];
         assign n2724 = BU2692_DOUT[45];
         assign n2725 = BU2692_DOUT[46];
      wire BU2692_RDY;
         assign n2726 = BU2692_RDY;
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
         assign BU7718_CLK = n155;
      wire [46 : 0] BU7718_DOUT;
         assign n2727 = BU7718_DOUT[0];
         assign n2728 = BU7718_DOUT[1];
         assign n2729 = BU7718_DOUT[2];
         assign n2730 = BU7718_DOUT[3];
         assign n2731 = BU7718_DOUT[4];
         assign n2732 = BU7718_DOUT[5];
         assign n2733 = BU7718_DOUT[6];
         assign n2734 = BU7718_DOUT[7];
         assign n2735 = BU7718_DOUT[8];
         assign n2736 = BU7718_DOUT[9];
         assign n2737 = BU7718_DOUT[10];
         assign n2738 = BU7718_DOUT[11];
         assign n2739 = BU7718_DOUT[12];
         assign n2740 = BU7718_DOUT[13];
         assign n2741 = BU7718_DOUT[14];
         assign n2742 = BU7718_DOUT[15];
         assign n2743 = BU7718_DOUT[16];
         assign n2744 = BU7718_DOUT[17];
         assign n2745 = BU7718_DOUT[18];
         assign n2746 = BU7718_DOUT[19];
         assign n2747 = BU7718_DOUT[20];
         assign n2748 = BU7718_DOUT[21];
         assign n2749 = BU7718_DOUT[22];
         assign n2750 = BU7718_DOUT[23];
         assign n2751 = BU7718_DOUT[24];
         assign n2752 = BU7718_DOUT[25];
         assign n2753 = BU7718_DOUT[26];
         assign n2754 = BU7718_DOUT[27];
         assign n2755 = BU7718_DOUT[28];
         assign n2756 = BU7718_DOUT[29];
         assign n2757 = BU7718_DOUT[30];
         assign n2758 = BU7718_DOUT[31];
         assign n2759 = BU7718_DOUT[32];
         assign n2760 = BU7718_DOUT[33];
         assign n2761 = BU7718_DOUT[34];
         assign n2762 = BU7718_DOUT[35];
         assign n2763 = BU7718_DOUT[36];
         assign n2764 = BU7718_DOUT[37];
         assign n2765 = BU7718_DOUT[38];
         assign n2766 = BU7718_DOUT[39];
         assign n2767 = BU7718_DOUT[40];
         assign n2768 = BU7718_DOUT[41];
         assign n2769 = BU7718_DOUT[42];
         assign n2770 = BU7718_DOUT[43];
         assign n2771 = BU7718_DOUT[44];
         assign n2772 = BU7718_DOUT[45];
         assign n2773 = BU7718_DOUT[46];
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
         assign BU12513_I0 = n6719;
      wire BU12513_I1;
         assign BU12513_I1 = n6691;
      wire BU12513_I2;
         assign BU12513_I2 = 1'b0;
      wire BU12513_I3;
         assign BU12513_I3 = 1'b0;
      wire BU12513_O;
         assign n6718 = BU12513_O;
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
         assign n6819 = BU12518_O;
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
         assign BU12524_CE = n6819;
      wire BU12524_CLK;
         assign BU12524_CLK = n155;
      wire BU12524_A0;
         assign BU12524_A0 = n6815;
      wire BU12524_A1;
         assign BU12524_A1 = n6816;
      wire BU12524_A2;
         assign BU12524_A2 = n6817;
      wire BU12524_A3;
         assign BU12524_A3 = n6818;
      wire BU12524_Q;
         assign n6692 = BU12524_Q;
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
         assign BU12525_CE = n6819;
      wire BU12525_CLK;
         assign BU12525_CLK = n155;
      wire BU12525_A0;
         assign BU12525_A0 = n6815;
      wire BU12525_A1;
         assign BU12525_A1 = n6816;
      wire BU12525_A2;
         assign BU12525_A2 = n6817;
      wire BU12525_A3;
         assign BU12525_A3 = n6818;
      wire BU12525_Q;
         assign n6693 = BU12525_Q;
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
         assign BU12526_CE = n6819;
      wire BU12526_CLK;
         assign BU12526_CLK = n155;
      wire BU12526_A0;
         assign BU12526_A0 = n6815;
      wire BU12526_A1;
         assign BU12526_A1 = n6816;
      wire BU12526_A2;
         assign BU12526_A2 = n6817;
      wire BU12526_A3;
         assign BU12526_A3 = n6818;
      wire BU12526_Q;
         assign n6694 = BU12526_Q;
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
         assign BU12527_CE = n6819;
      wire BU12527_CLK;
         assign BU12527_CLK = n155;
      wire BU12527_A0;
         assign BU12527_A0 = n6815;
      wire BU12527_A1;
         assign BU12527_A1 = n6816;
      wire BU12527_A2;
         assign BU12527_A2 = n6817;
      wire BU12527_A3;
         assign BU12527_A3 = n6818;
      wire BU12527_Q;
         assign n6695 = BU12527_Q;
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
         assign BU12528_CE = n6819;
      wire BU12528_CLK;
         assign BU12528_CLK = n155;
      wire BU12528_A0;
         assign BU12528_A0 = n6815;
      wire BU12528_A1;
         assign BU12528_A1 = n6816;
      wire BU12528_A2;
         assign BU12528_A2 = n6817;
      wire BU12528_A3;
         assign BU12528_A3 = n6818;
      wire BU12528_Q;
         assign n6696 = BU12528_Q;
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
         assign BU12529_CE = n6819;
      wire BU12529_CLK;
         assign BU12529_CLK = n155;
      wire BU12529_A0;
         assign BU12529_A0 = n6815;
      wire BU12529_A1;
         assign BU12529_A1 = n6816;
      wire BU12529_A2;
         assign BU12529_A2 = n6817;
      wire BU12529_A3;
         assign BU12529_A3 = n6818;
      wire BU12529_Q;
         assign n6697 = BU12529_Q;
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
         assign BU12530_CE = n6819;
      wire BU12530_CLK;
         assign BU12530_CLK = n155;
      wire BU12530_A0;
         assign BU12530_A0 = n6815;
      wire BU12530_A1;
         assign BU12530_A1 = n6816;
      wire BU12530_A2;
         assign BU12530_A2 = n6817;
      wire BU12530_A3;
         assign BU12530_A3 = n6818;
      wire BU12530_Q;
         assign n6698 = BU12530_Q;
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
         assign BU12531_CE = n6819;
      wire BU12531_CLK;
         assign BU12531_CLK = n155;
      wire BU12531_A0;
         assign BU12531_A0 = n6815;
      wire BU12531_A1;
         assign BU12531_A1 = n6816;
      wire BU12531_A2;
         assign BU12531_A2 = n6817;
      wire BU12531_A3;
         assign BU12531_A3 = n6818;
      wire BU12531_Q;
         assign n6699 = BU12531_Q;
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
         assign BU12532_CE = n6819;
      wire BU12532_CLK;
         assign BU12532_CLK = n155;
      wire BU12532_A0;
         assign BU12532_A0 = n6815;
      wire BU12532_A1;
         assign BU12532_A1 = n6816;
      wire BU12532_A2;
         assign BU12532_A2 = n6817;
      wire BU12532_A3;
         assign BU12532_A3 = n6818;
      wire BU12532_Q;
         assign n6700 = BU12532_Q;
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
         assign BU12533_CE = n6819;
      wire BU12533_CLK;
         assign BU12533_CLK = n155;
      wire BU12533_A0;
         assign BU12533_A0 = n6815;
      wire BU12533_A1;
         assign BU12533_A1 = n6816;
      wire BU12533_A2;
         assign BU12533_A2 = n6817;
      wire BU12533_A3;
         assign BU12533_A3 = n6818;
      wire BU12533_Q;
         assign n6701 = BU12533_Q;
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
         assign BU12534_CE = n6819;
      wire BU12534_CLK;
         assign BU12534_CLK = n155;
      wire BU12534_A0;
         assign BU12534_A0 = n6815;
      wire BU12534_A1;
         assign BU12534_A1 = n6816;
      wire BU12534_A2;
         assign BU12534_A2 = n6817;
      wire BU12534_A3;
         assign BU12534_A3 = n6818;
      wire BU12534_Q;
         assign n6702 = BU12534_Q;
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
         assign BU12535_CE = n6819;
      wire BU12535_CLK;
         assign BU12535_CLK = n155;
      wire BU12535_A0;
         assign BU12535_A0 = n6815;
      wire BU12535_A1;
         assign BU12535_A1 = n6816;
      wire BU12535_A2;
         assign BU12535_A2 = n6817;
      wire BU12535_A3;
         assign BU12535_A3 = n6818;
      wire BU12535_Q;
         assign n6703 = BU12535_Q;
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
         assign BU12536_CE = n6819;
      wire BU12536_CLK;
         assign BU12536_CLK = n155;
      wire BU12536_A0;
         assign BU12536_A0 = n6815;
      wire BU12536_A1;
         assign BU12536_A1 = n6816;
      wire BU12536_A2;
         assign BU12536_A2 = n6817;
      wire BU12536_A3;
         assign BU12536_A3 = n6818;
      wire BU12536_Q;
         assign n6704 = BU12536_Q;
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
         assign BU12537_CE = n6819;
      wire BU12537_CLK;
         assign BU12537_CLK = n155;
      wire BU12537_A0;
         assign BU12537_A0 = n6815;
      wire BU12537_A1;
         assign BU12537_A1 = n6816;
      wire BU12537_A2;
         assign BU12537_A2 = n6817;
      wire BU12537_A3;
         assign BU12537_A3 = n6818;
      wire BU12537_Q;
         assign n6705 = BU12537_Q;
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
         assign BU12538_CE = n6819;
      wire BU12538_CLK;
         assign BU12538_CLK = n155;
      wire BU12538_A0;
         assign BU12538_A0 = n6815;
      wire BU12538_A1;
         assign BU12538_A1 = n6816;
      wire BU12538_A2;
         assign BU12538_A2 = n6817;
      wire BU12538_A3;
         assign BU12538_A3 = n6818;
      wire BU12538_Q;
         assign n6706 = BU12538_Q;
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
         assign BU12539_CE = n6819;
      wire BU12539_CLK;
         assign BU12539_CLK = n155;
      wire BU12539_A0;
         assign BU12539_A0 = n6815;
      wire BU12539_A1;
         assign BU12539_A1 = n6816;
      wire BU12539_A2;
         assign BU12539_A2 = n6817;
      wire BU12539_A3;
         assign BU12539_A3 = n6818;
      wire BU12539_Q;
         assign n6707 = BU12539_Q;
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
         assign BU12540_CE = n6819;
      wire BU12540_CLK;
         assign BU12540_CLK = n155;
      wire BU12540_A0;
         assign BU12540_A0 = n6815;
      wire BU12540_A1;
         assign BU12540_A1 = n6816;
      wire BU12540_A2;
         assign BU12540_A2 = n6817;
      wire BU12540_A3;
         assign BU12540_A3 = n6818;
      wire BU12540_Q;
         assign n6708 = BU12540_Q;
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
         assign BU12541_CE = n6819;
      wire BU12541_CLK;
         assign BU12541_CLK = n155;
      wire BU12541_A0;
         assign BU12541_A0 = n6815;
      wire BU12541_A1;
         assign BU12541_A1 = n6816;
      wire BU12541_A2;
         assign BU12541_A2 = n6817;
      wire BU12541_A3;
         assign BU12541_A3 = n6818;
      wire BU12541_Q;
         assign n6709 = BU12541_Q;
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
         assign BU12542_CE = n6819;
      wire BU12542_CLK;
         assign BU12542_CLK = n155;
      wire BU12542_A0;
         assign BU12542_A0 = n6815;
      wire BU12542_A1;
         assign BU12542_A1 = n6816;
      wire BU12542_A2;
         assign BU12542_A2 = n6817;
      wire BU12542_A3;
         assign BU12542_A3 = n6818;
      wire BU12542_Q;
         assign n6710 = BU12542_Q;
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
         assign BU12543_CE = n6819;
      wire BU12543_CLK;
         assign BU12543_CLK = n155;
      wire BU12543_A0;
         assign BU12543_A0 = n6815;
      wire BU12543_A1;
         assign BU12543_A1 = n6816;
      wire BU12543_A2;
         assign BU12543_A2 = n6817;
      wire BU12543_A3;
         assign BU12543_A3 = n6818;
      wire BU12543_Q;
         assign n6711 = BU12543_Q;
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
         assign BU12544_CE = n6819;
      wire BU12544_CLK;
         assign BU12544_CLK = n155;
      wire BU12544_A0;
         assign BU12544_A0 = n6815;
      wire BU12544_A1;
         assign BU12544_A1 = n6816;
      wire BU12544_A2;
         assign BU12544_A2 = n6817;
      wire BU12544_A3;
         assign BU12544_A3 = n6818;
      wire BU12544_Q;
         assign n6712 = BU12544_Q;
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
         assign BU12545_CE = n6819;
      wire BU12545_CLK;
         assign BU12545_CLK = n155;
      wire BU12545_A0;
         assign BU12545_A0 = n6815;
      wire BU12545_A1;
         assign BU12545_A1 = n6816;
      wire BU12545_A2;
         assign BU12545_A2 = n6817;
      wire BU12545_A3;
         assign BU12545_A3 = n6818;
      wire BU12545_Q;
         assign n6713 = BU12545_Q;
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
         assign BU12546_CE = n6819;
      wire BU12546_CLK;
         assign BU12546_CLK = n155;
      wire BU12546_A0;
         assign BU12546_A0 = n6815;
      wire BU12546_A1;
         assign BU12546_A1 = n6816;
      wire BU12546_A2;
         assign BU12546_A2 = n6817;
      wire BU12546_A3;
         assign BU12546_A3 = n6818;
      wire BU12546_Q;
         assign n6714 = BU12546_Q;
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
         assign BU12547_CE = n6819;
      wire BU12547_CLK;
         assign BU12547_CLK = n155;
      wire BU12547_A0;
         assign BU12547_A0 = n6815;
      wire BU12547_A1;
         assign BU12547_A1 = n6816;
      wire BU12547_A2;
         assign BU12547_A2 = n6817;
      wire BU12547_A3;
         assign BU12547_A3 = n6818;
      wire BU12547_Q;
         assign n6715 = BU12547_Q;
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
         assign BU12548_CE = n6819;
      wire BU12548_CLK;
         assign BU12548_CLK = n155;
      wire BU12548_A0;
         assign BU12548_A0 = n6815;
      wire BU12548_A1;
         assign BU12548_A1 = n6816;
      wire BU12548_A2;
         assign BU12548_A2 = n6817;
      wire BU12548_A3;
         assign BU12548_A3 = n6818;
      wire BU12548_Q;
         assign n6716 = BU12548_Q;
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
         assign BU12549_CE = n6819;
      wire BU12549_CLK;
         assign BU12549_CLK = n155;
      wire BU12549_A0;
         assign BU12549_A0 = n6815;
      wire BU12549_A1;
         assign BU12549_A1 = n6816;
      wire BU12549_A2;
         assign BU12549_A2 = n6817;
      wire BU12549_A3;
         assign BU12549_A3 = n6818;
      wire BU12549_Q;
         assign n6717 = BU12549_Q;
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
         assign n6815 = BU12550_Q[0];
         assign n6816 = BU12550_Q[1];
         assign n6817 = BU12550_Q[2];
         assign n6818 = BU12550_Q[3];
      wire BU12550_CLK;
         assign BU12550_CLK = n155;
      wire BU12550_UP;
         assign BU12550_UP = n6819;
      wire BU12550_CE;
         assign BU12550_CE = n6820;
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
         assign BU12579_I0 = n6718;
      wire BU12579_I1;
         assign BU12579_I1 = n6819;
      wire BU12579_I2;
         assign BU12579_I2 = n6719;
      wire BU12579_I3;
         assign BU12579_I3 = n6821;
      wire BU12579_O;
         assign n6820 = BU12579_O;
      LUT4       BU12579(
         .I0(BU12579_I0),
         .I1(BU12579_I1),
         .I2(BU12579_I2),
         .I3(BU12579_I3),
         .O(BU12579_O)
      );

      defparam BU12583.INIT = 'he2ea;
      wire BU12583_I0;
         assign BU12583_I0 = n6719;
      wire BU12583_I1;
         assign BU12583_I1 = n6821;
      wire BU12583_I2;
         assign BU12583_I2 = n6819;
      wire BU12583_I3;
         assign BU12583_I3 = n6718;
      wire BU12583_O;
         assign n7164 = BU12583_O;
      LUT4       BU12583(
         .I0(BU12583_I0),
         .I1(BU12583_I1),
         .I2(BU12583_I2),
         .I3(BU12583_I3),
         .O(BU12583_O)
      );

      wire BU12584_D;
         assign BU12584_D = n7164;
      wire BU12584_C;
         assign BU12584_C = n155;
      wire BU12584_CE;
         assign BU12584_CE = 1'b1;
      wire BU12584_Q;
         assign n6719 = BU12584_Q;
      FDE       BU12584(
         .D(BU12584_D),
         .C(BU12584_C),
         .CE(BU12584_CE),
         .Q(BU12584_Q)
      );

      defparam BU12587.INIT = 'h0001;
      wire BU12587_I0;
         assign BU12587_I0 = n6815;
      wire BU12587_I1;
         assign BU12587_I1 = n6816;
      wire BU12587_I2;
         assign BU12587_I2 = n6817;
      wire BU12587_I3;
         assign BU12587_I3 = n6818;
      wire BU12587_O;
         assign n6821 = BU12587_O;
      LUT4       BU12587(
         .I0(BU12587_I0),
         .I1(BU12587_I1),
         .I2(BU12587_I2),
         .I3(BU12587_I3),
         .O(BU12587_O)
      );

      wire BU12588_ND;
         assign BU12588_ND = n6719;
      wire BU12588_RDY;
         assign n6763 = BU12588_RDY;
      wire BU12588_CLK;
         assign BU12588_CLK = n155;
      wire BU12588_RFD;
         assign n6691 = BU12588_RFD;
      wire [25 : 0] BU12588_DIN;
         assign BU12588_DIN[0] = n6692;
         assign BU12588_DIN[1] = n6693;
         assign BU12588_DIN[2] = n6694;
         assign BU12588_DIN[3] = n6695;
         assign BU12588_DIN[4] = n6696;
         assign BU12588_DIN[5] = n6697;
         assign BU12588_DIN[6] = n6698;
         assign BU12588_DIN[7] = n6699;
         assign BU12588_DIN[8] = n6700;
         assign BU12588_DIN[9] = n6701;
         assign BU12588_DIN[10] = n6702;
         assign BU12588_DIN[11] = n6703;
         assign BU12588_DIN[12] = n6704;
         assign BU12588_DIN[13] = n6705;
         assign BU12588_DIN[14] = n6706;
         assign BU12588_DIN[15] = n6707;
         assign BU12588_DIN[16] = n6708;
         assign BU12588_DIN[17] = n6709;
         assign BU12588_DIN[18] = n6710;
         assign BU12588_DIN[19] = n6711;
         assign BU12588_DIN[20] = n6712;
         assign BU12588_DIN[21] = n6713;
         assign BU12588_DIN[22] = n6714;
         assign BU12588_DIN[23] = n6715;
         assign BU12588_DIN[24] = n6716;
         assign BU12588_DIN[25] = n6717;
      wire [42 : 0] BU12588_DOUT;
         assign n6720 = BU12588_DOUT[0];
         assign n6721 = BU12588_DOUT[1];
         assign n6722 = BU12588_DOUT[2];
         assign n6723 = BU12588_DOUT[3];
         assign n6724 = BU12588_DOUT[4];
         assign n6725 = BU12588_DOUT[5];
         assign n6726 = BU12588_DOUT[6];
         assign n6727 = BU12588_DOUT[7];
         assign n6728 = BU12588_DOUT[8];
         assign n6729 = BU12588_DOUT[9];
         assign n6730 = BU12588_DOUT[10];
         assign n6731 = BU12588_DOUT[11];
         assign n6732 = BU12588_DOUT[12];
         assign n6733 = BU12588_DOUT[13];
         assign n6734 = BU12588_DOUT[14];
         assign n6735 = BU12588_DOUT[15];
         assign n6736 = BU12588_DOUT[16];
         assign n6737 = BU12588_DOUT[17];
         assign n6738 = BU12588_DOUT[18];
         assign n6739 = BU12588_DOUT[19];
         assign n6740 = BU12588_DOUT[20];
         assign n6741 = BU12588_DOUT[21];
         assign n6742 = BU12588_DOUT[22];
         assign n6743 = BU12588_DOUT[23];
         assign n6744 = BU12588_DOUT[24];
         assign n6745 = BU12588_DOUT[25];
         assign n6746 = BU12588_DOUT[26];
         assign n6747 = BU12588_DOUT[27];
         assign n6748 = BU12588_DOUT[28];
         assign n6749 = BU12588_DOUT[29];
         assign n6750 = BU12588_DOUT[30];
         assign n6751 = BU12588_DOUT[31];
         assign n6752 = BU12588_DOUT[32];
         assign n6753 = BU12588_DOUT[33];
         assign n6754 = BU12588_DOUT[34];
         assign n6755 = BU12588_DOUT[35];
         assign n6756 = BU12588_DOUT[36];
         assign n6757 = BU12588_DOUT[37];
         assign n6758 = BU12588_DOUT[38];
         assign n6759 = BU12588_DOUT[39];
         assign n6760 = BU12588_DOUT[40];
         assign n6761 = BU12588_DOUT[41];
         assign n6762 = BU12588_DOUT[42];
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
         "ddcv_orig_CFIR.mif"    /* c_mem_init_file*/,
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

      wire [26 : 0] BU19118_I;
         assign BU19118_I[0] = n6720;
         assign BU19118_I[1] = n6721;
         assign BU19118_I[2] = n6722;
         assign BU19118_I[3] = n6723;
         assign BU19118_I[4] = n6724;
         assign BU19118_I[5] = n6725;
         assign BU19118_I[6] = n6726;
         assign BU19118_I[7] = n6727;
         assign BU19118_I[8] = n6728;
         assign BU19118_I[9] = n6729;
         assign BU19118_I[10] = n6730;
         assign BU19118_I[11] = n6731;
         assign BU19118_I[12] = n6732;
         assign BU19118_I[13] = n6733;
         assign BU19118_I[14] = n6734;
         assign BU19118_I[15] = n6735;
         assign BU19118_I[16] = n6736;
         assign BU19118_I[17] = n6737;
         assign BU19118_I[18] = n6738;
         assign BU19118_I[19] = n6739;
         assign BU19118_I[20] = n6740;
         assign BU19118_I[21] = n6741;
         assign BU19118_I[22] = n6742;
         assign BU19118_I[23] = n6743;
         assign BU19118_I[24] = n6744;
         assign BU19118_I[25] = n6745;
         assign BU19118_I[26] = n6746;
      wire BU19118_O;
         assign n7297 = BU19118_O;
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
         27    /* c_inputs*/,
         "011111111111111111111111111"    /* c_input_inv_mask*/,
         0    /* c_pipe_stages*/,
         "0"    /* c_sinit_val*/,
         0    /* c_sync_enable*/,
         1    /* c_sync_priority*/
      )
      BU19118(
         .I(BU19118_I),
         .O(BU19118_O)
      );

      defparam BU19149.INIT = 'h8c8c;
      wire BU19149_I0;
         assign BU19149_I0 = n6747;
      wire BU19149_I1;
         assign BU19149_I1 = n6746;
      wire BU19149_I2;
         assign BU19149_I2 = n7297;
      wire BU19149_I3;
         assign BU19149_I3 = 1'b0;
      wire BU19149_O;
         assign n7294 = BU19149_O;
      LUT4       BU19149(
         .I0(BU19149_I0),
         .I1(BU19149_I1),
         .I2(BU19149_I2),
         .I3(BU19149_I3),
         .O(BU19149_O)
      );

      wire [15 : 0] BU19150_A;
         assign BU19150_A[0] = n6747;
         assign BU19150_A[1] = n6748;
         assign BU19150_A[2] = n6749;
         assign BU19150_A[3] = n6750;
         assign BU19150_A[4] = n6751;
         assign BU19150_A[5] = n6752;
         assign BU19150_A[6] = n6753;
         assign BU19150_A[7] = n6754;
         assign BU19150_A[8] = n6755;
         assign BU19150_A[9] = n6756;
         assign BU19150_A[10] = n6757;
         assign BU19150_A[11] = n6758;
         assign BU19150_A[12] = n6759;
         assign BU19150_A[13] = n6760;
         assign BU19150_A[14] = n6761;
         assign BU19150_A[15] = n6762;
      wire [0 : 0] BU19150_B;
         assign BU19150_B[0] = n7294;
      wire [16 : 0] BU19150_S;
         assign n7277 = BU19150_S[0];
         assign n7278 = BU19150_S[1];
         assign n7279 = BU19150_S[2];
         assign n7280 = BU19150_S[3];
         assign n7281 = BU19150_S[4];
         assign n7282 = BU19150_S[5];
         assign n7283 = BU19150_S[6];
         assign n7284 = BU19150_S[7];
         assign n7285 = BU19150_S[8];
         assign n7286 = BU19150_S[9];
         assign n7287 = BU19150_S[10];
         assign n7288 = BU19150_S[11];
         assign n7289 = BU19150_S[12];
         assign n7290 = BU19150_S[13];
         assign n7291 = BU19150_S[14];
         assign n7292 = BU19150_S[15];
      C_ADDSUB_V5_0 #(
         0    /* c_add_mode*/,
         "00000000000000000"    /* c_ainit_val*/,
         0    /* c_a_type*/,
         16    /* c_a_width*/,
         0    /* c_bypass_enable*/,
         0    /* c_bypass_low*/,
         0    /* c_b_constant*/,
         1    /* c_b_type*/,
         "00000000000000000"    /* c_b_value*/,
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
         16    /* c_high_bit*/,
         1    /* c_latency*/,
         0    /* c_low_bit*/,
         17    /* c_out_width*/,
         0    /* c_pipe_stages*/,
         "00000000000000000"    /* c_sinit_val*/,
         0    /* c_sync_enable*/,
         1    /* c_sync_priority*/
      )
      BU19150(
         .A(BU19150_A),
         .B(BU19150_B),
         .S(BU19150_S)
      );

      defparam BU19219.INIT = 'h0202;
      wire BU19219_I0;
         assign BU19219_I0 = n6762;
      wire BU19219_I1;
         assign BU19219_I1 = n6761;
      wire BU19219_I2;
         assign BU19219_I2 = n7292;
      wire BU19219_I3;
         assign BU19219_I3 = 1'b0;
      wire BU19219_O;
         assign n7325 = BU19219_O;
      LUT4       BU19219(
         .I0(BU19219_I0),
         .I1(BU19219_I1),
         .I2(BU19219_I2),
         .I3(BU19219_I3),
         .O(BU19219_O)
      );

      defparam BU19221.INIT = 'h4444;
      wire BU19221_I0;
         assign BU19221_I0 = n6762;
      wire BU19221_I1;
         assign BU19221_I1 = n7292;
      wire BU19221_I2;
         assign BU19221_I2 = 1'b0;
      wire BU19221_I3;
         assign BU19221_I3 = 1'b0;
      wire BU19221_O;
         assign n7327 = BU19221_O;
      LUT4       BU19221(
         .I0(BU19221_I0),
         .I1(BU19221_I1),
         .I2(BU19221_I2),
         .I3(BU19221_I3),
         .O(BU19221_O)
      );

      wire [14 : 0] BU19222_D;
         assign BU19222_D[0] = n7277;
         assign BU19222_D[1] = n7278;
         assign BU19222_D[2] = n7279;
         assign BU19222_D[3] = n7280;
         assign BU19222_D[4] = n7281;
         assign BU19222_D[5] = n7282;
         assign BU19222_D[6] = n7283;
         assign BU19222_D[7] = n7284;
         assign BU19222_D[8] = n7285;
         assign BU19222_D[9] = n7286;
         assign BU19222_D[10] = n7287;
         assign BU19222_D[11] = n7288;
         assign BU19222_D[12] = n7289;
         assign BU19222_D[13] = n7290;
         assign BU19222_D[14] = n7291;
      wire [14 : 0] BU19222_Q;
         assign n82 = BU19222_Q[0];
         assign n83 = BU19222_Q[1];
         assign n84 = BU19222_Q[2];
         assign n85 = BU19222_Q[3];
         assign n86 = BU19222_Q[4];
         assign n87 = BU19222_Q[5];
         assign n88 = BU19222_Q[6];
         assign n89 = BU19222_Q[7];
         assign n90 = BU19222_Q[8];
         assign n91 = BU19222_Q[9];
         assign n92 = BU19222_Q[10];
         assign n93 = BU19222_Q[11];
         assign n94 = BU19222_Q[12];
         assign n95 = BU19222_Q[13];
         assign n96 = BU19222_Q[14];
      wire BU19222_CLK;
         assign BU19222_CLK = n155;
      wire BU19222_SCLR;
         assign BU19222_SCLR = n7325;
      wire BU19222_SSET;
         assign BU19222_SSET = n7327;
      C_REG_FD_V5_0 #(
         "000000000000000"    /* c_ainit_val*/,
         0    /* c_enable_rlocs*/,
         0    /* c_has_aclr*/,
         0    /* c_has_ainit*/,
         0    /* c_has_aset*/,
         0    /* c_has_ce*/,
         1    /* c_has_sclr*/,
         0    /* c_has_sinit*/,
         1    /* c_has_sset*/,
         "000000000000000"    /* c_sinit_val*/,
         0    /* c_sync_enable*/,
         0    /* c_sync_priority*/,
         15    /* c_width*/
      )
      BU19222(
         .D(BU19222_D),
         .Q(BU19222_Q),
         .CLK(BU19222_CLK),
         .SCLR(BU19222_SCLR),
         .SSET(BU19222_SSET)
      );

      wire [0 : 0] BU19283_D;
         assign BU19283_D[0] = n7292;
      wire [0 : 0] BU19283_Q;
         assign n97 = BU19283_Q[0];
      wire BU19283_CLK;
         assign BU19283_CLK = n155;
      wire BU19283_SCLR;
         assign BU19283_SCLR = n7327;
      wire BU19283_SSET;
         assign BU19283_SSET = n7325;
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
      BU19283(
         .D(BU19283_D),
         .Q(BU19283_Q),
         .CLK(BU19283_CLK),
         .SCLR(BU19283_SCLR),
         .SSET(BU19283_SSET)
      );

      wire BU19290_D;
         assign BU19290_D = n6763;
      wire BU19290_C;
         assign BU19290_C = n155;
      wire BU19290_CE;
         assign BU19290_CE = 1'b1;
      wire BU19290_Q;
         assign n98 = BU19290_Q;
      FDE       BU19290(
         .D(BU19290_D),
         .C(BU19290_C),
         .CE(BU19290_CE),
         .Q(BU19290_Q)
      );

      wire BU19293_ND;
         assign BU19293_ND = n98;
      wire BU19293_RDY;
         assign n134 = BU19293_RDY;
      wire BU19293_CLK;
         assign BU19293_CLK = n155;
      wire BU19293_RFD;
      wire [15 : 0] BU19293_DIN;
         assign BU19293_DIN[0] = n82;
         assign BU19293_DIN[1] = n83;
         assign BU19293_DIN[2] = n84;
         assign BU19293_DIN[3] = n85;
         assign BU19293_DIN[4] = n86;
         assign BU19293_DIN[5] = n87;
         assign BU19293_DIN[6] = n88;
         assign BU19293_DIN[7] = n89;
         assign BU19293_DIN[8] = n90;
         assign BU19293_DIN[9] = n91;
         assign BU19293_DIN[10] = n92;
         assign BU19293_DIN[11] = n93;
         assign BU19293_DIN[12] = n94;
         assign BU19293_DIN[13] = n95;
         assign BU19293_DIN[14] = n96;
         assign BU19293_DIN[15] = n97;
      wire [0 : 0] BU19293_SEL_O;
         assign n135 = BU19293_SEL_O[0];
      wire [34 : 0] BU19293_DOUT;
         assign n99 = BU19293_DOUT[0];
         assign n100 = BU19293_DOUT[1];
         assign n101 = BU19293_DOUT[2];
         assign n102 = BU19293_DOUT[3];
         assign n103 = BU19293_DOUT[4];
         assign n104 = BU19293_DOUT[5];
         assign n105 = BU19293_DOUT[6];
         assign n106 = BU19293_DOUT[7];
         assign n107 = BU19293_DOUT[8];
         assign n108 = BU19293_DOUT[9];
         assign n109 = BU19293_DOUT[10];
         assign n110 = BU19293_DOUT[11];
         assign n111 = BU19293_DOUT[12];
         assign n112 = BU19293_DOUT[13];
         assign n113 = BU19293_DOUT[14];
         assign n114 = BU19293_DOUT[15];
         assign n115 = BU19293_DOUT[16];
         assign n116 = BU19293_DOUT[17];
         assign n117 = BU19293_DOUT[18];
         assign n118 = BU19293_DOUT[19];
         assign n119 = BU19293_DOUT[20];
         assign n120 = BU19293_DOUT[21];
         assign n121 = BU19293_DOUT[22];
         assign n122 = BU19293_DOUT[23];
         assign n123 = BU19293_DOUT[24];
         assign n124 = BU19293_DOUT[25];
         assign n125 = BU19293_DOUT[26];
         assign n126 = BU19293_DOUT[27];
         assign n127 = BU19293_DOUT[28];
         assign n128 = BU19293_DOUT[29];
         assign n129 = BU19293_DOUT[30];
         assign n130 = BU19293_DOUT[31];
         assign n131 = BU19293_DOUT[32];
         assign n132 = BU19293_DOUT[33];
         assign n133 = BU19293_DOUT[34];
      C_DA_FIR_V7_0 #(
         1    /* c_baat*/,
         2    /* c_channels*/,
         0    /* c_coeff_type*/,
         16    /* c_coeff_width*/,
         0    /* c_data_type*/,
         16    /* c_data_width*/,
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
         "ddcv_orig_PFIR.mif"    /* c_mem_init_file*/,
         1    /* c_optimize*/,
         5    /* c_polyphase_factor*/,
         0    /* c_reg_output*/,
         0    /* c_reload*/,
         657    /* c_reload_delay*/,
         2    /* c_reload_mem_type*/,
         0    /* c_response*/,
         35    /* c_result_width*/,
         0    /* c_saturate*/,
         0    /* c_shape*/,
         55    /* c_taps*/,
         0    /* c_use_model_func*/,
         1    /* c_zpf*/
      )
      BU19293(
         .ND(BU19293_ND),
         .RDY(BU19293_RDY),
         .CLK(BU19293_CLK),
         .RFD(BU19293_RFD),
         .DIN(BU19293_DIN),
         .SEL_O(BU19293_SEL_O),
         .DOUT(BU19293_DOUT)
      );

      defparam BU22774.INIT = 'h2222;
      wire BU22774_I0;
         assign BU22774_I0 = n134;
      wire BU22774_I1;
         assign BU22774_I1 = n135;
      wire BU22774_I2;
         assign BU22774_I2 = 1'b0;
      wire BU22774_I3;
         assign BU22774_I3 = 1'b0;
      wire BU22774_O;
         assign n136 = BU22774_O;
      LUT4       BU22774(
         .I0(BU22774_I0),
         .I1(BU22774_I1),
         .I2(BU22774_I2),
         .I3(BU22774_I3),
         .O(BU22774_O)
      );

      defparam BU22776.INIT = 'h8888;
      wire BU22776_I0;
         assign BU22776_I0 = n134;
      wire BU22776_I1;
         assign BU22776_I1 = n135;
      wire BU22776_I2;
         assign BU22776_I2 = 1'b0;
      wire BU22776_I3;
         assign BU22776_I3 = 1'b0;
      wire BU22776_O;
         assign n137 = BU22776_O;
      LUT4       BU22776(
         .I0(BU22776_I0),
         .I1(BU22776_I1),
         .I2(BU22776_I2),
         .I3(BU22776_I3),
         .O(BU22776_O)
      );

      wire BU22779_D;
         assign BU22779_D = n137;
      wire BU22779_C;
         assign BU22779_C = n155;
      wire BU22779_CE;
         assign BU22779_CE = 1'b1;
      wire BU22779_Q;
         assign n153 = BU22779_Q;
      FDE       BU22779(
         .D(BU22779_D),
         .C(BU22779_C),
         .CE(BU22779_CE),
         .Q(BU22779_Q)
      );

      wire [4 : 0] BU22784_I;
         assign BU22784_I[0] = n99;
         assign BU22784_I[1] = n100;
         assign BU22784_I[2] = n101;
         assign BU22784_I[3] = n102;
         assign BU22784_I[4] = n103;
      wire BU22784_O;
         assign n7868 = BU22784_O;
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
      BU22784(
         .I(BU22784_I),
         .O(BU22784_O)
      );

      defparam BU22793.INIT = 'h8c8c;
      wire BU22793_I0;
         assign BU22793_I0 = n104;
      wire BU22793_I1;
         assign BU22793_I1 = n103;
      wire BU22793_I2;
         assign BU22793_I2 = n7868;
      wire BU22793_I3;
         assign BU22793_I3 = 1'b0;
      wire BU22793_O;
         assign n7865 = BU22793_O;
      LUT4       BU22793(
         .I0(BU22793_I0),
         .I1(BU22793_I1),
         .I2(BU22793_I2),
         .I3(BU22793_I3),
         .O(BU22793_O)
      );

      wire [29 : 0] BU22794_A;
         assign BU22794_A[0] = n104;
         assign BU22794_A[1] = n105;
         assign BU22794_A[2] = n106;
         assign BU22794_A[3] = n107;
         assign BU22794_A[4] = n108;
         assign BU22794_A[5] = n109;
         assign BU22794_A[6] = n110;
         assign BU22794_A[7] = n111;
         assign BU22794_A[8] = n112;
         assign BU22794_A[9] = n113;
         assign BU22794_A[10] = n114;
         assign BU22794_A[11] = n115;
         assign BU22794_A[12] = n116;
         assign BU22794_A[13] = n117;
         assign BU22794_A[14] = n118;
         assign BU22794_A[15] = n119;
         assign BU22794_A[16] = n120;
         assign BU22794_A[17] = n121;
         assign BU22794_A[18] = n122;
         assign BU22794_A[19] = n123;
         assign BU22794_A[20] = n124;
         assign BU22794_A[21] = n125;
         assign BU22794_A[22] = n126;
         assign BU22794_A[23] = n127;
         assign BU22794_A[24] = n128;
         assign BU22794_A[25] = n129;
         assign BU22794_A[26] = n130;
         assign BU22794_A[27] = n131;
         assign BU22794_A[28] = n132;
         assign BU22794_A[29] = n133;
      wire [0 : 0] BU22794_B;
         assign BU22794_B[0] = n7865;
      wire [30 : 0] BU22794_S;
         assign n7834 = BU22794_S[0];
         assign n7835 = BU22794_S[1];
         assign n7836 = BU22794_S[2];
         assign n7837 = BU22794_S[3];
         assign n7838 = BU22794_S[4];
         assign n7839 = BU22794_S[5];
         assign n7840 = BU22794_S[6];
         assign n7841 = BU22794_S[7];
         assign n7842 = BU22794_S[8];
         assign n7843 = BU22794_S[9];
         assign n7844 = BU22794_S[10];
         assign n7845 = BU22794_S[11];
         assign n7846 = BU22794_S[12];
         assign n7847 = BU22794_S[13];
         assign n7848 = BU22794_S[14];
         assign n7849 = BU22794_S[15];
         assign n7850 = BU22794_S[16];
         assign n7851 = BU22794_S[17];
         assign n7852 = BU22794_S[18];
         assign n7853 = BU22794_S[19];
         assign n7854 = BU22794_S[20];
         assign n7855 = BU22794_S[21];
         assign n7856 = BU22794_S[22];
         assign n7857 = BU22794_S[23];
         assign n7858 = BU22794_S[24];
         assign n7859 = BU22794_S[25];
         assign n7860 = BU22794_S[26];
         assign n7861 = BU22794_S[27];
         assign n7862 = BU22794_S[28];
         assign n7863 = BU22794_S[29];
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
      BU22794(
         .A(BU22794_A),
         .B(BU22794_B),
         .S(BU22794_S)
      );

      defparam BU22919.INIT = 'h0200;
      wire BU22919_I0;
         assign BU22919_I0 = n133;
      wire BU22919_I1;
         assign BU22919_I1 = n132;
      wire BU22919_I2;
         assign BU22919_I2 = n7863;
      wire BU22919_I3;
         assign BU22919_I3 = n136;
      wire BU22919_O;
         assign n7874 = BU22919_O;
      LUT4       BU22919(
         .I0(BU22919_I0),
         .I1(BU22919_I1),
         .I2(BU22919_I2),
         .I3(BU22919_I3),
         .O(BU22919_O)
      );

      defparam BU22921.INIT = 'h4040;
      wire BU22921_I0;
         assign BU22921_I0 = n133;
      wire BU22921_I1;
         assign BU22921_I1 = n7863;
      wire BU22921_I2;
         assign BU22921_I2 = n136;
      wire BU22921_I3;
         assign BU22921_I3 = 1'b0;
      wire BU22921_O;
         assign n7876 = BU22921_O;
      LUT4       BU22921(
         .I0(BU22921_I0),
         .I1(BU22921_I1),
         .I2(BU22921_I2),
         .I3(BU22921_I3),
         .O(BU22921_O)
      );

      wire [28 : 0] BU22922_D;
         assign BU22922_D[0] = n7834;
         assign BU22922_D[1] = n7835;
         assign BU22922_D[2] = n7836;
         assign BU22922_D[3] = n7837;
         assign BU22922_D[4] = n7838;
         assign BU22922_D[5] = n7839;
         assign BU22922_D[6] = n7840;
         assign BU22922_D[7] = n7841;
         assign BU22922_D[8] = n7842;
         assign BU22922_D[9] = n7843;
         assign BU22922_D[10] = n7844;
         assign BU22922_D[11] = n7845;
         assign BU22922_D[12] = n7846;
         assign BU22922_D[13] = n7847;
         assign BU22922_D[14] = n7848;
         assign BU22922_D[15] = n7849;
         assign BU22922_D[16] = n7850;
         assign BU22922_D[17] = n7851;
         assign BU22922_D[18] = n7852;
         assign BU22922_D[19] = n7853;
         assign BU22922_D[20] = n7854;
         assign BU22922_D[21] = n7855;
         assign BU22922_D[22] = n7856;
         assign BU22922_D[23] = n7857;
         assign BU22922_D[24] = n7858;
         assign BU22922_D[25] = n7859;
         assign BU22922_D[26] = n7860;
         assign BU22922_D[27] = n7861;
         assign BU22922_D[28] = n7862;
      wire [28 : 0] BU22922_Q;
         assign n195 = BU22922_Q[0];
         assign n196 = BU22922_Q[1];
         assign n197 = BU22922_Q[2];
         assign n198 = BU22922_Q[3];
         assign n199 = BU22922_Q[4];
         assign n200 = BU22922_Q[5];
         assign n201 = BU22922_Q[6];
         assign n202 = BU22922_Q[7];
         assign n203 = BU22922_Q[8];
         assign n204 = BU22922_Q[9];
         assign n205 = BU22922_Q[10];
         assign n206 = BU22922_Q[11];
         assign n207 = BU22922_Q[12];
         assign n208 = BU22922_Q[13];
         assign n209 = BU22922_Q[14];
         assign n210 = BU22922_Q[15];
         assign n211 = BU22922_Q[16];
         assign n212 = BU22922_Q[17];
         assign n213 = BU22922_Q[18];
         assign n214 = BU22922_Q[19];
         assign n215 = BU22922_Q[20];
         assign n216 = BU22922_Q[21];
         assign n217 = BU22922_Q[22];
         assign n218 = BU22922_Q[23];
         assign n219 = BU22922_Q[24];
         assign n220 = BU22922_Q[25];
         assign n221 = BU22922_Q[26];
         assign n222 = BU22922_Q[27];
         assign n223 = BU22922_Q[28];
      wire BU22922_CLK;
         assign BU22922_CLK = n155;
      wire BU22922_CE;
         assign BU22922_CE = n136;
      wire BU22922_SCLR;
         assign BU22922_SCLR = n7874;
      wire BU22922_SSET;
         assign BU22922_SSET = n7876;
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
      BU22922(
         .D(BU22922_D),
         .Q(BU22922_Q),
         .CLK(BU22922_CLK),
         .CE(BU22922_CE),
         .SCLR(BU22922_SCLR),
         .SSET(BU22922_SSET)
      );

      wire [0 : 0] BU23042_D;
         assign BU23042_D[0] = n7863;
      wire [0 : 0] BU23042_Q;
         assign n224 = BU23042_Q[0];
      wire BU23042_CLK;
         assign BU23042_CLK = n155;
      wire BU23042_CE;
         assign BU23042_CE = n136;
      wire BU23042_SCLR;
         assign BU23042_SCLR = n7876;
      wire BU23042_SSET;
         assign BU23042_SSET = n7874;
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
      BU23042(
         .D(BU23042_D),
         .Q(BU23042_Q),
         .CLK(BU23042_CLK),
         .CE(BU23042_CE),
         .SCLR(BU23042_SCLR),
         .SSET(BU23042_SSET)
      );

      wire [4 : 0] BU23054_I;
         assign BU23054_I[0] = n99;
         assign BU23054_I[1] = n100;
         assign BU23054_I[2] = n101;
         assign BU23054_I[3] = n102;
         assign BU23054_I[4] = n103;
      wire BU23054_O;
         assign n8413 = BU23054_O;
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
      BU23054(
         .I(BU23054_I),
         .O(BU23054_O)
      );

      defparam BU23063.INIT = 'h8c8c;
      wire BU23063_I0;
         assign BU23063_I0 = n104;
      wire BU23063_I1;
         assign BU23063_I1 = n103;
      wire BU23063_I2;
         assign BU23063_I2 = n8413;
      wire BU23063_I3;
         assign BU23063_I3 = 1'b0;
      wire BU23063_O;
         assign n8410 = BU23063_O;
      LUT4       BU23063(
         .I0(BU23063_I0),
         .I1(BU23063_I1),
         .I2(BU23063_I2),
         .I3(BU23063_I3),
         .O(BU23063_O)
      );

      wire [29 : 0] BU23064_A;
         assign BU23064_A[0] = n104;
         assign BU23064_A[1] = n105;
         assign BU23064_A[2] = n106;
         assign BU23064_A[3] = n107;
         assign BU23064_A[4] = n108;
         assign BU23064_A[5] = n109;
         assign BU23064_A[6] = n110;
         assign BU23064_A[7] = n111;
         assign BU23064_A[8] = n112;
         assign BU23064_A[9] = n113;
         assign BU23064_A[10] = n114;
         assign BU23064_A[11] = n115;
         assign BU23064_A[12] = n116;
         assign BU23064_A[13] = n117;
         assign BU23064_A[14] = n118;
         assign BU23064_A[15] = n119;
         assign BU23064_A[16] = n120;
         assign BU23064_A[17] = n121;
         assign BU23064_A[18] = n122;
         assign BU23064_A[19] = n123;
         assign BU23064_A[20] = n124;
         assign BU23064_A[21] = n125;
         assign BU23064_A[22] = n126;
         assign BU23064_A[23] = n127;
         assign BU23064_A[24] = n128;
         assign BU23064_A[25] = n129;
         assign BU23064_A[26] = n130;
         assign BU23064_A[27] = n131;
         assign BU23064_A[28] = n132;
         assign BU23064_A[29] = n133;
      wire [0 : 0] BU23064_B;
         assign BU23064_B[0] = n8410;
      wire [30 : 0] BU23064_S;
         assign n8379 = BU23064_S[0];
         assign n8380 = BU23064_S[1];
         assign n8381 = BU23064_S[2];
         assign n8382 = BU23064_S[3];
         assign n8383 = BU23064_S[4];
         assign n8384 = BU23064_S[5];
         assign n8385 = BU23064_S[6];
         assign n8386 = BU23064_S[7];
         assign n8387 = BU23064_S[8];
         assign n8388 = BU23064_S[9];
         assign n8389 = BU23064_S[10];
         assign n8390 = BU23064_S[11];
         assign n8391 = BU23064_S[12];
         assign n8392 = BU23064_S[13];
         assign n8393 = BU23064_S[14];
         assign n8394 = BU23064_S[15];
         assign n8395 = BU23064_S[16];
         assign n8396 = BU23064_S[17];
         assign n8397 = BU23064_S[18];
         assign n8398 = BU23064_S[19];
         assign n8399 = BU23064_S[20];
         assign n8400 = BU23064_S[21];
         assign n8401 = BU23064_S[22];
         assign n8402 = BU23064_S[23];
         assign n8403 = BU23064_S[24];
         assign n8404 = BU23064_S[25];
         assign n8405 = BU23064_S[26];
         assign n8406 = BU23064_S[27];
         assign n8407 = BU23064_S[28];
         assign n8408 = BU23064_S[29];
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
      BU23064(
         .A(BU23064_A),
         .B(BU23064_B),
         .S(BU23064_S)
      );

      defparam BU23189.INIT = 'h0200;
      wire BU23189_I0;
         assign BU23189_I0 = n133;
      wire BU23189_I1;
         assign BU23189_I1 = n132;
      wire BU23189_I2;
         assign BU23189_I2 = n8408;
      wire BU23189_I3;
         assign BU23189_I3 = n137;
      wire BU23189_O;
         assign n8419 = BU23189_O;
      LUT4       BU23189(
         .I0(BU23189_I0),
         .I1(BU23189_I1),
         .I2(BU23189_I2),
         .I3(BU23189_I3),
         .O(BU23189_O)
      );

      defparam BU23191.INIT = 'h4040;
      wire BU23191_I0;
         assign BU23191_I0 = n133;
      wire BU23191_I1;
         assign BU23191_I1 = n8408;
      wire BU23191_I2;
         assign BU23191_I2 = n137;
      wire BU23191_I3;
         assign BU23191_I3 = 1'b0;
      wire BU23191_O;
         assign n8421 = BU23191_O;
      LUT4       BU23191(
         .I0(BU23191_I0),
         .I1(BU23191_I1),
         .I2(BU23191_I2),
         .I3(BU23191_I3),
         .O(BU23191_O)
      );

      wire [28 : 0] BU23192_D;
         assign BU23192_D[0] = n8379;
         assign BU23192_D[1] = n8380;
         assign BU23192_D[2] = n8381;
         assign BU23192_D[3] = n8382;
         assign BU23192_D[4] = n8383;
         assign BU23192_D[5] = n8384;
         assign BU23192_D[6] = n8385;
         assign BU23192_D[7] = n8386;
         assign BU23192_D[8] = n8387;
         assign BU23192_D[9] = n8388;
         assign BU23192_D[10] = n8389;
         assign BU23192_D[11] = n8390;
         assign BU23192_D[12] = n8391;
         assign BU23192_D[13] = n8392;
         assign BU23192_D[14] = n8393;
         assign BU23192_D[15] = n8394;
         assign BU23192_D[16] = n8395;
         assign BU23192_D[17] = n8396;
         assign BU23192_D[18] = n8397;
         assign BU23192_D[19] = n8398;
         assign BU23192_D[20] = n8399;
         assign BU23192_D[21] = n8400;
         assign BU23192_D[22] = n8401;
         assign BU23192_D[23] = n8402;
         assign BU23192_D[24] = n8403;
         assign BU23192_D[25] = n8404;
         assign BU23192_D[26] = n8405;
         assign BU23192_D[27] = n8406;
         assign BU23192_D[28] = n8407;
      wire [28 : 0] BU23192_Q;
         assign n225 = BU23192_Q[0];
         assign n226 = BU23192_Q[1];
         assign n227 = BU23192_Q[2];
         assign n228 = BU23192_Q[3];
         assign n229 = BU23192_Q[4];
         assign n230 = BU23192_Q[5];
         assign n231 = BU23192_Q[6];
         assign n232 = BU23192_Q[7];
         assign n233 = BU23192_Q[8];
         assign n234 = BU23192_Q[9];
         assign n235 = BU23192_Q[10];
         assign n236 = BU23192_Q[11];
         assign n237 = BU23192_Q[12];
         assign n238 = BU23192_Q[13];
         assign n239 = BU23192_Q[14];
         assign n240 = BU23192_Q[15];
         assign n241 = BU23192_Q[16];
         assign n242 = BU23192_Q[17];
         assign n243 = BU23192_Q[18];
         assign n244 = BU23192_Q[19];
         assign n245 = BU23192_Q[20];
         assign n246 = BU23192_Q[21];
         assign n247 = BU23192_Q[22];
         assign n248 = BU23192_Q[23];
         assign n249 = BU23192_Q[24];
         assign n250 = BU23192_Q[25];
         assign n251 = BU23192_Q[26];
         assign n252 = BU23192_Q[27];
         assign n253 = BU23192_Q[28];
      wire BU23192_CLK;
         assign BU23192_CLK = n155;
      wire BU23192_CE;
         assign BU23192_CE = n137;
      wire BU23192_SCLR;
         assign BU23192_SCLR = n8419;
      wire BU23192_SSET;
         assign BU23192_SSET = n8421;
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
      BU23192(
         .D(BU23192_D),
         .Q(BU23192_Q),
         .CLK(BU23192_CLK),
         .CE(BU23192_CE),
         .SCLR(BU23192_SCLR),
         .SSET(BU23192_SSET)
      );

      wire [0 : 0] BU23312_D;
         assign BU23312_D[0] = n8408;
      wire [0 : 0] BU23312_Q;
         assign n254 = BU23312_Q[0];
      wire BU23312_CLK;
         assign BU23312_CLK = n155;
      wire BU23312_CE;
         assign BU23312_CE = n137;
      wire BU23312_SCLR;
         assign BU23312_SCLR = n8421;
      wire BU23312_SSET;
         assign BU23312_SSET = n8419;
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
      BU23312(
         .D(BU23312_D),
         .Q(BU23312_Q),
         .CLK(BU23312_CLK),
         .CE(BU23312_CE),
         .SCLR(BU23312_SCLR),
         .SSET(BU23312_SSET)
      );

//synopsys translate_on

endmodule
