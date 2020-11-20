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
C_CIC_V3_0
C_REG_FD_V5_0
C_DDS_V4_1
C_SHIFT_RAM_V5_0
MULT_GEN_V5_0
C_GATE_BIT_V5_0
*/

module ddcv1_0(
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
   wire n291;
   wire n338;
   wire n339;
   wire n340;
   wire n412;
   wire n413;
   wire n414;
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
   wire n457;
   wire n458;
   wire n459;
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
   wire n544;
   wire n574;
   wire n575;
   wire n576;
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
   wire n616;
   wire n617;
   wire n618;
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
   wire n661;
   wire n662;
   wire n663;
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
   wire n924;
   wire n925;
   wire n926;
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
   wire n1516;
   wire n1517;
   wire n1518;
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
   wire n1541;
   wire n1544;
   wire n1550;
   wire n1552;
   wire n2159;
   wire n2160;
   wire n2161;
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
   wire n2184;
   wire n2187;
   wire n2193;
   wire n2195;
   wire n2602;
   wire n2603;
   wire n2604;
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
   wire n2915;
   wire n2916;
   wire n2917;
   wire n2918;
   wire n2919;
   wire n2920;
   wire n2921;
   wire n2922;
   wire n2923;
   wire n2924;
   wire n2925;
   wire n2926;
   wire n2927;
   wire n2928;
   wire n2929;
   wire n2930;
   wire n2931;
   wire n2932;
   wire n2933;
   wire n2934;
   wire n2935;
   wire n2936;
   wire n2937;
   wire n2938;
   wire n2940;
   wire n2943;
   wire n2960;
   wire n2962;
   wire n3403;
   wire n3404;
   wire n3405;
   wire n3406;
   wire n3407;
   wire n3408;
   wire n3409;
   wire n3410;
   wire n3411;
   wire n3412;
   wire n3413;
   wire n3414;
   wire n3415;
   wire n3416;
   wire n3417;
   wire n3418;
   wire n3419;
   wire n3420;
   wire n3421;
   wire n3422;
   wire n3423;
   wire n3424;
   wire n3425;
   wire n3426;
   wire n3428;
   wire n3431;
   wire n3448;
   wire n3450;
   wire n4288;
   wire n6210;
   wire n6211;
   wire n6212;
   wire n6213;
   wire n6214;
   wire n6215;
   wire n6216;
   wire n6217;
   wire n6218;
   wire n6219;
   wire n6220;
   wire n6221;
   wire n6222;
   wire n6223;
   wire n6224;
   wire n6225;
   wire n6226;
   wire n6227;
   wire n6228;
   wire n6229;
   wire n6230;
   wire n6231;
   wire n6232;
   wire n6233;
   wire n6234;
   wire n6235;
   wire n6236;
   wire n6237;
   wire n6238;
   wire n6239;
   wire n6240;
   wire n6241;
   wire n6242;
   wire n6243;
   wire n6244;
   wire n6245;
   wire n6246;
   wire n6247;
   wire n6248;
   wire n6249;
   wire n6250;
   wire n6251;
   wire n6252;
   wire n6385;
   wire n6386;
   wire n6387;
   wire n6388;
   wire n6389;
   wire n6390;
   wire n6391;
   wire n6392;
   wire n6393;
   wire n6394;
   wire n6395;
   wire n6396;
   wire n6397;
   wire n6398;
   wire n6399;
   wire n6400;
   wire n6402;
   wire n6405;
   wire n6432;
   wire n6434;
   wire n6936;
   wire n6937;
   wire n6938;
   wire n6939;
   wire n6940;
   wire n6941;
   wire n6942;
   wire n6943;
   wire n6944;
   wire n6945;
   wire n6946;
   wire n6947;
   wire n6948;
   wire n6949;
   wire n6950;
   wire n6951;
   wire n6952;
   wire n6953;
   wire n6954;
   wire n6955;
   wire n6956;
   wire n6957;
   wire n6958;
   wire n6959;
   wire n6960;
   wire n6961;
   wire n6962;
   wire n6963;
   wire n6964;
   wire n6965;
   wire n6967;
   wire n6970;
   wire n6975;
   wire n6977;
   wire n7477;
   wire n7478;
   wire n7479;
   wire n7480;
   wire n7481;
   wire n7482;
   wire n7483;
   wire n7484;
   wire n7485;
   wire n7486;
   wire n7487;
   wire n7488;
   wire n7489;
   wire n7490;
   wire n7491;
   wire n7492;
   wire n7493;
   wire n7494;
   wire n7495;
   wire n7496;
   wire n7497;
   wire n7498;
   wire n7499;
   wire n7500;
   wire n7501;
   wire n7502;
   wire n7503;
   wire n7504;
   wire n7505;
   wire n7506;
   wire n7508;
   wire n7511;
   wire n7516;
   wire n7518;
   assign n135 = DIN[0];
   assign n136 = DIN[1];
   assign n137 = DIN[2];
   assign n138 = DIN[3];
   assign n139 = DIN[4];
   assign n140 = DIN[5];
   assign n141 = DIN[6];
   assign n142 = DIN[7];
   assign n143 = DIN[8];
   assign n144 = DIN[9];
   assign n145 = DIN[10];
   assign n146 = DIN[11];
   assign n147 = DIN[12];
   assign n148 = DIN[13];
   assign n149 = ND;
   assign n152 = CLK;
   assign n153 = ADDR[0];
   assign n154 = ADDR[1];
   assign n155 = ADDR[2];
   assign n156 = ADDR[3];
   assign n157 = ADDR[4];
   assign n158 = LD_DIN[0];
   assign n159 = LD_DIN[1];
   assign n160 = LD_DIN[2];
   assign n161 = LD_DIN[3];
   assign n162 = LD_DIN[4];
   assign n163 = LD_DIN[5];
   assign n164 = LD_DIN[6];
   assign n165 = LD_DIN[7];
   assign n166 = LD_DIN[8];
   assign n167 = LD_DIN[9];
   assign n168 = LD_DIN[10];
   assign n169 = LD_DIN[11];
   assign n170 = LD_DIN[12];
   assign n171 = LD_DIN[13];
   assign n172 = LD_DIN[14];
   assign n173 = LD_DIN[15];
   assign n174 = LD_DIN[16];
   assign n175 = LD_DIN[17];
   assign n176 = LD_DIN[18];
   assign n177 = LD_DIN[19];
   assign n178 = LD_DIN[20];
   assign n179 = LD_DIN[21];
   assign n180 = LD_DIN[22];
   assign n181 = LD_DIN[23];
   assign n182 = LD_DIN[24];
   assign n183 = LD_DIN[25];
   assign n184 = LD_DIN[26];
   assign n185 = LD_DIN[27];
   assign n186 = LD_DIN[28];
   assign n187 = LD_DIN[29];
   assign n188 = LD_DIN[30];
   assign n189 = LD_DIN[31];
   assign n190 = WE;
   assign n191 = SEL;
   assign RDY = n150;
   assign RFD = n151;
   assign DOUT_I[0] = n192;
   assign DOUT_I[1] = n193;
   assign DOUT_I[2] = n194;
   assign DOUT_I[3] = n195;
   assign DOUT_I[4] = n196;
   assign DOUT_I[5] = n197;
   assign DOUT_I[6] = n198;
   assign DOUT_I[7] = n199;
   assign DOUT_I[8] = n200;
   assign DOUT_I[9] = n201;
   assign DOUT_I[10] = n202;
   assign DOUT_I[11] = n203;
   assign DOUT_I[12] = n204;
   assign DOUT_I[13] = n205;
   assign DOUT_I[14] = n206;
   assign DOUT_I[15] = n207;
   assign DOUT_I[16] = n208;
   assign DOUT_I[17] = n209;
   assign DOUT_I[18] = n210;
   assign DOUT_I[19] = n211;
   assign DOUT_I[20] = n212;
   assign DOUT_I[21] = n213;
   assign DOUT_I[22] = n214;
   assign DOUT_I[23] = n215;
   assign DOUT_I[24] = n216;
   assign DOUT_I[25] = n217;
   assign DOUT_I[26] = n218;
   assign DOUT_I[27] = n219;
   assign DOUT_I[28] = n220;
   assign DOUT_I[29] = n221;
   assign DOUT_Q[0] = n222;
   assign DOUT_Q[1] = n223;
   assign DOUT_Q[2] = n224;
   assign DOUT_Q[3] = n225;
   assign DOUT_Q[4] = n226;
   assign DOUT_Q[5] = n227;
   assign DOUT_Q[6] = n228;
   assign DOUT_Q[7] = n229;
   assign DOUT_Q[8] = n230;
   assign DOUT_Q[9] = n231;
   assign DOUT_Q[10] = n232;
   assign DOUT_Q[11] = n233;
   assign DOUT_Q[12] = n234;
   assign DOUT_Q[13] = n235;
   assign DOUT_Q[14] = n236;
   assign DOUT_Q[15] = n237;
   assign DOUT_Q[16] = n238;
   assign DOUT_Q[17] = n239;
   assign DOUT_Q[18] = n240;
   assign DOUT_Q[19] = n241;
   assign DOUT_Q[20] = n242;
   assign DOUT_Q[21] = n243;
   assign DOUT_Q[22] = n244;
   assign DOUT_Q[23] = n245;
   assign DOUT_Q[24] = n246;
   assign DOUT_Q[25] = n247;
   assign DOUT_Q[26] = n248;
   assign DOUT_Q[27] = n249;
   assign DOUT_Q[28] = n250;
   assign DOUT_Q[29] = n251;

      defparam BU4.INIT = 'h1000;
      wire BU4_I0;
         assign BU4_I0 = n157;
      wire BU4_I1;
         assign BU4_I1 = n156;
      wire BU4_I2;
         assign BU4_I2 = n155;
      wire BU4_I3;
         assign BU4_I3 = n191;
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
         assign BU8_I1 = n190;
      wire BU8_I2;
         assign BU8_I2 = n154;
      wire BU8_I3;
         assign BU8_I3 = n153;
      wire BU8_O;
         assign n291 = BU8_O;
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
         assign n151 = BU10_O;
      LUT4       BU10(
         .I0(BU10_I0),
         .I1(BU10_I1),
         .I2(BU10_I2),
         .I3(BU10_I3),
         .O(BU10_O)
      );

      wire BU1292_D;
         assign BU1292_D = n149;
      wire BU1292_C;
         assign BU1292_C = n152;
      wire BU1292_CE;
         assign BU1292_CE = 1'b1;
      wire BU1292_Q;
         assign n340 = BU1292_Q;
      FDE       BU1292(
         .D(BU1292_D),
         .C(BU1292_C),
         .CE(BU1292_CE),
         .Q(BU1292_Q)
      );

      defparam BU14.INIT = 'h0000;
      wire BU14_D;
         assign BU14_D = n135;
      wire BU14_CE;
         assign BU14_CE = n149;
      wire BU14_CLK;
         assign BU14_CLK = n152;
      wire BU14_A0;
         assign BU14_A0 = 1'b0;
      wire BU14_A1;
         assign BU14_A1 = 1'b1;
      wire BU14_A2;
         assign BU14_A2 = 1'b0;
      wire BU14_A3;
         assign BU14_A3 = 1'b0;
      wire BU14_Q;
         assign n924 = BU14_Q;
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
         assign BU16_D = n924;
      wire BU16_C;
         assign BU16_C = n152;
      wire BU16_CE;
         assign BU16_CE = n149;
      wire BU16_Q;
         assign n587 = BU16_Q;
      FDE       BU16(
         .D(BU16_D),
         .C(BU16_C),
         .CE(BU16_CE),
         .Q(BU16_Q)
      );

      defparam BU17.INIT = 'h0000;
      wire BU17_D;
         assign BU17_D = n136;
      wire BU17_CE;
         assign BU17_CE = n149;
      wire BU17_CLK;
         assign BU17_CLK = n152;
      wire BU17_A0;
         assign BU17_A0 = 1'b0;
      wire BU17_A1;
         assign BU17_A1 = 1'b1;
      wire BU17_A2;
         assign BU17_A2 = 1'b0;
      wire BU17_A3;
         assign BU17_A3 = 1'b0;
      wire BU17_Q;
         assign n925 = BU17_Q;
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
         assign BU19_D = n925;
      wire BU19_C;
         assign BU19_C = n152;
      wire BU19_CE;
         assign BU19_CE = n149;
      wire BU19_Q;
         assign n586 = BU19_Q;
      FDE       BU19(
         .D(BU19_D),
         .C(BU19_C),
         .CE(BU19_CE),
         .Q(BU19_Q)
      );

      defparam BU20.INIT = 'h0000;
      wire BU20_D;
         assign BU20_D = n137;
      wire BU20_CE;
         assign BU20_CE = n149;
      wire BU20_CLK;
         assign BU20_CLK = n152;
      wire BU20_A0;
         assign BU20_A0 = 1'b0;
      wire BU20_A1;
         assign BU20_A1 = 1'b1;
      wire BU20_A2;
         assign BU20_A2 = 1'b0;
      wire BU20_A3;
         assign BU20_A3 = 1'b0;
      wire BU20_Q;
         assign n926 = BU20_Q;
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
         assign BU22_D = n926;
      wire BU22_C;
         assign BU22_C = n152;
      wire BU22_CE;
         assign BU22_CE = n149;
      wire BU22_Q;
         assign n585 = BU22_Q;
      FDE       BU22(
         .D(BU22_D),
         .C(BU22_C),
         .CE(BU22_CE),
         .Q(BU22_Q)
      );

      defparam BU23.INIT = 'h0000;
      wire BU23_D;
         assign BU23_D = n138;
      wire BU23_CE;
         assign BU23_CE = n149;
      wire BU23_CLK;
         assign BU23_CLK = n152;
      wire BU23_A0;
         assign BU23_A0 = 1'b0;
      wire BU23_A1;
         assign BU23_A1 = 1'b1;
      wire BU23_A2;
         assign BU23_A2 = 1'b0;
      wire BU23_A3;
         assign BU23_A3 = 1'b0;
      wire BU23_Q;
         assign n927 = BU23_Q;
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
         assign BU25_D = n927;
      wire BU25_C;
         assign BU25_C = n152;
      wire BU25_CE;
         assign BU25_CE = n149;
      wire BU25_Q;
         assign n584 = BU25_Q;
      FDE       BU25(
         .D(BU25_D),
         .C(BU25_C),
         .CE(BU25_CE),
         .Q(BU25_Q)
      );

      defparam BU26.INIT = 'h0000;
      wire BU26_D;
         assign BU26_D = n139;
      wire BU26_CE;
         assign BU26_CE = n149;
      wire BU26_CLK;
         assign BU26_CLK = n152;
      wire BU26_A0;
         assign BU26_A0 = 1'b0;
      wire BU26_A1;
         assign BU26_A1 = 1'b1;
      wire BU26_A2;
         assign BU26_A2 = 1'b0;
      wire BU26_A3;
         assign BU26_A3 = 1'b0;
      wire BU26_Q;
         assign n928 = BU26_Q;
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
         assign BU28_D = n928;
      wire BU28_C;
         assign BU28_C = n152;
      wire BU28_CE;
         assign BU28_CE = n149;
      wire BU28_Q;
         assign n583 = BU28_Q;
      FDE       BU28(
         .D(BU28_D),
         .C(BU28_C),
         .CE(BU28_CE),
         .Q(BU28_Q)
      );

      defparam BU29.INIT = 'h0000;
      wire BU29_D;
         assign BU29_D = n140;
      wire BU29_CE;
         assign BU29_CE = n149;
      wire BU29_CLK;
         assign BU29_CLK = n152;
      wire BU29_A0;
         assign BU29_A0 = 1'b0;
      wire BU29_A1;
         assign BU29_A1 = 1'b1;
      wire BU29_A2;
         assign BU29_A2 = 1'b0;
      wire BU29_A3;
         assign BU29_A3 = 1'b0;
      wire BU29_Q;
         assign n929 = BU29_Q;
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
         assign BU31_D = n929;
      wire BU31_C;
         assign BU31_C = n152;
      wire BU31_CE;
         assign BU31_CE = n149;
      wire BU31_Q;
         assign n582 = BU31_Q;
      FDE       BU31(
         .D(BU31_D),
         .C(BU31_C),
         .CE(BU31_CE),
         .Q(BU31_Q)
      );

      defparam BU32.INIT = 'h0000;
      wire BU32_D;
         assign BU32_D = n141;
      wire BU32_CE;
         assign BU32_CE = n149;
      wire BU32_CLK;
         assign BU32_CLK = n152;
      wire BU32_A0;
         assign BU32_A0 = 1'b0;
      wire BU32_A1;
         assign BU32_A1 = 1'b1;
      wire BU32_A2;
         assign BU32_A2 = 1'b0;
      wire BU32_A3;
         assign BU32_A3 = 1'b0;
      wire BU32_Q;
         assign n930 = BU32_Q;
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
         assign BU34_D = n930;
      wire BU34_C;
         assign BU34_C = n152;
      wire BU34_CE;
         assign BU34_CE = n149;
      wire BU34_Q;
         assign n581 = BU34_Q;
      FDE       BU34(
         .D(BU34_D),
         .C(BU34_C),
         .CE(BU34_CE),
         .Q(BU34_Q)
      );

      defparam BU35.INIT = 'h0000;
      wire BU35_D;
         assign BU35_D = n142;
      wire BU35_CE;
         assign BU35_CE = n149;
      wire BU35_CLK;
         assign BU35_CLK = n152;
      wire BU35_A0;
         assign BU35_A0 = 1'b0;
      wire BU35_A1;
         assign BU35_A1 = 1'b1;
      wire BU35_A2;
         assign BU35_A2 = 1'b0;
      wire BU35_A3;
         assign BU35_A3 = 1'b0;
      wire BU35_Q;
         assign n931 = BU35_Q;
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
         assign BU37_D = n931;
      wire BU37_C;
         assign BU37_C = n152;
      wire BU37_CE;
         assign BU37_CE = n149;
      wire BU37_Q;
         assign n580 = BU37_Q;
      FDE       BU37(
         .D(BU37_D),
         .C(BU37_C),
         .CE(BU37_CE),
         .Q(BU37_Q)
      );

      defparam BU38.INIT = 'h0000;
      wire BU38_D;
         assign BU38_D = n143;
      wire BU38_CE;
         assign BU38_CE = n149;
      wire BU38_CLK;
         assign BU38_CLK = n152;
      wire BU38_A0;
         assign BU38_A0 = 1'b0;
      wire BU38_A1;
         assign BU38_A1 = 1'b1;
      wire BU38_A2;
         assign BU38_A2 = 1'b0;
      wire BU38_A3;
         assign BU38_A3 = 1'b0;
      wire BU38_Q;
         assign n932 = BU38_Q;
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
         assign BU40_D = n932;
      wire BU40_C;
         assign BU40_C = n152;
      wire BU40_CE;
         assign BU40_CE = n149;
      wire BU40_Q;
         assign n579 = BU40_Q;
      FDE       BU40(
         .D(BU40_D),
         .C(BU40_C),
         .CE(BU40_CE),
         .Q(BU40_Q)
      );

      defparam BU41.INIT = 'h0000;
      wire BU41_D;
         assign BU41_D = n144;
      wire BU41_CE;
         assign BU41_CE = n149;
      wire BU41_CLK;
         assign BU41_CLK = n152;
      wire BU41_A0;
         assign BU41_A0 = 1'b0;
      wire BU41_A1;
         assign BU41_A1 = 1'b1;
      wire BU41_A2;
         assign BU41_A2 = 1'b0;
      wire BU41_A3;
         assign BU41_A3 = 1'b0;
      wire BU41_Q;
         assign n933 = BU41_Q;
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
         assign BU43_D = n933;
      wire BU43_C;
         assign BU43_C = n152;
      wire BU43_CE;
         assign BU43_CE = n149;
      wire BU43_Q;
         assign n578 = BU43_Q;
      FDE       BU43(
         .D(BU43_D),
         .C(BU43_C),
         .CE(BU43_CE),
         .Q(BU43_Q)
      );

      defparam BU44.INIT = 'h0000;
      wire BU44_D;
         assign BU44_D = n145;
      wire BU44_CE;
         assign BU44_CE = n149;
      wire BU44_CLK;
         assign BU44_CLK = n152;
      wire BU44_A0;
         assign BU44_A0 = 1'b0;
      wire BU44_A1;
         assign BU44_A1 = 1'b1;
      wire BU44_A2;
         assign BU44_A2 = 1'b0;
      wire BU44_A3;
         assign BU44_A3 = 1'b0;
      wire BU44_Q;
         assign n934 = BU44_Q;
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
         assign BU46_D = n934;
      wire BU46_C;
         assign BU46_C = n152;
      wire BU46_CE;
         assign BU46_CE = n149;
      wire BU46_Q;
         assign n577 = BU46_Q;
      FDE       BU46(
         .D(BU46_D),
         .C(BU46_C),
         .CE(BU46_CE),
         .Q(BU46_Q)
      );

      defparam BU47.INIT = 'h0000;
      wire BU47_D;
         assign BU47_D = n146;
      wire BU47_CE;
         assign BU47_CE = n149;
      wire BU47_CLK;
         assign BU47_CLK = n152;
      wire BU47_A0;
         assign BU47_A0 = 1'b0;
      wire BU47_A1;
         assign BU47_A1 = 1'b1;
      wire BU47_A2;
         assign BU47_A2 = 1'b0;
      wire BU47_A3;
         assign BU47_A3 = 1'b0;
      wire BU47_Q;
         assign n935 = BU47_Q;
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
         assign BU49_D = n935;
      wire BU49_C;
         assign BU49_C = n152;
      wire BU49_CE;
         assign BU49_CE = n149;
      wire BU49_Q;
         assign n576 = BU49_Q;
      FDE       BU49(
         .D(BU49_D),
         .C(BU49_C),
         .CE(BU49_CE),
         .Q(BU49_Q)
      );

      defparam BU50.INIT = 'h0000;
      wire BU50_D;
         assign BU50_D = n147;
      wire BU50_CE;
         assign BU50_CE = n149;
      wire BU50_CLK;
         assign BU50_CLK = n152;
      wire BU50_A0;
         assign BU50_A0 = 1'b0;
      wire BU50_A1;
         assign BU50_A1 = 1'b1;
      wire BU50_A2;
         assign BU50_A2 = 1'b0;
      wire BU50_A3;
         assign BU50_A3 = 1'b0;
      wire BU50_Q;
         assign n936 = BU50_Q;
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
         assign BU52_D = n936;
      wire BU52_C;
         assign BU52_C = n152;
      wire BU52_CE;
         assign BU52_CE = n149;
      wire BU52_Q;
         assign n575 = BU52_Q;
      FDE       BU52(
         .D(BU52_D),
         .C(BU52_C),
         .CE(BU52_CE),
         .Q(BU52_Q)
      );

      defparam BU53.INIT = 'h0000;
      wire BU53_D;
         assign BU53_D = n148;
      wire BU53_CE;
         assign BU53_CE = n149;
      wire BU53_CLK;
         assign BU53_CLK = n152;
      wire BU53_A0;
         assign BU53_A0 = 1'b0;
      wire BU53_A1;
         assign BU53_A1 = 1'b1;
      wire BU53_A2;
         assign BU53_A2 = 1'b0;
      wire BU53_A3;
         assign BU53_A3 = 1'b0;
      wire BU53_Q;
         assign n937 = BU53_Q;
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
         assign BU55_D = n937;
      wire BU55_C;
         assign BU55_C = n152;
      wire BU55_CE;
         assign BU55_CE = n149;
      wire BU55_Q;
         assign n574 = BU55_Q;
      FDE       BU55(
         .D(BU55_D),
         .C(BU55_C),
         .CE(BU55_CE),
         .Q(BU55_Q)
      );

      wire [31 : 0] BU57_DATA;
         assign BU57_DATA[0] = n158;
         assign BU57_DATA[1] = n159;
         assign BU57_DATA[2] = n160;
         assign BU57_DATA[3] = n161;
         assign BU57_DATA[4] = n162;
         assign BU57_DATA[5] = n163;
         assign BU57_DATA[6] = n164;
         assign BU57_DATA[7] = n165;
         assign BU57_DATA[8] = n166;
         assign BU57_DATA[9] = n167;
         assign BU57_DATA[10] = n168;
         assign BU57_DATA[11] = n169;
         assign BU57_DATA[12] = n170;
         assign BU57_DATA[13] = n171;
         assign BU57_DATA[14] = n172;
         assign BU57_DATA[15] = n173;
         assign BU57_DATA[16] = n174;
         assign BU57_DATA[17] = n175;
         assign BU57_DATA[18] = n176;
         assign BU57_DATA[19] = n177;
         assign BU57_DATA[20] = n178;
         assign BU57_DATA[21] = n179;
         assign BU57_DATA[22] = n180;
         assign BU57_DATA[23] = n181;
         assign BU57_DATA[24] = n182;
         assign BU57_DATA[25] = n183;
         assign BU57_DATA[26] = n184;
         assign BU57_DATA[27] = n185;
         assign BU57_DATA[28] = n186;
         assign BU57_DATA[29] = n187;
         assign BU57_DATA[30] = n188;
         assign BU57_DATA[31] = n189;
      wire BU57_WE;
         assign BU57_WE = n291;
      wire BU57_CLK;
         assign BU57_CLK = n152;
      wire BU57_CE;
         assign BU57_CE = n149;
      wire BU57_RDY;
         assign n339 = BU57_RDY;
      wire [14 : 0] BU57_SINE;
         assign n426 = BU57_SINE[0];
         assign n425 = BU57_SINE[1];
         assign n424 = BU57_SINE[2];
         assign n423 = BU57_SINE[3];
         assign n422 = BU57_SINE[4];
         assign n421 = BU57_SINE[5];
         assign n420 = BU57_SINE[6];
         assign n419 = BU57_SINE[7];
         assign n418 = BU57_SINE[8];
         assign n417 = BU57_SINE[9];
         assign n416 = BU57_SINE[10];
         assign n415 = BU57_SINE[11];
         assign n414 = BU57_SINE[12];
         assign n413 = BU57_SINE[13];
         assign n412 = BU57_SINE[14];
      wire [14 : 0] BU57_COSINE;
         assign n630 = BU57_COSINE[0];
         assign n629 = BU57_COSINE[1];
         assign n628 = BU57_COSINE[2];
         assign n627 = BU57_COSINE[3];
         assign n626 = BU57_COSINE[4];
         assign n625 = BU57_COSINE[5];
         assign n624 = BU57_COSINE[6];
         assign n623 = BU57_COSINE[7];
         assign n622 = BU57_COSINE[8];
         assign n621 = BU57_COSINE[9];
         assign n620 = BU57_COSINE[10];
         assign n619 = BU57_COSINE[11];
         assign n618 = BU57_COSINE[12];
         assign n617 = BU57_COSINE[13];
         assign n616 = BU57_COSINE[14];
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
         assign BU1294_I0 = n339;
      wire BU1294_I1;
         assign BU1294_I1 = n340;
      wire BU1294_I2;
         assign BU1294_I2 = 1'b0;
      wire BU1294_I3;
         assign BU1294_I3 = 1'b0;
      wire BU1294_O;
         assign n338 = BU1294_O;
      LUT4       BU1294(
         .I0(BU1294_I0),
         .I1(BU1294_I1),
         .I2(BU1294_I2),
         .I3(BU1294_I3),
         .O(BU1294_O)
      );

      wire BU1296_clk;
         assign BU1296_clk = n152;
      wire [13 : 0] BU1296_a;
         assign BU1296_a[13] = n574;
         assign BU1296_a[12] = n575;
         assign BU1296_a[11] = n576;
         assign BU1296_a[10] = n577;
         assign BU1296_a[9] = n578;
         assign BU1296_a[8] = n579;
         assign BU1296_a[7] = n580;
         assign BU1296_a[6] = n581;
         assign BU1296_a[5] = n582;
         assign BU1296_a[4] = n583;
         assign BU1296_a[3] = n584;
         assign BU1296_a[2] = n585;
         assign BU1296_a[1] = n586;
         assign BU1296_a[0] = n587;
      wire [14 : 0] BU1296_b;
         assign BU1296_b[14] = n412;
         assign BU1296_b[13] = n413;
         assign BU1296_b[12] = n414;
         assign BU1296_b[11] = n415;
         assign BU1296_b[10] = n416;
         assign BU1296_b[9] = n417;
         assign BU1296_b[8] = n418;
         assign BU1296_b[7] = n419;
         assign BU1296_b[6] = n420;
         assign BU1296_b[5] = n421;
         assign BU1296_b[4] = n422;
         assign BU1296_b[3] = n423;
         assign BU1296_b[2] = n424;
         assign BU1296_b[1] = n425;
         assign BU1296_b[0] = n426;
      wire [28 : 0] BU1296_o;
      wire [28 : 0] BU1296_q;
         assign n457 = BU1296_q[28];
         assign n458 = BU1296_q[27];
         assign n459 = BU1296_q[26];
         assign n460 = BU1296_q[25];
         assign n461 = BU1296_q[24];
         assign n462 = BU1296_q[23];
         assign n463 = BU1296_q[22];
         assign n464 = BU1296_q[21];
         assign n465 = BU1296_q[20];
         assign n466 = BU1296_q[19];
         assign n467 = BU1296_q[18];
         assign n468 = BU1296_q[17];
         assign n469 = BU1296_q[16];
         assign n470 = BU1296_q[15];
         assign n471 = BU1296_q[14];
         assign n472 = BU1296_q[13];
         assign n473 = BU1296_q[12];
         assign n474 = BU1296_q[11];
         assign n475 = BU1296_q[10];
         assign n476 = BU1296_q[9];
         assign n477 = BU1296_q[8];
         assign n478 = BU1296_q[7];
         assign n479 = BU1296_q[6];
         assign n480 = BU1296_q[5];
         assign n481 = BU1296_q[4];
         assign n482 = BU1296_q[3];
         assign n483 = BU1296_q[2];
         assign n484 = BU1296_q[1];
         assign n485 = BU1296_q[0];
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
         assign BU1296_nd = n338;
      wire BU1296_rdy;
         assign n544 = BU1296_rdy;
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
         assign BU1517_I[0] = n485;
         assign BU1517_I[1] = n484;
         assign BU1517_I[2] = n483;
         assign BU1517_I[3] = n482;
         assign BU1517_I[4] = n481;
      wire BU1517_O;
         assign n1544 = BU1517_O;
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
         assign BU1526_I0 = n480;
      wire BU1526_I1;
         assign BU1526_I1 = n481;
      wire BU1526_I2;
         assign BU1526_I2 = n1544;
      wire BU1526_I3;
         assign BU1526_I3 = 1'b0;
      wire BU1526_O;
         assign n1541 = BU1526_O;
      LUT4       BU1526(
         .I0(BU1526_I0),
         .I1(BU1526_I1),
         .I2(BU1526_I2),
         .I3(BU1526_I3),
         .O(BU1526_O)
      );

      wire [23 : 0] BU1527_A;
         assign BU1527_A[0] = n480;
         assign BU1527_A[1] = n479;
         assign BU1527_A[2] = n478;
         assign BU1527_A[3] = n477;
         assign BU1527_A[4] = n476;
         assign BU1527_A[5] = n475;
         assign BU1527_A[6] = n474;
         assign BU1527_A[7] = n473;
         assign BU1527_A[8] = n472;
         assign BU1527_A[9] = n471;
         assign BU1527_A[10] = n470;
         assign BU1527_A[11] = n469;
         assign BU1527_A[12] = n468;
         assign BU1527_A[13] = n467;
         assign BU1527_A[14] = n466;
         assign BU1527_A[15] = n465;
         assign BU1527_A[16] = n464;
         assign BU1527_A[17] = n463;
         assign BU1527_A[18] = n462;
         assign BU1527_A[19] = n461;
         assign BU1527_A[20] = n460;
         assign BU1527_A[21] = n459;
         assign BU1527_A[22] = n458;
         assign BU1527_A[23] = n457;
      wire [0 : 0] BU1527_B;
         assign BU1527_B[0] = n1541;
      wire [24 : 0] BU1527_S;
         assign n1516 = BU1527_S[0];
         assign n1517 = BU1527_S[1];
         assign n1518 = BU1527_S[2];
         assign n1519 = BU1527_S[3];
         assign n1520 = BU1527_S[4];
         assign n1521 = BU1527_S[5];
         assign n1522 = BU1527_S[6];
         assign n1523 = BU1527_S[7];
         assign n1524 = BU1527_S[8];
         assign n1525 = BU1527_S[9];
         assign n1526 = BU1527_S[10];
         assign n1527 = BU1527_S[11];
         assign n1528 = BU1527_S[12];
         assign n1529 = BU1527_S[13];
         assign n1530 = BU1527_S[14];
         assign n1531 = BU1527_S[15];
         assign n1532 = BU1527_S[16];
         assign n1533 = BU1527_S[17];
         assign n1534 = BU1527_S[18];
         assign n1535 = BU1527_S[19];
         assign n1536 = BU1527_S[20];
         assign n1537 = BU1527_S[21];
         assign n1538 = BU1527_S[22];
         assign n1539 = BU1527_S[23];
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
         assign BU1628_I0 = n457;
      wire BU1628_I1;
         assign BU1628_I1 = n458;
      wire BU1628_I2;
         assign BU1628_I2 = n1539;
      wire BU1628_I3;
         assign BU1628_I3 = 1'b0;
      wire BU1628_O;
         assign n1550 = BU1628_O;
      LUT4       BU1628(
         .I0(BU1628_I0),
         .I1(BU1628_I1),
         .I2(BU1628_I2),
         .I3(BU1628_I3),
         .O(BU1628_O)
      );

      defparam BU1630.INIT = 'h4444;
      wire BU1630_I0;
         assign BU1630_I0 = n457;
      wire BU1630_I1;
         assign BU1630_I1 = n1539;
      wire BU1630_I2;
         assign BU1630_I2 = 1'b0;
      wire BU1630_I3;
         assign BU1630_I3 = 1'b0;
      wire BU1630_O;
         assign n1552 = BU1630_O;
      LUT4       BU1630(
         .I0(BU1630_I0),
         .I1(BU1630_I1),
         .I2(BU1630_I2),
         .I3(BU1630_I3),
         .O(BU1630_O)
      );

      wire [22 : 0] BU1631_D;
         assign BU1631_D[0] = n1516;
         assign BU1631_D[1] = n1517;
         assign BU1631_D[2] = n1518;
         assign BU1631_D[3] = n1519;
         assign BU1631_D[4] = n1520;
         assign BU1631_D[5] = n1521;
         assign BU1631_D[6] = n1522;
         assign BU1631_D[7] = n1523;
         assign BU1631_D[8] = n1524;
         assign BU1631_D[9] = n1525;
         assign BU1631_D[10] = n1526;
         assign BU1631_D[11] = n1527;
         assign BU1631_D[12] = n1528;
         assign BU1631_D[13] = n1529;
         assign BU1631_D[14] = n1530;
         assign BU1631_D[15] = n1531;
         assign BU1631_D[16] = n1532;
         assign BU1631_D[17] = n1533;
         assign BU1631_D[18] = n1534;
         assign BU1631_D[19] = n1535;
         assign BU1631_D[20] = n1536;
         assign BU1631_D[21] = n1537;
         assign BU1631_D[22] = n1538;
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
         assign BU1631_CLK = n152;
      wire BU1631_SCLR;
         assign BU1631_SCLR = n1550;
      wire BU1631_SSET;
         assign BU1631_SSET = n1552;
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
         assign BU1724_D[0] = n1539;
      wire [0 : 0] BU1724_Q;
         assign n26 = BU1724_Q[0];
      wire BU1724_CLK;
         assign BU1724_CLK = n152;
      wire BU1724_SCLR;
         assign BU1724_SCLR = n1552;
      wire BU1724_SSET;
         assign BU1724_SSET = n1550;
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
         assign BU1729_CLK = n152;
      wire [0 : 0] BU1729_D;
         assign BU1729_D[0] = n544;
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
         assign BU1734_clk = n152;
      wire [13 : 0] BU1734_a;
         assign BU1734_a[13] = n574;
         assign BU1734_a[12] = n575;
         assign BU1734_a[11] = n576;
         assign BU1734_a[10] = n577;
         assign BU1734_a[9] = n578;
         assign BU1734_a[8] = n579;
         assign BU1734_a[7] = n580;
         assign BU1734_a[6] = n581;
         assign BU1734_a[5] = n582;
         assign BU1734_a[4] = n583;
         assign BU1734_a[3] = n584;
         assign BU1734_a[2] = n585;
         assign BU1734_a[1] = n586;
         assign BU1734_a[0] = n587;
      wire [14 : 0] BU1734_b;
         assign BU1734_b[14] = n616;
         assign BU1734_b[13] = n617;
         assign BU1734_b[12] = n618;
         assign BU1734_b[11] = n619;
         assign BU1734_b[10] = n620;
         assign BU1734_b[9] = n621;
         assign BU1734_b[8] = n622;
         assign BU1734_b[7] = n623;
         assign BU1734_b[6] = n624;
         assign BU1734_b[5] = n625;
         assign BU1734_b[4] = n626;
         assign BU1734_b[3] = n627;
         assign BU1734_b[2] = n628;
         assign BU1734_b[1] = n629;
         assign BU1734_b[0] = n630;
      wire [28 : 0] BU1734_o;
      wire [28 : 0] BU1734_q;
         assign n661 = BU1734_q[28];
         assign n662 = BU1734_q[27];
         assign n663 = BU1734_q[26];
         assign n664 = BU1734_q[25];
         assign n665 = BU1734_q[24];
         assign n666 = BU1734_q[23];
         assign n667 = BU1734_q[22];
         assign n668 = BU1734_q[21];
         assign n669 = BU1734_q[20];
         assign n670 = BU1734_q[19];
         assign n671 = BU1734_q[18];
         assign n672 = BU1734_q[17];
         assign n673 = BU1734_q[16];
         assign n674 = BU1734_q[15];
         assign n675 = BU1734_q[14];
         assign n676 = BU1734_q[13];
         assign n677 = BU1734_q[12];
         assign n678 = BU1734_q[11];
         assign n679 = BU1734_q[10];
         assign n680 = BU1734_q[9];
         assign n681 = BU1734_q[8];
         assign n682 = BU1734_q[7];
         assign n683 = BU1734_q[6];
         assign n684 = BU1734_q[5];
         assign n685 = BU1734_q[4];
         assign n686 = BU1734_q[3];
         assign n687 = BU1734_q[2];
         assign n688 = BU1734_q[1];
         assign n689 = BU1734_q[0];
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
         assign BU1734_nd = n338;
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
         assign BU1955_I[0] = n689;
         assign BU1955_I[1] = n688;
         assign BU1955_I[2] = n687;
         assign BU1955_I[3] = n686;
         assign BU1955_I[4] = n685;
      wire BU1955_O;
         assign n2187 = BU1955_O;
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
         assign BU1964_I0 = n684;
      wire BU1964_I1;
         assign BU1964_I1 = n685;
      wire BU1964_I2;
         assign BU1964_I2 = n2187;
      wire BU1964_I3;
         assign BU1964_I3 = 1'b0;
      wire BU1964_O;
         assign n2184 = BU1964_O;
      LUT4       BU1964(
         .I0(BU1964_I0),
         .I1(BU1964_I1),
         .I2(BU1964_I2),
         .I3(BU1964_I3),
         .O(BU1964_O)
      );

      wire [23 : 0] BU1965_A;
         assign BU1965_A[0] = n684;
         assign BU1965_A[1] = n683;
         assign BU1965_A[2] = n682;
         assign BU1965_A[3] = n681;
         assign BU1965_A[4] = n680;
         assign BU1965_A[5] = n679;
         assign BU1965_A[6] = n678;
         assign BU1965_A[7] = n677;
         assign BU1965_A[8] = n676;
         assign BU1965_A[9] = n675;
         assign BU1965_A[10] = n674;
         assign BU1965_A[11] = n673;
         assign BU1965_A[12] = n672;
         assign BU1965_A[13] = n671;
         assign BU1965_A[14] = n670;
         assign BU1965_A[15] = n669;
         assign BU1965_A[16] = n668;
         assign BU1965_A[17] = n667;
         assign BU1965_A[18] = n666;
         assign BU1965_A[19] = n665;
         assign BU1965_A[20] = n664;
         assign BU1965_A[21] = n663;
         assign BU1965_A[22] = n662;
         assign BU1965_A[23] = n661;
      wire [0 : 0] BU1965_B;
         assign BU1965_B[0] = n2184;
      wire [24 : 0] BU1965_S;
         assign n2159 = BU1965_S[0];
         assign n2160 = BU1965_S[1];
         assign n2161 = BU1965_S[2];
         assign n2162 = BU1965_S[3];
         assign n2163 = BU1965_S[4];
         assign n2164 = BU1965_S[5];
         assign n2165 = BU1965_S[6];
         assign n2166 = BU1965_S[7];
         assign n2167 = BU1965_S[8];
         assign n2168 = BU1965_S[9];
         assign n2169 = BU1965_S[10];
         assign n2170 = BU1965_S[11];
         assign n2171 = BU1965_S[12];
         assign n2172 = BU1965_S[13];
         assign n2173 = BU1965_S[14];
         assign n2174 = BU1965_S[15];
         assign n2175 = BU1965_S[16];
         assign n2176 = BU1965_S[17];
         assign n2177 = BU1965_S[18];
         assign n2178 = BU1965_S[19];
         assign n2179 = BU1965_S[20];
         assign n2180 = BU1965_S[21];
         assign n2181 = BU1965_S[22];
         assign n2182 = BU1965_S[23];
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
         assign BU2066_I0 = n661;
      wire BU2066_I1;
         assign BU2066_I1 = n662;
      wire BU2066_I2;
         assign BU2066_I2 = n2182;
      wire BU2066_I3;
         assign BU2066_I3 = 1'b0;
      wire BU2066_O;
         assign n2193 = BU2066_O;
      LUT4       BU2066(
         .I0(BU2066_I0),
         .I1(BU2066_I1),
         .I2(BU2066_I2),
         .I3(BU2066_I3),
         .O(BU2066_O)
      );

      defparam BU2068.INIT = 'h4444;
      wire BU2068_I0;
         assign BU2068_I0 = n661;
      wire BU2068_I1;
         assign BU2068_I1 = n2182;
      wire BU2068_I2;
         assign BU2068_I2 = 1'b0;
      wire BU2068_I3;
         assign BU2068_I3 = 1'b0;
      wire BU2068_O;
         assign n2195 = BU2068_O;
      LUT4       BU2068(
         .I0(BU2068_I0),
         .I1(BU2068_I1),
         .I2(BU2068_I2),
         .I3(BU2068_I3),
         .O(BU2068_O)
      );

      wire [22 : 0] BU2069_D;
         assign BU2069_D[0] = n2159;
         assign BU2069_D[1] = n2160;
         assign BU2069_D[2] = n2161;
         assign BU2069_D[3] = n2162;
         assign BU2069_D[4] = n2163;
         assign BU2069_D[5] = n2164;
         assign BU2069_D[6] = n2165;
         assign BU2069_D[7] = n2166;
         assign BU2069_D[8] = n2167;
         assign BU2069_D[9] = n2168;
         assign BU2069_D[10] = n2169;
         assign BU2069_D[11] = n2170;
         assign BU2069_D[12] = n2171;
         assign BU2069_D[13] = n2172;
         assign BU2069_D[14] = n2173;
         assign BU2069_D[15] = n2174;
         assign BU2069_D[16] = n2175;
         assign BU2069_D[17] = n2176;
         assign BU2069_D[18] = n2177;
         assign BU2069_D[19] = n2178;
         assign BU2069_D[20] = n2179;
         assign BU2069_D[21] = n2180;
         assign BU2069_D[22] = n2181;
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
         assign BU2069_CLK = n152;
      wire BU2069_SCLR;
         assign BU2069_SCLR = n2193;
      wire BU2069_SSET;
         assign BU2069_SSET = n2195;
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
         assign BU2162_D[0] = n2182;
      wire [0 : 0] BU2162_Q;
         assign n50 = BU2162_Q[0];
      wire BU2162_CLK;
         assign BU2162_CLK = n152;
      wire BU2162_SCLR;
         assign BU2162_SCLR = n2195;
      wire BU2162_SSET;
         assign BU2162_SSET = n2193;
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
         assign BU2457_D = n2716;
      wire BU2457_C;
         assign BU2457_C = n152;
      wire BU2457_CE;
         assign BU2457_CE = 1'b1;
      wire BU2457_Q;
         assign n2674 = BU2457_Q;
      FDE       BU2457(
         .D(BU2457_D),
         .C(BU2457_C),
         .CE(BU2457_CE),
         .Q(BU2457_Q)
      );

      wire [15 : 0] BU2461_I;
         assign BU2461_I[0] = n2676;
         assign BU2461_I[1] = n2677;
         assign BU2461_I[2] = n2678;
         assign BU2461_I[3] = n2679;
         assign BU2461_I[4] = n2680;
         assign BU2461_I[5] = n2681;
         assign BU2461_I[6] = n2682;
         assign BU2461_I[7] = n2683;
         assign BU2461_I[8] = n2684;
         assign BU2461_I[9] = n2685;
         assign BU2461_I[10] = n2686;
         assign BU2461_I[11] = n2687;
         assign BU2461_I[12] = n2688;
         assign BU2461_I[13] = n2689;
         assign BU2461_I[14] = n2690;
         assign BU2461_I[15] = n2691;
      wire BU2461_O;
         assign n2943 = BU2461_O;
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
         16    /* c_inputs*/,
         "0111111111111111"    /* c_input_inv_mask*/,
         0    /* c_pipe_stages*/,
         "0"    /* c_sinit_val*/,
         0    /* c_sync_enable*/,
         1    /* c_sync_priority*/
      )
      BU2461(
         .I(BU2461_I),
         .O(BU2461_O)
      );

      defparam BU2479.INIT = 'h8c8c;
      wire BU2479_I0;
         assign BU2479_I0 = n2692;
      wire BU2479_I1;
         assign BU2479_I1 = n2691;
      wire BU2479_I2;
         assign BU2479_I2 = n2943;
      wire BU2479_I3;
         assign BU2479_I3 = 1'b0;
      wire BU2479_O;
         assign n2940 = BU2479_O;
      LUT4       BU2479(
         .I0(BU2479_I0),
         .I1(BU2479_I1),
         .I2(BU2479_I2),
         .I3(BU2479_I3),
         .O(BU2479_O)
      );

      wire [23 : 0] BU2480_A;
         assign BU2480_A[0] = n2692;
         assign BU2480_A[1] = n2693;
         assign BU2480_A[2] = n2694;
         assign BU2480_A[3] = n2695;
         assign BU2480_A[4] = n2696;
         assign BU2480_A[5] = n2697;
         assign BU2480_A[6] = n2698;
         assign BU2480_A[7] = n2699;
         assign BU2480_A[8] = n2700;
         assign BU2480_A[9] = n2701;
         assign BU2480_A[10] = n2702;
         assign BU2480_A[11] = n2703;
         assign BU2480_A[12] = n2704;
         assign BU2480_A[13] = n2705;
         assign BU2480_A[14] = n2706;
         assign BU2480_A[15] = n2707;
         assign BU2480_A[16] = n2708;
         assign BU2480_A[17] = n2709;
         assign BU2480_A[18] = n2710;
         assign BU2480_A[19] = n2711;
         assign BU2480_A[20] = n2712;
         assign BU2480_A[21] = n2713;
         assign BU2480_A[22] = n2714;
         assign BU2480_A[23] = n2715;
      wire [0 : 0] BU2480_B;
         assign BU2480_B[0] = n2940;
      wire [24 : 0] BU2480_S;
         assign n2915 = BU2480_S[0];
         assign n2916 = BU2480_S[1];
         assign n2917 = BU2480_S[2];
         assign n2918 = BU2480_S[3];
         assign n2919 = BU2480_S[4];
         assign n2920 = BU2480_S[5];
         assign n2921 = BU2480_S[6];
         assign n2922 = BU2480_S[7];
         assign n2923 = BU2480_S[8];
         assign n2924 = BU2480_S[9];
         assign n2925 = BU2480_S[10];
         assign n2926 = BU2480_S[11];
         assign n2927 = BU2480_S[12];
         assign n2928 = BU2480_S[13];
         assign n2929 = BU2480_S[14];
         assign n2930 = BU2480_S[15];
         assign n2931 = BU2480_S[16];
         assign n2932 = BU2480_S[17];
         assign n2933 = BU2480_S[18];
         assign n2934 = BU2480_S[19];
         assign n2935 = BU2480_S[20];
         assign n2936 = BU2480_S[21];
         assign n2937 = BU2480_S[22];
         assign n2938 = BU2480_S[23];
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
      BU2480(
         .A(BU2480_A),
         .B(BU2480_B),
         .S(BU2480_S)
      );

      defparam BU2581.INIT = 'h0202;
      wire BU2581_I0;
         assign BU2581_I0 = n2715;
      wire BU2581_I1;
         assign BU2581_I1 = n2714;
      wire BU2581_I2;
         assign BU2581_I2 = n2938;
      wire BU2581_I3;
         assign BU2581_I3 = 1'b0;
      wire BU2581_O;
         assign n2960 = BU2581_O;
      LUT4       BU2581(
         .I0(BU2581_I0),
         .I1(BU2581_I1),
         .I2(BU2581_I2),
         .I3(BU2581_I3),
         .O(BU2581_O)
      );

      defparam BU2583.INIT = 'h4444;
      wire BU2583_I0;
         assign BU2583_I0 = n2715;
      wire BU2583_I1;
         assign BU2583_I1 = n2938;
      wire BU2583_I2;
         assign BU2583_I2 = 1'b0;
      wire BU2583_I3;
         assign BU2583_I3 = 1'b0;
      wire BU2583_O;
         assign n2962 = BU2583_O;
      LUT4       BU2583(
         .I0(BU2583_I0),
         .I1(BU2583_I1),
         .I2(BU2583_I2),
         .I3(BU2583_I3),
         .O(BU2583_O)
      );

      wire [22 : 0] BU2584_D;
         assign BU2584_D[0] = n2915;
         assign BU2584_D[1] = n2916;
         assign BU2584_D[2] = n2917;
         assign BU2584_D[3] = n2918;
         assign BU2584_D[4] = n2919;
         assign BU2584_D[5] = n2920;
         assign BU2584_D[6] = n2921;
         assign BU2584_D[7] = n2922;
         assign BU2584_D[8] = n2923;
         assign BU2584_D[9] = n2924;
         assign BU2584_D[10] = n2925;
         assign BU2584_D[11] = n2926;
         assign BU2584_D[12] = n2927;
         assign BU2584_D[13] = n2928;
         assign BU2584_D[14] = n2929;
         assign BU2584_D[15] = n2930;
         assign BU2584_D[16] = n2931;
         assign BU2584_D[17] = n2932;
         assign BU2584_D[18] = n2933;
         assign BU2584_D[19] = n2934;
         assign BU2584_D[20] = n2935;
         assign BU2584_D[21] = n2936;
         assign BU2584_D[22] = n2937;
      wire [22 : 0] BU2584_Q;
         assign n2602 = BU2584_Q[0];
         assign n2603 = BU2584_Q[1];
         assign n2604 = BU2584_Q[2];
         assign n2605 = BU2584_Q[3];
         assign n2606 = BU2584_Q[4];
         assign n2607 = BU2584_Q[5];
         assign n2608 = BU2584_Q[6];
         assign n2609 = BU2584_Q[7];
         assign n2610 = BU2584_Q[8];
         assign n2611 = BU2584_Q[9];
         assign n2612 = BU2584_Q[10];
         assign n2613 = BU2584_Q[11];
         assign n2614 = BU2584_Q[12];
         assign n2615 = BU2584_Q[13];
         assign n2616 = BU2584_Q[14];
         assign n2617 = BU2584_Q[15];
         assign n2618 = BU2584_Q[16];
         assign n2619 = BU2584_Q[17];
         assign n2620 = BU2584_Q[18];
         assign n2621 = BU2584_Q[19];
         assign n2622 = BU2584_Q[20];
         assign n2623 = BU2584_Q[21];
         assign n2624 = BU2584_Q[22];
      wire BU2584_CLK;
         assign BU2584_CLK = n152;
      wire BU2584_SCLR;
         assign BU2584_SCLR = n2960;
      wire BU2584_SSET;
         assign BU2584_SSET = n2962;
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
      BU2584(
         .D(BU2584_D),
         .Q(BU2584_Q),
         .CLK(BU2584_CLK),
         .SCLR(BU2584_SCLR),
         .SSET(BU2584_SSET)
      );

      wire [0 : 0] BU2677_D;
         assign BU2677_D[0] = n2938;
      wire [0 : 0] BU2677_Q;
         assign n2625 = BU2677_Q[0];
      wire BU2677_CLK;
         assign BU2677_CLK = n152;
      wire BU2677_SCLR;
         assign BU2677_SCLR = n2962;
      wire BU2677_SSET;
         assign BU2677_SSET = n2960;
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
      BU2677(
         .D(BU2677_D),
         .Q(BU2677_Q),
         .CLK(BU2677_CLK),
         .SCLR(BU2677_SCLR),
         .SSET(BU2677_SSET)
      );

      wire [15 : 0] BU6771_I;
         assign BU6771_I[0] = n2717;
         assign BU6771_I[1] = n2718;
         assign BU6771_I[2] = n2719;
         assign BU6771_I[3] = n2720;
         assign BU6771_I[4] = n2721;
         assign BU6771_I[5] = n2722;
         assign BU6771_I[6] = n2723;
         assign BU6771_I[7] = n2724;
         assign BU6771_I[8] = n2725;
         assign BU6771_I[9] = n2726;
         assign BU6771_I[10] = n2727;
         assign BU6771_I[11] = n2728;
         assign BU6771_I[12] = n2729;
         assign BU6771_I[13] = n2730;
         assign BU6771_I[14] = n2731;
         assign BU6771_I[15] = n2732;
      wire BU6771_O;
         assign n3431 = BU6771_O;
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
         16    /* c_inputs*/,
         "0111111111111111"    /* c_input_inv_mask*/,
         0    /* c_pipe_stages*/,
         "0"    /* c_sinit_val*/,
         0    /* c_sync_enable*/,
         1    /* c_sync_priority*/
      )
      BU6771(
         .I(BU6771_I),
         .O(BU6771_O)
      );

      defparam BU6789.INIT = 'h8c8c;
      wire BU6789_I0;
         assign BU6789_I0 = n2733;
      wire BU6789_I1;
         assign BU6789_I1 = n2732;
      wire BU6789_I2;
         assign BU6789_I2 = n3431;
      wire BU6789_I3;
         assign BU6789_I3 = 1'b0;
      wire BU6789_O;
         assign n3428 = BU6789_O;
      LUT4       BU6789(
         .I0(BU6789_I0),
         .I1(BU6789_I1),
         .I2(BU6789_I2),
         .I3(BU6789_I3),
         .O(BU6789_O)
      );

      wire [23 : 0] BU6790_A;
         assign BU6790_A[0] = n2733;
         assign BU6790_A[1] = n2734;
         assign BU6790_A[2] = n2735;
         assign BU6790_A[3] = n2736;
         assign BU6790_A[4] = n2737;
         assign BU6790_A[5] = n2738;
         assign BU6790_A[6] = n2739;
         assign BU6790_A[7] = n2740;
         assign BU6790_A[8] = n2741;
         assign BU6790_A[9] = n2742;
         assign BU6790_A[10] = n2743;
         assign BU6790_A[11] = n2744;
         assign BU6790_A[12] = n2745;
         assign BU6790_A[13] = n2746;
         assign BU6790_A[14] = n2747;
         assign BU6790_A[15] = n2748;
         assign BU6790_A[16] = n2749;
         assign BU6790_A[17] = n2750;
         assign BU6790_A[18] = n2751;
         assign BU6790_A[19] = n2752;
         assign BU6790_A[20] = n2753;
         assign BU6790_A[21] = n2754;
         assign BU6790_A[22] = n2755;
         assign BU6790_A[23] = n2756;
      wire [0 : 0] BU6790_B;
         assign BU6790_B[0] = n3428;
      wire [24 : 0] BU6790_S;
         assign n3403 = BU6790_S[0];
         assign n3404 = BU6790_S[1];
         assign n3405 = BU6790_S[2];
         assign n3406 = BU6790_S[3];
         assign n3407 = BU6790_S[4];
         assign n3408 = BU6790_S[5];
         assign n3409 = BU6790_S[6];
         assign n3410 = BU6790_S[7];
         assign n3411 = BU6790_S[8];
         assign n3412 = BU6790_S[9];
         assign n3413 = BU6790_S[10];
         assign n3414 = BU6790_S[11];
         assign n3415 = BU6790_S[12];
         assign n3416 = BU6790_S[13];
         assign n3417 = BU6790_S[14];
         assign n3418 = BU6790_S[15];
         assign n3419 = BU6790_S[16];
         assign n3420 = BU6790_S[17];
         assign n3421 = BU6790_S[18];
         assign n3422 = BU6790_S[19];
         assign n3423 = BU6790_S[20];
         assign n3424 = BU6790_S[21];
         assign n3425 = BU6790_S[22];
         assign n3426 = BU6790_S[23];
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
      BU6790(
         .A(BU6790_A),
         .B(BU6790_B),
         .S(BU6790_S)
      );

      defparam BU6891.INIT = 'h0202;
      wire BU6891_I0;
         assign BU6891_I0 = n2756;
      wire BU6891_I1;
         assign BU6891_I1 = n2755;
      wire BU6891_I2;
         assign BU6891_I2 = n3426;
      wire BU6891_I3;
         assign BU6891_I3 = 1'b0;
      wire BU6891_O;
         assign n3448 = BU6891_O;
      LUT4       BU6891(
         .I0(BU6891_I0),
         .I1(BU6891_I1),
         .I2(BU6891_I2),
         .I3(BU6891_I3),
         .O(BU6891_O)
      );

      defparam BU6893.INIT = 'h4444;
      wire BU6893_I0;
         assign BU6893_I0 = n2756;
      wire BU6893_I1;
         assign BU6893_I1 = n3426;
      wire BU6893_I2;
         assign BU6893_I2 = 1'b0;
      wire BU6893_I3;
         assign BU6893_I3 = 1'b0;
      wire BU6893_O;
         assign n3450 = BU6893_O;
      LUT4       BU6893(
         .I0(BU6893_I0),
         .I1(BU6893_I1),
         .I2(BU6893_I2),
         .I3(BU6893_I3),
         .O(BU6893_O)
      );

      wire [22 : 0] BU6894_D;
         assign BU6894_D[0] = n3403;
         assign BU6894_D[1] = n3404;
         assign BU6894_D[2] = n3405;
         assign BU6894_D[3] = n3406;
         assign BU6894_D[4] = n3407;
         assign BU6894_D[5] = n3408;
         assign BU6894_D[6] = n3409;
         assign BU6894_D[7] = n3410;
         assign BU6894_D[8] = n3411;
         assign BU6894_D[9] = n3412;
         assign BU6894_D[10] = n3413;
         assign BU6894_D[11] = n3414;
         assign BU6894_D[12] = n3415;
         assign BU6894_D[13] = n3416;
         assign BU6894_D[14] = n3417;
         assign BU6894_D[15] = n3418;
         assign BU6894_D[16] = n3419;
         assign BU6894_D[17] = n3420;
         assign BU6894_D[18] = n3421;
         assign BU6894_D[19] = n3422;
         assign BU6894_D[20] = n3423;
         assign BU6894_D[21] = n3424;
         assign BU6894_D[22] = n3425;
      wire [22 : 0] BU6894_Q;
         assign n2626 = BU6894_Q[0];
         assign n2627 = BU6894_Q[1];
         assign n2628 = BU6894_Q[2];
         assign n2629 = BU6894_Q[3];
         assign n2630 = BU6894_Q[4];
         assign n2631 = BU6894_Q[5];
         assign n2632 = BU6894_Q[6];
         assign n2633 = BU6894_Q[7];
         assign n2634 = BU6894_Q[8];
         assign n2635 = BU6894_Q[9];
         assign n2636 = BU6894_Q[10];
         assign n2637 = BU6894_Q[11];
         assign n2638 = BU6894_Q[12];
         assign n2639 = BU6894_Q[13];
         assign n2640 = BU6894_Q[14];
         assign n2641 = BU6894_Q[15];
         assign n2642 = BU6894_Q[16];
         assign n2643 = BU6894_Q[17];
         assign n2644 = BU6894_Q[18];
         assign n2645 = BU6894_Q[19];
         assign n2646 = BU6894_Q[20];
         assign n2647 = BU6894_Q[21];
         assign n2648 = BU6894_Q[22];
      wire BU6894_CLK;
         assign BU6894_CLK = n152;
      wire BU6894_SCLR;
         assign BU6894_SCLR = n3448;
      wire BU6894_SSET;
         assign BU6894_SSET = n3450;
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
      BU6894(
         .D(BU6894_D),
         .Q(BU6894_Q),
         .CLK(BU6894_CLK),
         .SCLR(BU6894_SCLR),
         .SSET(BU6894_SSET)
      );

      wire [0 : 0] BU6987_D;
         assign BU6987_D[0] = n3426;
      wire [0 : 0] BU6987_Q;
         assign n2649 = BU6987_Q[0];
      wire BU6987_CLK;
         assign BU6987_CLK = n152;
      wire BU6987_SCLR;
         assign BU6987_SCLR = n3450;
      wire BU6987_SSET;
         assign BU6987_SSET = n3448;
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
      BU6987(
         .D(BU6987_D),
         .Q(BU6987_Q),
         .CLK(BU6987_CLK),
         .SCLR(BU6987_SCLR),
         .SSET(BU6987_SSET)
      );

      wire BU2173_D;
         assign BU2173_D = n2626;
      wire BU2173_C;
         assign BU2173_C = n152;
      wire BU2173_CE;
         assign BU2173_CE = 1'b1;
      wire BU2173_Q;
         assign n2650 = BU2173_Q;
      FDE       BU2173(
         .D(BU2173_D),
         .C(BU2173_C),
         .CE(BU2173_CE),
         .Q(BU2173_Q)
      );

      wire BU2175_D;
         assign BU2175_D = n2627;
      wire BU2175_C;
         assign BU2175_C = n152;
      wire BU2175_CE;
         assign BU2175_CE = 1'b1;
      wire BU2175_Q;
         assign n2651 = BU2175_Q;
      FDE       BU2175(
         .D(BU2175_D),
         .C(BU2175_C),
         .CE(BU2175_CE),
         .Q(BU2175_Q)
      );

      wire BU2177_D;
         assign BU2177_D = n2628;
      wire BU2177_C;
         assign BU2177_C = n152;
      wire BU2177_CE;
         assign BU2177_CE = 1'b1;
      wire BU2177_Q;
         assign n2652 = BU2177_Q;
      FDE       BU2177(
         .D(BU2177_D),
         .C(BU2177_C),
         .CE(BU2177_CE),
         .Q(BU2177_Q)
      );

      wire BU2179_D;
         assign BU2179_D = n2629;
      wire BU2179_C;
         assign BU2179_C = n152;
      wire BU2179_CE;
         assign BU2179_CE = 1'b1;
      wire BU2179_Q;
         assign n2653 = BU2179_Q;
      FDE       BU2179(
         .D(BU2179_D),
         .C(BU2179_C),
         .CE(BU2179_CE),
         .Q(BU2179_Q)
      );

      wire BU2181_D;
         assign BU2181_D = n2630;
      wire BU2181_C;
         assign BU2181_C = n152;
      wire BU2181_CE;
         assign BU2181_CE = 1'b1;
      wire BU2181_Q;
         assign n2654 = BU2181_Q;
      FDE       BU2181(
         .D(BU2181_D),
         .C(BU2181_C),
         .CE(BU2181_CE),
         .Q(BU2181_Q)
      );

      wire BU2183_D;
         assign BU2183_D = n2631;
      wire BU2183_C;
         assign BU2183_C = n152;
      wire BU2183_CE;
         assign BU2183_CE = 1'b1;
      wire BU2183_Q;
         assign n2655 = BU2183_Q;
      FDE       BU2183(
         .D(BU2183_D),
         .C(BU2183_C),
         .CE(BU2183_CE),
         .Q(BU2183_Q)
      );

      wire BU2185_D;
         assign BU2185_D = n2632;
      wire BU2185_C;
         assign BU2185_C = n152;
      wire BU2185_CE;
         assign BU2185_CE = 1'b1;
      wire BU2185_Q;
         assign n2656 = BU2185_Q;
      FDE       BU2185(
         .D(BU2185_D),
         .C(BU2185_C),
         .CE(BU2185_CE),
         .Q(BU2185_Q)
      );

      wire BU2187_D;
         assign BU2187_D = n2633;
      wire BU2187_C;
         assign BU2187_C = n152;
      wire BU2187_CE;
         assign BU2187_CE = 1'b1;
      wire BU2187_Q;
         assign n2657 = BU2187_Q;
      FDE       BU2187(
         .D(BU2187_D),
         .C(BU2187_C),
         .CE(BU2187_CE),
         .Q(BU2187_Q)
      );

      wire BU2189_D;
         assign BU2189_D = n2634;
      wire BU2189_C;
         assign BU2189_C = n152;
      wire BU2189_CE;
         assign BU2189_CE = 1'b1;
      wire BU2189_Q;
         assign n2658 = BU2189_Q;
      FDE       BU2189(
         .D(BU2189_D),
         .C(BU2189_C),
         .CE(BU2189_CE),
         .Q(BU2189_Q)
      );

      wire BU2191_D;
         assign BU2191_D = n2635;
      wire BU2191_C;
         assign BU2191_C = n152;
      wire BU2191_CE;
         assign BU2191_CE = 1'b1;
      wire BU2191_Q;
         assign n2659 = BU2191_Q;
      FDE       BU2191(
         .D(BU2191_D),
         .C(BU2191_C),
         .CE(BU2191_CE),
         .Q(BU2191_Q)
      );

      wire BU2193_D;
         assign BU2193_D = n2636;
      wire BU2193_C;
         assign BU2193_C = n152;
      wire BU2193_CE;
         assign BU2193_CE = 1'b1;
      wire BU2193_Q;
         assign n2660 = BU2193_Q;
      FDE       BU2193(
         .D(BU2193_D),
         .C(BU2193_C),
         .CE(BU2193_CE),
         .Q(BU2193_Q)
      );

      wire BU2195_D;
         assign BU2195_D = n2637;
      wire BU2195_C;
         assign BU2195_C = n152;
      wire BU2195_CE;
         assign BU2195_CE = 1'b1;
      wire BU2195_Q;
         assign n2661 = BU2195_Q;
      FDE       BU2195(
         .D(BU2195_D),
         .C(BU2195_C),
         .CE(BU2195_CE),
         .Q(BU2195_Q)
      );

      wire BU2197_D;
         assign BU2197_D = n2638;
      wire BU2197_C;
         assign BU2197_C = n152;
      wire BU2197_CE;
         assign BU2197_CE = 1'b1;
      wire BU2197_Q;
         assign n2662 = BU2197_Q;
      FDE       BU2197(
         .D(BU2197_D),
         .C(BU2197_C),
         .CE(BU2197_CE),
         .Q(BU2197_Q)
      );

      wire BU2199_D;
         assign BU2199_D = n2639;
      wire BU2199_C;
         assign BU2199_C = n152;
      wire BU2199_CE;
         assign BU2199_CE = 1'b1;
      wire BU2199_Q;
         assign n2663 = BU2199_Q;
      FDE       BU2199(
         .D(BU2199_D),
         .C(BU2199_C),
         .CE(BU2199_CE),
         .Q(BU2199_Q)
      );

      wire BU2201_D;
         assign BU2201_D = n2640;
      wire BU2201_C;
         assign BU2201_C = n152;
      wire BU2201_CE;
         assign BU2201_CE = 1'b1;
      wire BU2201_Q;
         assign n2664 = BU2201_Q;
      FDE       BU2201(
         .D(BU2201_D),
         .C(BU2201_C),
         .CE(BU2201_CE),
         .Q(BU2201_Q)
      );

      wire BU2203_D;
         assign BU2203_D = n2641;
      wire BU2203_C;
         assign BU2203_C = n152;
      wire BU2203_CE;
         assign BU2203_CE = 1'b1;
      wire BU2203_Q;
         assign n2665 = BU2203_Q;
      FDE       BU2203(
         .D(BU2203_D),
         .C(BU2203_C),
         .CE(BU2203_CE),
         .Q(BU2203_Q)
      );

      wire BU2205_D;
         assign BU2205_D = n2642;
      wire BU2205_C;
         assign BU2205_C = n152;
      wire BU2205_CE;
         assign BU2205_CE = 1'b1;
      wire BU2205_Q;
         assign n2666 = BU2205_Q;
      FDE       BU2205(
         .D(BU2205_D),
         .C(BU2205_C),
         .CE(BU2205_CE),
         .Q(BU2205_Q)
      );

      wire BU2207_D;
         assign BU2207_D = n2643;
      wire BU2207_C;
         assign BU2207_C = n152;
      wire BU2207_CE;
         assign BU2207_CE = 1'b1;
      wire BU2207_Q;
         assign n2667 = BU2207_Q;
      FDE       BU2207(
         .D(BU2207_D),
         .C(BU2207_C),
         .CE(BU2207_CE),
         .Q(BU2207_Q)
      );

      wire BU2209_D;
         assign BU2209_D = n2644;
      wire BU2209_C;
         assign BU2209_C = n152;
      wire BU2209_CE;
         assign BU2209_CE = 1'b1;
      wire BU2209_Q;
         assign n2668 = BU2209_Q;
      FDE       BU2209(
         .D(BU2209_D),
         .C(BU2209_C),
         .CE(BU2209_CE),
         .Q(BU2209_Q)
      );

      wire BU2211_D;
         assign BU2211_D = n2645;
      wire BU2211_C;
         assign BU2211_C = n152;
      wire BU2211_CE;
         assign BU2211_CE = 1'b1;
      wire BU2211_Q;
         assign n2669 = BU2211_Q;
      FDE       BU2211(
         .D(BU2211_D),
         .C(BU2211_C),
         .CE(BU2211_CE),
         .Q(BU2211_Q)
      );

      wire BU2213_D;
         assign BU2213_D = n2646;
      wire BU2213_C;
         assign BU2213_C = n152;
      wire BU2213_CE;
         assign BU2213_CE = 1'b1;
      wire BU2213_Q;
         assign n2670 = BU2213_Q;
      FDE       BU2213(
         .D(BU2213_D),
         .C(BU2213_C),
         .CE(BU2213_CE),
         .Q(BU2213_Q)
      );

      wire BU2215_D;
         assign BU2215_D = n2647;
      wire BU2215_C;
         assign BU2215_C = n152;
      wire BU2215_CE;
         assign BU2215_CE = 1'b1;
      wire BU2215_Q;
         assign n2671 = BU2215_Q;
      FDE       BU2215(
         .D(BU2215_D),
         .C(BU2215_C),
         .CE(BU2215_CE),
         .Q(BU2215_Q)
      );

      wire BU2217_D;
         assign BU2217_D = n2648;
      wire BU2217_C;
         assign BU2217_C = n152;
      wire BU2217_CE;
         assign BU2217_CE = 1'b1;
      wire BU2217_Q;
         assign n2672 = BU2217_Q;
      FDE       BU2217(
         .D(BU2217_D),
         .C(BU2217_C),
         .CE(BU2217_CE),
         .Q(BU2217_Q)
      );

      wire BU2219_D;
         assign BU2219_D = n2649;
      wire BU2219_C;
         assign BU2219_C = n152;
      wire BU2219_CE;
         assign BU2219_CE = 1'b1;
      wire BU2219_Q;
         assign n2673 = BU2219_Q;
      FDE       BU2219(
         .D(BU2219_D),
         .C(BU2219_C),
         .CE(BU2219_CE),
         .Q(BU2219_Q)
      );

      wire [23 : 0] BU2220_MA;
         assign BU2220_MA[0] = n2650;
         assign BU2220_MA[1] = n2651;
         assign BU2220_MA[2] = n2652;
         assign BU2220_MA[3] = n2653;
         assign BU2220_MA[4] = n2654;
         assign BU2220_MA[5] = n2655;
         assign BU2220_MA[6] = n2656;
         assign BU2220_MA[7] = n2657;
         assign BU2220_MA[8] = n2658;
         assign BU2220_MA[9] = n2659;
         assign BU2220_MA[10] = n2660;
         assign BU2220_MA[11] = n2661;
         assign BU2220_MA[12] = n2662;
         assign BU2220_MA[13] = n2663;
         assign BU2220_MA[14] = n2664;
         assign BU2220_MA[15] = n2665;
         assign BU2220_MA[16] = n2666;
         assign BU2220_MA[17] = n2667;
         assign BU2220_MA[18] = n2668;
         assign BU2220_MA[19] = n2669;
         assign BU2220_MA[20] = n2670;
         assign BU2220_MA[21] = n2671;
         assign BU2220_MA[22] = n2672;
         assign BU2220_MA[23] = n2673;
      wire [23 : 0] BU2220_MB;
         assign BU2220_MB[0] = n2602;
         assign BU2220_MB[1] = n2603;
         assign BU2220_MB[2] = n2604;
         assign BU2220_MB[3] = n2605;
         assign BU2220_MB[4] = n2606;
         assign BU2220_MB[5] = n2607;
         assign BU2220_MB[6] = n2608;
         assign BU2220_MB[7] = n2609;
         assign BU2220_MB[8] = n2610;
         assign BU2220_MB[9] = n2611;
         assign BU2220_MB[10] = n2612;
         assign BU2220_MB[11] = n2613;
         assign BU2220_MB[12] = n2614;
         assign BU2220_MB[13] = n2615;
         assign BU2220_MB[14] = n2616;
         assign BU2220_MB[15] = n2617;
         assign BU2220_MB[16] = n2618;
         assign BU2220_MB[17] = n2619;
         assign BU2220_MB[18] = n2620;
         assign BU2220_MB[19] = n2621;
         assign BU2220_MB[20] = n2622;
         assign BU2220_MB[21] = n2623;
         assign BU2220_MB[22] = n2624;
         assign BU2220_MB[23] = n2625;
      wire [0 : 0] BU2220_S;
         assign BU2220_S[0] = n2674;
      wire [23 : 0] BU2220_Q;
         assign n56 = BU2220_Q[0];
         assign n57 = BU2220_Q[1];
         assign n58 = BU2220_Q[2];
         assign n59 = BU2220_Q[3];
         assign n60 = BU2220_Q[4];
         assign n61 = BU2220_Q[5];
         assign n62 = BU2220_Q[6];
         assign n63 = BU2220_Q[7];
         assign n64 = BU2220_Q[8];
         assign n65 = BU2220_Q[9];
         assign n66 = BU2220_Q[10];
         assign n67 = BU2220_Q[11];
         assign n68 = BU2220_Q[12];
         assign n69 = BU2220_Q[13];
         assign n70 = BU2220_Q[14];
         assign n71 = BU2220_Q[15];
         assign n72 = BU2220_Q[16];
         assign n73 = BU2220_Q[17];
         assign n74 = BU2220_Q[18];
         assign n75 = BU2220_Q[19];
         assign n76 = BU2220_Q[20];
         assign n77 = BU2220_Q[21];
         assign n78 = BU2220_Q[22];
         assign n79 = BU2220_Q[23];
      wire BU2220_CLK;
         assign BU2220_CLK = n152;
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
         assign BU2448_D = n2674;
      wire BU2448_C;
         assign BU2448_C = n152;
      wire BU2448_CE;
         assign BU2448_CE = 1'b1;
      wire BU2448_Q;
         assign n2675 = BU2448_Q;
      FDE       BU2448(
         .D(BU2448_D),
         .C(BU2448_C),
         .CE(BU2448_CE),
         .Q(BU2448_Q)
      );

      defparam BU2452.INIT = 'heeee;
      wire BU2452_I0;
         assign BU2452_I0 = n2674;
      wire BU2452_I1;
         assign BU2452_I1 = n2675;
      wire BU2452_I2;
         assign BU2452_I2 = 1'b0;
      wire BU2452_I3;
         assign BU2452_I3 = 1'b0;
      wire BU2452_O;
         assign n4288 = BU2452_O;
      LUT4       BU2452(
         .I0(BU2452_I0),
         .I1(BU2452_I1),
         .I2(BU2452_I2),
         .I3(BU2452_I3),
         .O(BU2452_O)
      );

      wire BU2453_D;
         assign BU2453_D = n4288;
      wire BU2453_C;
         assign BU2453_C = n152;
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

      wire [23 : 0] BU2682_DIN;
         assign BU2682_DIN[0] = n3;
         assign BU2682_DIN[1] = n4;
         assign BU2682_DIN[2] = n5;
         assign BU2682_DIN[3] = n6;
         assign BU2682_DIN[4] = n7;
         assign BU2682_DIN[5] = n8;
         assign BU2682_DIN[6] = n9;
         assign BU2682_DIN[7] = n10;
         assign BU2682_DIN[8] = n11;
         assign BU2682_DIN[9] = n12;
         assign BU2682_DIN[10] = n13;
         assign BU2682_DIN[11] = n14;
         assign BU2682_DIN[12] = n15;
         assign BU2682_DIN[13] = n16;
         assign BU2682_DIN[14] = n17;
         assign BU2682_DIN[15] = n18;
         assign BU2682_DIN[16] = n19;
         assign BU2682_DIN[17] = n20;
         assign BU2682_DIN[18] = n21;
         assign BU2682_DIN[19] = n22;
         assign BU2682_DIN[20] = n23;
         assign BU2682_DIN[21] = n24;
         assign BU2682_DIN[22] = n25;
         assign BU2682_DIN[23] = n26;
      wire BU2682_ND;
         assign BU2682_ND = n2;
      wire BU2682_RFD;
      wire BU2682_CLK;
         assign BU2682_CLK = n152;
      wire [39 : 0] BU2682_DOUT;
         assign n2676 = BU2682_DOUT[0];
         assign n2677 = BU2682_DOUT[1];
         assign n2678 = BU2682_DOUT[2];
         assign n2679 = BU2682_DOUT[3];
         assign n2680 = BU2682_DOUT[4];
         assign n2681 = BU2682_DOUT[5];
         assign n2682 = BU2682_DOUT[6];
         assign n2683 = BU2682_DOUT[7];
         assign n2684 = BU2682_DOUT[8];
         assign n2685 = BU2682_DOUT[9];
         assign n2686 = BU2682_DOUT[10];
         assign n2687 = BU2682_DOUT[11];
         assign n2688 = BU2682_DOUT[12];
         assign n2689 = BU2682_DOUT[13];
         assign n2690 = BU2682_DOUT[14];
         assign n2691 = BU2682_DOUT[15];
         assign n2692 = BU2682_DOUT[16];
         assign n2693 = BU2682_DOUT[17];
         assign n2694 = BU2682_DOUT[18];
         assign n2695 = BU2682_DOUT[19];
         assign n2696 = BU2682_DOUT[20];
         assign n2697 = BU2682_DOUT[21];
         assign n2698 = BU2682_DOUT[22];
         assign n2699 = BU2682_DOUT[23];
         assign n2700 = BU2682_DOUT[24];
         assign n2701 = BU2682_DOUT[25];
         assign n2702 = BU2682_DOUT[26];
         assign n2703 = BU2682_DOUT[27];
         assign n2704 = BU2682_DOUT[28];
         assign n2705 = BU2682_DOUT[29];
         assign n2706 = BU2682_DOUT[30];
         assign n2707 = BU2682_DOUT[31];
         assign n2708 = BU2682_DOUT[32];
         assign n2709 = BU2682_DOUT[33];
         assign n2710 = BU2682_DOUT[34];
         assign n2711 = BU2682_DOUT[35];
         assign n2712 = BU2682_DOUT[36];
         assign n2713 = BU2682_DOUT[37];
         assign n2714 = BU2682_DOUT[38];
         assign n2715 = BU2682_DOUT[39];
      wire BU2682_RDY;
         assign n2716 = BU2682_RDY;
      C_CIC_V3_0 #(
         24    /* c_data_width*/,
         1    /* c_differential_delay*/,
         0    /* c_enable_rlocs*/,
         2    /* c_filter_type*/,
         1    /* c_latency*/,
         1    /* c_number_channels*/,
         40    /* c_result_width*/,
         5    /* c_sample_rate_change*/,
         16383    /* c_sample_rate_change_max*/,
         4    /* c_sample_rate_change_min*/,
         2    /* c_sample_rate_change_type*/,
         7    /* c_stages*/
      )
      BU2682(
         .DIN(BU2682_DIN),
         .ND(BU2682_ND),
         .RFD(BU2682_RFD),
         .CLK(BU2682_CLK),
         .DOUT(BU2682_DOUT),
         .RDY(BU2682_RDY)
      );

      wire [23 : 0] BU6992_DIN;
         assign BU6992_DIN[0] = n27;
         assign BU6992_DIN[1] = n28;
         assign BU6992_DIN[2] = n29;
         assign BU6992_DIN[3] = n30;
         assign BU6992_DIN[4] = n31;
         assign BU6992_DIN[5] = n32;
         assign BU6992_DIN[6] = n33;
         assign BU6992_DIN[7] = n34;
         assign BU6992_DIN[8] = n35;
         assign BU6992_DIN[9] = n36;
         assign BU6992_DIN[10] = n37;
         assign BU6992_DIN[11] = n38;
         assign BU6992_DIN[12] = n39;
         assign BU6992_DIN[13] = n40;
         assign BU6992_DIN[14] = n41;
         assign BU6992_DIN[15] = n42;
         assign BU6992_DIN[16] = n43;
         assign BU6992_DIN[17] = n44;
         assign BU6992_DIN[18] = n45;
         assign BU6992_DIN[19] = n46;
         assign BU6992_DIN[20] = n47;
         assign BU6992_DIN[21] = n48;
         assign BU6992_DIN[22] = n49;
         assign BU6992_DIN[23] = n50;
      wire BU6992_ND;
         assign BU6992_ND = n2;
      wire BU6992_RFD;
      wire BU6992_CLK;
         assign BU6992_CLK = n152;
      wire [39 : 0] BU6992_DOUT;
         assign n2717 = BU6992_DOUT[0];
         assign n2718 = BU6992_DOUT[1];
         assign n2719 = BU6992_DOUT[2];
         assign n2720 = BU6992_DOUT[3];
         assign n2721 = BU6992_DOUT[4];
         assign n2722 = BU6992_DOUT[5];
         assign n2723 = BU6992_DOUT[6];
         assign n2724 = BU6992_DOUT[7];
         assign n2725 = BU6992_DOUT[8];
         assign n2726 = BU6992_DOUT[9];
         assign n2727 = BU6992_DOUT[10];
         assign n2728 = BU6992_DOUT[11];
         assign n2729 = BU6992_DOUT[12];
         assign n2730 = BU6992_DOUT[13];
         assign n2731 = BU6992_DOUT[14];
         assign n2732 = BU6992_DOUT[15];
         assign n2733 = BU6992_DOUT[16];
         assign n2734 = BU6992_DOUT[17];
         assign n2735 = BU6992_DOUT[18];
         assign n2736 = BU6992_DOUT[19];
         assign n2737 = BU6992_DOUT[20];
         assign n2738 = BU6992_DOUT[21];
         assign n2739 = BU6992_DOUT[22];
         assign n2740 = BU6992_DOUT[23];
         assign n2741 = BU6992_DOUT[24];
         assign n2742 = BU6992_DOUT[25];
         assign n2743 = BU6992_DOUT[26];
         assign n2744 = BU6992_DOUT[27];
         assign n2745 = BU6992_DOUT[28];
         assign n2746 = BU6992_DOUT[29];
         assign n2747 = BU6992_DOUT[30];
         assign n2748 = BU6992_DOUT[31];
         assign n2749 = BU6992_DOUT[32];
         assign n2750 = BU6992_DOUT[33];
         assign n2751 = BU6992_DOUT[34];
         assign n2752 = BU6992_DOUT[35];
         assign n2753 = BU6992_DOUT[36];
         assign n2754 = BU6992_DOUT[37];
         assign n2755 = BU6992_DOUT[38];
         assign n2756 = BU6992_DOUT[39];
      wire BU6992_RDY;
      C_CIC_V3_0 #(
         24    /* c_data_width*/,
         1    /* c_differential_delay*/,
         0    /* c_enable_rlocs*/,
         2    /* c_filter_type*/,
         1    /* c_latency*/,
         1    /* c_number_channels*/,
         40    /* c_result_width*/,
         5    /* c_sample_rate_change*/,
         16383    /* c_sample_rate_change_max*/,
         4    /* c_sample_rate_change_min*/,
         2    /* c_sample_rate_change_type*/,
         7    /* c_stages*/
      )
      BU6992(
         .DIN(BU6992_DIN),
         .ND(BU6992_ND),
         .RFD(BU6992_RFD),
         .CLK(BU6992_CLK),
         .DOUT(BU6992_DOUT),
         .RDY(BU6992_RDY)
      );

      wire BU11080_ND;
         assign BU11080_ND = n55;
      wire BU11080_RDY;
         assign n6252 = BU11080_RDY;
      wire BU11080_CLK;
         assign BU11080_CLK = n152;
      wire BU11080_RFD;
      wire [23 : 0] BU11080_DIN;
         assign BU11080_DIN[0] = n56;
         assign BU11080_DIN[1] = n57;
         assign BU11080_DIN[2] = n58;
         assign BU11080_DIN[3] = n59;
         assign BU11080_DIN[4] = n60;
         assign BU11080_DIN[5] = n61;
         assign BU11080_DIN[6] = n62;
         assign BU11080_DIN[7] = n63;
         assign BU11080_DIN[8] = n64;
         assign BU11080_DIN[9] = n65;
         assign BU11080_DIN[10] = n66;
         assign BU11080_DIN[11] = n67;
         assign BU11080_DIN[12] = n68;
         assign BU11080_DIN[13] = n69;
         assign BU11080_DIN[14] = n70;
         assign BU11080_DIN[15] = n71;
         assign BU11080_DIN[16] = n72;
         assign BU11080_DIN[17] = n73;
         assign BU11080_DIN[18] = n74;
         assign BU11080_DIN[19] = n75;
         assign BU11080_DIN[20] = n76;
         assign BU11080_DIN[21] = n77;
         assign BU11080_DIN[22] = n78;
         assign BU11080_DIN[23] = n79;
      wire [41 : 0] BU11080_DOUT;
         assign n6210 = BU11080_DOUT[0];
         assign n6211 = BU11080_DOUT[1];
         assign n6212 = BU11080_DOUT[2];
         assign n6213 = BU11080_DOUT[3];
         assign n6214 = BU11080_DOUT[4];
         assign n6215 = BU11080_DOUT[5];
         assign n6216 = BU11080_DOUT[6];
         assign n6217 = BU11080_DOUT[7];
         assign n6218 = BU11080_DOUT[8];
         assign n6219 = BU11080_DOUT[9];
         assign n6220 = BU11080_DOUT[10];
         assign n6221 = BU11080_DOUT[11];
         assign n6222 = BU11080_DOUT[12];
         assign n6223 = BU11080_DOUT[13];
         assign n6224 = BU11080_DOUT[14];
         assign n6225 = BU11080_DOUT[15];
         assign n6226 = BU11080_DOUT[16];
         assign n6227 = BU11080_DOUT[17];
         assign n6228 = BU11080_DOUT[18];
         assign n6229 = BU11080_DOUT[19];
         assign n6230 = BU11080_DOUT[20];
         assign n6231 = BU11080_DOUT[21];
         assign n6232 = BU11080_DOUT[22];
         assign n6233 = BU11080_DOUT[23];
         assign n6234 = BU11080_DOUT[24];
         assign n6235 = BU11080_DOUT[25];
         assign n6236 = BU11080_DOUT[26];
         assign n6237 = BU11080_DOUT[27];
         assign n6238 = BU11080_DOUT[28];
         assign n6239 = BU11080_DOUT[29];
         assign n6240 = BU11080_DOUT[30];
         assign n6241 = BU11080_DOUT[31];
         assign n6242 = BU11080_DOUT[32];
         assign n6243 = BU11080_DOUT[33];
         assign n6244 = BU11080_DOUT[34];
         assign n6245 = BU11080_DOUT[35];
         assign n6246 = BU11080_DOUT[36];
         assign n6247 = BU11080_DOUT[37];
         assign n6248 = BU11080_DOUT[38];
         assign n6249 = BU11080_DOUT[39];
         assign n6250 = BU11080_DOUT[40];
         assign n6251 = BU11080_DOUT[41];
      C_DA_FIR_V7_0 #(
         7    /* c_baat*/,
         2    /* c_channels*/,
         0    /* c_coeff_type*/,
         16    /* c_coeff_width*/,
         0    /* c_data_type*/,
         24    /* c_data_width*/,
         0    /* c_enable_rlocs*/,
         2    /* c_filter_type*/,
         0    /* c_has_reset*/,
         0    /* c_has_sel_i*/,
         0    /* c_has_sel_o*/,
         0    /* c_has_sin_f*/,
         0    /* c_has_sin_r*/,
         0    /* c_has_sout_f*/,
         0    /* c_has_sout_r*/,
         15    /* c_latency*/,
         "ddcv1_0_CFIR.mif"    /* c_mem_init_file*/,
         1    /* c_optimize*/,
         2    /* c_polyphase_factor*/,
         0    /* c_reg_output*/,
         0    /* c_reload*/,
         401    /* c_reload_delay*/,
         2    /* c_reload_mem_type*/,
         0    /* c_response*/,
         42    /* c_result_width*/,
         0    /* c_saturate*/,
         0    /* c_shape*/,
         46    /* c_taps*/,
         0    /* c_use_model_func*/,
         1    /* c_zpf*/
      )
      BU11080(
         .ND(BU11080_ND),
         .RDY(BU11080_RDY),
         .CLK(BU11080_CLK),
         .RFD(BU11080_RFD),
         .DIN(BU11080_DIN),
         .DOUT(BU11080_DOUT)
      );

      wire [25 : 0] BU20456_I;
         assign BU20456_I[0] = n6210;
         assign BU20456_I[1] = n6211;
         assign BU20456_I[2] = n6212;
         assign BU20456_I[3] = n6213;
         assign BU20456_I[4] = n6214;
         assign BU20456_I[5] = n6215;
         assign BU20456_I[6] = n6216;
         assign BU20456_I[7] = n6217;
         assign BU20456_I[8] = n6218;
         assign BU20456_I[9] = n6219;
         assign BU20456_I[10] = n6220;
         assign BU20456_I[11] = n6221;
         assign BU20456_I[12] = n6222;
         assign BU20456_I[13] = n6223;
         assign BU20456_I[14] = n6224;
         assign BU20456_I[15] = n6225;
         assign BU20456_I[16] = n6226;
         assign BU20456_I[17] = n6227;
         assign BU20456_I[18] = n6228;
         assign BU20456_I[19] = n6229;
         assign BU20456_I[20] = n6230;
         assign BU20456_I[21] = n6231;
         assign BU20456_I[22] = n6232;
         assign BU20456_I[23] = n6233;
         assign BU20456_I[24] = n6234;
         assign BU20456_I[25] = n6235;
      wire BU20456_O;
         assign n6405 = BU20456_O;
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
         26    /* c_inputs*/,
         "01111111111111111111111111"    /* c_input_inv_mask*/,
         0    /* c_pipe_stages*/,
         "0"    /* c_sinit_val*/,
         0    /* c_sync_enable*/,
         1    /* c_sync_priority*/
      )
      BU20456(
         .I(BU20456_I),
         .O(BU20456_O)
      );

      defparam BU20487.INIT = 'h8c8c;
      wire BU20487_I0;
         assign BU20487_I0 = n6236;
      wire BU20487_I1;
         assign BU20487_I1 = n6235;
      wire BU20487_I2;
         assign BU20487_I2 = n6405;
      wire BU20487_I3;
         assign BU20487_I3 = 1'b0;
      wire BU20487_O;
         assign n6402 = BU20487_O;
      LUT4       BU20487(
         .I0(BU20487_I0),
         .I1(BU20487_I1),
         .I2(BU20487_I2),
         .I3(BU20487_I3),
         .O(BU20487_O)
      );

      wire [15 : 0] BU20488_A;
         assign BU20488_A[0] = n6236;
         assign BU20488_A[1] = n6237;
         assign BU20488_A[2] = n6238;
         assign BU20488_A[3] = n6239;
         assign BU20488_A[4] = n6240;
         assign BU20488_A[5] = n6241;
         assign BU20488_A[6] = n6242;
         assign BU20488_A[7] = n6243;
         assign BU20488_A[8] = n6244;
         assign BU20488_A[9] = n6245;
         assign BU20488_A[10] = n6246;
         assign BU20488_A[11] = n6247;
         assign BU20488_A[12] = n6248;
         assign BU20488_A[13] = n6249;
         assign BU20488_A[14] = n6250;
         assign BU20488_A[15] = n6251;
      wire [0 : 0] BU20488_B;
         assign BU20488_B[0] = n6402;
      wire [16 : 0] BU20488_S;
         assign n6385 = BU20488_S[0];
         assign n6386 = BU20488_S[1];
         assign n6387 = BU20488_S[2];
         assign n6388 = BU20488_S[3];
         assign n6389 = BU20488_S[4];
         assign n6390 = BU20488_S[5];
         assign n6391 = BU20488_S[6];
         assign n6392 = BU20488_S[7];
         assign n6393 = BU20488_S[8];
         assign n6394 = BU20488_S[9];
         assign n6395 = BU20488_S[10];
         assign n6396 = BU20488_S[11];
         assign n6397 = BU20488_S[12];
         assign n6398 = BU20488_S[13];
         assign n6399 = BU20488_S[14];
         assign n6400 = BU20488_S[15];
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
      BU20488(
         .A(BU20488_A),
         .B(BU20488_B),
         .S(BU20488_S)
      );

      defparam BU20557.INIT = 'h0202;
      wire BU20557_I0;
         assign BU20557_I0 = n6251;
      wire BU20557_I1;
         assign BU20557_I1 = n6250;
      wire BU20557_I2;
         assign BU20557_I2 = n6400;
      wire BU20557_I3;
         assign BU20557_I3 = 1'b0;
      wire BU20557_O;
         assign n6432 = BU20557_O;
      LUT4       BU20557(
         .I0(BU20557_I0),
         .I1(BU20557_I1),
         .I2(BU20557_I2),
         .I3(BU20557_I3),
         .O(BU20557_O)
      );

      defparam BU20559.INIT = 'h4444;
      wire BU20559_I0;
         assign BU20559_I0 = n6251;
      wire BU20559_I1;
         assign BU20559_I1 = n6400;
      wire BU20559_I2;
         assign BU20559_I2 = 1'b0;
      wire BU20559_I3;
         assign BU20559_I3 = 1'b0;
      wire BU20559_O;
         assign n6434 = BU20559_O;
      LUT4       BU20559(
         .I0(BU20559_I0),
         .I1(BU20559_I1),
         .I2(BU20559_I2),
         .I3(BU20559_I3),
         .O(BU20559_O)
      );

      wire [14 : 0] BU20560_D;
         assign BU20560_D[0] = n6385;
         assign BU20560_D[1] = n6386;
         assign BU20560_D[2] = n6387;
         assign BU20560_D[3] = n6388;
         assign BU20560_D[4] = n6389;
         assign BU20560_D[5] = n6390;
         assign BU20560_D[6] = n6391;
         assign BU20560_D[7] = n6392;
         assign BU20560_D[8] = n6393;
         assign BU20560_D[9] = n6394;
         assign BU20560_D[10] = n6395;
         assign BU20560_D[11] = n6396;
         assign BU20560_D[12] = n6397;
         assign BU20560_D[13] = n6398;
         assign BU20560_D[14] = n6399;
      wire [14 : 0] BU20560_Q;
         assign n80 = BU20560_Q[0];
         assign n81 = BU20560_Q[1];
         assign n82 = BU20560_Q[2];
         assign n83 = BU20560_Q[3];
         assign n84 = BU20560_Q[4];
         assign n85 = BU20560_Q[5];
         assign n86 = BU20560_Q[6];
         assign n87 = BU20560_Q[7];
         assign n88 = BU20560_Q[8];
         assign n89 = BU20560_Q[9];
         assign n90 = BU20560_Q[10];
         assign n91 = BU20560_Q[11];
         assign n92 = BU20560_Q[12];
         assign n93 = BU20560_Q[13];
         assign n94 = BU20560_Q[14];
      wire BU20560_CLK;
         assign BU20560_CLK = n152;
      wire BU20560_SCLR;
         assign BU20560_SCLR = n6432;
      wire BU20560_SSET;
         assign BU20560_SSET = n6434;
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
      BU20560(
         .D(BU20560_D),
         .Q(BU20560_Q),
         .CLK(BU20560_CLK),
         .SCLR(BU20560_SCLR),
         .SSET(BU20560_SSET)
      );

      wire [0 : 0] BU20621_D;
         assign BU20621_D[0] = n6400;
      wire [0 : 0] BU20621_Q;
         assign n95 = BU20621_Q[0];
      wire BU20621_CLK;
         assign BU20621_CLK = n152;
      wire BU20621_SCLR;
         assign BU20621_SCLR = n6434;
      wire BU20621_SSET;
         assign BU20621_SSET = n6432;
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
      BU20621(
         .D(BU20621_D),
         .Q(BU20621_Q),
         .CLK(BU20621_CLK),
         .SCLR(BU20621_SCLR),
         .SSET(BU20621_SSET)
      );

      wire BU20628_D;
         assign BU20628_D = n6252;
      wire BU20628_C;
         assign BU20628_C = n152;
      wire BU20628_CE;
         assign BU20628_CE = 1'b1;
      wire BU20628_Q;
         assign n96 = BU20628_Q;
      FDE       BU20628(
         .D(BU20628_D),
         .C(BU20628_C),
         .CE(BU20628_CE),
         .Q(BU20628_Q)
      );

      wire BU20631_ND;
         assign BU20631_ND = n96;
      wire BU20631_RDY;
         assign n131 = BU20631_RDY;
      wire BU20631_CLK;
         assign BU20631_CLK = n152;
      wire BU20631_RFD;
      wire [15 : 0] BU20631_DIN;
         assign BU20631_DIN[0] = n80;
         assign BU20631_DIN[1] = n81;
         assign BU20631_DIN[2] = n82;
         assign BU20631_DIN[3] = n83;
         assign BU20631_DIN[4] = n84;
         assign BU20631_DIN[5] = n85;
         assign BU20631_DIN[6] = n86;
         assign BU20631_DIN[7] = n87;
         assign BU20631_DIN[8] = n88;
         assign BU20631_DIN[9] = n89;
         assign BU20631_DIN[10] = n90;
         assign BU20631_DIN[11] = n91;
         assign BU20631_DIN[12] = n92;
         assign BU20631_DIN[13] = n93;
         assign BU20631_DIN[14] = n94;
         assign BU20631_DIN[15] = n95;
      wire [0 : 0] BU20631_SEL_O;
         assign n132 = BU20631_SEL_O[0];
      wire [33 : 0] BU20631_DOUT;
         assign n97 = BU20631_DOUT[0];
         assign n98 = BU20631_DOUT[1];
         assign n99 = BU20631_DOUT[2];
         assign n100 = BU20631_DOUT[3];
         assign n101 = BU20631_DOUT[4];
         assign n102 = BU20631_DOUT[5];
         assign n103 = BU20631_DOUT[6];
         assign n104 = BU20631_DOUT[7];
         assign n105 = BU20631_DOUT[8];
         assign n106 = BU20631_DOUT[9];
         assign n107 = BU20631_DOUT[10];
         assign n108 = BU20631_DOUT[11];
         assign n109 = BU20631_DOUT[12];
         assign n110 = BU20631_DOUT[13];
         assign n111 = BU20631_DOUT[14];
         assign n112 = BU20631_DOUT[15];
         assign n113 = BU20631_DOUT[16];
         assign n114 = BU20631_DOUT[17];
         assign n115 = BU20631_DOUT[18];
         assign n116 = BU20631_DOUT[19];
         assign n117 = BU20631_DOUT[20];
         assign n118 = BU20631_DOUT[21];
         assign n119 = BU20631_DOUT[22];
         assign n120 = BU20631_DOUT[23];
         assign n121 = BU20631_DOUT[24];
         assign n122 = BU20631_DOUT[25];
         assign n123 = BU20631_DOUT[26];
         assign n124 = BU20631_DOUT[27];
         assign n125 = BU20631_DOUT[28];
         assign n126 = BU20631_DOUT[29];
         assign n127 = BU20631_DOUT[30];
         assign n128 = BU20631_DOUT[31];
         assign n129 = BU20631_DOUT[32];
         assign n130 = BU20631_DOUT[33];
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
         "ddcv1_0_PFIR.mif"    /* c_mem_init_file*/,
         1    /* c_optimize*/,
         5    /* c_polyphase_factor*/,
         0    /* c_reg_output*/,
         0    /* c_reload*/,
         657    /* c_reload_delay*/,
         2    /* c_reload_mem_type*/,
         0    /* c_response*/,
         34    /* c_result_width*/,
         0    /* c_saturate*/,
         0    /* c_shape*/,
         66    /* c_taps*/,
         0    /* c_use_model_func*/,
         1    /* c_zpf*/
      )
      BU20631(
         .ND(BU20631_ND),
         .RDY(BU20631_RDY),
         .CLK(BU20631_CLK),
         .RFD(BU20631_RFD),
         .DIN(BU20631_DIN),
         .SEL_O(BU20631_SEL_O),
         .DOUT(BU20631_DOUT)
      );

      defparam BU24197.INIT = 'h2222;
      wire BU24197_I0;
         assign BU24197_I0 = n131;
      wire BU24197_I1;
         assign BU24197_I1 = n132;
      wire BU24197_I2;
         assign BU24197_I2 = 1'b0;
      wire BU24197_I3;
         assign BU24197_I3 = 1'b0;
      wire BU24197_O;
         assign n133 = BU24197_O;
      LUT4       BU24197(
         .I0(BU24197_I0),
         .I1(BU24197_I1),
         .I2(BU24197_I2),
         .I3(BU24197_I3),
         .O(BU24197_O)
      );

      defparam BU24199.INIT = 'h8888;
      wire BU24199_I0;
         assign BU24199_I0 = n131;
      wire BU24199_I1;
         assign BU24199_I1 = n132;
      wire BU24199_I2;
         assign BU24199_I2 = 1'b0;
      wire BU24199_I3;
         assign BU24199_I3 = 1'b0;
      wire BU24199_O;
         assign n134 = BU24199_O;
      LUT4       BU24199(
         .I0(BU24199_I0),
         .I1(BU24199_I1),
         .I2(BU24199_I2),
         .I3(BU24199_I3),
         .O(BU24199_O)
      );

      wire BU24202_D;
         assign BU24202_D = n134;
      wire BU24202_C;
         assign BU24202_C = n152;
      wire BU24202_CE;
         assign BU24202_CE = 1'b1;
      wire BU24202_Q;
         assign n150 = BU24202_Q;
      FDE       BU24202(
         .D(BU24202_D),
         .C(BU24202_C),
         .CE(BU24202_CE),
         .Q(BU24202_Q)
      );

      wire [3 : 0] BU24207_I;
         assign BU24207_I[0] = n97;
         assign BU24207_I[1] = n98;
         assign BU24207_I[2] = n99;
         assign BU24207_I[3] = n100;
      wire BU24207_O;
         assign n6970 = BU24207_O;
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
         4    /* c_inputs*/,
         "0111"    /* c_input_inv_mask*/,
         0    /* c_pipe_stages*/,
         "0"    /* c_sinit_val*/,
         0    /* c_sync_enable*/,
         1    /* c_sync_priority*/
      )
      BU24207(
         .I(BU24207_I),
         .O(BU24207_O)
      );

      defparam BU24213.INIT = 'h8c8c;
      wire BU24213_I0;
         assign BU24213_I0 = n101;
      wire BU24213_I1;
         assign BU24213_I1 = n100;
      wire BU24213_I2;
         assign BU24213_I2 = n6970;
      wire BU24213_I3;
         assign BU24213_I3 = 1'b0;
      wire BU24213_O;
         assign n6967 = BU24213_O;
      LUT4       BU24213(
         .I0(BU24213_I0),
         .I1(BU24213_I1),
         .I2(BU24213_I2),
         .I3(BU24213_I3),
         .O(BU24213_O)
      );

      wire [29 : 0] BU24214_A;
         assign BU24214_A[0] = n101;
         assign BU24214_A[1] = n102;
         assign BU24214_A[2] = n103;
         assign BU24214_A[3] = n104;
         assign BU24214_A[4] = n105;
         assign BU24214_A[5] = n106;
         assign BU24214_A[6] = n107;
         assign BU24214_A[7] = n108;
         assign BU24214_A[8] = n109;
         assign BU24214_A[9] = n110;
         assign BU24214_A[10] = n111;
         assign BU24214_A[11] = n112;
         assign BU24214_A[12] = n113;
         assign BU24214_A[13] = n114;
         assign BU24214_A[14] = n115;
         assign BU24214_A[15] = n116;
         assign BU24214_A[16] = n117;
         assign BU24214_A[17] = n118;
         assign BU24214_A[18] = n119;
         assign BU24214_A[19] = n120;
         assign BU24214_A[20] = n121;
         assign BU24214_A[21] = n122;
         assign BU24214_A[22] = n123;
         assign BU24214_A[23] = n124;
         assign BU24214_A[24] = n125;
         assign BU24214_A[25] = n126;
         assign BU24214_A[26] = n127;
         assign BU24214_A[27] = n128;
         assign BU24214_A[28] = n129;
         assign BU24214_A[29] = n130;
      wire [0 : 0] BU24214_B;
         assign BU24214_B[0] = n6967;
      wire [30 : 0] BU24214_S;
         assign n6936 = BU24214_S[0];
         assign n6937 = BU24214_S[1];
         assign n6938 = BU24214_S[2];
         assign n6939 = BU24214_S[3];
         assign n6940 = BU24214_S[4];
         assign n6941 = BU24214_S[5];
         assign n6942 = BU24214_S[6];
         assign n6943 = BU24214_S[7];
         assign n6944 = BU24214_S[8];
         assign n6945 = BU24214_S[9];
         assign n6946 = BU24214_S[10];
         assign n6947 = BU24214_S[11];
         assign n6948 = BU24214_S[12];
         assign n6949 = BU24214_S[13];
         assign n6950 = BU24214_S[14];
         assign n6951 = BU24214_S[15];
         assign n6952 = BU24214_S[16];
         assign n6953 = BU24214_S[17];
         assign n6954 = BU24214_S[18];
         assign n6955 = BU24214_S[19];
         assign n6956 = BU24214_S[20];
         assign n6957 = BU24214_S[21];
         assign n6958 = BU24214_S[22];
         assign n6959 = BU24214_S[23];
         assign n6960 = BU24214_S[24];
         assign n6961 = BU24214_S[25];
         assign n6962 = BU24214_S[26];
         assign n6963 = BU24214_S[27];
         assign n6964 = BU24214_S[28];
         assign n6965 = BU24214_S[29];
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
      BU24214(
         .A(BU24214_A),
         .B(BU24214_B),
         .S(BU24214_S)
      );

      defparam BU24339.INIT = 'h0200;
      wire BU24339_I0;
         assign BU24339_I0 = n130;
      wire BU24339_I1;
         assign BU24339_I1 = n129;
      wire BU24339_I2;
         assign BU24339_I2 = n6965;
      wire BU24339_I3;
         assign BU24339_I3 = n133;
      wire BU24339_O;
         assign n6975 = BU24339_O;
      LUT4       BU24339(
         .I0(BU24339_I0),
         .I1(BU24339_I1),
         .I2(BU24339_I2),
         .I3(BU24339_I3),
         .O(BU24339_O)
      );

      defparam BU24341.INIT = 'h4040;
      wire BU24341_I0;
         assign BU24341_I0 = n130;
      wire BU24341_I1;
         assign BU24341_I1 = n6965;
      wire BU24341_I2;
         assign BU24341_I2 = n133;
      wire BU24341_I3;
         assign BU24341_I3 = 1'b0;
      wire BU24341_O;
         assign n6977 = BU24341_O;
      LUT4       BU24341(
         .I0(BU24341_I0),
         .I1(BU24341_I1),
         .I2(BU24341_I2),
         .I3(BU24341_I3),
         .O(BU24341_O)
      );

      wire [28 : 0] BU24342_D;
         assign BU24342_D[0] = n6936;
         assign BU24342_D[1] = n6937;
         assign BU24342_D[2] = n6938;
         assign BU24342_D[3] = n6939;
         assign BU24342_D[4] = n6940;
         assign BU24342_D[5] = n6941;
         assign BU24342_D[6] = n6942;
         assign BU24342_D[7] = n6943;
         assign BU24342_D[8] = n6944;
         assign BU24342_D[9] = n6945;
         assign BU24342_D[10] = n6946;
         assign BU24342_D[11] = n6947;
         assign BU24342_D[12] = n6948;
         assign BU24342_D[13] = n6949;
         assign BU24342_D[14] = n6950;
         assign BU24342_D[15] = n6951;
         assign BU24342_D[16] = n6952;
         assign BU24342_D[17] = n6953;
         assign BU24342_D[18] = n6954;
         assign BU24342_D[19] = n6955;
         assign BU24342_D[20] = n6956;
         assign BU24342_D[21] = n6957;
         assign BU24342_D[22] = n6958;
         assign BU24342_D[23] = n6959;
         assign BU24342_D[24] = n6960;
         assign BU24342_D[25] = n6961;
         assign BU24342_D[26] = n6962;
         assign BU24342_D[27] = n6963;
         assign BU24342_D[28] = n6964;
      wire [28 : 0] BU24342_Q;
         assign n192 = BU24342_Q[0];
         assign n193 = BU24342_Q[1];
         assign n194 = BU24342_Q[2];
         assign n195 = BU24342_Q[3];
         assign n196 = BU24342_Q[4];
         assign n197 = BU24342_Q[5];
         assign n198 = BU24342_Q[6];
         assign n199 = BU24342_Q[7];
         assign n200 = BU24342_Q[8];
         assign n201 = BU24342_Q[9];
         assign n202 = BU24342_Q[10];
         assign n203 = BU24342_Q[11];
         assign n204 = BU24342_Q[12];
         assign n205 = BU24342_Q[13];
         assign n206 = BU24342_Q[14];
         assign n207 = BU24342_Q[15];
         assign n208 = BU24342_Q[16];
         assign n209 = BU24342_Q[17];
         assign n210 = BU24342_Q[18];
         assign n211 = BU24342_Q[19];
         assign n212 = BU24342_Q[20];
         assign n213 = BU24342_Q[21];
         assign n214 = BU24342_Q[22];
         assign n215 = BU24342_Q[23];
         assign n216 = BU24342_Q[24];
         assign n217 = BU24342_Q[25];
         assign n218 = BU24342_Q[26];
         assign n219 = BU24342_Q[27];
         assign n220 = BU24342_Q[28];
      wire BU24342_CLK;
         assign BU24342_CLK = n152;
      wire BU24342_CE;
         assign BU24342_CE = n133;
      wire BU24342_SCLR;
         assign BU24342_SCLR = n6975;
      wire BU24342_SSET;
         assign BU24342_SSET = n6977;
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
      BU24342(
         .D(BU24342_D),
         .Q(BU24342_Q),
         .CLK(BU24342_CLK),
         .CE(BU24342_CE),
         .SCLR(BU24342_SCLR),
         .SSET(BU24342_SSET)
      );

      wire [0 : 0] BU24462_D;
         assign BU24462_D[0] = n6965;
      wire [0 : 0] BU24462_Q;
         assign n221 = BU24462_Q[0];
      wire BU24462_CLK;
         assign BU24462_CLK = n152;
      wire BU24462_CE;
         assign BU24462_CE = n133;
      wire BU24462_SCLR;
         assign BU24462_SCLR = n6977;
      wire BU24462_SSET;
         assign BU24462_SSET = n6975;
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
      BU24462(
         .D(BU24462_D),
         .Q(BU24462_Q),
         .CLK(BU24462_CLK),
         .CE(BU24462_CE),
         .SCLR(BU24462_SCLR),
         .SSET(BU24462_SSET)
      );

      wire [3 : 0] BU24474_I;
         assign BU24474_I[0] = n97;
         assign BU24474_I[1] = n98;
         assign BU24474_I[2] = n99;
         assign BU24474_I[3] = n100;
      wire BU24474_O;
         assign n7511 = BU24474_O;
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
         4    /* c_inputs*/,
         "0111"    /* c_input_inv_mask*/,
         0    /* c_pipe_stages*/,
         "0"    /* c_sinit_val*/,
         0    /* c_sync_enable*/,
         1    /* c_sync_priority*/
      )
      BU24474(
         .I(BU24474_I),
         .O(BU24474_O)
      );

      defparam BU24480.INIT = 'h8c8c;
      wire BU24480_I0;
         assign BU24480_I0 = n101;
      wire BU24480_I1;
         assign BU24480_I1 = n100;
      wire BU24480_I2;
         assign BU24480_I2 = n7511;
      wire BU24480_I3;
         assign BU24480_I3 = 1'b0;
      wire BU24480_O;
         assign n7508 = BU24480_O;
      LUT4       BU24480(
         .I0(BU24480_I0),
         .I1(BU24480_I1),
         .I2(BU24480_I2),
         .I3(BU24480_I3),
         .O(BU24480_O)
      );

      wire [29 : 0] BU24481_A;
         assign BU24481_A[0] = n101;
         assign BU24481_A[1] = n102;
         assign BU24481_A[2] = n103;
         assign BU24481_A[3] = n104;
         assign BU24481_A[4] = n105;
         assign BU24481_A[5] = n106;
         assign BU24481_A[6] = n107;
         assign BU24481_A[7] = n108;
         assign BU24481_A[8] = n109;
         assign BU24481_A[9] = n110;
         assign BU24481_A[10] = n111;
         assign BU24481_A[11] = n112;
         assign BU24481_A[12] = n113;
         assign BU24481_A[13] = n114;
         assign BU24481_A[14] = n115;
         assign BU24481_A[15] = n116;
         assign BU24481_A[16] = n117;
         assign BU24481_A[17] = n118;
         assign BU24481_A[18] = n119;
         assign BU24481_A[19] = n120;
         assign BU24481_A[20] = n121;
         assign BU24481_A[21] = n122;
         assign BU24481_A[22] = n123;
         assign BU24481_A[23] = n124;
         assign BU24481_A[24] = n125;
         assign BU24481_A[25] = n126;
         assign BU24481_A[26] = n127;
         assign BU24481_A[27] = n128;
         assign BU24481_A[28] = n129;
         assign BU24481_A[29] = n130;
      wire [0 : 0] BU24481_B;
         assign BU24481_B[0] = n7508;
      wire [30 : 0] BU24481_S;
         assign n7477 = BU24481_S[0];
         assign n7478 = BU24481_S[1];
         assign n7479 = BU24481_S[2];
         assign n7480 = BU24481_S[3];
         assign n7481 = BU24481_S[4];
         assign n7482 = BU24481_S[5];
         assign n7483 = BU24481_S[6];
         assign n7484 = BU24481_S[7];
         assign n7485 = BU24481_S[8];
         assign n7486 = BU24481_S[9];
         assign n7487 = BU24481_S[10];
         assign n7488 = BU24481_S[11];
         assign n7489 = BU24481_S[12];
         assign n7490 = BU24481_S[13];
         assign n7491 = BU24481_S[14];
         assign n7492 = BU24481_S[15];
         assign n7493 = BU24481_S[16];
         assign n7494 = BU24481_S[17];
         assign n7495 = BU24481_S[18];
         assign n7496 = BU24481_S[19];
         assign n7497 = BU24481_S[20];
         assign n7498 = BU24481_S[21];
         assign n7499 = BU24481_S[22];
         assign n7500 = BU24481_S[23];
         assign n7501 = BU24481_S[24];
         assign n7502 = BU24481_S[25];
         assign n7503 = BU24481_S[26];
         assign n7504 = BU24481_S[27];
         assign n7505 = BU24481_S[28];
         assign n7506 = BU24481_S[29];
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
      BU24481(
         .A(BU24481_A),
         .B(BU24481_B),
         .S(BU24481_S)
      );

      defparam BU24606.INIT = 'h0200;
      wire BU24606_I0;
         assign BU24606_I0 = n130;
      wire BU24606_I1;
         assign BU24606_I1 = n129;
      wire BU24606_I2;
         assign BU24606_I2 = n7506;
      wire BU24606_I3;
         assign BU24606_I3 = n134;
      wire BU24606_O;
         assign n7516 = BU24606_O;
      LUT4       BU24606(
         .I0(BU24606_I0),
         .I1(BU24606_I1),
         .I2(BU24606_I2),
         .I3(BU24606_I3),
         .O(BU24606_O)
      );

      defparam BU24608.INIT = 'h4040;
      wire BU24608_I0;
         assign BU24608_I0 = n130;
      wire BU24608_I1;
         assign BU24608_I1 = n7506;
      wire BU24608_I2;
         assign BU24608_I2 = n134;
      wire BU24608_I3;
         assign BU24608_I3 = 1'b0;
      wire BU24608_O;
         assign n7518 = BU24608_O;
      LUT4       BU24608(
         .I0(BU24608_I0),
         .I1(BU24608_I1),
         .I2(BU24608_I2),
         .I3(BU24608_I3),
         .O(BU24608_O)
      );

      wire [28 : 0] BU24609_D;
         assign BU24609_D[0] = n7477;
         assign BU24609_D[1] = n7478;
         assign BU24609_D[2] = n7479;
         assign BU24609_D[3] = n7480;
         assign BU24609_D[4] = n7481;
         assign BU24609_D[5] = n7482;
         assign BU24609_D[6] = n7483;
         assign BU24609_D[7] = n7484;
         assign BU24609_D[8] = n7485;
         assign BU24609_D[9] = n7486;
         assign BU24609_D[10] = n7487;
         assign BU24609_D[11] = n7488;
         assign BU24609_D[12] = n7489;
         assign BU24609_D[13] = n7490;
         assign BU24609_D[14] = n7491;
         assign BU24609_D[15] = n7492;
         assign BU24609_D[16] = n7493;
         assign BU24609_D[17] = n7494;
         assign BU24609_D[18] = n7495;
         assign BU24609_D[19] = n7496;
         assign BU24609_D[20] = n7497;
         assign BU24609_D[21] = n7498;
         assign BU24609_D[22] = n7499;
         assign BU24609_D[23] = n7500;
         assign BU24609_D[24] = n7501;
         assign BU24609_D[25] = n7502;
         assign BU24609_D[26] = n7503;
         assign BU24609_D[27] = n7504;
         assign BU24609_D[28] = n7505;
      wire [28 : 0] BU24609_Q;
         assign n222 = BU24609_Q[0];
         assign n223 = BU24609_Q[1];
         assign n224 = BU24609_Q[2];
         assign n225 = BU24609_Q[3];
         assign n226 = BU24609_Q[4];
         assign n227 = BU24609_Q[5];
         assign n228 = BU24609_Q[6];
         assign n229 = BU24609_Q[7];
         assign n230 = BU24609_Q[8];
         assign n231 = BU24609_Q[9];
         assign n232 = BU24609_Q[10];
         assign n233 = BU24609_Q[11];
         assign n234 = BU24609_Q[12];
         assign n235 = BU24609_Q[13];
         assign n236 = BU24609_Q[14];
         assign n237 = BU24609_Q[15];
         assign n238 = BU24609_Q[16];
         assign n239 = BU24609_Q[17];
         assign n240 = BU24609_Q[18];
         assign n241 = BU24609_Q[19];
         assign n242 = BU24609_Q[20];
         assign n243 = BU24609_Q[21];
         assign n244 = BU24609_Q[22];
         assign n245 = BU24609_Q[23];
         assign n246 = BU24609_Q[24];
         assign n247 = BU24609_Q[25];
         assign n248 = BU24609_Q[26];
         assign n249 = BU24609_Q[27];
         assign n250 = BU24609_Q[28];
      wire BU24609_CLK;
         assign BU24609_CLK = n152;
      wire BU24609_CE;
         assign BU24609_CE = n134;
      wire BU24609_SCLR;
         assign BU24609_SCLR = n7516;
      wire BU24609_SSET;
         assign BU24609_SSET = n7518;
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
      BU24609(
         .D(BU24609_D),
         .Q(BU24609_Q),
         .CLK(BU24609_CLK),
         .CE(BU24609_CE),
         .SCLR(BU24609_SCLR),
         .SSET(BU24609_SSET)
      );

      wire [0 : 0] BU24729_D;
         assign BU24729_D[0] = n7506;
      wire [0 : 0] BU24729_Q;
         assign n251 = BU24729_Q[0];
      wire BU24729_CLK;
         assign BU24729_CLK = n152;
      wire BU24729_CE;
         assign BU24729_CE = n134;
      wire BU24729_SCLR;
         assign BU24729_SCLR = n7518;
      wire BU24729_SSET;
         assign BU24729_SSET = n7516;
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
      BU24729(
         .D(BU24729_D),
         .Q(BU24729_Q),
         .CLK(BU24729_CLK),
         .CE(BU24729_CE),
         .SCLR(BU24729_SCLR),
         .SSET(BU24729_SSET)
      );

//synopsys translate_on

endmodule
