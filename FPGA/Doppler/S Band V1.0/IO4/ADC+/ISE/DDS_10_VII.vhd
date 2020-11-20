--------------------------------------------------------------------------------
--     This file is owned and controlled by Xilinx and must be used           --
--     solely for design, simulation, implementation and creation of          --
--     design files limited to Xilinx devices or technologies. Use            --
--     with non-Xilinx devices or technologies is expressly prohibited        --
--     and immediately terminates your license.                               --
--                                                                            --
--     XILINX IS PROVIDING THIS DESIGN, CODE, OR INFORMATION "AS IS"          --
--     SOLELY FOR USE IN DEVELOPING PROGRAMS AND SOLUTIONS FOR                --
--     XILINX DEVICES.  BY PROVIDING THIS DESIGN, CODE, OR INFORMATION        --
--     AS ONE POSSIBLE IMPLEMENTATION OF THIS FEATURE, APPLICATION            --
--     OR STANDARD, XILINX IS MAKING NO REPRESENTATION THAT THIS              --
--     IMPLEMENTATION IS FREE FROM ANY CLAIMS OF INFRINGEMENT,                --
--     AND YOU ARE RESPONSIBLE FOR OBTAINING ANY RIGHTS YOU MAY REQUIRE       --
--     FOR YOUR IMPLEMENTATION.  XILINX EXPRESSLY DISCLAIMS ANY               --
--     WARRANTY WHATSOEVER WITH RESPECT TO THE ADEQUACY OF THE                --
--     IMPLEMENTATION, INCLUDING BUT NOT LIMITED TO ANY WARRANTIES OR         --
--     REPRESENTATIONS THAT THIS IMPLEMENTATION IS FREE FROM CLAIMS OF        --
--     INFRINGEMENT, IMPLIED WARRANTIES OF MERCHANTABILITY AND FITNESS        --
--     FOR A PARTICULAR PURPOSE.                                              --
--                                                                            --
--     Xilinx products are not intended for use in life support               --
--     appliances, devices, or systems. Use in such applications are          --
--     expressly prohibited.                                                  --
--                                                                            --
--     (c) Copyright 1995-2007 Xilinx, Inc.                                   --
--     All rights reserved.                                                   --
--------------------------------------------------------------------------------

-- synthesis translate_off
LIBRARY std, ieee;
USE std.standard.ALL;
USE ieee.std_logic_1164.ALL;

LIBRARY unisim;
USE unisim.vcomponents.ALL;


LIBRARY XilinxCoreLib;
USE XilinxCoreLib.c_compare_v7_0_comp.ALL;
USE XilinxCoreLib.c_shift_ram_v7_0_comp.ALL;
USE XilinxCoreLib.c_reg_fd_v7_0_comp.ALL;
USE XilinxCoreLib.blkmemsp_v6_0_comp.ALL;
USE XilinxCoreLib.c_twos_comp_v7_0_comp.ALL;
USE XilinxCoreLib.c_gate_bit_v7_0_comp.ALL;
USE XilinxCoreLib.c_shift_fd_v7_0_comp.ALL;
USE XilinxCoreLib.c_addsub_v7_0_comp.ALL;

ENTITY DDS_10_VII IS
   PORT (
      CLK : IN STD_LOGIC;
      SINE : OUT STD_LOGIC_VECTOR(13 DOWNTO 0)   
);
END DDS_10_VII;

ARCHITECTURE xilinx OF DDS_10_VII IS 

-- Signals for connecting to instantiations
   SIGNAL BU4_A : STD_LOGIC_VECTOR(30 DOWNTO 0);
   SIGNAL BU4_Q : STD_LOGIC_VECTOR(30 DOWNTO 0);
   SIGNAL BU4_CLK : STD_LOGIC;
   SIGNAL BU190_CLK : STD_LOGIC;
   SIGNAL BU190_SDOUT : STD_LOGIC;
   SIGNAL BU199_A : STD_LOGIC_VECTOR(30 DOWNTO 0);
   SIGNAL BU199_Q : STD_LOGIC_VECTOR(30 DOWNTO 0);
   SIGNAL BU199_CLK : STD_LOGIC;
   SIGNAL BU704_A : STD_LOGIC_VECTOR(20 DOWNTO 0);
   SIGNAL BU704_B : STD_LOGIC_VECTOR(9 DOWNTO 0);
   SIGNAL BU704_Q : STD_LOGIC_VECTOR(11 DOWNTO 0);
   SIGNAL BU704_CLK : STD_LOGIC;
   SIGNAL BU643_A : STD_LOGIC_VECTOR(8 DOWNTO 0);
   SIGNAL BU643_B : STD_LOGIC_VECTOR(8 DOWNTO 0);
   SIGNAL BU643_Q : STD_LOGIC_VECTOR(9 DOWNTO 0);
   SIGNAL BU643_CLK : STD_LOGIC;
   SIGNAL BU457_A : STD_LOGIC_VECTOR(7 DOWNTO 0);
   SIGNAL BU457_B : STD_LOGIC_VECTOR(7 DOWNTO 0);
   SIGNAL BU457_Q : STD_LOGIC_VECTOR(8 DOWNTO 0);
   SIGNAL BU457_CLK : STD_LOGIC;
   SIGNAL BU388_I : STD_LOGIC_VECTOR(3 DOWNTO 0);
   SIGNAL BU388_T : STD_LOGIC;
   SIGNAL BU388_EN : STD_LOGIC;
   SIGNAL BU388_Q : STD_LOGIC;
   SIGNAL BU388_CLK : STD_LOGIC;
   SIGNAL BU388_CE : STD_LOGIC;
   SIGNAL BU388_ACLR : STD_LOGIC;
   SIGNAL BU388_ASET : STD_LOGIC;
   SIGNAL BU388_AINIT : STD_LOGIC;
   SIGNAL BU388_SCLR : STD_LOGIC;
   SIGNAL BU388_SSET : STD_LOGIC;
   SIGNAL BU388_SINIT : STD_LOGIC;
   SIGNAL BU388_O : STD_LOGIC;
   SIGNAL BU393_CLK : STD_LOGIC;
   SIGNAL BU393_SDIN : STD_LOGIC;
   SIGNAL BU393_Q : STD_LOGIC_VECTOR(12 DOWNTO 0);
   SIGNAL BU422_I : STD_LOGIC_VECTOR(3 DOWNTO 0);
   SIGNAL BU422_T : STD_LOGIC;
   SIGNAL BU422_EN : STD_LOGIC;
   SIGNAL BU422_Q : STD_LOGIC;
   SIGNAL BU422_CLK : STD_LOGIC;
   SIGNAL BU422_CE : STD_LOGIC;
   SIGNAL BU422_ACLR : STD_LOGIC;
   SIGNAL BU422_ASET : STD_LOGIC;
   SIGNAL BU422_AINIT : STD_LOGIC;
   SIGNAL BU422_SCLR : STD_LOGIC;
   SIGNAL BU422_SSET : STD_LOGIC;
   SIGNAL BU422_SINIT : STD_LOGIC;
   SIGNAL BU422_O : STD_LOGIC;
   SIGNAL BU427_CLK : STD_LOGIC;
   SIGNAL BU427_SDIN : STD_LOGIC;
   SIGNAL BU427_Q : STD_LOGIC_VECTOR(13 DOWNTO 0);
   SIGNAL BU589_A : STD_LOGIC_VECTOR(7 DOWNTO 0);
   SIGNAL BU589_B : STD_LOGIC_VECTOR(7 DOWNTO 0);
   SIGNAL BU589_Q : STD_LOGIC_VECTOR(8 DOWNTO 0);
   SIGNAL BU589_CLK : STD_LOGIC;
   SIGNAL BU512_I : STD_LOGIC_VECTOR(1 DOWNTO 0);
   SIGNAL BU512_T : STD_LOGIC;
   SIGNAL BU512_EN : STD_LOGIC;
   SIGNAL BU512_Q : STD_LOGIC;
   SIGNAL BU512_CLK : STD_LOGIC;
   SIGNAL BU512_CE : STD_LOGIC;
   SIGNAL BU512_ACLR : STD_LOGIC;
   SIGNAL BU512_ASET : STD_LOGIC;
   SIGNAL BU512_AINIT : STD_LOGIC;
   SIGNAL BU512_SCLR : STD_LOGIC;
   SIGNAL BU512_SSET : STD_LOGIC;
   SIGNAL BU512_SINIT : STD_LOGIC;
   SIGNAL BU512_O : STD_LOGIC;
   SIGNAL BU517_CLK : STD_LOGIC;
   SIGNAL BU517_SDIN : STD_LOGIC;
   SIGNAL BU517_Q : STD_LOGIC_VECTOR(14 DOWNTO 0);
   SIGNAL BU550_I : STD_LOGIC_VECTOR(3 DOWNTO 0);
   SIGNAL BU550_T : STD_LOGIC;
   SIGNAL BU550_EN : STD_LOGIC;
   SIGNAL BU550_Q : STD_LOGIC;
   SIGNAL BU550_CLK : STD_LOGIC;
   SIGNAL BU550_CE : STD_LOGIC;
   SIGNAL BU550_ACLR : STD_LOGIC;
   SIGNAL BU550_ASET : STD_LOGIC;
   SIGNAL BU550_AINIT : STD_LOGIC;
   SIGNAL BU550_SCLR : STD_LOGIC;
   SIGNAL BU550_SSET : STD_LOGIC;
   SIGNAL BU550_SINIT : STD_LOGIC;
   SIGNAL BU550_O : STD_LOGIC;
   SIGNAL BU555_CLK : STD_LOGIC;
   SIGNAL BU555_SDIN : STD_LOGIC;
   SIGNAL BU555_Q : STD_LOGIC_VECTOR(15 DOWNTO 0);
   SIGNAL BU841_D : STD_LOGIC_VECTOR(11 DOWNTO 0);
   SIGNAL BU841_Q : STD_LOGIC_VECTOR(11 DOWNTO 0);
   SIGNAL BU841_CLK : STD_LOGIC;
   SIGNAL BU868_A : STD_LOGIC_VECTOR(9 DOWNTO 0);
   SIGNAL BU868_BYPASS : STD_LOGIC;
   SIGNAL BU868_CLK : STD_LOGIC;
   SIGNAL BU868_Q : STD_LOGIC_VECTOR(10 DOWNTO 0);
   SIGNAL BU947_CLK : STD_LOGIC;
   SIGNAL BU947_D : STD_LOGIC_VECTOR(0 DOWNTO 0);
   SIGNAL BU947_Q : STD_LOGIC_VECTOR(0 DOWNTO 0);
   SIGNAL BU955_CLK : STD_LOGIC;
   SIGNAL BU955_D : STD_LOGIC_VECTOR(0 DOWNTO 0);
   SIGNAL BU955_Q : STD_LOGIC_VECTOR(0 DOWNTO 0);
   SIGNAL BU966_I0 : STD_LOGIC;
   SIGNAL BU966_I1 : STD_LOGIC;
   SIGNAL BU966_I2 : STD_LOGIC;
   SIGNAL BU966_I3 : STD_LOGIC;
   SIGNAL BU966_O : STD_LOGIC;
   SIGNAL BU967_D : STD_LOGIC;
   SIGNAL BU967_C : STD_LOGIC;
   SIGNAL BU967_CE : STD_LOGIC;
   SIGNAL BU967_PRE : STD_LOGIC;
   SIGNAL BU967_Q : STD_LOGIC;
   SIGNAL BU971_I0 : STD_LOGIC;
   SIGNAL BU971_I1 : STD_LOGIC;
   SIGNAL BU971_I2 : STD_LOGIC;
   SIGNAL BU971_I3 : STD_LOGIC;
   SIGNAL BU971_O : STD_LOGIC;
   SIGNAL BU972_D : STD_LOGIC;
   SIGNAL BU972_C : STD_LOGIC;
   SIGNAL BU972_CE : STD_LOGIC;
   SIGNAL BU972_Q : STD_LOGIC;
   SIGNAL BU976_I0 : STD_LOGIC;
   SIGNAL BU976_I1 : STD_LOGIC;
   SIGNAL BU976_I2 : STD_LOGIC;
   SIGNAL BU976_I3 : STD_LOGIC;
   SIGNAL BU976_O : STD_LOGIC;
   SIGNAL BU977_D : STD_LOGIC;
   SIGNAL BU977_C : STD_LOGIC;
   SIGNAL BU977_CE : STD_LOGIC;
   SIGNAL BU977_Q : STD_LOGIC;
   SIGNAL BU979_A : STD_LOGIC_VECTOR(9 DOWNTO 0);
   SIGNAL BU979_CLK : STD_LOGIC;
   SIGNAL BU979_ACLR : STD_LOGIC;
   SIGNAL BU979_QA_GE_B : STD_LOGIC;
   SIGNAL BU1015_A : STD_LOGIC_VECTOR(9 DOWNTO 0);
   SIGNAL BU1015_CLK : STD_LOGIC;
   SIGNAL BU1015_ACLR : STD_LOGIC;
   SIGNAL BU1015_QA_EQ_B : STD_LOGIC;
   SIGNAL BU806_addr : STD_LOGIC_VECTOR(9 DOWNTO 0);
   SIGNAL BU806_clk : STD_LOGIC;
   SIGNAL BU806_din : STD_LOGIC_VECTOR(12 DOWNTO 0);
   SIGNAL BU806_dout : STD_LOGIC_VECTOR(12 DOWNTO 0);
   SIGNAL BU806_en : STD_LOGIC;
   SIGNAL BU806_nd : STD_LOGIC;
   SIGNAL BU806_rfd : STD_LOGIC;
   SIGNAL BU806_rdy : STD_LOGIC;
   SIGNAL BU806_sinit : STD_LOGIC;
   SIGNAL BU806_we : STD_LOGIC;
   SIGNAL BU1031_A : STD_LOGIC_VECTOR(13 DOWNTO 0);
   SIGNAL BU1031_B : STD_LOGIC_VECTOR(13 DOWNTO 0);
   SIGNAL BU1031_C_IN : STD_LOGIC;
   SIGNAL BU1031_ADD : STD_LOGIC;
   SIGNAL BU1031_Q : STD_LOGIC_VECTOR(13 DOWNTO 0);
   SIGNAL BU1031_CLK : STD_LOGIC;
   SIGNAL BU1031_CE : STD_LOGIC;
   SIGNAL BU1116_CLK : STD_LOGIC;
   SIGNAL BU1116_SDIN : STD_LOGIC;
   SIGNAL BU1116_SDOUT : STD_LOGIC;
   SIGNAL n0 : STD_LOGIC := '0';
   SIGNAL n1 : STD_LOGIC := '1';
   SIGNAL n2 : STD_LOGIC;
   SIGNAL n3 : STD_LOGIC;
   SIGNAL n4 : STD_LOGIC;
   SIGNAL n5 : STD_LOGIC;
   SIGNAL n6 : STD_LOGIC;
   SIGNAL n7 : STD_LOGIC;
   SIGNAL n8 : STD_LOGIC;
   SIGNAL n9 : STD_LOGIC;
   SIGNAL n10 : STD_LOGIC;
   SIGNAL n11 : STD_LOGIC;
   SIGNAL n12 : STD_LOGIC;
   SIGNAL n13 : STD_LOGIC;
   SIGNAL n14 : STD_LOGIC;
   SIGNAL n15 : STD_LOGIC;
   SIGNAL n16 : STD_LOGIC;
   SIGNAL n17 : STD_LOGIC;
   SIGNAL n18 : STD_LOGIC;
   SIGNAL n19 : STD_LOGIC;
   SIGNAL n20 : STD_LOGIC;
   SIGNAL n21 : STD_LOGIC;
   SIGNAL n22 : STD_LOGIC;
   SIGNAL n23 : STD_LOGIC;
   SIGNAL n24 : STD_LOGIC;
   SIGNAL n25 : STD_LOGIC;
   SIGNAL n26 : STD_LOGIC;
   SIGNAL n27 : STD_LOGIC;
   SIGNAL n28 : STD_LOGIC;
   SIGNAL n29 : STD_LOGIC;
   SIGNAL n30 : STD_LOGIC;
   SIGNAL n31 : STD_LOGIC;
   SIGNAL n32 : STD_LOGIC;
   SIGNAL n43 : STD_LOGIC;
   SIGNAL n44 : STD_LOGIC;
   SIGNAL n45 : STD_LOGIC;
   SIGNAL n46 : STD_LOGIC;
   SIGNAL n47 : STD_LOGIC;
   SIGNAL n48 : STD_LOGIC;
   SIGNAL n49 : STD_LOGIC;
   SIGNAL n50 : STD_LOGIC;
   SIGNAL n51 : STD_LOGIC;
   SIGNAL n52 : STD_LOGIC;
   SIGNAL n53 : STD_LOGIC;
   SIGNAL n54 : STD_LOGIC;
   SIGNAL n55 : STD_LOGIC;
   SIGNAL n56 : STD_LOGIC;
   SIGNAL n57 : STD_LOGIC;
   SIGNAL n58 : STD_LOGIC;
   SIGNAL n59 : STD_LOGIC;
   SIGNAL n60 : STD_LOGIC;
   SIGNAL n61 : STD_LOGIC;
   SIGNAL n62 : STD_LOGIC;
   SIGNAL n63 : STD_LOGIC;
   SIGNAL n64 : STD_LOGIC;
   SIGNAL n65 : STD_LOGIC;
   SIGNAL n66 : STD_LOGIC;
   SIGNAL n67 : STD_LOGIC;
   SIGNAL n68 : STD_LOGIC;
   SIGNAL n69 : STD_LOGIC;
   SIGNAL n70 : STD_LOGIC;
   SIGNAL n71 : STD_LOGIC;
   SIGNAL n72 : STD_LOGIC;
   SIGNAL n73 : STD_LOGIC;
   SIGNAL n74 : STD_LOGIC;
   SIGNAL n75 : STD_LOGIC;
   SIGNAL n76 : STD_LOGIC;
   SIGNAL n77 : STD_LOGIC;
   SIGNAL n78 : STD_LOGIC;
   SIGNAL n79 : STD_LOGIC;
   SIGNAL n80 : STD_LOGIC;
   SIGNAL n81 : STD_LOGIC;
   SIGNAL n82 : STD_LOGIC;
   SIGNAL n83 : STD_LOGIC;
   SIGNAL n84 : STD_LOGIC;
   SIGNAL n85 : STD_LOGIC;
   SIGNAL n86 : STD_LOGIC;
   SIGNAL n118 : STD_LOGIC;
   SIGNAL n119 : STD_LOGIC;
   SIGNAL n120 : STD_LOGIC;
   SIGNAL n121 : STD_LOGIC;
   SIGNAL n122 : STD_LOGIC;
   SIGNAL n123 : STD_LOGIC;
   SIGNAL n124 : STD_LOGIC;
   SIGNAL n125 : STD_LOGIC;
   SIGNAL n126 : STD_LOGIC;
   SIGNAL n127 : STD_LOGIC;
   SIGNAL n128 : STD_LOGIC;
   SIGNAL n129 : STD_LOGIC;
   SIGNAL n130 : STD_LOGIC;
   SIGNAL n131 : STD_LOGIC;
   SIGNAL n132 : STD_LOGIC;
   SIGNAL n1129 : STD_LOGIC;
   SIGNAL n1130 : STD_LOGIC;
   SIGNAL n1131 : STD_LOGIC;
   SIGNAL n1132 : STD_LOGIC;
   SIGNAL n1133 : STD_LOGIC;
   SIGNAL n1134 : STD_LOGIC;
   SIGNAL n1135 : STD_LOGIC;
   SIGNAL n1136 : STD_LOGIC;
   SIGNAL n1137 : STD_LOGIC;
   SIGNAL n1138 : STD_LOGIC;
   SIGNAL n1139 : STD_LOGIC;
   SIGNAL n1140 : STD_LOGIC;
   SIGNAL n1179 : STD_LOGIC;
   SIGNAL n1180 : STD_LOGIC;
   SIGNAL n1181 : STD_LOGIC;
   SIGNAL n1182 : STD_LOGIC;
   SIGNAL n1183 : STD_LOGIC;
   SIGNAL n1184 : STD_LOGIC;
   SIGNAL n1185 : STD_LOGIC;
   SIGNAL n1186 : STD_LOGIC;
   SIGNAL n1187 : STD_LOGIC;
   SIGNAL n1188 : STD_LOGIC;
   SIGNAL n1189 : STD_LOGIC;
   SIGNAL n1230 : STD_LOGIC;
   SIGNAL n1231 : STD_LOGIC;
   SIGNAL n1232 : STD_LOGIC;
   SIGNAL n1233 : STD_LOGIC;
   SIGNAL n1234 : STD_LOGIC;
   SIGNAL n1235 : STD_LOGIC;
   SIGNAL n1236 : STD_LOGIC;
   SIGNAL n1237 : STD_LOGIC;
   SIGNAL n1238 : STD_LOGIC;
   SIGNAL n1239 : STD_LOGIC;
   SIGNAL n1240 : STD_LOGIC;
   SIGNAL n1241 : STD_LOGIC;
   SIGNAL n1242 : STD_LOGIC;
   SIGNAL n1243 : STD_LOGIC;
   SIGNAL n1244 : STD_LOGIC;
   SIGNAL n1245 : STD_LOGIC;
   SIGNAL n1246 : STD_LOGIC;
   SIGNAL n1247 : STD_LOGIC;
   SIGNAL n1248 : STD_LOGIC;
   SIGNAL n1285 : STD_LOGIC;
   SIGNAL n1286 : STD_LOGIC;
   SIGNAL n1287 : STD_LOGIC;
   SIGNAL n1288 : STD_LOGIC;
   SIGNAL n1289 : STD_LOGIC;
   SIGNAL n1290 : STD_LOGIC;
   SIGNAL n1291 : STD_LOGIC;
   SIGNAL n1292 : STD_LOGIC;
   SIGNAL n1293 : STD_LOGIC;
   SIGNAL n1294 : STD_LOGIC;
   SIGNAL n1295 : STD_LOGIC;
   SIGNAL n1338 : STD_LOGIC;
   SIGNAL n1339 : STD_LOGIC;
   SIGNAL n1340 : STD_LOGIC;
   SIGNAL n1341 : STD_LOGIC;
   SIGNAL n1342 : STD_LOGIC;
   SIGNAL n1343 : STD_LOGIC;
   SIGNAL n1344 : STD_LOGIC;
   SIGNAL n1345 : STD_LOGIC;
   SIGNAL n1346 : STD_LOGIC;
   SIGNAL n1974 : STD_LOGIC;
   SIGNAL n1975 : STD_LOGIC;
   SIGNAL n1976 : STD_LOGIC;
   SIGNAL n1977 : STD_LOGIC;
   SIGNAL n1978 : STD_LOGIC;
   SIGNAL n1979 : STD_LOGIC;
   SIGNAL n1980 : STD_LOGIC;
   SIGNAL n1981 : STD_LOGIC;
   SIGNAL n1982 : STD_LOGIC;
   SIGNAL n1983 : STD_LOGIC;
   SIGNAL n1984 : STD_LOGIC;
   SIGNAL n1985 : STD_LOGIC;
   SIGNAL n1986 : STD_LOGIC;
   SIGNAL n1987 : STD_LOGIC;
   SIGNAL n2008 : STD_LOGIC;
   SIGNAL n2009 : STD_LOGIC;
   SIGNAL n2010 : STD_LOGIC;
   SIGNAL n2011 : STD_LOGIC;
   SIGNAL n2012 : STD_LOGIC;
   SIGNAL n2013 : STD_LOGIC;
   SIGNAL n2014 : STD_LOGIC;
   SIGNAL n2015 : STD_LOGIC;
   SIGNAL n2016 : STD_LOGIC;
   SIGNAL n2017 : STD_LOGIC;
   SIGNAL n2021 : STD_LOGIC;
   SIGNAL n2022 : STD_LOGIC;
   SIGNAL n2023 : STD_LOGIC;
   SIGNAL n2024 : STD_LOGIC;
   SIGNAL n2025 : STD_LOGIC;
   SIGNAL n2026 : STD_LOGIC;
   SIGNAL n2027 : STD_LOGIC;
   SIGNAL n2028 : STD_LOGIC;
   SIGNAL n2029 : STD_LOGIC;
   SIGNAL n2030 : STD_LOGIC;
   SIGNAL n2031 : STD_LOGIC;
   SIGNAL n2032 : STD_LOGIC;
   SIGNAL n2033 : STD_LOGIC;
   SIGNAL n2034 : STD_LOGIC;
   SIGNAL n2035 : STD_LOGIC;
   SIGNAL n2036 : STD_LOGIC;
   SIGNAL n2037 : STD_LOGIC;
   SIGNAL n2038 : STD_LOGIC;
   SIGNAL n2053 : STD_LOGIC;
   SIGNAL n2271 : STD_LOGIC;
   SIGNAL n2288 : STD_LOGIC;
   SIGNAL n2304 : STD_LOGIC;

BEGIN

   n118 <= CLK;
   SINE(0) <= n119;
   SINE(1) <= n120;
   SINE(2) <= n121;
   SINE(3) <= n122;
   SINE(4) <= n123;
   SINE(5) <= n124;
   SINE(6) <= n125;
   SINE(7) <= n126;
   SINE(8) <= n127;
   SINE(9) <= n128;
   SINE(10) <= n129;
   SINE(11) <= n130;
   SINE(12) <= n131;
   SINE(13) <= n132;

   BU4_A(0) <= n2;
   BU4_A(1) <= n3;
   BU4_A(2) <= n4;
   BU4_A(3) <= n5;
   BU4_A(4) <= n6;
   BU4_A(5) <= n7;
   BU4_A(6) <= n8;
   BU4_A(7) <= n9;
   BU4_A(8) <= n10;
   BU4_A(9) <= n11;
   BU4_A(10) <= n12;
   BU4_A(11) <= n13;
   BU4_A(12) <= n14;
   BU4_A(13) <= n15;
   BU4_A(14) <= n16;
   BU4_A(15) <= n17;
   BU4_A(16) <= n18;
   BU4_A(17) <= n19;
   BU4_A(18) <= n20;
   BU4_A(19) <= n21;
   BU4_A(20) <= n22;
   BU4_A(21) <= n23;
   BU4_A(22) <= n24;
   BU4_A(23) <= n25;
   BU4_A(24) <= n26;
   BU4_A(25) <= n27;
   BU4_A(26) <= n28;
   BU4_A(27) <= n29;
   BU4_A(28) <= n30;
   BU4_A(29) <= n31;
   BU4_A(30) <= n32;
   n2 <= BU4_Q(0);
   n3 <= BU4_Q(1);
   n4 <= BU4_Q(2);
   n5 <= BU4_Q(3);
   n6 <= BU4_Q(4);
   n7 <= BU4_Q(5);
   n8 <= BU4_Q(6);
   n9 <= BU4_Q(7);
   n10 <= BU4_Q(8);
   n11 <= BU4_Q(9);
   n12 <= BU4_Q(10);
   n13 <= BU4_Q(11);
   n14 <= BU4_Q(12);
   n15 <= BU4_Q(13);
   n16 <= BU4_Q(14);
   n17 <= BU4_Q(15);
   n18 <= BU4_Q(16);
   n19 <= BU4_Q(17);
   n20 <= BU4_Q(18);
   n21 <= BU4_Q(19);
   n22 <= BU4_Q(20);
   n23 <= BU4_Q(21);
   n24 <= BU4_Q(22);
   n25 <= BU4_Q(23);
   n26 <= BU4_Q(24);
   n27 <= BU4_Q(25);
   n28 <= BU4_Q(26);
   n29 <= BU4_Q(27);
   n30 <= BU4_Q(28);
   n31 <= BU4_Q(29);
   n32 <= BU4_Q(30);
   BU4_CLK <= n118;
   BU4 : C_ADDSUB_V7_0
      GENERIC MAP (
         c_has_bypass_with_cin => 0,
         c_a_type => 1,
         c_has_sclr => 0,
         c_has_aset => 0,
         c_has_b_out => 0,
         c_sync_priority => 0,
         c_has_s => 1,
         c_has_q => 1,
         c_bypass_enable => 1,
         c_b_constant => 1,
         c_has_ovfl => 0,
         c_high_bit => 30,
         c_latency => 1,
         c_sinit_val => "0000000000000000000000000000000",
         c_has_bypass => 0,
         c_pipe_stages => 0,
         c_has_sset => 0,
         c_has_ainit => 0,
         c_has_a_signed => 0,
         c_has_q_c_out => 0,
         c_b_type => 1,
         c_has_add => 0,
         c_has_sinit => 0,
         c_has_b_in => 0,
         c_has_b_signed => 0,
         c_bypass_low => 0,
         c_enable_rlocs => 0,
         c_b_value => "0000000000000000000000000000000",
         c_add_mode => 0,
         c_has_aclr => 0,
         c_out_width => 31,
         c_low_bit => 0,
         c_ainit_val => "0000000000000000000000000000000",
         c_has_q_ovfl => 0,
         c_has_q_b_out => 0,
         c_has_c_out => 0,
         c_b_width => 31,
         c_a_width => 31,
         c_sync_enable => 0,
         c_has_ce => 0,
         c_has_c_in => 0
      )
      PORT MAP (
         A => BU4_A,
         Q => BU4_Q,
         CLK => BU4_CLK
      );

   BU190_CLK <= n118;
   n64 <= BU190_SDOUT;
   BU190 : C_SHIFT_FD_V7_0
      GENERIC MAP (
         c_has_aset => 0,
         c_has_d => 0,
         c_sync_priority => 1,
         c_has_sclr => 0,
         c_fill_data => 1,
         c_width => 2,
         c_enable_rlocs => 0,
         c_ainit_val => "00",
         c_has_ce => 0,
         c_has_aclr => 0,
         c_sync_enable => 0,
         c_has_ainit => 0,
         c_has_sdout => 1,
         c_sinit_val => "00",
         c_has_sset => 0,
         c_has_sinit => 0,
         c_has_q => 0,
         c_shift_type => 1,
         c_has_sdin => 0,
         c_has_lsb_2_msb => 0
      )
      PORT MAP (
         CLK => BU190_CLK,
         SDOUT => BU190_SDOUT
      );

   BU199_A(0) <= n2;
   BU199_A(1) <= n3;
   BU199_A(2) <= n4;
   BU199_A(3) <= n5;
   BU199_A(4) <= n6;
   BU199_A(5) <= n7;
   BU199_A(6) <= n8;
   BU199_A(7) <= n9;
   BU199_A(8) <= n10;
   BU199_A(9) <= n11;
   BU199_A(10) <= n12;
   BU199_A(11) <= n13;
   BU199_A(12) <= n14;
   BU199_A(13) <= n15;
   BU199_A(14) <= n16;
   BU199_A(15) <= n17;
   BU199_A(16) <= n18;
   BU199_A(17) <= n19;
   BU199_A(18) <= n20;
   BU199_A(19) <= n21;
   BU199_A(20) <= n22;
   BU199_A(21) <= n23;
   BU199_A(22) <= n24;
   BU199_A(23) <= n25;
   BU199_A(24) <= n26;
   BU199_A(25) <= n27;
   BU199_A(26) <= n28;
   BU199_A(27) <= n29;
   BU199_A(28) <= n30;
   BU199_A(29) <= n31;
   BU199_A(30) <= n32;
   n43 <= BU199_Q(10);
   n44 <= BU199_Q(11);
   n45 <= BU199_Q(12);
   n46 <= BU199_Q(13);
   n47 <= BU199_Q(14);
   n48 <= BU199_Q(15);
   n49 <= BU199_Q(16);
   n50 <= BU199_Q(17);
   n51 <= BU199_Q(18);
   n52 <= BU199_Q(19);
   n53 <= BU199_Q(20);
   n54 <= BU199_Q(21);
   n55 <= BU199_Q(22);
   n56 <= BU199_Q(23);
   n57 <= BU199_Q(24);
   n58 <= BU199_Q(25);
   n59 <= BU199_Q(26);
   n60 <= BU199_Q(27);
   n61 <= BU199_Q(28);
   n62 <= BU199_Q(29);
   n63 <= BU199_Q(30);
   BU199_CLK <= n118;
   BU199 : C_ADDSUB_V7_0
      GENERIC MAP (
         c_has_bypass_with_cin => 0,
         c_a_type => 1,
         c_has_sclr => 0,
         c_has_aset => 0,
         c_has_b_out => 0,
         c_sync_priority => 0,
         c_has_s => 1,
         c_has_q => 1,
         c_bypass_enable => 1,
         c_b_constant => 1,
         c_has_ovfl => 0,
         c_high_bit => 30,
         c_latency => 1,
         c_sinit_val => "0000000000000000000000000000000",
         c_has_bypass => 0,
         c_pipe_stages => 0,
         c_has_sset => 0,
         c_has_ainit => 0,
         c_has_a_signed => 0,
         c_has_q_c_out => 0,
         c_b_type => 1,
         c_has_add => 0,
         c_has_sinit => 0,
         c_has_b_in => 0,
         c_has_b_signed => 0,
         c_bypass_low => 0,
         c_enable_rlocs => 0,
         c_b_value => "0000000000000000000000000000000",
         c_add_mode => 0,
         c_has_aclr => 0,
         c_out_width => 31,
         c_low_bit => 0,
         c_ainit_val => "0000000000000000000000000000000",
         c_has_q_ovfl => 0,
         c_has_q_b_out => 0,
         c_has_c_out => 0,
         c_b_width => 31,
         c_a_width => 31,
         c_sync_enable => 0,
         c_has_ce => 0,
         c_has_c_in => 0
      )
      PORT MAP (
         A => BU199_A,
         Q => BU199_Q,
         CLK => BU199_CLK
      );

   BU704_A(0) <= n43;
   BU704_A(1) <= n44;
   BU704_A(2) <= n45;
   BU704_A(3) <= n46;
   BU704_A(4) <= n47;
   BU704_A(5) <= n48;
   BU704_A(6) <= n49;
   BU704_A(7) <= n50;
   BU704_A(8) <= n51;
   BU704_A(9) <= n52;
   BU704_A(10) <= n53;
   BU704_A(11) <= n54;
   BU704_A(12) <= n55;
   BU704_A(13) <= n56;
   BU704_A(14) <= n57;
   BU704_A(15) <= n58;
   BU704_A(16) <= n59;
   BU704_A(17) <= n60;
   BU704_A(18) <= n61;
   BU704_A(19) <= n62;
   BU704_A(20) <= n63;
   BU704_B(0) <= n77;
   BU704_B(1) <= n78;
   BU704_B(2) <= n79;
   BU704_B(3) <= n80;
   BU704_B(4) <= n81;
   BU704_B(5) <= n82;
   BU704_B(6) <= n83;
   BU704_B(7) <= n84;
   BU704_B(8) <= n85;
   BU704_B(9) <= n86;
   n65 <= BU704_Q(0);
   n66 <= BU704_Q(1);
   n67 <= BU704_Q(2);
   n68 <= BU704_Q(3);
   n69 <= BU704_Q(4);
   n70 <= BU704_Q(5);
   n71 <= BU704_Q(6);
   n72 <= BU704_Q(7);
   n73 <= BU704_Q(8);
   n74 <= BU704_Q(9);
   n75 <= BU704_Q(10);
   n76 <= BU704_Q(11);
   BU704_CLK <= n118;
   BU704 : C_ADDSUB_V7_0
      GENERIC MAP (
         c_has_bypass_with_cin => 0,
         c_a_type => 1,
         c_has_sclr => 0,
         c_has_aset => 0,
         c_has_b_out => 0,
         c_sync_priority => 0,
         c_has_s => 1,
         c_has_q => 1,
         c_bypass_enable => 1,
         c_b_constant => 0,
         c_has_ovfl => 0,
         c_high_bit => 20,
         c_latency => 1,
         c_sinit_val => "000000000000",
         c_has_bypass => 0,
         c_pipe_stages => 0,
         c_has_sset => 0,
         c_has_ainit => 0,
         c_has_a_signed => 0,
         c_has_q_c_out => 0,
         c_b_type => 0,
         c_has_add => 0,
         c_has_sinit => 0,
         c_has_b_in => 0,
         c_has_b_signed => 0,
         c_bypass_low => 0,
         c_enable_rlocs => 0,
         c_b_value => "000000000000000000000",
         c_add_mode => 0,
         c_has_aclr => 0,
         c_out_width => 12,
         c_low_bit => 9,
         c_ainit_val => "000000000000",
         c_has_q_ovfl => 0,
         c_has_q_b_out => 0,
         c_has_c_out => 0,
         c_b_width => 10,
         c_a_width => 21,
         c_sync_enable => 0,
         c_has_ce => 0,
         c_has_c_in => 0
      )
      PORT MAP (
         A => BU704_A,
         B => BU704_B,
         Q => BU704_Q,
         CLK => BU704_CLK
      );

   BU643_A(0) <= n1230;
   BU643_A(1) <= n1231;
   BU643_A(2) <= n1232;
   BU643_A(3) <= n1233;
   BU643_A(4) <= n1234;
   BU643_A(5) <= n1235;
   BU643_A(6) <= n1236;
   BU643_A(7) <= n1237;
   BU643_A(8) <= n1238;
   BU643_B(0) <= n1338;
   BU643_B(1) <= n1339;
   BU643_B(2) <= n1340;
   BU643_B(3) <= n1341;
   BU643_B(4) <= n1342;
   BU643_B(5) <= n1343;
   BU643_B(6) <= n1344;
   BU643_B(7) <= n1345;
   BU643_B(8) <= n1346;
   n77 <= BU643_Q(0);
   n78 <= BU643_Q(1);
   n79 <= BU643_Q(2);
   n80 <= BU643_Q(3);
   n81 <= BU643_Q(4);
   n82 <= BU643_Q(5);
   n83 <= BU643_Q(6);
   n84 <= BU643_Q(7);
   n85 <= BU643_Q(8);
   n86 <= BU643_Q(9);
   BU643_CLK <= n118;
   BU643 : C_ADDSUB_V7_0
      GENERIC MAP (
         c_has_bypass_with_cin => 0,
         c_a_type => 0,
         c_has_sclr => 0,
         c_has_aset => 0,
         c_has_b_out => 0,
         c_sync_priority => 0,
         c_has_s => 1,
         c_has_q => 1,
         c_bypass_enable => 0,
         c_b_constant => 0,
         c_has_ovfl => 0,
         c_high_bit => 9,
         c_latency => 1,
         c_sinit_val => "0000000000",
         c_has_bypass => 0,
         c_pipe_stages => 0,
         c_has_sset => 0,
         c_has_ainit => 0,
         c_has_a_signed => 0,
         c_has_q_c_out => 0,
         c_b_type => 0,
         c_has_add => 0,
         c_has_sinit => 0,
         c_has_b_in => 0,
         c_has_b_signed => 0,
         c_bypass_low => 0,
         c_enable_rlocs => 0,
         c_b_value => "0000000000",
         c_add_mode => 0,
         c_has_aclr => 0,
         c_out_width => 10,
         c_low_bit => 0,
         c_ainit_val => "0000000000",
         c_has_q_ovfl => 0,
         c_has_q_b_out => 0,
         c_has_c_out => 0,
         c_b_width => 9,
         c_a_width => 9,
         c_sync_enable => 0,
         c_has_ce => 0,
         c_has_c_in => 0
      )
      PORT MAP (
         A => BU643_A,
         B => BU643_B,
         Q => BU643_Q,
         CLK => BU643_CLK
      );

   BU457_A(0) <= n1129;
   BU457_A(1) <= n1130;
   BU457_A(2) <= n1131;
   BU457_A(3) <= n1132;
   BU457_A(4) <= n1133;
   BU457_A(5) <= n1134;
   BU457_A(6) <= n1135;
   BU457_A(7) <= n1136;
   BU457_B(0) <= n1179;
   BU457_B(1) <= n1180;
   BU457_B(2) <= n1181;
   BU457_B(3) <= n1182;
   BU457_B(4) <= n1183;
   BU457_B(5) <= n1184;
   BU457_B(6) <= n1185;
   BU457_B(7) <= n1186;
   n1230 <= BU457_Q(0);
   n1231 <= BU457_Q(1);
   n1232 <= BU457_Q(2);
   n1233 <= BU457_Q(3);
   n1234 <= BU457_Q(4);
   n1235 <= BU457_Q(5);
   n1236 <= BU457_Q(6);
   n1237 <= BU457_Q(7);
   n1238 <= BU457_Q(8);
   BU457_CLK <= n118;
   BU457 : C_ADDSUB_V7_0
      GENERIC MAP (
         c_has_bypass_with_cin => 0,
         c_a_type => 0,
         c_has_sclr => 0,
         c_has_aset => 0,
         c_has_b_out => 0,
         c_sync_priority => 0,
         c_has_s => 1,
         c_has_q => 1,
         c_bypass_enable => 0,
         c_b_constant => 0,
         c_has_ovfl => 0,
         c_high_bit => 8,
         c_latency => 1,
         c_sinit_val => "000000000",
         c_has_bypass => 0,
         c_pipe_stages => 0,
         c_has_sset => 0,
         c_has_ainit => 0,
         c_has_a_signed => 0,
         c_has_q_c_out => 0,
         c_b_type => 0,
         c_has_add => 0,
         c_has_sinit => 0,
         c_has_b_in => 0,
         c_has_b_signed => 0,
         c_bypass_low => 0,
         c_enable_rlocs => 0,
         c_b_value => "000000000",
         c_add_mode => 0,
         c_has_aclr => 0,
         c_out_width => 9,
         c_low_bit => 0,
         c_ainit_val => "000000000",
         c_has_q_ovfl => 0,
         c_has_q_b_out => 0,
         c_has_c_out => 0,
         c_b_width => 8,
         c_a_width => 8,
         c_sync_enable => 0,
         c_has_ce => 0,
         c_has_c_in => 0
      )
      PORT MAP (
         A => BU457_A,
         B => BU457_B,
         Q => BU457_Q,
         CLK => BU457_CLK
      );

   BU388_I(0) <= n1138;
   BU388_I(1) <= n1139;
   BU388_I(2) <= n1140;
   BU388_I(3) <= n1136;
   BU388_T <= '0';
   BU388_EN <= '0';
   BU388_CLK <= '0';
   BU388_CE <= '0';
   BU388_ACLR <= '0';
   BU388_ASET <= '0';
   BU388_AINIT <= '0';
   BU388_SCLR <= '0';
   BU388_SSET <= '0';
   BU388_SINIT <= '0';
   n1137 <= BU388_O;
   BU388 : C_GATE_BIT_V7_0
      GENERIC MAP (
         c_has_aset => 0,
         c_gate_type => 4,
         c_sync_priority => 1,
         c_has_sclr => 0,
         c_enable_rlocs => 0,
         c_ainit_val => "0",
         c_pipe_stages => 0,
         c_has_ce => 0,
         c_has_aclr => 0,
         c_sync_enable => 0,
         c_has_ainit => 0,
         c_sinit_val => "0",
         c_has_sset => 0,
         c_has_sinit => 0,
         c_has_q => 1,
         c_has_o => 1,
         c_inputs => 4,
         c_input_inv_mask => "0000"
      )
      PORT MAP (
         I => BU388_I,
         T => BU388_T,
         EN => BU388_EN,
         Q => BU388_Q,
         CLK => BU388_CLK,
         CE => BU388_CE,
         ACLR => BU388_ACLR,
         ASET => BU388_ASET,
         AINIT => BU388_AINIT,
         SCLR => BU388_SCLR,
         SSET => BU388_SSET,
         SINIT => BU388_SINIT,
         O => BU388_O
      );

   BU393_CLK <= n118;
   BU393_SDIN <= n1137;
   n1138 <= BU393_Q(0);
   n1139 <= BU393_Q(2);
   n1140 <= BU393_Q(3);
   n1129 <= BU393_Q(5);
   n1130 <= BU393_Q(6);
   n1131 <= BU393_Q(7);
   n1132 <= BU393_Q(8);
   n1133 <= BU393_Q(9);
   n1134 <= BU393_Q(10);
   n1135 <= BU393_Q(11);
   n1136 <= BU393_Q(12);
   BU393 : C_SHIFT_FD_V7_0
      GENERIC MAP (
         c_has_aset => 0,
         c_has_d => 0,
         c_sync_priority => 0,
         c_has_sclr => 0,
         c_fill_data => 5,
         c_width => 13,
         c_enable_rlocs => 0,
         c_ainit_val => "1000000000000",
         c_has_ce => 0,
         c_has_aclr => 0,
         c_sync_enable => 0,
         c_has_ainit => 0,
         c_has_sdout => 0,
         c_sinit_val => "1000000000000",
         c_has_sset => 0,
         c_has_sinit => 0,
         c_has_q => 1,
         c_shift_type => 0,
         c_has_sdin => 1,
         c_has_lsb_2_msb => 0
      )
      PORT MAP (
         CLK => BU393_CLK,
         SDIN => BU393_SDIN,
         Q => BU393_Q
      );

   BU422_I(0) <= n1188;
   BU422_I(1) <= n1189;
   BU422_I(2) <= n1182;
   BU422_I(3) <= n1186;
   BU422_T <= '0';
   BU422_EN <= '0';
   BU422_CLK <= '0';
   BU422_CE <= '0';
   BU422_ACLR <= '0';
   BU422_ASET <= '0';
   BU422_AINIT <= '0';
   BU422_SCLR <= '0';
   BU422_SSET <= '0';
   BU422_SINIT <= '0';
   n1187 <= BU422_O;
   BU422 : C_GATE_BIT_V7_0
      GENERIC MAP (
         c_has_aset => 0,
         c_gate_type => 4,
         c_sync_priority => 1,
         c_has_sclr => 0,
         c_enable_rlocs => 0,
         c_ainit_val => "0",
         c_pipe_stages => 0,
         c_has_ce => 0,
         c_has_aclr => 0,
         c_sync_enable => 0,
         c_has_ainit => 0,
         c_sinit_val => "0",
         c_has_sset => 0,
         c_has_sinit => 0,
         c_has_q => 1,
         c_has_o => 1,
         c_inputs => 4,
         c_input_inv_mask => "0000"
      )
      PORT MAP (
         I => BU422_I,
         T => BU422_T,
         EN => BU422_EN,
         Q => BU422_Q,
         CLK => BU422_CLK,
         CE => BU422_CE,
         ACLR => BU422_ACLR,
         ASET => BU422_ASET,
         AINIT => BU422_AINIT,
         SCLR => BU422_SCLR,
         SSET => BU422_SSET,
         SINIT => BU422_SINIT,
         O => BU422_O
      );

   BU427_CLK <= n118;
   BU427_SDIN <= n1187;
   n1188 <= BU427_Q(0);
   n1189 <= BU427_Q(5);
   n1179 <= BU427_Q(6);
   n1180 <= BU427_Q(7);
   n1181 <= BU427_Q(8);
   n1182 <= BU427_Q(9);
   n1183 <= BU427_Q(10);
   n1184 <= BU427_Q(11);
   n1185 <= BU427_Q(12);
   n1186 <= BU427_Q(13);
   BU427 : C_SHIFT_FD_V7_0
      GENERIC MAP (
         c_has_aset => 0,
         c_has_d => 0,
         c_sync_priority => 0,
         c_has_sclr => 0,
         c_fill_data => 5,
         c_width => 14,
         c_enable_rlocs => 0,
         c_ainit_val => "10000000000000",
         c_has_ce => 0,
         c_has_aclr => 0,
         c_sync_enable => 0,
         c_has_ainit => 0,
         c_has_sdout => 0,
         c_sinit_val => "10000000000000",
         c_has_sset => 0,
         c_has_sinit => 0,
         c_has_q => 1,
         c_shift_type => 0,
         c_has_sdin => 1,
         c_has_lsb_2_msb => 0
      )
      PORT MAP (
         CLK => BU427_CLK,
         SDIN => BU427_SDIN,
         Q => BU427_Q
      );

   BU589_A(0) <= n1239;
   BU589_A(1) <= n1240;
   BU589_A(2) <= n1241;
   BU589_A(3) <= n1242;
   BU589_A(4) <= n1243;
   BU589_A(5) <= n1244;
   BU589_A(6) <= n1245;
   BU589_A(7) <= n1246;
   BU589_B(0) <= n1285;
   BU589_B(1) <= n1286;
   BU589_B(2) <= n1287;
   BU589_B(3) <= n1288;
   BU589_B(4) <= n1289;
   BU589_B(5) <= n1290;
   BU589_B(6) <= n1291;
   BU589_B(7) <= n1292;
   n1338 <= BU589_Q(0);
   n1339 <= BU589_Q(1);
   n1340 <= BU589_Q(2);
   n1341 <= BU589_Q(3);
   n1342 <= BU589_Q(4);
   n1343 <= BU589_Q(5);
   n1344 <= BU589_Q(6);
   n1345 <= BU589_Q(7);
   n1346 <= BU589_Q(8);
   BU589_CLK <= n118;
   BU589 : C_ADDSUB_V7_0
      GENERIC MAP (
         c_has_bypass_with_cin => 0,
         c_a_type => 0,
         c_has_sclr => 0,
         c_has_aset => 0,
         c_has_b_out => 0,
         c_sync_priority => 0,
         c_has_s => 1,
         c_has_q => 1,
         c_bypass_enable => 0,
         c_b_constant => 0,
         c_has_ovfl => 0,
         c_high_bit => 8,
         c_latency => 1,
         c_sinit_val => "000000000",
         c_has_bypass => 0,
         c_pipe_stages => 0,
         c_has_sset => 0,
         c_has_ainit => 0,
         c_has_a_signed => 0,
         c_has_q_c_out => 0,
         c_b_type => 0,
         c_has_add => 0,
         c_has_sinit => 0,
         c_has_b_in => 0,
         c_has_b_signed => 0,
         c_bypass_low => 0,
         c_enable_rlocs => 0,
         c_b_value => "000000000",
         c_add_mode => 0,
         c_has_aclr => 0,
         c_out_width => 9,
         c_low_bit => 0,
         c_ainit_val => "000000000",
         c_has_q_ovfl => 0,
         c_has_q_b_out => 0,
         c_has_c_out => 0,
         c_b_width => 8,
         c_a_width => 8,
         c_sync_enable => 0,
         c_has_ce => 0,
         c_has_c_in => 0
      )
      PORT MAP (
         A => BU589_A,
         B => BU589_B,
         Q => BU589_Q,
         CLK => BU589_CLK
      );

   BU512_I(0) <= n1248;
   BU512_I(1) <= n1246;
   BU512_T <= '0';
   BU512_EN <= '0';
   BU512_CLK <= '0';
   BU512_CE <= '0';
   BU512_ACLR <= '0';
   BU512_ASET <= '0';
   BU512_AINIT <= '0';
   BU512_SCLR <= '0';
   BU512_SSET <= '0';
   BU512_SINIT <= '0';
   n1247 <= BU512_O;
   BU512 : C_GATE_BIT_V7_0
      GENERIC MAP (
         c_has_aset => 0,
         c_gate_type => 4,
         c_sync_priority => 1,
         c_has_sclr => 0,
         c_enable_rlocs => 0,
         c_ainit_val => "0",
         c_pipe_stages => 0,
         c_has_ce => 0,
         c_has_aclr => 0,
         c_sync_enable => 0,
         c_has_ainit => 0,
         c_sinit_val => "0",
         c_has_sset => 0,
         c_has_sinit => 0,
         c_has_q => 1,
         c_has_o => 1,
         c_inputs => 2,
         c_input_inv_mask => "00"
      )
      PORT MAP (
         I => BU512_I,
         T => BU512_T,
         EN => BU512_EN,
         Q => BU512_Q,
         CLK => BU512_CLK,
         CE => BU512_CE,
         ACLR => BU512_ACLR,
         ASET => BU512_ASET,
         AINIT => BU512_AINIT,
         SCLR => BU512_SCLR,
         SSET => BU512_SSET,
         SINIT => BU512_SINIT,
         O => BU512_O
      );

   BU517_CLK <= n118;
   BU517_SDIN <= n1247;
   n1248 <= BU517_Q(0);
   n1239 <= BU517_Q(7);
   n1240 <= BU517_Q(8);
   n1241 <= BU517_Q(9);
   n1242 <= BU517_Q(10);
   n1243 <= BU517_Q(11);
   n1244 <= BU517_Q(12);
   n1245 <= BU517_Q(13);
   n1246 <= BU517_Q(14);
   BU517 : C_SHIFT_FD_V7_0
      GENERIC MAP (
         c_has_aset => 0,
         c_has_d => 0,
         c_sync_priority => 0,
         c_has_sclr => 0,
         c_fill_data => 5,
         c_width => 15,
         c_enable_rlocs => 0,
         c_ainit_val => "100000000000000",
         c_has_ce => 0,
         c_has_aclr => 0,
         c_sync_enable => 0,
         c_has_ainit => 0,
         c_has_sdout => 0,
         c_sinit_val => "100000000000000",
         c_has_sset => 0,
         c_has_sinit => 0,
         c_has_q => 1,
         c_shift_type => 0,
         c_has_sdin => 1,
         c_has_lsb_2_msb => 0
      )
      PORT MAP (
         CLK => BU517_CLK,
         SDIN => BU517_SDIN,
         Q => BU517_Q
      );

   BU550_I(0) <= n1294;
   BU550_I(1) <= n1295;
   BU550_I(2) <= n1288;
   BU550_I(3) <= n1292;
   BU550_T <= '0';
   BU550_EN <= '0';
   BU550_CLK <= '0';
   BU550_CE <= '0';
   BU550_ACLR <= '0';
   BU550_ASET <= '0';
   BU550_AINIT <= '0';
   BU550_SCLR <= '0';
   BU550_SSET <= '0';
   BU550_SINIT <= '0';
   n1293 <= BU550_O;
   BU550 : C_GATE_BIT_V7_0
      GENERIC MAP (
         c_has_aset => 0,
         c_gate_type => 4,
         c_sync_priority => 1,
         c_has_sclr => 0,
         c_enable_rlocs => 0,
         c_ainit_val => "0",
         c_pipe_stages => 0,
         c_has_ce => 0,
         c_has_aclr => 0,
         c_sync_enable => 0,
         c_has_ainit => 0,
         c_sinit_val => "0",
         c_has_sset => 0,
         c_has_sinit => 0,
         c_has_q => 1,
         c_has_o => 1,
         c_inputs => 4,
         c_input_inv_mask => "0000"
      )
      PORT MAP (
         I => BU550_I,
         T => BU550_T,
         EN => BU550_EN,
         Q => BU550_Q,
         CLK => BU550_CLK,
         CE => BU550_CE,
         ACLR => BU550_ACLR,
         ASET => BU550_ASET,
         AINIT => BU550_AINIT,
         SCLR => BU550_SCLR,
         SSET => BU550_SSET,
         SINIT => BU550_SINIT,
         O => BU550_O
      );

   BU555_CLK <= n118;
   BU555_SDIN <= n1293;
   n1294 <= BU555_Q(0);
   n1295 <= BU555_Q(2);
   n1285 <= BU555_Q(8);
   n1286 <= BU555_Q(9);
   n1287 <= BU555_Q(10);
   n1288 <= BU555_Q(11);
   n1289 <= BU555_Q(12);
   n1290 <= BU555_Q(13);
   n1291 <= BU555_Q(14);
   n1292 <= BU555_Q(15);
   BU555 : C_SHIFT_FD_V7_0
      GENERIC MAP (
         c_has_aset => 0,
         c_has_d => 0,
         c_sync_priority => 0,
         c_has_sclr => 0,
         c_fill_data => 5,
         c_width => 16,
         c_enable_rlocs => 0,
         c_ainit_val => "1000000000000000",
         c_has_ce => 0,
         c_has_aclr => 0,
         c_sync_enable => 0,
         c_has_ainit => 0,
         c_has_sdout => 0,
         c_sinit_val => "1000000000000000",
         c_has_sset => 0,
         c_has_sinit => 0,
         c_has_q => 1,
         c_shift_type => 0,
         c_has_sdin => 1,
         c_has_lsb_2_msb => 0
      )
      PORT MAP (
         CLK => BU555_CLK,
         SDIN => BU555_SDIN,
         Q => BU555_Q
      );

   BU841_D(0) <= n65;
   BU841_D(1) <= n66;
   BU841_D(2) <= n67;
   BU841_D(3) <= n68;
   BU841_D(4) <= n69;
   BU841_D(5) <= n70;
   BU841_D(6) <= n71;
   BU841_D(7) <= n72;
   BU841_D(8) <= n73;
   BU841_D(9) <= n74;
   BU841_D(10) <= n75;
   BU841_D(11) <= n76;
   n1974 <= BU841_Q(0);
   n1975 <= BU841_Q(1);
   n1976 <= BU841_Q(2);
   n1977 <= BU841_Q(3);
   n1978 <= BU841_Q(4);
   n1979 <= BU841_Q(5);
   n1980 <= BU841_Q(6);
   n1981 <= BU841_Q(7);
   n1982 <= BU841_Q(8);
   n1983 <= BU841_Q(9);
   n1984 <= BU841_Q(10);
   n1985 <= BU841_Q(11);
   BU841_CLK <= n118;
   BU841 : C_REG_FD_V7_0
      GENERIC MAP (
         c_width => 12,
         c_has_ce => 0,
         c_sinit_val => "000000000000",
         c_has_sinit => 0,
         c_ainit_val => "000000000000",
         c_has_aset => 0,
         c_sync_enable => 0,
         c_enable_rlocs => 0,
         c_has_aclr => 0,
         c_has_sset => 0,
         c_sync_priority => 0,
         c_has_ainit => 0,
         c_has_sclr => 0
      )
      PORT MAP (
         D => BU841_D,
         Q => BU841_Q,
         CLK => BU841_CLK
      );

   BU868_A(0) <= n1974;
   BU868_A(1) <= n1975;
   BU868_A(2) <= n1976;
   BU868_A(3) <= n1977;
   BU868_A(4) <= n1978;
   BU868_A(5) <= n1979;
   BU868_A(6) <= n1980;
   BU868_A(7) <= n1981;
   BU868_A(8) <= n1982;
   BU868_A(9) <= n1983;
   BU868_BYPASS <= n1984;
   BU868_CLK <= n118;
   n2008 <= BU868_Q(0);
   n2009 <= BU868_Q(1);
   n2010 <= BU868_Q(2);
   n2011 <= BU868_Q(3);
   n2012 <= BU868_Q(4);
   n2013 <= BU868_Q(5);
   n2014 <= BU868_Q(6);
   n2015 <= BU868_Q(7);
   n2016 <= BU868_Q(8);
   n2017 <= BU868_Q(9);
   BU868 : C_TWOS_COMP_V7_0
      GENERIC MAP (
         c_has_aset => 0,
         c_sync_priority => 0,
         c_has_sclr => 0,
         c_width => 10,
         c_enable_rlocs => 0,
         c_has_bypass => 1,
         c_ainit_val => "00000000000",
         c_bypass_low => 1,
         c_pipe_stages => 0,
         c_has_ce => 0,
         c_has_aclr => 0,
         c_sync_enable => 0,
         c_has_ainit => 0,
         c_sinit_val => "00000000000",
         c_has_sset => 0,
         c_has_sinit => 0,
         c_has_s => 0,
         c_bypass_enable => 1,
         c_has_q => 1
      )
      PORT MAP (
         A => BU868_A,
         BYPASS => BU868_BYPASS,
         CLK => BU868_CLK,
         Q => BU868_Q
      );

   BU947_CLK <= n118;
   BU947_D(0) <= n1985;
   n1986 <= BU947_Q(0);
   BU947 : C_SHIFT_RAM_V7_0
      GENERIC MAP (
         c_has_aset => 0,
         c_read_mif => 0,
         c_has_a => 0,
         c_sync_priority => 0,
         c_has_sclr => 0,
         c_width => 1,
         c_enable_rlocs => 0,
         c_default_data_radix => 2,
         c_generate_mif => 0,
         c_ainit_val => "0",
         c_has_ce => 0,
         c_has_aclr => 0,
         c_mem_init_radix => 2,
         c_sync_enable => 0,
         c_depth => 2,
         c_has_ainit => 0,
         c_sinit_val => "0",
         c_has_sset => 0,
         c_has_sinit => 0,
         c_shift_type => 0,
         c_mem_init_file => "null",
         c_default_data => "0",
         c_reg_last_bit => 1,
         c_addr_width => 1
      )
      PORT MAP (
         CLK => BU947_CLK,
         D => BU947_D,
         Q => BU947_Q
      );

   BU955_CLK <= n118;
   BU955_D(0) <= n1984;
   n1987 <= BU955_Q(0);
   BU955 : C_SHIFT_RAM_V7_0
      GENERIC MAP (
         c_has_aset => 0,
         c_read_mif => 0,
         c_has_a => 0,
         c_sync_priority => 0,
         c_has_sclr => 0,
         c_width => 1,
         c_enable_rlocs => 0,
         c_default_data_radix => 2,
         c_generate_mif => 0,
         c_ainit_val => "0",
         c_has_ce => 0,
         c_has_aclr => 0,
         c_mem_init_radix => 2,
         c_sync_enable => 0,
         c_depth => 2,
         c_has_ainit => 0,
         c_sinit_val => "0",
         c_has_sset => 0,
         c_has_sinit => 0,
         c_shift_type => 0,
         c_mem_init_file => "null",
         c_default_data => "0",
         c_reg_last_bit => 1,
         c_addr_width => 1
      )
      PORT MAP (
         CLK => BU955_CLK,
         D => BU955_D,
         Q => BU955_Q
      );

   BU966_I0 <= n1986;
   BU966_I1 <= n1987;
   BU966_I2 <= n2022;
   BU966_I3 <= '0';
   n2271 <= BU966_O;
   BU966 : LUT4
      GENERIC MAP (
         INIT  => X"9595"
      )
      PORT MAP (
         I0 => BU966_I0,
         I1 => BU966_I1,
         I2 => BU966_I2,
         I3 => BU966_I3,
         O => BU966_O
      );

   BU967_D <= n2271;
   BU967_C <= n118;
   BU967_CE <= '1';
   BU967_PRE <= '0';
   n2024 <= BU967_Q;
   BU967 : FDPE
      PORT MAP (
         D => BU967_D,
         C => BU967_C,
         CE => BU967_CE,
         PRE => BU967_PRE,
         Q => BU967_Q
      );

   BU971_I0 <= n1986;
   BU971_I1 <= n1987;
   BU971_I2 <= n2022;
   BU971_I3 <= n2023;
   n2288 <= BU971_O;
   BU971 : LUT4
      GENERIC MAP (
         INIT  => X"002a"
      )
      PORT MAP (
         I0 => BU971_I0,
         I1 => BU971_I1,
         I2 => BU971_I2,
         I3 => BU971_I3,
         O => BU971_O
      );

   BU972_D <= n2288;
   BU972_C <= n118;
   BU972_CE <= '1';
   n2025 <= BU972_Q;
   BU972 : FDE
      PORT MAP (
         D => BU972_D,
         C => BU972_C,
         CE => BU972_CE,
         Q => BU972_Q
      );

   BU976_I0 <= '0';
   BU976_I1 <= n1987;
   BU976_I2 <= n2022;
   BU976_I3 <= '0';
   n2304 <= BU976_O;
   BU976 : LUT4
      GENERIC MAP (
         INIT  => X"c0c0"
      )
      PORT MAP (
         I0 => BU976_I0,
         I1 => BU976_I1,
         I2 => BU976_I2,
         I3 => BU976_I3,
         O => BU976_O
      );

   BU977_D <= n2304;
   BU977_C <= n118;
   BU977_CE <= '1';
   n2021 <= BU977_Q;
   BU977 : FDE
      PORT MAP (
         D => BU977_D,
         C => BU977_C,
         CE => BU977_CE,
         Q => BU977_Q
      );

   BU979_A(0) <= n2008;
   BU979_A(1) <= n2009;
   BU979_A(2) <= n2010;
   BU979_A(3) <= n2011;
   BU979_A(4) <= n2012;
   BU979_A(5) <= n2013;
   BU979_A(6) <= n2014;
   BU979_A(7) <= n2015;
   BU979_A(8) <= n2016;
   BU979_A(9) <= n2017;
   BU979_CLK <= n118;
   BU979_ACLR <= '0';
   n2023 <= BU979_QA_GE_B;
   BU979 : C_COMPARE_V7_0
      GENERIC MAP (
         c_has_qa_ge_b => 1,
         c_has_aset => 0,
         c_has_qa_ne_b => 0,
         c_has_qa_lt_b => 0,
         c_has_a_gt_b => 0,
         c_has_a_eq_b => 0,
         c_data_type => 1,
         c_sync_priority => 0,
         c_has_sclr => 0,
         c_has_qa_gt_b => 0,
         c_width => 10,
         c_has_qa_eq_b => 0,
         c_enable_rlocs => 0,
         c_ainit_val => "0",
         c_has_a_le_b => 0,
         c_has_ce => 0,
         c_pipe_stages => 0,
         c_has_aclr => 1,
         c_sync_enable => 0,
         c_has_sset => 0,
         c_has_qa_le_b => 0,
         c_b_constant => 1,
         c_has_a_ge_b => 0,
         c_has_a_ne_b => 0,
         c_has_a_lt_b => 0,
         c_b_value => "1111111001"
      )
      PORT MAP (
         A => BU979_A,
         CLK => BU979_CLK,
         ACLR => BU979_ACLR,
         QA_GE_B => BU979_QA_GE_B
      );

   BU1015_A(0) <= n2008;
   BU1015_A(1) <= n2009;
   BU1015_A(2) <= n2010;
   BU1015_A(3) <= n2011;
   BU1015_A(4) <= n2012;
   BU1015_A(5) <= n2013;
   BU1015_A(6) <= n2014;
   BU1015_A(7) <= n2015;
   BU1015_A(8) <= n2016;
   BU1015_A(9) <= n2017;
   BU1015_CLK <= n118;
   BU1015_ACLR <= '0';
   n2022 <= BU1015_QA_EQ_B;
   BU1015 : C_COMPARE_V7_0
      GENERIC MAP (
         c_has_qa_ge_b => 0,
         c_has_aset => 0,
         c_has_qa_ne_b => 0,
         c_has_qa_lt_b => 0,
         c_has_a_gt_b => 0,
         c_has_a_eq_b => 0,
         c_data_type => 1,
         c_sync_priority => 0,
         c_has_sclr => 0,
         c_has_qa_gt_b => 0,
         c_width => 10,
         c_has_qa_eq_b => 1,
         c_enable_rlocs => 0,
         c_ainit_val => "0",
         c_has_a_le_b => 0,
         c_has_ce => 0,
         c_pipe_stages => 0,
         c_has_aclr => 1,
         c_sync_enable => 0,
         c_has_sset => 0,
         c_has_qa_le_b => 0,
         c_b_constant => 1,
         c_has_a_ge_b => 0,
         c_has_a_ne_b => 0,
         c_has_a_lt_b => 0,
         c_b_value => "0000000000"
      )
      PORT MAP (
         A => BU1015_A,
         CLK => BU1015_CLK,
         ACLR => BU1015_ACLR,
         QA_EQ_B => BU1015_QA_EQ_B
      );

   BU806_addr(9) <= n2017;
   BU806_addr(8) <= n2016;
   BU806_addr(7) <= n2015;
   BU806_addr(6) <= n2014;
   BU806_addr(5) <= n2013;
   BU806_addr(4) <= n2012;
   BU806_addr(3) <= n2011;
   BU806_addr(2) <= n2010;
   BU806_addr(1) <= n2009;
   BU806_addr(0) <= n2008;
   BU806_clk <= n118;
   BU806_din(12) <= '0';
   BU806_din(11) <= '0';
   BU806_din(10) <= '0';
   BU806_din(9) <= '0';
   BU806_din(8) <= '0';
   BU806_din(7) <= '0';
   BU806_din(6) <= '0';
   BU806_din(5) <= '0';
   BU806_din(4) <= '0';
   BU806_din(3) <= '0';
   BU806_din(2) <= '0';
   BU806_din(1) <= '0';
   BU806_din(0) <= '0';
   n2038 <= BU806_dout(12);
   n2037 <= BU806_dout(11);
   n2036 <= BU806_dout(10);
   n2035 <= BU806_dout(9);
   n2034 <= BU806_dout(8);
   n2033 <= BU806_dout(7);
   n2032 <= BU806_dout(6);
   n2031 <= BU806_dout(5);
   n2030 <= BU806_dout(4);
   n2029 <= BU806_dout(3);
   n2028 <= BU806_dout(2);
   n2027 <= BU806_dout(1);
   n2026 <= BU806_dout(0);
   BU806_en <= '0';
   BU806_nd <= '0';
   BU806_sinit <= '0';
   BU806_we <= '0';
   BU806 : blkmemsp_v6_0
      GENERIC MAP (
         c_sinit_value => "0000000000000000000",
         c_yclk_is_rising => 1,
         c_reg_inputs => 0,
         c_has_en => 0,
         c_ywe_is_high => 1,
         c_ysinit_is_high => 1,
         c_ytop_addr => "1024",
         c_yprimitive_type => "4kx4",
         c_yhierarchy => "hierarchy1",
         c_has_rdy => 0,
         c_has_limit_data_pitch => 0,
         c_write_mode => 0,
         c_width => 13,
         c_yuse_single_primitive => 0,
         c_has_nd => 0,
         c_enable_rlocs => 0,
         c_has_we => 0,
         c_has_rfd => 0,
         c_has_din => 0,
         c_ybottom_addr => "0",
         c_yen_is_high => 1,
         c_pipe_stages => 1,
         c_depth => 1024,
         c_has_default_data => 0,
         c_limit_data_pitch => 18,
         c_has_sinit => 0,
         c_yydisable_warnings => 1,
         c_mem_init_file => "DDS_10_VII_SINCOS_TABLE_TRIG_ROM.mif",
         c_default_data => "0000000000000000000",
         c_ymake_bmm => 0,
         c_addr_width => 10
      )
      PORT MAP (
         addr => BU806_addr,
         clk => BU806_clk,
         din => BU806_din,
         dout => BU806_dout,
         en => BU806_en,
         nd => BU806_nd,
         rfd => BU806_rfd,
         rdy => BU806_rdy,
         sinit => BU806_sinit,
         we => BU806_we
      );

   BU1031_A(0) <= '0';
   BU1031_A(1) <= '0';
   BU1031_A(2) <= '0';
   BU1031_A(3) <= '0';
   BU1031_A(4) <= '0';
   BU1031_A(5) <= '0';
   BU1031_A(6) <= '0';
   BU1031_A(7) <= '0';
   BU1031_A(8) <= '0';
   BU1031_A(9) <= '0';
   BU1031_A(10) <= '0';
   BU1031_A(11) <= '0';
   BU1031_A(12) <= '0';
   BU1031_A(13) <= '0';
   BU1031_B(0) <= n2026;
   BU1031_B(1) <= n2027;
   BU1031_B(2) <= n2028;
   BU1031_B(3) <= n2029;
   BU1031_B(4) <= n2030;
   BU1031_B(5) <= n2031;
   BU1031_B(6) <= n2032;
   BU1031_B(7) <= n2033;
   BU1031_B(8) <= n2034;
   BU1031_B(9) <= n2035;
   BU1031_B(10) <= n2036;
   BU1031_B(11) <= n2037;
   BU1031_B(12) <= n2038;
   BU1031_B(13) <= n2021;
   BU1031_C_IN <= n2025;
   BU1031_ADD <= n2024;
   n119 <= BU1031_Q(0);
   n120 <= BU1031_Q(1);
   n121 <= BU1031_Q(2);
   n122 <= BU1031_Q(3);
   n123 <= BU1031_Q(4);
   n124 <= BU1031_Q(5);
   n125 <= BU1031_Q(6);
   n126 <= BU1031_Q(7);
   n127 <= BU1031_Q(8);
   n128 <= BU1031_Q(9);
   n129 <= BU1031_Q(10);
   n130 <= BU1031_Q(11);
   n131 <= BU1031_Q(12);
   n132 <= BU1031_Q(13);
   BU1031_CLK <= n118;
   BU1031_CE <= n2053;
   BU1031 : C_ADDSUB_V7_0
      GENERIC MAP (
         c_has_bypass_with_cin => 0,
         c_a_type => 1,
         c_has_sclr => 0,
         c_has_aset => 0,
         c_has_b_out => 0,
         c_sync_priority => 0,
         c_has_s => 1,
         c_has_q => 1,
         c_bypass_enable => 1,
         c_b_constant => 0,
         c_has_ovfl => 0,
         c_high_bit => 13,
         c_latency => 1,
         c_sinit_val => "00000000000000",
         c_has_bypass => 0,
         c_pipe_stages => 0,
         c_has_sset => 0,
         c_has_ainit => 0,
         c_has_a_signed => 0,
         c_has_q_c_out => 0,
         c_b_type => 1,
         c_has_add => 1,
         c_has_sinit => 0,
         c_has_b_in => 0,
         c_has_b_signed => 0,
         c_bypass_low => 0,
         c_enable_rlocs => 0,
         c_b_value => "00000000000000",
         c_add_mode => 2,
         c_has_aclr => 0,
         c_out_width => 14,
         c_low_bit => 0,
         c_ainit_val => "00000000000000",
         c_has_q_ovfl => 0,
         c_has_q_b_out => 0,
         c_has_c_out => 0,
         c_b_width => 14,
         c_a_width => 14,
         c_sync_enable => 0,
         c_has_ce => 1,
         c_has_c_in => 1
      )
      PORT MAP (
         A => BU1031_A,
         B => BU1031_B,
         C_IN => BU1031_C_IN,
         ADD => BU1031_ADD,
         Q => BU1031_Q,
         CLK => BU1031_CLK,
         CE => BU1031_CE
      );

   BU1116_CLK <= n118;
   BU1116_SDIN <= n64;
   n2053 <= BU1116_SDOUT;
   BU1116 : C_SHIFT_FD_V7_0
      GENERIC MAP (
         c_has_aset => 0,
         c_has_d => 0,
         c_sync_priority => 0,
         c_has_sclr => 0,
         c_fill_data => 5,
         c_width => 4,
         c_enable_rlocs => 0,
         c_ainit_val => "0000",
         c_has_ce => 0,
         c_has_aclr => 0,
         c_sync_enable => 0,
         c_has_ainit => 0,
         c_has_sdout => 1,
         c_sinit_val => "0000",
         c_has_sset => 0,
         c_has_sinit => 0,
         c_has_q => 0,
         c_shift_type => 1,
         c_has_sdin => 1,
         c_has_lsb_2_msb => 0
      )
      PORT MAP (
         CLK => BU1116_CLK,
         SDIN => BU1116_SDIN,
         SDOUT => BU1116_SDOUT
      );


END xilinx;


-- synthesis translate_on
