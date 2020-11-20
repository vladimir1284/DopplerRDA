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

ENTITY DDSV IS
   PORT (
      DATA : IN STD_LOGIC_VECTOR(27 DOWNTO 0);
      WE : IN STD_LOGIC;
      A : IN STD_LOGIC_VECTOR(4 DOWNTO 0);
      CLK : IN STD_LOGIC;
      SINE : OUT STD_LOGIC_VECTOR(12 DOWNTO 0)   
);
END DDSV;

ARCHITECTURE xilinx OF DDSV IS 

-- Signals for connecting to instantiations
   SIGNAL BU2_I : STD_LOGIC_VECTOR(5 DOWNTO 0);
   SIGNAL BU2_T : STD_LOGIC;
   SIGNAL BU2_EN : STD_LOGIC;
   SIGNAL BU2_Q : STD_LOGIC;
   SIGNAL BU2_CLK : STD_LOGIC;
   SIGNAL BU2_CE : STD_LOGIC;
   SIGNAL BU2_ACLR : STD_LOGIC;
   SIGNAL BU2_ASET : STD_LOGIC;
   SIGNAL BU2_AINIT : STD_LOGIC;
   SIGNAL BU2_SCLR : STD_LOGIC;
   SIGNAL BU2_SSET : STD_LOGIC;
   SIGNAL BU2_SINIT : STD_LOGIC;
   SIGNAL BU2_O : STD_LOGIC;
   SIGNAL BU12_D : STD_LOGIC_VECTOR(27 DOWNTO 0);
   SIGNAL BU12_Q : STD_LOGIC_VECTOR(27 DOWNTO 0);
   SIGNAL BU12_CLK : STD_LOGIC;
   SIGNAL BU12_CE : STD_LOGIC;
   SIGNAL BU70_A : STD_LOGIC_VECTOR(27 DOWNTO 0);
   SIGNAL BU70_B : STD_LOGIC_VECTOR(27 DOWNTO 0);
   SIGNAL BU70_Q : STD_LOGIC_VECTOR(27 DOWNTO 0);
   SIGNAL BU70_CLK : STD_LOGIC;
   SIGNAL BU238_CLK : STD_LOGIC;
   SIGNAL BU238_SDOUT : STD_LOGIC;
   SIGNAL BU247_A : STD_LOGIC_VECTOR(27 DOWNTO 0);
   SIGNAL BU247_Q : STD_LOGIC_VECTOR(27 DOWNTO 0);
   SIGNAL BU247_CLK : STD_LOGIC;
   SIGNAL BU734_A : STD_LOGIC_VECTOR(19 DOWNTO 0);
   SIGNAL BU734_B : STD_LOGIC_VECTOR(9 DOWNTO 0);
   SIGNAL BU734_Q : STD_LOGIC_VECTOR(10 DOWNTO 0);
   SIGNAL BU734_CLK : STD_LOGIC;
   SIGNAL BU673_A : STD_LOGIC_VECTOR(8 DOWNTO 0);
   SIGNAL BU673_B : STD_LOGIC_VECTOR(8 DOWNTO 0);
   SIGNAL BU673_Q : STD_LOGIC_VECTOR(9 DOWNTO 0);
   SIGNAL BU673_CLK : STD_LOGIC;
   SIGNAL BU487_A : STD_LOGIC_VECTOR(7 DOWNTO 0);
   SIGNAL BU487_B : STD_LOGIC_VECTOR(7 DOWNTO 0);
   SIGNAL BU487_Q : STD_LOGIC_VECTOR(8 DOWNTO 0);
   SIGNAL BU487_CLK : STD_LOGIC;
   SIGNAL BU418_I : STD_LOGIC_VECTOR(3 DOWNTO 0);
   SIGNAL BU418_T : STD_LOGIC;
   SIGNAL BU418_EN : STD_LOGIC;
   SIGNAL BU418_Q : STD_LOGIC;
   SIGNAL BU418_CLK : STD_LOGIC;
   SIGNAL BU418_CE : STD_LOGIC;
   SIGNAL BU418_ACLR : STD_LOGIC;
   SIGNAL BU418_ASET : STD_LOGIC;
   SIGNAL BU418_AINIT : STD_LOGIC;
   SIGNAL BU418_SCLR : STD_LOGIC;
   SIGNAL BU418_SSET : STD_LOGIC;
   SIGNAL BU418_SINIT : STD_LOGIC;
   SIGNAL BU418_O : STD_LOGIC;
   SIGNAL BU423_CLK : STD_LOGIC;
   SIGNAL BU423_SDIN : STD_LOGIC;
   SIGNAL BU423_Q : STD_LOGIC_VECTOR(12 DOWNTO 0);
   SIGNAL BU452_I : STD_LOGIC_VECTOR(3 DOWNTO 0);
   SIGNAL BU452_T : STD_LOGIC;
   SIGNAL BU452_EN : STD_LOGIC;
   SIGNAL BU452_Q : STD_LOGIC;
   SIGNAL BU452_CLK : STD_LOGIC;
   SIGNAL BU452_CE : STD_LOGIC;
   SIGNAL BU452_ACLR : STD_LOGIC;
   SIGNAL BU452_ASET : STD_LOGIC;
   SIGNAL BU452_AINIT : STD_LOGIC;
   SIGNAL BU452_SCLR : STD_LOGIC;
   SIGNAL BU452_SSET : STD_LOGIC;
   SIGNAL BU452_SINIT : STD_LOGIC;
   SIGNAL BU452_O : STD_LOGIC;
   SIGNAL BU457_CLK : STD_LOGIC;
   SIGNAL BU457_SDIN : STD_LOGIC;
   SIGNAL BU457_Q : STD_LOGIC_VECTOR(13 DOWNTO 0);
   SIGNAL BU619_A : STD_LOGIC_VECTOR(7 DOWNTO 0);
   SIGNAL BU619_B : STD_LOGIC_VECTOR(7 DOWNTO 0);
   SIGNAL BU619_Q : STD_LOGIC_VECTOR(8 DOWNTO 0);
   SIGNAL BU619_CLK : STD_LOGIC;
   SIGNAL BU542_I : STD_LOGIC_VECTOR(1 DOWNTO 0);
   SIGNAL BU542_T : STD_LOGIC;
   SIGNAL BU542_EN : STD_LOGIC;
   SIGNAL BU542_Q : STD_LOGIC;
   SIGNAL BU542_CLK : STD_LOGIC;
   SIGNAL BU542_CE : STD_LOGIC;
   SIGNAL BU542_ACLR : STD_LOGIC;
   SIGNAL BU542_ASET : STD_LOGIC;
   SIGNAL BU542_AINIT : STD_LOGIC;
   SIGNAL BU542_SCLR : STD_LOGIC;
   SIGNAL BU542_SSET : STD_LOGIC;
   SIGNAL BU542_SINIT : STD_LOGIC;
   SIGNAL BU542_O : STD_LOGIC;
   SIGNAL BU547_CLK : STD_LOGIC;
   SIGNAL BU547_SDIN : STD_LOGIC;
   SIGNAL BU547_Q : STD_LOGIC_VECTOR(14 DOWNTO 0);
   SIGNAL BU580_I : STD_LOGIC_VECTOR(3 DOWNTO 0);
   SIGNAL BU580_T : STD_LOGIC;
   SIGNAL BU580_EN : STD_LOGIC;
   SIGNAL BU580_Q : STD_LOGIC;
   SIGNAL BU580_CLK : STD_LOGIC;
   SIGNAL BU580_CE : STD_LOGIC;
   SIGNAL BU580_ACLR : STD_LOGIC;
   SIGNAL BU580_ASET : STD_LOGIC;
   SIGNAL BU580_AINIT : STD_LOGIC;
   SIGNAL BU580_SCLR : STD_LOGIC;
   SIGNAL BU580_SSET : STD_LOGIC;
   SIGNAL BU580_SINIT : STD_LOGIC;
   SIGNAL BU580_O : STD_LOGIC;
   SIGNAL BU585_CLK : STD_LOGIC;
   SIGNAL BU585_SDIN : STD_LOGIC;
   SIGNAL BU585_Q : STD_LOGIC_VECTOR(15 DOWNTO 0);
   SIGNAL BU863_D : STD_LOGIC_VECTOR(10 DOWNTO 0);
   SIGNAL BU863_Q : STD_LOGIC_VECTOR(10 DOWNTO 0);
   SIGNAL BU863_CLK : STD_LOGIC;
   SIGNAL BU888_A : STD_LOGIC_VECTOR(8 DOWNTO 0);
   SIGNAL BU888_BYPASS : STD_LOGIC;
   SIGNAL BU888_CLK : STD_LOGIC;
   SIGNAL BU888_Q : STD_LOGIC_VECTOR(9 DOWNTO 0);
   SIGNAL BU960_CLK : STD_LOGIC;
   SIGNAL BU960_D : STD_LOGIC_VECTOR(0 DOWNTO 0);
   SIGNAL BU960_Q : STD_LOGIC_VECTOR(0 DOWNTO 0);
   SIGNAL BU968_CLK : STD_LOGIC;
   SIGNAL BU968_D : STD_LOGIC_VECTOR(0 DOWNTO 0);
   SIGNAL BU968_Q : STD_LOGIC_VECTOR(0 DOWNTO 0);
   SIGNAL BU979_I0 : STD_LOGIC;
   SIGNAL BU979_I1 : STD_LOGIC;
   SIGNAL BU979_I2 : STD_LOGIC;
   SIGNAL BU979_I3 : STD_LOGIC;
   SIGNAL BU979_O : STD_LOGIC;
   SIGNAL BU980_D : STD_LOGIC;
   SIGNAL BU980_C : STD_LOGIC;
   SIGNAL BU980_CE : STD_LOGIC;
   SIGNAL BU980_PRE : STD_LOGIC;
   SIGNAL BU980_Q : STD_LOGIC;
   SIGNAL BU984_I0 : STD_LOGIC;
   SIGNAL BU984_I1 : STD_LOGIC;
   SIGNAL BU984_I2 : STD_LOGIC;
   SIGNAL BU984_I3 : STD_LOGIC;
   SIGNAL BU984_O : STD_LOGIC;
   SIGNAL BU985_D : STD_LOGIC;
   SIGNAL BU985_C : STD_LOGIC;
   SIGNAL BU985_CE : STD_LOGIC;
   SIGNAL BU985_Q : STD_LOGIC;
   SIGNAL BU989_I0 : STD_LOGIC;
   SIGNAL BU989_I1 : STD_LOGIC;
   SIGNAL BU989_I2 : STD_LOGIC;
   SIGNAL BU989_I3 : STD_LOGIC;
   SIGNAL BU989_O : STD_LOGIC;
   SIGNAL BU990_D : STD_LOGIC;
   SIGNAL BU990_C : STD_LOGIC;
   SIGNAL BU990_CE : STD_LOGIC;
   SIGNAL BU990_Q : STD_LOGIC;
   SIGNAL BU992_A : STD_LOGIC_VECTOR(8 DOWNTO 0);
   SIGNAL BU992_CLK : STD_LOGIC;
   SIGNAL BU992_ACLR : STD_LOGIC;
   SIGNAL BU992_QA_GE_B : STD_LOGIC;
   SIGNAL BU1025_A : STD_LOGIC_VECTOR(8 DOWNTO 0);
   SIGNAL BU1025_CLK : STD_LOGIC;
   SIGNAL BU1025_ACLR : STD_LOGIC;
   SIGNAL BU1025_QA_EQ_B : STD_LOGIC;
   SIGNAL BU830_addr : STD_LOGIC_VECTOR(8 DOWNTO 0);
   SIGNAL BU830_clk : STD_LOGIC;
   SIGNAL BU830_din : STD_LOGIC_VECTOR(11 DOWNTO 0);
   SIGNAL BU830_dout : STD_LOGIC_VECTOR(11 DOWNTO 0);
   SIGNAL BU830_en : STD_LOGIC;
   SIGNAL BU830_nd : STD_LOGIC;
   SIGNAL BU830_rfd : STD_LOGIC;
   SIGNAL BU830_rdy : STD_LOGIC;
   SIGNAL BU830_sinit : STD_LOGIC;
   SIGNAL BU830_we : STD_LOGIC;
   SIGNAL BU1041_A : STD_LOGIC_VECTOR(12 DOWNTO 0);
   SIGNAL BU1041_B : STD_LOGIC_VECTOR(12 DOWNTO 0);
   SIGNAL BU1041_C_IN : STD_LOGIC;
   SIGNAL BU1041_ADD : STD_LOGIC;
   SIGNAL BU1041_Q : STD_LOGIC_VECTOR(12 DOWNTO 0);
   SIGNAL BU1041_CLK : STD_LOGIC;
   SIGNAL BU1041_CE : STD_LOGIC;
   SIGNAL BU1120_CLK : STD_LOGIC;
   SIGNAL BU1120_SDIN : STD_LOGIC;
   SIGNAL BU1120_SDOUT : STD_LOGIC;
   SIGNAL n0 : STD_LOGIC := '0';
   SIGNAL n1 : STD_LOGIC := '1';
   SIGNAL n2 : STD_LOGIC;
   SIGNAL n3 : STD_LOGIC;
   SIGNAL n4 : STD_LOGIC;
   SIGNAL n5 : STD_LOGIC;
   SIGNAL n6 : STD_LOGIC;
   SIGNAL n7 : STD_LOGIC;
   SIGNAL n8 : STD_LOGIC;
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
   SIGNAL n33 : STD_LOGIC;
   SIGNAL n34 : STD_LOGIC;
   SIGNAL n35 : STD_LOGIC;
   SIGNAL n36 : STD_LOGIC;
   SIGNAL n37 : STD_LOGIC;
   SIGNAL n38 : STD_LOGIC;
   SIGNAL n39 : STD_LOGIC;
   SIGNAL n40 : STD_LOGIC;
   SIGNAL n41 : STD_LOGIC;
   SIGNAL n42 : STD_LOGIC;
   SIGNAL n43 : STD_LOGIC;
   SIGNAL n44 : STD_LOGIC;
   SIGNAL n45 : STD_LOGIC;
   SIGNAL n46 : STD_LOGIC;
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
   SIGNAL n87 : STD_LOGIC;
   SIGNAL n88 : STD_LOGIC;
   SIGNAL n89 : STD_LOGIC;
   SIGNAL n90 : STD_LOGIC;
   SIGNAL n91 : STD_LOGIC;
   SIGNAL n92 : STD_LOGIC;
   SIGNAL n93 : STD_LOGIC;
   SIGNAL n94 : STD_LOGIC;
   SIGNAL n95 : STD_LOGIC;
   SIGNAL n96 : STD_LOGIC;
   SIGNAL n127 : STD_LOGIC;
   SIGNAL n128 : STD_LOGIC;
   SIGNAL n129 : STD_LOGIC;
   SIGNAL n130 : STD_LOGIC;
   SIGNAL n131 : STD_LOGIC;
   SIGNAL n132 : STD_LOGIC;
   SIGNAL n133 : STD_LOGIC;
   SIGNAL n134 : STD_LOGIC;
   SIGNAL n135 : STD_LOGIC;
   SIGNAL n136 : STD_LOGIC;
   SIGNAL n137 : STD_LOGIC;
   SIGNAL n138 : STD_LOGIC;
   SIGNAL n139 : STD_LOGIC;
   SIGNAL n140 : STD_LOGIC;
   SIGNAL n141 : STD_LOGIC;
   SIGNAL n142 : STD_LOGIC;
   SIGNAL n143 : STD_LOGIC;
   SIGNAL n144 : STD_LOGIC;
   SIGNAL n145 : STD_LOGIC;
   SIGNAL n146 : STD_LOGIC;
   SIGNAL n147 : STD_LOGIC;
   SIGNAL n148 : STD_LOGIC;
   SIGNAL n149 : STD_LOGIC;
   SIGNAL n150 : STD_LOGIC;
   SIGNAL n151 : STD_LOGIC;
   SIGNAL n152 : STD_LOGIC;
   SIGNAL n153 : STD_LOGIC;
   SIGNAL n154 : STD_LOGIC;
   SIGNAL n161 : STD_LOGIC;
   SIGNAL n162 : STD_LOGIC;
   SIGNAL n163 : STD_LOGIC;
   SIGNAL n164 : STD_LOGIC;
   SIGNAL n165 : STD_LOGIC;
   SIGNAL n166 : STD_LOGIC;
   SIGNAL n167 : STD_LOGIC;
   SIGNAL n168 : STD_LOGIC;
   SIGNAL n169 : STD_LOGIC;
   SIGNAL n170 : STD_LOGIC;
   SIGNAL n171 : STD_LOGIC;
   SIGNAL n172 : STD_LOGIC;
   SIGNAL n173 : STD_LOGIC;
   SIGNAL n174 : STD_LOGIC;
   SIGNAL n227 : STD_LOGIC;
   SIGNAL n228 : STD_LOGIC;
   SIGNAL n229 : STD_LOGIC;
   SIGNAL n230 : STD_LOGIC;
   SIGNAL n231 : STD_LOGIC;
   SIGNAL n232 : STD_LOGIC;
   SIGNAL n233 : STD_LOGIC;
   SIGNAL n234 : STD_LOGIC;
   SIGNAL n235 : STD_LOGIC;
   SIGNAL n236 : STD_LOGIC;
   SIGNAL n237 : STD_LOGIC;
   SIGNAL n238 : STD_LOGIC;
   SIGNAL n239 : STD_LOGIC;
   SIGNAL n240 : STD_LOGIC;
   SIGNAL n241 : STD_LOGIC;
   SIGNAL n242 : STD_LOGIC;
   SIGNAL n243 : STD_LOGIC;
   SIGNAL n244 : STD_LOGIC;
   SIGNAL n245 : STD_LOGIC;
   SIGNAL n246 : STD_LOGIC;
   SIGNAL n247 : STD_LOGIC;
   SIGNAL n248 : STD_LOGIC;
   SIGNAL n249 : STD_LOGIC;
   SIGNAL n250 : STD_LOGIC;
   SIGNAL n251 : STD_LOGIC;
   SIGNAL n252 : STD_LOGIC;
   SIGNAL n253 : STD_LOGIC;
   SIGNAL n254 : STD_LOGIC;
   SIGNAL n1422 : STD_LOGIC;
   SIGNAL n1423 : STD_LOGIC;
   SIGNAL n1424 : STD_LOGIC;
   SIGNAL n1425 : STD_LOGIC;
   SIGNAL n1426 : STD_LOGIC;
   SIGNAL n1427 : STD_LOGIC;
   SIGNAL n1428 : STD_LOGIC;
   SIGNAL n1429 : STD_LOGIC;
   SIGNAL n1430 : STD_LOGIC;
   SIGNAL n1431 : STD_LOGIC;
   SIGNAL n1432 : STD_LOGIC;
   SIGNAL n1433 : STD_LOGIC;
   SIGNAL n1472 : STD_LOGIC;
   SIGNAL n1473 : STD_LOGIC;
   SIGNAL n1474 : STD_LOGIC;
   SIGNAL n1475 : STD_LOGIC;
   SIGNAL n1476 : STD_LOGIC;
   SIGNAL n1477 : STD_LOGIC;
   SIGNAL n1478 : STD_LOGIC;
   SIGNAL n1479 : STD_LOGIC;
   SIGNAL n1480 : STD_LOGIC;
   SIGNAL n1481 : STD_LOGIC;
   SIGNAL n1482 : STD_LOGIC;
   SIGNAL n1523 : STD_LOGIC;
   SIGNAL n1524 : STD_LOGIC;
   SIGNAL n1525 : STD_LOGIC;
   SIGNAL n1526 : STD_LOGIC;
   SIGNAL n1527 : STD_LOGIC;
   SIGNAL n1528 : STD_LOGIC;
   SIGNAL n1529 : STD_LOGIC;
   SIGNAL n1530 : STD_LOGIC;
   SIGNAL n1531 : STD_LOGIC;
   SIGNAL n1532 : STD_LOGIC;
   SIGNAL n1533 : STD_LOGIC;
   SIGNAL n1534 : STD_LOGIC;
   SIGNAL n1535 : STD_LOGIC;
   SIGNAL n1536 : STD_LOGIC;
   SIGNAL n1537 : STD_LOGIC;
   SIGNAL n1538 : STD_LOGIC;
   SIGNAL n1539 : STD_LOGIC;
   SIGNAL n1540 : STD_LOGIC;
   SIGNAL n1541 : STD_LOGIC;
   SIGNAL n1578 : STD_LOGIC;
   SIGNAL n1579 : STD_LOGIC;
   SIGNAL n1580 : STD_LOGIC;
   SIGNAL n1581 : STD_LOGIC;
   SIGNAL n1582 : STD_LOGIC;
   SIGNAL n1583 : STD_LOGIC;
   SIGNAL n1584 : STD_LOGIC;
   SIGNAL n1585 : STD_LOGIC;
   SIGNAL n1586 : STD_LOGIC;
   SIGNAL n1587 : STD_LOGIC;
   SIGNAL n1588 : STD_LOGIC;
   SIGNAL n1631 : STD_LOGIC;
   SIGNAL n1632 : STD_LOGIC;
   SIGNAL n1633 : STD_LOGIC;
   SIGNAL n1634 : STD_LOGIC;
   SIGNAL n1635 : STD_LOGIC;
   SIGNAL n1636 : STD_LOGIC;
   SIGNAL n1637 : STD_LOGIC;
   SIGNAL n1638 : STD_LOGIC;
   SIGNAL n1639 : STD_LOGIC;
   SIGNAL n2267 : STD_LOGIC;
   SIGNAL n2268 : STD_LOGIC;
   SIGNAL n2269 : STD_LOGIC;
   SIGNAL n2270 : STD_LOGIC;
   SIGNAL n2271 : STD_LOGIC;
   SIGNAL n2272 : STD_LOGIC;
   SIGNAL n2273 : STD_LOGIC;
   SIGNAL n2274 : STD_LOGIC;
   SIGNAL n2275 : STD_LOGIC;
   SIGNAL n2276 : STD_LOGIC;
   SIGNAL n2277 : STD_LOGIC;
   SIGNAL n2278 : STD_LOGIC;
   SIGNAL n2279 : STD_LOGIC;
   SIGNAL n2298 : STD_LOGIC;
   SIGNAL n2299 : STD_LOGIC;
   SIGNAL n2300 : STD_LOGIC;
   SIGNAL n2301 : STD_LOGIC;
   SIGNAL n2302 : STD_LOGIC;
   SIGNAL n2303 : STD_LOGIC;
   SIGNAL n2304 : STD_LOGIC;
   SIGNAL n2305 : STD_LOGIC;
   SIGNAL n2306 : STD_LOGIC;
   SIGNAL n2310 : STD_LOGIC;
   SIGNAL n2311 : STD_LOGIC;
   SIGNAL n2312 : STD_LOGIC;
   SIGNAL n2313 : STD_LOGIC;
   SIGNAL n2314 : STD_LOGIC;
   SIGNAL n2315 : STD_LOGIC;
   SIGNAL n2316 : STD_LOGIC;
   SIGNAL n2317 : STD_LOGIC;
   SIGNAL n2318 : STD_LOGIC;
   SIGNAL n2319 : STD_LOGIC;
   SIGNAL n2320 : STD_LOGIC;
   SIGNAL n2321 : STD_LOGIC;
   SIGNAL n2322 : STD_LOGIC;
   SIGNAL n2323 : STD_LOGIC;
   SIGNAL n2324 : STD_LOGIC;
   SIGNAL n2325 : STD_LOGIC;
   SIGNAL n2326 : STD_LOGIC;
   SIGNAL n2340 : STD_LOGIC;
   SIGNAL n2543 : STD_LOGIC;
   SIGNAL n2560 : STD_LOGIC;
   SIGNAL n2576 : STD_LOGIC;

BEGIN

   n127 <= DATA(0);
   n128 <= DATA(1);
   n129 <= DATA(2);
   n130 <= DATA(3);
   n131 <= DATA(4);
   n132 <= DATA(5);
   n133 <= DATA(6);
   n134 <= DATA(7);
   n135 <= DATA(8);
   n136 <= DATA(9);
   n137 <= DATA(10);
   n138 <= DATA(11);
   n139 <= DATA(12);
   n140 <= DATA(13);
   n141 <= DATA(14);
   n142 <= DATA(15);
   n143 <= DATA(16);
   n144 <= DATA(17);
   n145 <= DATA(18);
   n146 <= DATA(19);
   n147 <= DATA(20);
   n148 <= DATA(21);
   n149 <= DATA(22);
   n150 <= DATA(23);
   n151 <= DATA(24);
   n152 <= DATA(25);
   n153 <= DATA(26);
   n154 <= DATA(27);
   n8 <= WE;
   n3 <= A(0);
   n4 <= A(1);
   n5 <= A(2);
   n6 <= A(3);
   n7 <= A(4);
   n161 <= CLK;
   SINE(0) <= n162;
   SINE(1) <= n163;
   SINE(2) <= n164;
   SINE(3) <= n165;
   SINE(4) <= n166;
   SINE(5) <= n167;
   SINE(6) <= n168;
   SINE(7) <= n169;
   SINE(8) <= n170;
   SINE(9) <= n171;
   SINE(10) <= n172;
   SINE(11) <= n173;
   SINE(12) <= n174;

   BU2_I(0) <= n3;
   BU2_I(1) <= n4;
   BU2_I(2) <= n5;
   BU2_I(3) <= n6;
   BU2_I(4) <= n7;
   BU2_I(5) <= n8;
   BU2_T <= '0';
   BU2_EN <= '0';
   BU2_CLK <= '0';
   BU2_CE <= '0';
   BU2_ACLR <= '0';
   BU2_ASET <= '0';
   BU2_AINIT <= '0';
   BU2_SCLR <= '0';
   BU2_SSET <= '0';
   BU2_SINIT <= '0';
   n2 <= BU2_O;
   BU2 : C_GATE_BIT_V7_0
      GENERIC MAP (
         c_has_aset => 0,
         c_gate_type => 0,
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
         c_inputs => 6,
         c_input_inv_mask => "011111"
      )
      PORT MAP (
         I => BU2_I,
         T => BU2_T,
         EN => BU2_EN,
         Q => BU2_Q,
         CLK => BU2_CLK,
         CE => BU2_CE,
         ACLR => BU2_ACLR,
         ASET => BU2_ASET,
         AINIT => BU2_AINIT,
         SCLR => BU2_SCLR,
         SSET => BU2_SSET,
         SINIT => BU2_SINIT,
         O => BU2_O
      );

   BU12_D(0) <= n127;
   BU12_D(1) <= n128;
   BU12_D(2) <= n129;
   BU12_D(3) <= n130;
   BU12_D(4) <= n131;
   BU12_D(5) <= n132;
   BU12_D(6) <= n133;
   BU12_D(7) <= n134;
   BU12_D(8) <= n135;
   BU12_D(9) <= n136;
   BU12_D(10) <= n137;
   BU12_D(11) <= n138;
   BU12_D(12) <= n139;
   BU12_D(13) <= n140;
   BU12_D(14) <= n141;
   BU12_D(15) <= n142;
   BU12_D(16) <= n143;
   BU12_D(17) <= n144;
   BU12_D(18) <= n145;
   BU12_D(19) <= n146;
   BU12_D(20) <= n147;
   BU12_D(21) <= n148;
   BU12_D(22) <= n149;
   BU12_D(23) <= n150;
   BU12_D(24) <= n151;
   BU12_D(25) <= n152;
   BU12_D(26) <= n153;
   BU12_D(27) <= n154;
   n227 <= BU12_Q(0);
   n228 <= BU12_Q(1);
   n229 <= BU12_Q(2);
   n230 <= BU12_Q(3);
   n231 <= BU12_Q(4);
   n232 <= BU12_Q(5);
   n233 <= BU12_Q(6);
   n234 <= BU12_Q(7);
   n235 <= BU12_Q(8);
   n236 <= BU12_Q(9);
   n237 <= BU12_Q(10);
   n238 <= BU12_Q(11);
   n239 <= BU12_Q(12);
   n240 <= BU12_Q(13);
   n241 <= BU12_Q(14);
   n242 <= BU12_Q(15);
   n243 <= BU12_Q(16);
   n244 <= BU12_Q(17);
   n245 <= BU12_Q(18);
   n246 <= BU12_Q(19);
   n247 <= BU12_Q(20);
   n248 <= BU12_Q(21);
   n249 <= BU12_Q(22);
   n250 <= BU12_Q(23);
   n251 <= BU12_Q(24);
   n252 <= BU12_Q(25);
   n253 <= BU12_Q(26);
   n254 <= BU12_Q(27);
   BU12_CLK <= n161;
   BU12_CE <= n2;
   BU12 : C_REG_FD_V7_0
      GENERIC MAP (
         c_width => 28,
         c_has_ce => 1,
         c_sinit_val => "0000000000000000000000000000",
         c_has_sinit => 0,
         c_ainit_val => "0000000000000000000000000000",
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
         D => BU12_D,
         Q => BU12_Q,
         CLK => BU12_CLK,
         CE => BU12_CE
      );

   BU70_A(0) <= n19;
   BU70_A(1) <= n20;
   BU70_A(2) <= n21;
   BU70_A(3) <= n22;
   BU70_A(4) <= n23;
   BU70_A(5) <= n24;
   BU70_A(6) <= n25;
   BU70_A(7) <= n26;
   BU70_A(8) <= n27;
   BU70_A(9) <= n28;
   BU70_A(10) <= n29;
   BU70_A(11) <= n30;
   BU70_A(12) <= n31;
   BU70_A(13) <= n32;
   BU70_A(14) <= n33;
   BU70_A(15) <= n34;
   BU70_A(16) <= n35;
   BU70_A(17) <= n36;
   BU70_A(18) <= n37;
   BU70_A(19) <= n38;
   BU70_A(20) <= n39;
   BU70_A(21) <= n40;
   BU70_A(22) <= n41;
   BU70_A(23) <= n42;
   BU70_A(24) <= n43;
   BU70_A(25) <= n44;
   BU70_A(26) <= n45;
   BU70_A(27) <= n46;
   BU70_B(0) <= n227;
   BU70_B(1) <= n228;
   BU70_B(2) <= n229;
   BU70_B(3) <= n230;
   BU70_B(4) <= n231;
   BU70_B(5) <= n232;
   BU70_B(6) <= n233;
   BU70_B(7) <= n234;
   BU70_B(8) <= n235;
   BU70_B(9) <= n236;
   BU70_B(10) <= n237;
   BU70_B(11) <= n238;
   BU70_B(12) <= n239;
   BU70_B(13) <= n240;
   BU70_B(14) <= n241;
   BU70_B(15) <= n242;
   BU70_B(16) <= n243;
   BU70_B(17) <= n244;
   BU70_B(18) <= n245;
   BU70_B(19) <= n246;
   BU70_B(20) <= n247;
   BU70_B(21) <= n248;
   BU70_B(22) <= n249;
   BU70_B(23) <= n250;
   BU70_B(24) <= n251;
   BU70_B(25) <= n252;
   BU70_B(26) <= n253;
   BU70_B(27) <= n254;
   n19 <= BU70_Q(0);
   n20 <= BU70_Q(1);
   n21 <= BU70_Q(2);
   n22 <= BU70_Q(3);
   n23 <= BU70_Q(4);
   n24 <= BU70_Q(5);
   n25 <= BU70_Q(6);
   n26 <= BU70_Q(7);
   n27 <= BU70_Q(8);
   n28 <= BU70_Q(9);
   n29 <= BU70_Q(10);
   n30 <= BU70_Q(11);
   n31 <= BU70_Q(12);
   n32 <= BU70_Q(13);
   n33 <= BU70_Q(14);
   n34 <= BU70_Q(15);
   n35 <= BU70_Q(16);
   n36 <= BU70_Q(17);
   n37 <= BU70_Q(18);
   n38 <= BU70_Q(19);
   n39 <= BU70_Q(20);
   n40 <= BU70_Q(21);
   n41 <= BU70_Q(22);
   n42 <= BU70_Q(23);
   n43 <= BU70_Q(24);
   n44 <= BU70_Q(25);
   n45 <= BU70_Q(26);
   n46 <= BU70_Q(27);
   BU70_CLK <= n161;
   BU70 : C_ADDSUB_V7_0
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
         c_high_bit => 27,
         c_latency => 1,
         c_sinit_val => "0000000000000000000000000000",
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
         c_b_value => "0000000000000000000000000000",
         c_add_mode => 0,
         c_has_aclr => 0,
         c_out_width => 28,
         c_low_bit => 0,
         c_ainit_val => "0000000000000000000000000000",
         c_has_q_ovfl => 0,
         c_has_q_b_out => 0,
         c_has_c_out => 0,
         c_b_width => 28,
         c_a_width => 28,
         c_sync_enable => 0,
         c_has_ce => 0,
         c_has_c_in => 0
      )
      PORT MAP (
         A => BU70_A,
         B => BU70_B,
         Q => BU70_Q,
         CLK => BU70_CLK
      );

   BU238_CLK <= n161;
   n75 <= BU238_SDOUT;
   BU238 : C_SHIFT_FD_V7_0
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
         CLK => BU238_CLK,
         SDOUT => BU238_SDOUT
      );

   BU247_A(0) <= n19;
   BU247_A(1) <= n20;
   BU247_A(2) <= n21;
   BU247_A(3) <= n22;
   BU247_A(4) <= n23;
   BU247_A(5) <= n24;
   BU247_A(6) <= n25;
   BU247_A(7) <= n26;
   BU247_A(8) <= n27;
   BU247_A(9) <= n28;
   BU247_A(10) <= n29;
   BU247_A(11) <= n30;
   BU247_A(12) <= n31;
   BU247_A(13) <= n32;
   BU247_A(14) <= n33;
   BU247_A(15) <= n34;
   BU247_A(16) <= n35;
   BU247_A(17) <= n36;
   BU247_A(18) <= n37;
   BU247_A(19) <= n38;
   BU247_A(20) <= n39;
   BU247_A(21) <= n40;
   BU247_A(22) <= n41;
   BU247_A(23) <= n42;
   BU247_A(24) <= n43;
   BU247_A(25) <= n44;
   BU247_A(26) <= n45;
   BU247_A(27) <= n46;
   n55 <= BU247_Q(8);
   n56 <= BU247_Q(9);
   n57 <= BU247_Q(10);
   n58 <= BU247_Q(11);
   n59 <= BU247_Q(12);
   n60 <= BU247_Q(13);
   n61 <= BU247_Q(14);
   n62 <= BU247_Q(15);
   n63 <= BU247_Q(16);
   n64 <= BU247_Q(17);
   n65 <= BU247_Q(18);
   n66 <= BU247_Q(19);
   n67 <= BU247_Q(20);
   n68 <= BU247_Q(21);
   n69 <= BU247_Q(22);
   n70 <= BU247_Q(23);
   n71 <= BU247_Q(24);
   n72 <= BU247_Q(25);
   n73 <= BU247_Q(26);
   n74 <= BU247_Q(27);
   BU247_CLK <= n161;
   BU247 : C_ADDSUB_V7_0
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
         c_high_bit => 27,
         c_latency => 1,
         c_sinit_val => "0000000000000000000000000000",
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
         c_b_value => "0000000000000000000000000000",
         c_add_mode => 0,
         c_has_aclr => 0,
         c_out_width => 28,
         c_low_bit => 0,
         c_ainit_val => "0000000000000000000000000000",
         c_has_q_ovfl => 0,
         c_has_q_b_out => 0,
         c_has_c_out => 0,
         c_b_width => 28,
         c_a_width => 28,
         c_sync_enable => 0,
         c_has_ce => 0,
         c_has_c_in => 0
      )
      PORT MAP (
         A => BU247_A,
         Q => BU247_Q,
         CLK => BU247_CLK
      );

   BU734_A(0) <= n55;
   BU734_A(1) <= n56;
   BU734_A(2) <= n57;
   BU734_A(3) <= n58;
   BU734_A(4) <= n59;
   BU734_A(5) <= n60;
   BU734_A(6) <= n61;
   BU734_A(7) <= n62;
   BU734_A(8) <= n63;
   BU734_A(9) <= n64;
   BU734_A(10) <= n65;
   BU734_A(11) <= n66;
   BU734_A(12) <= n67;
   BU734_A(13) <= n68;
   BU734_A(14) <= n69;
   BU734_A(15) <= n70;
   BU734_A(16) <= n71;
   BU734_A(17) <= n72;
   BU734_A(18) <= n73;
   BU734_A(19) <= n74;
   BU734_B(0) <= n87;
   BU734_B(1) <= n88;
   BU734_B(2) <= n89;
   BU734_B(3) <= n90;
   BU734_B(4) <= n91;
   BU734_B(5) <= n92;
   BU734_B(6) <= n93;
   BU734_B(7) <= n94;
   BU734_B(8) <= n95;
   BU734_B(9) <= n96;
   n76 <= BU734_Q(0);
   n77 <= BU734_Q(1);
   n78 <= BU734_Q(2);
   n79 <= BU734_Q(3);
   n80 <= BU734_Q(4);
   n81 <= BU734_Q(5);
   n82 <= BU734_Q(6);
   n83 <= BU734_Q(7);
   n84 <= BU734_Q(8);
   n85 <= BU734_Q(9);
   n86 <= BU734_Q(10);
   BU734_CLK <= n161;
   BU734 : C_ADDSUB_V7_0
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
         c_high_bit => 19,
         c_latency => 1,
         c_sinit_val => "00000000000",
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
         c_b_value => "00000000000000000000",
         c_add_mode => 0,
         c_has_aclr => 0,
         c_out_width => 11,
         c_low_bit => 9,
         c_ainit_val => "00000000000",
         c_has_q_ovfl => 0,
         c_has_q_b_out => 0,
         c_has_c_out => 0,
         c_b_width => 10,
         c_a_width => 20,
         c_sync_enable => 0,
         c_has_ce => 0,
         c_has_c_in => 0
      )
      PORT MAP (
         A => BU734_A,
         B => BU734_B,
         Q => BU734_Q,
         CLK => BU734_CLK
      );

   BU673_A(0) <= n1523;
   BU673_A(1) <= n1524;
   BU673_A(2) <= n1525;
   BU673_A(3) <= n1526;
   BU673_A(4) <= n1527;
   BU673_A(5) <= n1528;
   BU673_A(6) <= n1529;
   BU673_A(7) <= n1530;
   BU673_A(8) <= n1531;
   BU673_B(0) <= n1631;
   BU673_B(1) <= n1632;
   BU673_B(2) <= n1633;
   BU673_B(3) <= n1634;
   BU673_B(4) <= n1635;
   BU673_B(5) <= n1636;
   BU673_B(6) <= n1637;
   BU673_B(7) <= n1638;
   BU673_B(8) <= n1639;
   n87 <= BU673_Q(0);
   n88 <= BU673_Q(1);
   n89 <= BU673_Q(2);
   n90 <= BU673_Q(3);
   n91 <= BU673_Q(4);
   n92 <= BU673_Q(5);
   n93 <= BU673_Q(6);
   n94 <= BU673_Q(7);
   n95 <= BU673_Q(8);
   n96 <= BU673_Q(9);
   BU673_CLK <= n161;
   BU673 : C_ADDSUB_V7_0
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
         A => BU673_A,
         B => BU673_B,
         Q => BU673_Q,
         CLK => BU673_CLK
      );

   BU487_A(0) <= n1422;
   BU487_A(1) <= n1423;
   BU487_A(2) <= n1424;
   BU487_A(3) <= n1425;
   BU487_A(4) <= n1426;
   BU487_A(5) <= n1427;
   BU487_A(6) <= n1428;
   BU487_A(7) <= n1429;
   BU487_B(0) <= n1472;
   BU487_B(1) <= n1473;
   BU487_B(2) <= n1474;
   BU487_B(3) <= n1475;
   BU487_B(4) <= n1476;
   BU487_B(5) <= n1477;
   BU487_B(6) <= n1478;
   BU487_B(7) <= n1479;
   n1523 <= BU487_Q(0);
   n1524 <= BU487_Q(1);
   n1525 <= BU487_Q(2);
   n1526 <= BU487_Q(3);
   n1527 <= BU487_Q(4);
   n1528 <= BU487_Q(5);
   n1529 <= BU487_Q(6);
   n1530 <= BU487_Q(7);
   n1531 <= BU487_Q(8);
   BU487_CLK <= n161;
   BU487 : C_ADDSUB_V7_0
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
         A => BU487_A,
         B => BU487_B,
         Q => BU487_Q,
         CLK => BU487_CLK
      );

   BU418_I(0) <= n1431;
   BU418_I(1) <= n1432;
   BU418_I(2) <= n1433;
   BU418_I(3) <= n1429;
   BU418_T <= '0';
   BU418_EN <= '0';
   BU418_CLK <= '0';
   BU418_CE <= '0';
   BU418_ACLR <= '0';
   BU418_ASET <= '0';
   BU418_AINIT <= '0';
   BU418_SCLR <= '0';
   BU418_SSET <= '0';
   BU418_SINIT <= '0';
   n1430 <= BU418_O;
   BU418 : C_GATE_BIT_V7_0
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
         I => BU418_I,
         T => BU418_T,
         EN => BU418_EN,
         Q => BU418_Q,
         CLK => BU418_CLK,
         CE => BU418_CE,
         ACLR => BU418_ACLR,
         ASET => BU418_ASET,
         AINIT => BU418_AINIT,
         SCLR => BU418_SCLR,
         SSET => BU418_SSET,
         SINIT => BU418_SINIT,
         O => BU418_O
      );

   BU423_CLK <= n161;
   BU423_SDIN <= n1430;
   n1431 <= BU423_Q(0);
   n1432 <= BU423_Q(2);
   n1433 <= BU423_Q(3);
   n1422 <= BU423_Q(5);
   n1423 <= BU423_Q(6);
   n1424 <= BU423_Q(7);
   n1425 <= BU423_Q(8);
   n1426 <= BU423_Q(9);
   n1427 <= BU423_Q(10);
   n1428 <= BU423_Q(11);
   n1429 <= BU423_Q(12);
   BU423 : C_SHIFT_FD_V7_0
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
         CLK => BU423_CLK,
         SDIN => BU423_SDIN,
         Q => BU423_Q
      );

   BU452_I(0) <= n1481;
   BU452_I(1) <= n1482;
   BU452_I(2) <= n1475;
   BU452_I(3) <= n1479;
   BU452_T <= '0';
   BU452_EN <= '0';
   BU452_CLK <= '0';
   BU452_CE <= '0';
   BU452_ACLR <= '0';
   BU452_ASET <= '0';
   BU452_AINIT <= '0';
   BU452_SCLR <= '0';
   BU452_SSET <= '0';
   BU452_SINIT <= '0';
   n1480 <= BU452_O;
   BU452 : C_GATE_BIT_V7_0
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
         I => BU452_I,
         T => BU452_T,
         EN => BU452_EN,
         Q => BU452_Q,
         CLK => BU452_CLK,
         CE => BU452_CE,
         ACLR => BU452_ACLR,
         ASET => BU452_ASET,
         AINIT => BU452_AINIT,
         SCLR => BU452_SCLR,
         SSET => BU452_SSET,
         SINIT => BU452_SINIT,
         O => BU452_O
      );

   BU457_CLK <= n161;
   BU457_SDIN <= n1480;
   n1481 <= BU457_Q(0);
   n1482 <= BU457_Q(5);
   n1472 <= BU457_Q(6);
   n1473 <= BU457_Q(7);
   n1474 <= BU457_Q(8);
   n1475 <= BU457_Q(9);
   n1476 <= BU457_Q(10);
   n1477 <= BU457_Q(11);
   n1478 <= BU457_Q(12);
   n1479 <= BU457_Q(13);
   BU457 : C_SHIFT_FD_V7_0
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
         CLK => BU457_CLK,
         SDIN => BU457_SDIN,
         Q => BU457_Q
      );

   BU619_A(0) <= n1532;
   BU619_A(1) <= n1533;
   BU619_A(2) <= n1534;
   BU619_A(3) <= n1535;
   BU619_A(4) <= n1536;
   BU619_A(5) <= n1537;
   BU619_A(6) <= n1538;
   BU619_A(7) <= n1539;
   BU619_B(0) <= n1578;
   BU619_B(1) <= n1579;
   BU619_B(2) <= n1580;
   BU619_B(3) <= n1581;
   BU619_B(4) <= n1582;
   BU619_B(5) <= n1583;
   BU619_B(6) <= n1584;
   BU619_B(7) <= n1585;
   n1631 <= BU619_Q(0);
   n1632 <= BU619_Q(1);
   n1633 <= BU619_Q(2);
   n1634 <= BU619_Q(3);
   n1635 <= BU619_Q(4);
   n1636 <= BU619_Q(5);
   n1637 <= BU619_Q(6);
   n1638 <= BU619_Q(7);
   n1639 <= BU619_Q(8);
   BU619_CLK <= n161;
   BU619 : C_ADDSUB_V7_0
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
         A => BU619_A,
         B => BU619_B,
         Q => BU619_Q,
         CLK => BU619_CLK
      );

   BU542_I(0) <= n1541;
   BU542_I(1) <= n1539;
   BU542_T <= '0';
   BU542_EN <= '0';
   BU542_CLK <= '0';
   BU542_CE <= '0';
   BU542_ACLR <= '0';
   BU542_ASET <= '0';
   BU542_AINIT <= '0';
   BU542_SCLR <= '0';
   BU542_SSET <= '0';
   BU542_SINIT <= '0';
   n1540 <= BU542_O;
   BU542 : C_GATE_BIT_V7_0
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
         I => BU542_I,
         T => BU542_T,
         EN => BU542_EN,
         Q => BU542_Q,
         CLK => BU542_CLK,
         CE => BU542_CE,
         ACLR => BU542_ACLR,
         ASET => BU542_ASET,
         AINIT => BU542_AINIT,
         SCLR => BU542_SCLR,
         SSET => BU542_SSET,
         SINIT => BU542_SINIT,
         O => BU542_O
      );

   BU547_CLK <= n161;
   BU547_SDIN <= n1540;
   n1541 <= BU547_Q(0);
   n1532 <= BU547_Q(7);
   n1533 <= BU547_Q(8);
   n1534 <= BU547_Q(9);
   n1535 <= BU547_Q(10);
   n1536 <= BU547_Q(11);
   n1537 <= BU547_Q(12);
   n1538 <= BU547_Q(13);
   n1539 <= BU547_Q(14);
   BU547 : C_SHIFT_FD_V7_0
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
         CLK => BU547_CLK,
         SDIN => BU547_SDIN,
         Q => BU547_Q
      );

   BU580_I(0) <= n1587;
   BU580_I(1) <= n1588;
   BU580_I(2) <= n1581;
   BU580_I(3) <= n1585;
   BU580_T <= '0';
   BU580_EN <= '0';
   BU580_CLK <= '0';
   BU580_CE <= '0';
   BU580_ACLR <= '0';
   BU580_ASET <= '0';
   BU580_AINIT <= '0';
   BU580_SCLR <= '0';
   BU580_SSET <= '0';
   BU580_SINIT <= '0';
   n1586 <= BU580_O;
   BU580 : C_GATE_BIT_V7_0
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
         I => BU580_I,
         T => BU580_T,
         EN => BU580_EN,
         Q => BU580_Q,
         CLK => BU580_CLK,
         CE => BU580_CE,
         ACLR => BU580_ACLR,
         ASET => BU580_ASET,
         AINIT => BU580_AINIT,
         SCLR => BU580_SCLR,
         SSET => BU580_SSET,
         SINIT => BU580_SINIT,
         O => BU580_O
      );

   BU585_CLK <= n161;
   BU585_SDIN <= n1586;
   n1587 <= BU585_Q(0);
   n1588 <= BU585_Q(2);
   n1578 <= BU585_Q(8);
   n1579 <= BU585_Q(9);
   n1580 <= BU585_Q(10);
   n1581 <= BU585_Q(11);
   n1582 <= BU585_Q(12);
   n1583 <= BU585_Q(13);
   n1584 <= BU585_Q(14);
   n1585 <= BU585_Q(15);
   BU585 : C_SHIFT_FD_V7_0
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
         CLK => BU585_CLK,
         SDIN => BU585_SDIN,
         Q => BU585_Q
      );

   BU863_D(0) <= n76;
   BU863_D(1) <= n77;
   BU863_D(2) <= n78;
   BU863_D(3) <= n79;
   BU863_D(4) <= n80;
   BU863_D(5) <= n81;
   BU863_D(6) <= n82;
   BU863_D(7) <= n83;
   BU863_D(8) <= n84;
   BU863_D(9) <= n85;
   BU863_D(10) <= n86;
   n2267 <= BU863_Q(0);
   n2268 <= BU863_Q(1);
   n2269 <= BU863_Q(2);
   n2270 <= BU863_Q(3);
   n2271 <= BU863_Q(4);
   n2272 <= BU863_Q(5);
   n2273 <= BU863_Q(6);
   n2274 <= BU863_Q(7);
   n2275 <= BU863_Q(8);
   n2276 <= BU863_Q(9);
   n2277 <= BU863_Q(10);
   BU863_CLK <= n161;
   BU863 : C_REG_FD_V7_0
      GENERIC MAP (
         c_width => 11,
         c_has_ce => 0,
         c_sinit_val => "00000000000",
         c_has_sinit => 0,
         c_ainit_val => "00000000000",
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
         D => BU863_D,
         Q => BU863_Q,
         CLK => BU863_CLK
      );

   BU888_A(0) <= n2267;
   BU888_A(1) <= n2268;
   BU888_A(2) <= n2269;
   BU888_A(3) <= n2270;
   BU888_A(4) <= n2271;
   BU888_A(5) <= n2272;
   BU888_A(6) <= n2273;
   BU888_A(7) <= n2274;
   BU888_A(8) <= n2275;
   BU888_BYPASS <= n2276;
   BU888_CLK <= n161;
   n2298 <= BU888_Q(0);
   n2299 <= BU888_Q(1);
   n2300 <= BU888_Q(2);
   n2301 <= BU888_Q(3);
   n2302 <= BU888_Q(4);
   n2303 <= BU888_Q(5);
   n2304 <= BU888_Q(6);
   n2305 <= BU888_Q(7);
   n2306 <= BU888_Q(8);
   BU888 : C_TWOS_COMP_V7_0
      GENERIC MAP (
         c_has_aset => 0,
         c_sync_priority => 0,
         c_has_sclr => 0,
         c_width => 9,
         c_enable_rlocs => 0,
         c_has_bypass => 1,
         c_ainit_val => "0000000000",
         c_bypass_low => 1,
         c_pipe_stages => 0,
         c_has_ce => 0,
         c_has_aclr => 0,
         c_sync_enable => 0,
         c_has_ainit => 0,
         c_sinit_val => "0000000000",
         c_has_sset => 0,
         c_has_sinit => 0,
         c_has_s => 0,
         c_bypass_enable => 1,
         c_has_q => 1
      )
      PORT MAP (
         A => BU888_A,
         BYPASS => BU888_BYPASS,
         CLK => BU888_CLK,
         Q => BU888_Q
      );

   BU960_CLK <= n161;
   BU960_D(0) <= n2277;
   n2278 <= BU960_Q(0);
   BU960 : C_SHIFT_RAM_V7_0
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
         CLK => BU960_CLK,
         D => BU960_D,
         Q => BU960_Q
      );

   BU968_CLK <= n161;
   BU968_D(0) <= n2276;
   n2279 <= BU968_Q(0);
   BU968 : C_SHIFT_RAM_V7_0
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
         CLK => BU968_CLK,
         D => BU968_D,
         Q => BU968_Q
      );

   BU979_I0 <= n2278;
   BU979_I1 <= n2279;
   BU979_I2 <= n2311;
   BU979_I3 <= '0';
   n2543 <= BU979_O;
   BU979 : LUT4
      GENERIC MAP (
         INIT  => X"9595"
      )
      PORT MAP (
         I0 => BU979_I0,
         I1 => BU979_I1,
         I2 => BU979_I2,
         I3 => BU979_I3,
         O => BU979_O
      );

   BU980_D <= n2543;
   BU980_C <= n161;
   BU980_CE <= '1';
   BU980_PRE <= '0';
   n2313 <= BU980_Q;
   BU980 : FDPE
      PORT MAP (
         D => BU980_D,
         C => BU980_C,
         CE => BU980_CE,
         PRE => BU980_PRE,
         Q => BU980_Q
      );

   BU984_I0 <= n2278;
   BU984_I1 <= n2279;
   BU984_I2 <= n2311;
   BU984_I3 <= n2312;
   n2560 <= BU984_O;
   BU984 : LUT4
      GENERIC MAP (
         INIT  => X"002a"
      )
      PORT MAP (
         I0 => BU984_I0,
         I1 => BU984_I1,
         I2 => BU984_I2,
         I3 => BU984_I3,
         O => BU984_O
      );

   BU985_D <= n2560;
   BU985_C <= n161;
   BU985_CE <= '1';
   n2314 <= BU985_Q;
   BU985 : FDE
      PORT MAP (
         D => BU985_D,
         C => BU985_C,
         CE => BU985_CE,
         Q => BU985_Q
      );

   BU989_I0 <= '0';
   BU989_I1 <= n2279;
   BU989_I2 <= n2311;
   BU989_I3 <= '0';
   n2576 <= BU989_O;
   BU989 : LUT4
      GENERIC MAP (
         INIT  => X"c0c0"
      )
      PORT MAP (
         I0 => BU989_I0,
         I1 => BU989_I1,
         I2 => BU989_I2,
         I3 => BU989_I3,
         O => BU989_O
      );

   BU990_D <= n2576;
   BU990_C <= n161;
   BU990_CE <= '1';
   n2310 <= BU990_Q;
   BU990 : FDE
      PORT MAP (
         D => BU990_D,
         C => BU990_C,
         CE => BU990_CE,
         Q => BU990_Q
      );

   BU992_A(0) <= n2298;
   BU992_A(1) <= n2299;
   BU992_A(2) <= n2300;
   BU992_A(3) <= n2301;
   BU992_A(4) <= n2302;
   BU992_A(5) <= n2303;
   BU992_A(6) <= n2304;
   BU992_A(7) <= n2305;
   BU992_A(8) <= n2306;
   BU992_CLK <= n161;
   BU992_ACLR <= '0';
   n2312 <= BU992_QA_GE_B;
   BU992 : C_COMPARE_V7_0
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
         c_width => 9,
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
         c_b_value => "111111011"
      )
      PORT MAP (
         A => BU992_A,
         CLK => BU992_CLK,
         ACLR => BU992_ACLR,
         QA_GE_B => BU992_QA_GE_B
      );

   BU1025_A(0) <= n2298;
   BU1025_A(1) <= n2299;
   BU1025_A(2) <= n2300;
   BU1025_A(3) <= n2301;
   BU1025_A(4) <= n2302;
   BU1025_A(5) <= n2303;
   BU1025_A(6) <= n2304;
   BU1025_A(7) <= n2305;
   BU1025_A(8) <= n2306;
   BU1025_CLK <= n161;
   BU1025_ACLR <= '0';
   n2311 <= BU1025_QA_EQ_B;
   BU1025 : C_COMPARE_V7_0
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
         c_width => 9,
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
         c_b_value => "000000000"
      )
      PORT MAP (
         A => BU1025_A,
         CLK => BU1025_CLK,
         ACLR => BU1025_ACLR,
         QA_EQ_B => BU1025_QA_EQ_B
      );

   BU830_addr(8) <= n2306;
   BU830_addr(7) <= n2305;
   BU830_addr(6) <= n2304;
   BU830_addr(5) <= n2303;
   BU830_addr(4) <= n2302;
   BU830_addr(3) <= n2301;
   BU830_addr(2) <= n2300;
   BU830_addr(1) <= n2299;
   BU830_addr(0) <= n2298;
   BU830_clk <= n161;
   BU830_din(11) <= '0';
   BU830_din(10) <= '0';
   BU830_din(9) <= '0';
   BU830_din(8) <= '0';
   BU830_din(7) <= '0';
   BU830_din(6) <= '0';
   BU830_din(5) <= '0';
   BU830_din(4) <= '0';
   BU830_din(3) <= '0';
   BU830_din(2) <= '0';
   BU830_din(1) <= '0';
   BU830_din(0) <= '0';
   n2326 <= BU830_dout(11);
   n2325 <= BU830_dout(10);
   n2324 <= BU830_dout(9);
   n2323 <= BU830_dout(8);
   n2322 <= BU830_dout(7);
   n2321 <= BU830_dout(6);
   n2320 <= BU830_dout(5);
   n2319 <= BU830_dout(4);
   n2318 <= BU830_dout(3);
   n2317 <= BU830_dout(2);
   n2316 <= BU830_dout(1);
   n2315 <= BU830_dout(0);
   BU830_en <= '0';
   BU830_nd <= '0';
   BU830_sinit <= '0';
   BU830_we <= '0';
   BU830 : blkmemsp_v6_0
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
         c_width => 12,
         c_yuse_single_primitive => 0,
         c_has_nd => 0,
         c_enable_rlocs => 0,
         c_has_we => 0,
         c_has_rfd => 0,
         c_has_din => 0,
         c_ybottom_addr => "0",
         c_yen_is_high => 1,
         c_pipe_stages => 1,
         c_depth => 512,
         c_has_default_data => 0,
         c_limit_data_pitch => 18,
         c_has_sinit => 0,
         c_yydisable_warnings => 1,
         c_mem_init_file => "DDSV_SINCOS_TABLE_TRIG_ROM.mif",
         c_default_data => "0000000000000000000",
         c_ymake_bmm => 0,
         c_addr_width => 9
      )
      PORT MAP (
         addr => BU830_addr,
         clk => BU830_clk,
         din => BU830_din,
         dout => BU830_dout,
         en => BU830_en,
         nd => BU830_nd,
         rfd => BU830_rfd,
         rdy => BU830_rdy,
         sinit => BU830_sinit,
         we => BU830_we
      );

   BU1041_A(0) <= '0';
   BU1041_A(1) <= '0';
   BU1041_A(2) <= '0';
   BU1041_A(3) <= '0';
   BU1041_A(4) <= '0';
   BU1041_A(5) <= '0';
   BU1041_A(6) <= '0';
   BU1041_A(7) <= '0';
   BU1041_A(8) <= '0';
   BU1041_A(9) <= '0';
   BU1041_A(10) <= '0';
   BU1041_A(11) <= '0';
   BU1041_A(12) <= '0';
   BU1041_B(0) <= n2315;
   BU1041_B(1) <= n2316;
   BU1041_B(2) <= n2317;
   BU1041_B(3) <= n2318;
   BU1041_B(4) <= n2319;
   BU1041_B(5) <= n2320;
   BU1041_B(6) <= n2321;
   BU1041_B(7) <= n2322;
   BU1041_B(8) <= n2323;
   BU1041_B(9) <= n2324;
   BU1041_B(10) <= n2325;
   BU1041_B(11) <= n2326;
   BU1041_B(12) <= n2310;
   BU1041_C_IN <= n2314;
   BU1041_ADD <= n2313;
   n162 <= BU1041_Q(0);
   n163 <= BU1041_Q(1);
   n164 <= BU1041_Q(2);
   n165 <= BU1041_Q(3);
   n166 <= BU1041_Q(4);
   n167 <= BU1041_Q(5);
   n168 <= BU1041_Q(6);
   n169 <= BU1041_Q(7);
   n170 <= BU1041_Q(8);
   n171 <= BU1041_Q(9);
   n172 <= BU1041_Q(10);
   n173 <= BU1041_Q(11);
   n174 <= BU1041_Q(12);
   BU1041_CLK <= n161;
   BU1041_CE <= n2340;
   BU1041 : C_ADDSUB_V7_0
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
         c_high_bit => 12,
         c_latency => 1,
         c_sinit_val => "0000000000000",
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
         c_b_value => "0000000000000",
         c_add_mode => 2,
         c_has_aclr => 0,
         c_out_width => 13,
         c_low_bit => 0,
         c_ainit_val => "0000000000000",
         c_has_q_ovfl => 0,
         c_has_q_b_out => 0,
         c_has_c_out => 0,
         c_b_width => 13,
         c_a_width => 13,
         c_sync_enable => 0,
         c_has_ce => 1,
         c_has_c_in => 1
      )
      PORT MAP (
         A => BU1041_A,
         B => BU1041_B,
         C_IN => BU1041_C_IN,
         ADD => BU1041_ADD,
         Q => BU1041_Q,
         CLK => BU1041_CLK,
         CE => BU1041_CE
      );

   BU1120_CLK <= n161;
   BU1120_SDIN <= n75;
   n2340 <= BU1120_SDOUT;
   BU1120 : C_SHIFT_FD_V7_0
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
         CLK => BU1120_CLK,
         SDIN => BU1120_SDIN,
         SDOUT => BU1120_SDOUT
      );


END xilinx;


-- synthesis translate_on
