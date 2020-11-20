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

ENTITY DDS IS
   PORT (
      DATA : IN STD_LOGIC_VECTOR(31 DOWNTO 0);
      WE : IN STD_LOGIC;
      A : IN STD_LOGIC_VECTOR(4 DOWNTO 0);
      CLK : IN STD_LOGIC;
      SCLR : IN STD_LOGIC;
      SINE : OUT STD_LOGIC_VECTOR(14 DOWNTO 0)   
);
END DDS;

ARCHITECTURE xilinx OF DDS IS 

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
   SIGNAL BU12_D : STD_LOGIC_VECTOR(31 DOWNTO 0);
   SIGNAL BU12_Q : STD_LOGIC_VECTOR(31 DOWNTO 0);
   SIGNAL BU12_CLK : STD_LOGIC;
   SIGNAL BU12_CE : STD_LOGIC;
   SIGNAL BU78_A : STD_LOGIC_VECTOR(31 DOWNTO 0);
   SIGNAL BU78_B : STD_LOGIC_VECTOR(31 DOWNTO 0);
   SIGNAL BU78_Q : STD_LOGIC_VECTOR(31 DOWNTO 0);
   SIGNAL BU78_CLK : STD_LOGIC;
   SIGNAL BU78_SCLR : STD_LOGIC;
   SIGNAL BU270_CLK : STD_LOGIC;
   SIGNAL BU270_SDOUT : STD_LOGIC;
   SIGNAL BU270_SCLR : STD_LOGIC;
   SIGNAL BU279_A : STD_LOGIC_VECTOR(31 DOWNTO 0);
   SIGNAL BU279_Q : STD_LOGIC_VECTOR(31 DOWNTO 0);
   SIGNAL BU279_CLK : STD_LOGIC;
   SIGNAL BU790_A : STD_LOGIC_VECTOR(21 DOWNTO 0);
   SIGNAL BU790_B : STD_LOGIC_VECTOR(9 DOWNTO 0);
   SIGNAL BU790_Q : STD_LOGIC_VECTOR(12 DOWNTO 0);
   SIGNAL BU790_CLK : STD_LOGIC;
   SIGNAL BU790_SCLR : STD_LOGIC;
   SIGNAL BU729_A : STD_LOGIC_VECTOR(8 DOWNTO 0);
   SIGNAL BU729_B : STD_LOGIC_VECTOR(8 DOWNTO 0);
   SIGNAL BU729_Q : STD_LOGIC_VECTOR(9 DOWNTO 0);
   SIGNAL BU729_CLK : STD_LOGIC;
   SIGNAL BU729_SCLR : STD_LOGIC;
   SIGNAL BU543_A : STD_LOGIC_VECTOR(7 DOWNTO 0);
   SIGNAL BU543_B : STD_LOGIC_VECTOR(7 DOWNTO 0);
   SIGNAL BU543_Q : STD_LOGIC_VECTOR(8 DOWNTO 0);
   SIGNAL BU543_CLK : STD_LOGIC;
   SIGNAL BU543_SCLR : STD_LOGIC;
   SIGNAL BU474_I : STD_LOGIC_VECTOR(3 DOWNTO 0);
   SIGNAL BU474_T : STD_LOGIC;
   SIGNAL BU474_EN : STD_LOGIC;
   SIGNAL BU474_Q : STD_LOGIC;
   SIGNAL BU474_CLK : STD_LOGIC;
   SIGNAL BU474_CE : STD_LOGIC;
   SIGNAL BU474_ACLR : STD_LOGIC;
   SIGNAL BU474_ASET : STD_LOGIC;
   SIGNAL BU474_AINIT : STD_LOGIC;
   SIGNAL BU474_SCLR : STD_LOGIC;
   SIGNAL BU474_SSET : STD_LOGIC;
   SIGNAL BU474_SINIT : STD_LOGIC;
   SIGNAL BU474_O : STD_LOGIC;
   SIGNAL BU479_CLK : STD_LOGIC;
   SIGNAL BU479_SDIN : STD_LOGIC;
   SIGNAL BU479_Q : STD_LOGIC_VECTOR(12 DOWNTO 0);
   SIGNAL BU479_SINIT : STD_LOGIC;
   SIGNAL BU508_I : STD_LOGIC_VECTOR(3 DOWNTO 0);
   SIGNAL BU508_T : STD_LOGIC;
   SIGNAL BU508_EN : STD_LOGIC;
   SIGNAL BU508_Q : STD_LOGIC;
   SIGNAL BU508_CLK : STD_LOGIC;
   SIGNAL BU508_CE : STD_LOGIC;
   SIGNAL BU508_ACLR : STD_LOGIC;
   SIGNAL BU508_ASET : STD_LOGIC;
   SIGNAL BU508_AINIT : STD_LOGIC;
   SIGNAL BU508_SCLR : STD_LOGIC;
   SIGNAL BU508_SSET : STD_LOGIC;
   SIGNAL BU508_SINIT : STD_LOGIC;
   SIGNAL BU508_O : STD_LOGIC;
   SIGNAL BU513_CLK : STD_LOGIC;
   SIGNAL BU513_SDIN : STD_LOGIC;
   SIGNAL BU513_Q : STD_LOGIC_VECTOR(13 DOWNTO 0);
   SIGNAL BU513_SINIT : STD_LOGIC;
   SIGNAL BU675_A : STD_LOGIC_VECTOR(7 DOWNTO 0);
   SIGNAL BU675_B : STD_LOGIC_VECTOR(7 DOWNTO 0);
   SIGNAL BU675_Q : STD_LOGIC_VECTOR(8 DOWNTO 0);
   SIGNAL BU675_CLK : STD_LOGIC;
   SIGNAL BU675_SCLR : STD_LOGIC;
   SIGNAL BU598_I : STD_LOGIC_VECTOR(1 DOWNTO 0);
   SIGNAL BU598_T : STD_LOGIC;
   SIGNAL BU598_EN : STD_LOGIC;
   SIGNAL BU598_Q : STD_LOGIC;
   SIGNAL BU598_CLK : STD_LOGIC;
   SIGNAL BU598_CE : STD_LOGIC;
   SIGNAL BU598_ACLR : STD_LOGIC;
   SIGNAL BU598_ASET : STD_LOGIC;
   SIGNAL BU598_AINIT : STD_LOGIC;
   SIGNAL BU598_SCLR : STD_LOGIC;
   SIGNAL BU598_SSET : STD_LOGIC;
   SIGNAL BU598_SINIT : STD_LOGIC;
   SIGNAL BU598_O : STD_LOGIC;
   SIGNAL BU603_CLK : STD_LOGIC;
   SIGNAL BU603_SDIN : STD_LOGIC;
   SIGNAL BU603_Q : STD_LOGIC_VECTOR(14 DOWNTO 0);
   SIGNAL BU603_SINIT : STD_LOGIC;
   SIGNAL BU636_I : STD_LOGIC_VECTOR(3 DOWNTO 0);
   SIGNAL BU636_T : STD_LOGIC;
   SIGNAL BU636_EN : STD_LOGIC;
   SIGNAL BU636_Q : STD_LOGIC;
   SIGNAL BU636_CLK : STD_LOGIC;
   SIGNAL BU636_CE : STD_LOGIC;
   SIGNAL BU636_ACLR : STD_LOGIC;
   SIGNAL BU636_ASET : STD_LOGIC;
   SIGNAL BU636_AINIT : STD_LOGIC;
   SIGNAL BU636_SCLR : STD_LOGIC;
   SIGNAL BU636_SSET : STD_LOGIC;
   SIGNAL BU636_SINIT : STD_LOGIC;
   SIGNAL BU636_O : STD_LOGIC;
   SIGNAL BU641_CLK : STD_LOGIC;
   SIGNAL BU641_SDIN : STD_LOGIC;
   SIGNAL BU641_Q : STD_LOGIC_VECTOR(15 DOWNTO 0);
   SIGNAL BU641_SINIT : STD_LOGIC;
   SIGNAL BU940_D : STD_LOGIC_VECTOR(12 DOWNTO 0);
   SIGNAL BU940_Q : STD_LOGIC_VECTOR(12 DOWNTO 0);
   SIGNAL BU940_CLK : STD_LOGIC;
   SIGNAL BU969_A : STD_LOGIC_VECTOR(10 DOWNTO 0);
   SIGNAL BU969_BYPASS : STD_LOGIC;
   SIGNAL BU969_CLK : STD_LOGIC;
   SIGNAL BU969_Q : STD_LOGIC_VECTOR(11 DOWNTO 0);
   SIGNAL BU1055_CLK : STD_LOGIC;
   SIGNAL BU1055_D : STD_LOGIC_VECTOR(0 DOWNTO 0);
   SIGNAL BU1055_Q : STD_LOGIC_VECTOR(0 DOWNTO 0);
   SIGNAL BU1063_CLK : STD_LOGIC;
   SIGNAL BU1063_D : STD_LOGIC_VECTOR(0 DOWNTO 0);
   SIGNAL BU1063_Q : STD_LOGIC_VECTOR(0 DOWNTO 0);
   SIGNAL BU1074_I0 : STD_LOGIC;
   SIGNAL BU1074_I1 : STD_LOGIC;
   SIGNAL BU1074_I2 : STD_LOGIC;
   SIGNAL BU1074_I3 : STD_LOGIC;
   SIGNAL BU1074_O : STD_LOGIC;
   SIGNAL BU1075_D : STD_LOGIC;
   SIGNAL BU1075_C : STD_LOGIC;
   SIGNAL BU1075_CE : STD_LOGIC;
   SIGNAL BU1075_PRE : STD_LOGIC;
   SIGNAL BU1075_Q : STD_LOGIC;
   SIGNAL BU1079_I0 : STD_LOGIC;
   SIGNAL BU1079_I1 : STD_LOGIC;
   SIGNAL BU1079_I2 : STD_LOGIC;
   SIGNAL BU1079_I3 : STD_LOGIC;
   SIGNAL BU1079_O : STD_LOGIC;
   SIGNAL BU1080_D : STD_LOGIC;
   SIGNAL BU1080_C : STD_LOGIC;
   SIGNAL BU1080_CE : STD_LOGIC;
   SIGNAL BU1080_Q : STD_LOGIC;
   SIGNAL BU1084_I0 : STD_LOGIC;
   SIGNAL BU1084_I1 : STD_LOGIC;
   SIGNAL BU1084_I2 : STD_LOGIC;
   SIGNAL BU1084_I3 : STD_LOGIC;
   SIGNAL BU1084_O : STD_LOGIC;
   SIGNAL BU1085_D : STD_LOGIC;
   SIGNAL BU1085_C : STD_LOGIC;
   SIGNAL BU1085_CE : STD_LOGIC;
   SIGNAL BU1085_Q : STD_LOGIC;
   SIGNAL BU1087_A : STD_LOGIC_VECTOR(10 DOWNTO 0);
   SIGNAL BU1087_CLK : STD_LOGIC;
   SIGNAL BU1087_ACLR : STD_LOGIC;
   SIGNAL BU1087_QA_GE_B : STD_LOGIC;
   SIGNAL BU1126_A : STD_LOGIC_VECTOR(10 DOWNTO 0);
   SIGNAL BU1126_CLK : STD_LOGIC;
   SIGNAL BU1126_ACLR : STD_LOGIC;
   SIGNAL BU1126_QA_EQ_B : STD_LOGIC;
   SIGNAL BU898_addr : STD_LOGIC_VECTOR(10 DOWNTO 0);
   SIGNAL BU898_clk : STD_LOGIC;
   SIGNAL BU898_din : STD_LOGIC_VECTOR(13 DOWNTO 0);
   SIGNAL BU898_dout : STD_LOGIC_VECTOR(13 DOWNTO 0);
   SIGNAL BU898_en : STD_LOGIC;
   SIGNAL BU898_nd : STD_LOGIC;
   SIGNAL BU898_rfd : STD_LOGIC;
   SIGNAL BU898_rdy : STD_LOGIC;
   SIGNAL BU898_sinit : STD_LOGIC;
   SIGNAL BU898_we : STD_LOGIC;
   SIGNAL BU1145_A : STD_LOGIC_VECTOR(14 DOWNTO 0);
   SIGNAL BU1145_B : STD_LOGIC_VECTOR(14 DOWNTO 0);
   SIGNAL BU1145_C_IN : STD_LOGIC;
   SIGNAL BU1145_ADD : STD_LOGIC;
   SIGNAL BU1145_Q : STD_LOGIC_VECTOR(14 DOWNTO 0);
   SIGNAL BU1145_CLK : STD_LOGIC;
   SIGNAL BU1145_CE : STD_LOGIC;
   SIGNAL BU1145_SCLR : STD_LOGIC;
   SIGNAL BU1236_CLK : STD_LOGIC;
   SIGNAL BU1236_SDIN : STD_LOGIC;
   SIGNAL BU1236_SDOUT : STD_LOGIC;
   SIGNAL BU1236_SCLR : STD_LOGIC;
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
   SIGNAL n47 : STD_LOGIC;
   SIGNAL n48 : STD_LOGIC;
   SIGNAL n49 : STD_LOGIC;
   SIGNAL n50 : STD_LOGIC;
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
   SIGNAL n97 : STD_LOGIC;
   SIGNAL n98 : STD_LOGIC;
   SIGNAL n99 : STD_LOGIC;
   SIGNAL n100 : STD_LOGIC;
   SIGNAL n101 : STD_LOGIC;
   SIGNAL n102 : STD_LOGIC;
   SIGNAL n103 : STD_LOGIC;
   SIGNAL n104 : STD_LOGIC;
   SIGNAL n105 : STD_LOGIC;
   SIGNAL n106 : STD_LOGIC;
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
   SIGNAL n155 : STD_LOGIC;
   SIGNAL n156 : STD_LOGIC;
   SIGNAL n157 : STD_LOGIC;
   SIGNAL n158 : STD_LOGIC;
   SIGNAL n159 : STD_LOGIC;
   SIGNAL n160 : STD_LOGIC;
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
   SIGNAL n177 : STD_LOGIC;
   SIGNAL n178 : STD_LOGIC;
   SIGNAL n179 : STD_LOGIC;
   SIGNAL n180 : STD_LOGIC;
   SIGNAL n181 : STD_LOGIC;
   SIGNAL n182 : STD_LOGIC;
   SIGNAL n183 : STD_LOGIC;
   SIGNAL n184 : STD_LOGIC;
   SIGNAL n185 : STD_LOGIC;
   SIGNAL n186 : STD_LOGIC;
   SIGNAL n187 : STD_LOGIC;
   SIGNAL n188 : STD_LOGIC;
   SIGNAL n189 : STD_LOGIC;
   SIGNAL n190 : STD_LOGIC;
   SIGNAL n191 : STD_LOGIC;
   SIGNAL n192 : STD_LOGIC;
   SIGNAL n193 : STD_LOGIC;
   SIGNAL n250 : STD_LOGIC;
   SIGNAL n251 : STD_LOGIC;
   SIGNAL n252 : STD_LOGIC;
   SIGNAL n253 : STD_LOGIC;
   SIGNAL n254 : STD_LOGIC;
   SIGNAL n255 : STD_LOGIC;
   SIGNAL n256 : STD_LOGIC;
   SIGNAL n257 : STD_LOGIC;
   SIGNAL n258 : STD_LOGIC;
   SIGNAL n259 : STD_LOGIC;
   SIGNAL n260 : STD_LOGIC;
   SIGNAL n261 : STD_LOGIC;
   SIGNAL n262 : STD_LOGIC;
   SIGNAL n263 : STD_LOGIC;
   SIGNAL n264 : STD_LOGIC;
   SIGNAL n265 : STD_LOGIC;
   SIGNAL n266 : STD_LOGIC;
   SIGNAL n267 : STD_LOGIC;
   SIGNAL n268 : STD_LOGIC;
   SIGNAL n269 : STD_LOGIC;
   SIGNAL n270 : STD_LOGIC;
   SIGNAL n271 : STD_LOGIC;
   SIGNAL n272 : STD_LOGIC;
   SIGNAL n273 : STD_LOGIC;
   SIGNAL n274 : STD_LOGIC;
   SIGNAL n275 : STD_LOGIC;
   SIGNAL n276 : STD_LOGIC;
   SIGNAL n277 : STD_LOGIC;
   SIGNAL n278 : STD_LOGIC;
   SIGNAL n279 : STD_LOGIC;
   SIGNAL n280 : STD_LOGIC;
   SIGNAL n281 : STD_LOGIC;
   SIGNAL n1614 : STD_LOGIC;
   SIGNAL n1615 : STD_LOGIC;
   SIGNAL n1616 : STD_LOGIC;
   SIGNAL n1617 : STD_LOGIC;
   SIGNAL n1618 : STD_LOGIC;
   SIGNAL n1619 : STD_LOGIC;
   SIGNAL n1620 : STD_LOGIC;
   SIGNAL n1621 : STD_LOGIC;
   SIGNAL n1622 : STD_LOGIC;
   SIGNAL n1623 : STD_LOGIC;
   SIGNAL n1624 : STD_LOGIC;
   SIGNAL n1625 : STD_LOGIC;
   SIGNAL n1664 : STD_LOGIC;
   SIGNAL n1665 : STD_LOGIC;
   SIGNAL n1666 : STD_LOGIC;
   SIGNAL n1667 : STD_LOGIC;
   SIGNAL n1668 : STD_LOGIC;
   SIGNAL n1669 : STD_LOGIC;
   SIGNAL n1670 : STD_LOGIC;
   SIGNAL n1671 : STD_LOGIC;
   SIGNAL n1672 : STD_LOGIC;
   SIGNAL n1673 : STD_LOGIC;
   SIGNAL n1674 : STD_LOGIC;
   SIGNAL n1715 : STD_LOGIC;
   SIGNAL n1716 : STD_LOGIC;
   SIGNAL n1717 : STD_LOGIC;
   SIGNAL n1718 : STD_LOGIC;
   SIGNAL n1719 : STD_LOGIC;
   SIGNAL n1720 : STD_LOGIC;
   SIGNAL n1721 : STD_LOGIC;
   SIGNAL n1722 : STD_LOGIC;
   SIGNAL n1723 : STD_LOGIC;
   SIGNAL n1724 : STD_LOGIC;
   SIGNAL n1725 : STD_LOGIC;
   SIGNAL n1726 : STD_LOGIC;
   SIGNAL n1727 : STD_LOGIC;
   SIGNAL n1728 : STD_LOGIC;
   SIGNAL n1729 : STD_LOGIC;
   SIGNAL n1730 : STD_LOGIC;
   SIGNAL n1731 : STD_LOGIC;
   SIGNAL n1732 : STD_LOGIC;
   SIGNAL n1733 : STD_LOGIC;
   SIGNAL n1770 : STD_LOGIC;
   SIGNAL n1771 : STD_LOGIC;
   SIGNAL n1772 : STD_LOGIC;
   SIGNAL n1773 : STD_LOGIC;
   SIGNAL n1774 : STD_LOGIC;
   SIGNAL n1775 : STD_LOGIC;
   SIGNAL n1776 : STD_LOGIC;
   SIGNAL n1777 : STD_LOGIC;
   SIGNAL n1778 : STD_LOGIC;
   SIGNAL n1779 : STD_LOGIC;
   SIGNAL n1780 : STD_LOGIC;
   SIGNAL n1823 : STD_LOGIC;
   SIGNAL n1824 : STD_LOGIC;
   SIGNAL n1825 : STD_LOGIC;
   SIGNAL n1826 : STD_LOGIC;
   SIGNAL n1827 : STD_LOGIC;
   SIGNAL n1828 : STD_LOGIC;
   SIGNAL n1829 : STD_LOGIC;
   SIGNAL n1830 : STD_LOGIC;
   SIGNAL n1831 : STD_LOGIC;
   SIGNAL n2467 : STD_LOGIC;
   SIGNAL n2468 : STD_LOGIC;
   SIGNAL n2469 : STD_LOGIC;
   SIGNAL n2470 : STD_LOGIC;
   SIGNAL n2471 : STD_LOGIC;
   SIGNAL n2472 : STD_LOGIC;
   SIGNAL n2473 : STD_LOGIC;
   SIGNAL n2474 : STD_LOGIC;
   SIGNAL n2475 : STD_LOGIC;
   SIGNAL n2476 : STD_LOGIC;
   SIGNAL n2477 : STD_LOGIC;
   SIGNAL n2478 : STD_LOGIC;
   SIGNAL n2479 : STD_LOGIC;
   SIGNAL n2480 : STD_LOGIC;
   SIGNAL n2481 : STD_LOGIC;
   SIGNAL n2504 : STD_LOGIC;
   SIGNAL n2505 : STD_LOGIC;
   SIGNAL n2506 : STD_LOGIC;
   SIGNAL n2507 : STD_LOGIC;
   SIGNAL n2508 : STD_LOGIC;
   SIGNAL n2509 : STD_LOGIC;
   SIGNAL n2510 : STD_LOGIC;
   SIGNAL n2511 : STD_LOGIC;
   SIGNAL n2512 : STD_LOGIC;
   SIGNAL n2513 : STD_LOGIC;
   SIGNAL n2514 : STD_LOGIC;
   SIGNAL n2518 : STD_LOGIC;
   SIGNAL n2519 : STD_LOGIC;
   SIGNAL n2520 : STD_LOGIC;
   SIGNAL n2521 : STD_LOGIC;
   SIGNAL n2522 : STD_LOGIC;
   SIGNAL n2523 : STD_LOGIC;
   SIGNAL n2524 : STD_LOGIC;
   SIGNAL n2525 : STD_LOGIC;
   SIGNAL n2526 : STD_LOGIC;
   SIGNAL n2527 : STD_LOGIC;
   SIGNAL n2528 : STD_LOGIC;
   SIGNAL n2529 : STD_LOGIC;
   SIGNAL n2530 : STD_LOGIC;
   SIGNAL n2531 : STD_LOGIC;
   SIGNAL n2532 : STD_LOGIC;
   SIGNAL n2533 : STD_LOGIC;
   SIGNAL n2534 : STD_LOGIC;
   SIGNAL n2535 : STD_LOGIC;
   SIGNAL n2536 : STD_LOGIC;
   SIGNAL n2552 : STD_LOGIC;
   SIGNAL n2786 : STD_LOGIC;
   SIGNAL n2803 : STD_LOGIC;
   SIGNAL n2819 : STD_LOGIC;

BEGIN

   n139 <= DATA(0);
   n140 <= DATA(1);
   n141 <= DATA(2);
   n142 <= DATA(3);
   n143 <= DATA(4);
   n144 <= DATA(5);
   n145 <= DATA(6);
   n146 <= DATA(7);
   n147 <= DATA(8);
   n148 <= DATA(9);
   n149 <= DATA(10);
   n150 <= DATA(11);
   n151 <= DATA(12);
   n152 <= DATA(13);
   n153 <= DATA(14);
   n154 <= DATA(15);
   n155 <= DATA(16);
   n156 <= DATA(17);
   n157 <= DATA(18);
   n158 <= DATA(19);
   n159 <= DATA(20);
   n160 <= DATA(21);
   n161 <= DATA(22);
   n162 <= DATA(23);
   n163 <= DATA(24);
   n164 <= DATA(25);
   n165 <= DATA(26);
   n166 <= DATA(27);
   n167 <= DATA(28);
   n168 <= DATA(29);
   n169 <= DATA(30);
   n170 <= DATA(31);
   n8 <= WE;
   n3 <= A(0);
   n4 <= A(1);
   n5 <= A(2);
   n6 <= A(3);
   n7 <= A(4);
   n177 <= CLK;
   n178 <= SCLR;
   SINE(0) <= n179;
   SINE(1) <= n180;
   SINE(2) <= n181;
   SINE(3) <= n182;
   SINE(4) <= n183;
   SINE(5) <= n184;
   SINE(6) <= n185;
   SINE(7) <= n186;
   SINE(8) <= n187;
   SINE(9) <= n188;
   SINE(10) <= n189;
   SINE(11) <= n190;
   SINE(12) <= n191;
   SINE(13) <= n192;
   SINE(14) <= n193;

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

   BU12_D(0) <= n139;
   BU12_D(1) <= n140;
   BU12_D(2) <= n141;
   BU12_D(3) <= n142;
   BU12_D(4) <= n143;
   BU12_D(5) <= n144;
   BU12_D(6) <= n145;
   BU12_D(7) <= n146;
   BU12_D(8) <= n147;
   BU12_D(9) <= n148;
   BU12_D(10) <= n149;
   BU12_D(11) <= n150;
   BU12_D(12) <= n151;
   BU12_D(13) <= n152;
   BU12_D(14) <= n153;
   BU12_D(15) <= n154;
   BU12_D(16) <= n155;
   BU12_D(17) <= n156;
   BU12_D(18) <= n157;
   BU12_D(19) <= n158;
   BU12_D(20) <= n159;
   BU12_D(21) <= n160;
   BU12_D(22) <= n161;
   BU12_D(23) <= n162;
   BU12_D(24) <= n163;
   BU12_D(25) <= n164;
   BU12_D(26) <= n165;
   BU12_D(27) <= n166;
   BU12_D(28) <= n167;
   BU12_D(29) <= n168;
   BU12_D(30) <= n169;
   BU12_D(31) <= n170;
   n250 <= BU12_Q(0);
   n251 <= BU12_Q(1);
   n252 <= BU12_Q(2);
   n253 <= BU12_Q(3);
   n254 <= BU12_Q(4);
   n255 <= BU12_Q(5);
   n256 <= BU12_Q(6);
   n257 <= BU12_Q(7);
   n258 <= BU12_Q(8);
   n259 <= BU12_Q(9);
   n260 <= BU12_Q(10);
   n261 <= BU12_Q(11);
   n262 <= BU12_Q(12);
   n263 <= BU12_Q(13);
   n264 <= BU12_Q(14);
   n265 <= BU12_Q(15);
   n266 <= BU12_Q(16);
   n267 <= BU12_Q(17);
   n268 <= BU12_Q(18);
   n269 <= BU12_Q(19);
   n270 <= BU12_Q(20);
   n271 <= BU12_Q(21);
   n272 <= BU12_Q(22);
   n273 <= BU12_Q(23);
   n274 <= BU12_Q(24);
   n275 <= BU12_Q(25);
   n276 <= BU12_Q(26);
   n277 <= BU12_Q(27);
   n278 <= BU12_Q(28);
   n279 <= BU12_Q(29);
   n280 <= BU12_Q(30);
   n281 <= BU12_Q(31);
   BU12_CLK <= n177;
   BU12_CE <= n2;
   BU12 : C_REG_FD_V7_0
      GENERIC MAP (
         c_width => 32,
         c_has_ce => 1,
         c_sinit_val => "00000000000000000000000000000000",
         c_has_sinit => 0,
         c_ainit_val => "00000000000000000000000000000000",
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

   BU78_A(0) <= n19;
   BU78_A(1) <= n20;
   BU78_A(2) <= n21;
   BU78_A(3) <= n22;
   BU78_A(4) <= n23;
   BU78_A(5) <= n24;
   BU78_A(6) <= n25;
   BU78_A(7) <= n26;
   BU78_A(8) <= n27;
   BU78_A(9) <= n28;
   BU78_A(10) <= n29;
   BU78_A(11) <= n30;
   BU78_A(12) <= n31;
   BU78_A(13) <= n32;
   BU78_A(14) <= n33;
   BU78_A(15) <= n34;
   BU78_A(16) <= n35;
   BU78_A(17) <= n36;
   BU78_A(18) <= n37;
   BU78_A(19) <= n38;
   BU78_A(20) <= n39;
   BU78_A(21) <= n40;
   BU78_A(22) <= n41;
   BU78_A(23) <= n42;
   BU78_A(24) <= n43;
   BU78_A(25) <= n44;
   BU78_A(26) <= n45;
   BU78_A(27) <= n46;
   BU78_A(28) <= n47;
   BU78_A(29) <= n48;
   BU78_A(30) <= n49;
   BU78_A(31) <= n50;
   BU78_B(0) <= n250;
   BU78_B(1) <= n251;
   BU78_B(2) <= n252;
   BU78_B(3) <= n253;
   BU78_B(4) <= n254;
   BU78_B(5) <= n255;
   BU78_B(6) <= n256;
   BU78_B(7) <= n257;
   BU78_B(8) <= n258;
   BU78_B(9) <= n259;
   BU78_B(10) <= n260;
   BU78_B(11) <= n261;
   BU78_B(12) <= n262;
   BU78_B(13) <= n263;
   BU78_B(14) <= n264;
   BU78_B(15) <= n265;
   BU78_B(16) <= n266;
   BU78_B(17) <= n267;
   BU78_B(18) <= n268;
   BU78_B(19) <= n269;
   BU78_B(20) <= n270;
   BU78_B(21) <= n271;
   BU78_B(22) <= n272;
   BU78_B(23) <= n273;
   BU78_B(24) <= n274;
   BU78_B(25) <= n275;
   BU78_B(26) <= n276;
   BU78_B(27) <= n277;
   BU78_B(28) <= n278;
   BU78_B(29) <= n279;
   BU78_B(30) <= n280;
   BU78_B(31) <= n281;
   n19 <= BU78_Q(0);
   n20 <= BU78_Q(1);
   n21 <= BU78_Q(2);
   n22 <= BU78_Q(3);
   n23 <= BU78_Q(4);
   n24 <= BU78_Q(5);
   n25 <= BU78_Q(6);
   n26 <= BU78_Q(7);
   n27 <= BU78_Q(8);
   n28 <= BU78_Q(9);
   n29 <= BU78_Q(10);
   n30 <= BU78_Q(11);
   n31 <= BU78_Q(12);
   n32 <= BU78_Q(13);
   n33 <= BU78_Q(14);
   n34 <= BU78_Q(15);
   n35 <= BU78_Q(16);
   n36 <= BU78_Q(17);
   n37 <= BU78_Q(18);
   n38 <= BU78_Q(19);
   n39 <= BU78_Q(20);
   n40 <= BU78_Q(21);
   n41 <= BU78_Q(22);
   n42 <= BU78_Q(23);
   n43 <= BU78_Q(24);
   n44 <= BU78_Q(25);
   n45 <= BU78_Q(26);
   n46 <= BU78_Q(27);
   n47 <= BU78_Q(28);
   n48 <= BU78_Q(29);
   n49 <= BU78_Q(30);
   n50 <= BU78_Q(31);
   BU78_CLK <= n177;
   BU78_SCLR <= n178;
   BU78 : C_ADDSUB_V7_0
      GENERIC MAP (
         c_has_bypass_with_cin => 0,
         c_a_type => 1,
         c_has_sclr => 1,
         c_has_aset => 0,
         c_has_b_out => 0,
         c_sync_priority => 0,
         c_has_s => 1,
         c_has_q => 1,
         c_bypass_enable => 1,
         c_b_constant => 0,
         c_has_ovfl => 0,
         c_high_bit => 31,
         c_latency => 1,
         c_sinit_val => "00000000000000000000000000000000",
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
         c_b_value => "00000000000000000000000000000000",
         c_add_mode => 0,
         c_has_aclr => 0,
         c_out_width => 32,
         c_low_bit => 0,
         c_ainit_val => "00000000000000000000000000000000",
         c_has_q_ovfl => 0,
         c_has_q_b_out => 0,
         c_has_c_out => 0,
         c_b_width => 32,
         c_a_width => 32,
         c_sync_enable => 0,
         c_has_ce => 0,
         c_has_c_in => 0
      )
      PORT MAP (
         A => BU78_A,
         B => BU78_B,
         Q => BU78_Q,
         CLK => BU78_CLK,
         SCLR => BU78_SCLR
      );

   BU270_CLK <= n177;
   n83 <= BU270_SDOUT;
   BU270_SCLR <= n178;
   BU270 : C_SHIFT_FD_V7_0
      GENERIC MAP (
         c_has_aset => 0,
         c_has_d => 0,
         c_sync_priority => 1,
         c_has_sclr => 1,
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
         CLK => BU270_CLK,
         SDOUT => BU270_SDOUT,
         SCLR => BU270_SCLR
      );

   BU279_A(0) <= n19;
   BU279_A(1) <= n20;
   BU279_A(2) <= n21;
   BU279_A(3) <= n22;
   BU279_A(4) <= n23;
   BU279_A(5) <= n24;
   BU279_A(6) <= n25;
   BU279_A(7) <= n26;
   BU279_A(8) <= n27;
   BU279_A(9) <= n28;
   BU279_A(10) <= n29;
   BU279_A(11) <= n30;
   BU279_A(12) <= n31;
   BU279_A(13) <= n32;
   BU279_A(14) <= n33;
   BU279_A(15) <= n34;
   BU279_A(16) <= n35;
   BU279_A(17) <= n36;
   BU279_A(18) <= n37;
   BU279_A(19) <= n38;
   BU279_A(20) <= n39;
   BU279_A(21) <= n40;
   BU279_A(22) <= n41;
   BU279_A(23) <= n42;
   BU279_A(24) <= n43;
   BU279_A(25) <= n44;
   BU279_A(26) <= n45;
   BU279_A(27) <= n46;
   BU279_A(28) <= n47;
   BU279_A(29) <= n48;
   BU279_A(30) <= n49;
   BU279_A(31) <= n50;
   n61 <= BU279_Q(10);
   n62 <= BU279_Q(11);
   n63 <= BU279_Q(12);
   n64 <= BU279_Q(13);
   n65 <= BU279_Q(14);
   n66 <= BU279_Q(15);
   n67 <= BU279_Q(16);
   n68 <= BU279_Q(17);
   n69 <= BU279_Q(18);
   n70 <= BU279_Q(19);
   n71 <= BU279_Q(20);
   n72 <= BU279_Q(21);
   n73 <= BU279_Q(22);
   n74 <= BU279_Q(23);
   n75 <= BU279_Q(24);
   n76 <= BU279_Q(25);
   n77 <= BU279_Q(26);
   n78 <= BU279_Q(27);
   n79 <= BU279_Q(28);
   n80 <= BU279_Q(29);
   n81 <= BU279_Q(30);
   n82 <= BU279_Q(31);
   BU279_CLK <= n177;
   BU279 : C_ADDSUB_V7_0
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
         c_high_bit => 31,
         c_latency => 1,
         c_sinit_val => "00000000000000000000000000000000",
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
         c_b_value => "00000000000000000000000000000000",
         c_add_mode => 0,
         c_has_aclr => 0,
         c_out_width => 32,
         c_low_bit => 0,
         c_ainit_val => "00000000000000000000000000000000",
         c_has_q_ovfl => 0,
         c_has_q_b_out => 0,
         c_has_c_out => 0,
         c_b_width => 32,
         c_a_width => 32,
         c_sync_enable => 0,
         c_has_ce => 0,
         c_has_c_in => 0
      )
      PORT MAP (
         A => BU279_A,
         Q => BU279_Q,
         CLK => BU279_CLK
      );

   BU790_A(0) <= n61;
   BU790_A(1) <= n62;
   BU790_A(2) <= n63;
   BU790_A(3) <= n64;
   BU790_A(4) <= n65;
   BU790_A(5) <= n66;
   BU790_A(6) <= n67;
   BU790_A(7) <= n68;
   BU790_A(8) <= n69;
   BU790_A(9) <= n70;
   BU790_A(10) <= n71;
   BU790_A(11) <= n72;
   BU790_A(12) <= n73;
   BU790_A(13) <= n74;
   BU790_A(14) <= n75;
   BU790_A(15) <= n76;
   BU790_A(16) <= n77;
   BU790_A(17) <= n78;
   BU790_A(18) <= n79;
   BU790_A(19) <= n80;
   BU790_A(20) <= n81;
   BU790_A(21) <= n82;
   BU790_B(0) <= n97;
   BU790_B(1) <= n98;
   BU790_B(2) <= n99;
   BU790_B(3) <= n100;
   BU790_B(4) <= n101;
   BU790_B(5) <= n102;
   BU790_B(6) <= n103;
   BU790_B(7) <= n104;
   BU790_B(8) <= n105;
   BU790_B(9) <= n106;
   n84 <= BU790_Q(0);
   n85 <= BU790_Q(1);
   n86 <= BU790_Q(2);
   n87 <= BU790_Q(3);
   n88 <= BU790_Q(4);
   n89 <= BU790_Q(5);
   n90 <= BU790_Q(6);
   n91 <= BU790_Q(7);
   n92 <= BU790_Q(8);
   n93 <= BU790_Q(9);
   n94 <= BU790_Q(10);
   n95 <= BU790_Q(11);
   n96 <= BU790_Q(12);
   BU790_CLK <= n177;
   BU790_SCLR <= n178;
   BU790 : C_ADDSUB_V7_0
      GENERIC MAP (
         c_has_bypass_with_cin => 0,
         c_a_type => 1,
         c_has_sclr => 1,
         c_has_aset => 0,
         c_has_b_out => 0,
         c_sync_priority => 0,
         c_has_s => 1,
         c_has_q => 1,
         c_bypass_enable => 1,
         c_b_constant => 0,
         c_has_ovfl => 0,
         c_high_bit => 21,
         c_latency => 1,
         c_sinit_val => "0000000000000",
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
         c_b_value => "0000000000000000000000",
         c_add_mode => 0,
         c_has_aclr => 0,
         c_out_width => 13,
         c_low_bit => 9,
         c_ainit_val => "0000000000000",
         c_has_q_ovfl => 0,
         c_has_q_b_out => 0,
         c_has_c_out => 0,
         c_b_width => 10,
         c_a_width => 22,
         c_sync_enable => 0,
         c_has_ce => 0,
         c_has_c_in => 0
      )
      PORT MAP (
         A => BU790_A,
         B => BU790_B,
         Q => BU790_Q,
         CLK => BU790_CLK,
         SCLR => BU790_SCLR
      );

   BU729_A(0) <= n1715;
   BU729_A(1) <= n1716;
   BU729_A(2) <= n1717;
   BU729_A(3) <= n1718;
   BU729_A(4) <= n1719;
   BU729_A(5) <= n1720;
   BU729_A(6) <= n1721;
   BU729_A(7) <= n1722;
   BU729_A(8) <= n1723;
   BU729_B(0) <= n1823;
   BU729_B(1) <= n1824;
   BU729_B(2) <= n1825;
   BU729_B(3) <= n1826;
   BU729_B(4) <= n1827;
   BU729_B(5) <= n1828;
   BU729_B(6) <= n1829;
   BU729_B(7) <= n1830;
   BU729_B(8) <= n1831;
   n97 <= BU729_Q(0);
   n98 <= BU729_Q(1);
   n99 <= BU729_Q(2);
   n100 <= BU729_Q(3);
   n101 <= BU729_Q(4);
   n102 <= BU729_Q(5);
   n103 <= BU729_Q(6);
   n104 <= BU729_Q(7);
   n105 <= BU729_Q(8);
   n106 <= BU729_Q(9);
   BU729_CLK <= n177;
   BU729_SCLR <= n178;
   BU729 : C_ADDSUB_V7_0
      GENERIC MAP (
         c_has_bypass_with_cin => 0,
         c_a_type => 0,
         c_has_sclr => 1,
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
         A => BU729_A,
         B => BU729_B,
         Q => BU729_Q,
         CLK => BU729_CLK,
         SCLR => BU729_SCLR
      );

   BU543_A(0) <= n1614;
   BU543_A(1) <= n1615;
   BU543_A(2) <= n1616;
   BU543_A(3) <= n1617;
   BU543_A(4) <= n1618;
   BU543_A(5) <= n1619;
   BU543_A(6) <= n1620;
   BU543_A(7) <= n1621;
   BU543_B(0) <= n1664;
   BU543_B(1) <= n1665;
   BU543_B(2) <= n1666;
   BU543_B(3) <= n1667;
   BU543_B(4) <= n1668;
   BU543_B(5) <= n1669;
   BU543_B(6) <= n1670;
   BU543_B(7) <= n1671;
   n1715 <= BU543_Q(0);
   n1716 <= BU543_Q(1);
   n1717 <= BU543_Q(2);
   n1718 <= BU543_Q(3);
   n1719 <= BU543_Q(4);
   n1720 <= BU543_Q(5);
   n1721 <= BU543_Q(6);
   n1722 <= BU543_Q(7);
   n1723 <= BU543_Q(8);
   BU543_CLK <= n177;
   BU543_SCLR <= n178;
   BU543 : C_ADDSUB_V7_0
      GENERIC MAP (
         c_has_bypass_with_cin => 0,
         c_a_type => 0,
         c_has_sclr => 1,
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
         A => BU543_A,
         B => BU543_B,
         Q => BU543_Q,
         CLK => BU543_CLK,
         SCLR => BU543_SCLR
      );

   BU474_I(0) <= n1623;
   BU474_I(1) <= n1624;
   BU474_I(2) <= n1625;
   BU474_I(3) <= n1621;
   BU474_T <= '0';
   BU474_EN <= '0';
   BU474_CLK <= '0';
   BU474_CE <= '0';
   BU474_ACLR <= '0';
   BU474_ASET <= '0';
   BU474_AINIT <= '0';
   BU474_SCLR <= '0';
   BU474_SSET <= '0';
   BU474_SINIT <= '0';
   n1622 <= BU474_O;
   BU474 : C_GATE_BIT_V7_0
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
         I => BU474_I,
         T => BU474_T,
         EN => BU474_EN,
         Q => BU474_Q,
         CLK => BU474_CLK,
         CE => BU474_CE,
         ACLR => BU474_ACLR,
         ASET => BU474_ASET,
         AINIT => BU474_AINIT,
         SCLR => BU474_SCLR,
         SSET => BU474_SSET,
         SINIT => BU474_SINIT,
         O => BU474_O
      );

   BU479_CLK <= n177;
   BU479_SDIN <= n1622;
   n1623 <= BU479_Q(0);
   n1624 <= BU479_Q(2);
   n1625 <= BU479_Q(3);
   n1614 <= BU479_Q(5);
   n1615 <= BU479_Q(6);
   n1616 <= BU479_Q(7);
   n1617 <= BU479_Q(8);
   n1618 <= BU479_Q(9);
   n1619 <= BU479_Q(10);
   n1620 <= BU479_Q(11);
   n1621 <= BU479_Q(12);
   BU479_SINIT <= n178;
   BU479 : C_SHIFT_FD_V7_0
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
         c_has_sinit => 1,
         c_has_q => 1,
         c_shift_type => 0,
         c_has_sdin => 1,
         c_has_lsb_2_msb => 0
      )
      PORT MAP (
         CLK => BU479_CLK,
         SDIN => BU479_SDIN,
         Q => BU479_Q,
         SINIT => BU479_SINIT
      );

   BU508_I(0) <= n1673;
   BU508_I(1) <= n1674;
   BU508_I(2) <= n1667;
   BU508_I(3) <= n1671;
   BU508_T <= '0';
   BU508_EN <= '0';
   BU508_CLK <= '0';
   BU508_CE <= '0';
   BU508_ACLR <= '0';
   BU508_ASET <= '0';
   BU508_AINIT <= '0';
   BU508_SCLR <= '0';
   BU508_SSET <= '0';
   BU508_SINIT <= '0';
   n1672 <= BU508_O;
   BU508 : C_GATE_BIT_V7_0
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
         I => BU508_I,
         T => BU508_T,
         EN => BU508_EN,
         Q => BU508_Q,
         CLK => BU508_CLK,
         CE => BU508_CE,
         ACLR => BU508_ACLR,
         ASET => BU508_ASET,
         AINIT => BU508_AINIT,
         SCLR => BU508_SCLR,
         SSET => BU508_SSET,
         SINIT => BU508_SINIT,
         O => BU508_O
      );

   BU513_CLK <= n177;
   BU513_SDIN <= n1672;
   n1673 <= BU513_Q(0);
   n1674 <= BU513_Q(5);
   n1664 <= BU513_Q(6);
   n1665 <= BU513_Q(7);
   n1666 <= BU513_Q(8);
   n1667 <= BU513_Q(9);
   n1668 <= BU513_Q(10);
   n1669 <= BU513_Q(11);
   n1670 <= BU513_Q(12);
   n1671 <= BU513_Q(13);
   BU513_SINIT <= n178;
   BU513 : C_SHIFT_FD_V7_0
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
         c_has_sinit => 1,
         c_has_q => 1,
         c_shift_type => 0,
         c_has_sdin => 1,
         c_has_lsb_2_msb => 0
      )
      PORT MAP (
         CLK => BU513_CLK,
         SDIN => BU513_SDIN,
         Q => BU513_Q,
         SINIT => BU513_SINIT
      );

   BU675_A(0) <= n1724;
   BU675_A(1) <= n1725;
   BU675_A(2) <= n1726;
   BU675_A(3) <= n1727;
   BU675_A(4) <= n1728;
   BU675_A(5) <= n1729;
   BU675_A(6) <= n1730;
   BU675_A(7) <= n1731;
   BU675_B(0) <= n1770;
   BU675_B(1) <= n1771;
   BU675_B(2) <= n1772;
   BU675_B(3) <= n1773;
   BU675_B(4) <= n1774;
   BU675_B(5) <= n1775;
   BU675_B(6) <= n1776;
   BU675_B(7) <= n1777;
   n1823 <= BU675_Q(0);
   n1824 <= BU675_Q(1);
   n1825 <= BU675_Q(2);
   n1826 <= BU675_Q(3);
   n1827 <= BU675_Q(4);
   n1828 <= BU675_Q(5);
   n1829 <= BU675_Q(6);
   n1830 <= BU675_Q(7);
   n1831 <= BU675_Q(8);
   BU675_CLK <= n177;
   BU675_SCLR <= n178;
   BU675 : C_ADDSUB_V7_0
      GENERIC MAP (
         c_has_bypass_with_cin => 0,
         c_a_type => 0,
         c_has_sclr => 1,
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
         A => BU675_A,
         B => BU675_B,
         Q => BU675_Q,
         CLK => BU675_CLK,
         SCLR => BU675_SCLR
      );

   BU598_I(0) <= n1733;
   BU598_I(1) <= n1731;
   BU598_T <= '0';
   BU598_EN <= '0';
   BU598_CLK <= '0';
   BU598_CE <= '0';
   BU598_ACLR <= '0';
   BU598_ASET <= '0';
   BU598_AINIT <= '0';
   BU598_SCLR <= '0';
   BU598_SSET <= '0';
   BU598_SINIT <= '0';
   n1732 <= BU598_O;
   BU598 : C_GATE_BIT_V7_0
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
         I => BU598_I,
         T => BU598_T,
         EN => BU598_EN,
         Q => BU598_Q,
         CLK => BU598_CLK,
         CE => BU598_CE,
         ACLR => BU598_ACLR,
         ASET => BU598_ASET,
         AINIT => BU598_AINIT,
         SCLR => BU598_SCLR,
         SSET => BU598_SSET,
         SINIT => BU598_SINIT,
         O => BU598_O
      );

   BU603_CLK <= n177;
   BU603_SDIN <= n1732;
   n1733 <= BU603_Q(0);
   n1724 <= BU603_Q(7);
   n1725 <= BU603_Q(8);
   n1726 <= BU603_Q(9);
   n1727 <= BU603_Q(10);
   n1728 <= BU603_Q(11);
   n1729 <= BU603_Q(12);
   n1730 <= BU603_Q(13);
   n1731 <= BU603_Q(14);
   BU603_SINIT <= n178;
   BU603 : C_SHIFT_FD_V7_0
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
         c_has_sinit => 1,
         c_has_q => 1,
         c_shift_type => 0,
         c_has_sdin => 1,
         c_has_lsb_2_msb => 0
      )
      PORT MAP (
         CLK => BU603_CLK,
         SDIN => BU603_SDIN,
         Q => BU603_Q,
         SINIT => BU603_SINIT
      );

   BU636_I(0) <= n1779;
   BU636_I(1) <= n1780;
   BU636_I(2) <= n1773;
   BU636_I(3) <= n1777;
   BU636_T <= '0';
   BU636_EN <= '0';
   BU636_CLK <= '0';
   BU636_CE <= '0';
   BU636_ACLR <= '0';
   BU636_ASET <= '0';
   BU636_AINIT <= '0';
   BU636_SCLR <= '0';
   BU636_SSET <= '0';
   BU636_SINIT <= '0';
   n1778 <= BU636_O;
   BU636 : C_GATE_BIT_V7_0
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
         I => BU636_I,
         T => BU636_T,
         EN => BU636_EN,
         Q => BU636_Q,
         CLK => BU636_CLK,
         CE => BU636_CE,
         ACLR => BU636_ACLR,
         ASET => BU636_ASET,
         AINIT => BU636_AINIT,
         SCLR => BU636_SCLR,
         SSET => BU636_SSET,
         SINIT => BU636_SINIT,
         O => BU636_O
      );

   BU641_CLK <= n177;
   BU641_SDIN <= n1778;
   n1779 <= BU641_Q(0);
   n1780 <= BU641_Q(2);
   n1770 <= BU641_Q(8);
   n1771 <= BU641_Q(9);
   n1772 <= BU641_Q(10);
   n1773 <= BU641_Q(11);
   n1774 <= BU641_Q(12);
   n1775 <= BU641_Q(13);
   n1776 <= BU641_Q(14);
   n1777 <= BU641_Q(15);
   BU641_SINIT <= n178;
   BU641 : C_SHIFT_FD_V7_0
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
         c_has_sinit => 1,
         c_has_q => 1,
         c_shift_type => 0,
         c_has_sdin => 1,
         c_has_lsb_2_msb => 0
      )
      PORT MAP (
         CLK => BU641_CLK,
         SDIN => BU641_SDIN,
         Q => BU641_Q,
         SINIT => BU641_SINIT
      );

   BU940_D(0) <= n84;
   BU940_D(1) <= n85;
   BU940_D(2) <= n86;
   BU940_D(3) <= n87;
   BU940_D(4) <= n88;
   BU940_D(5) <= n89;
   BU940_D(6) <= n90;
   BU940_D(7) <= n91;
   BU940_D(8) <= n92;
   BU940_D(9) <= n93;
   BU940_D(10) <= n94;
   BU940_D(11) <= n95;
   BU940_D(12) <= n96;
   n2467 <= BU940_Q(0);
   n2468 <= BU940_Q(1);
   n2469 <= BU940_Q(2);
   n2470 <= BU940_Q(3);
   n2471 <= BU940_Q(4);
   n2472 <= BU940_Q(5);
   n2473 <= BU940_Q(6);
   n2474 <= BU940_Q(7);
   n2475 <= BU940_Q(8);
   n2476 <= BU940_Q(9);
   n2477 <= BU940_Q(10);
   n2478 <= BU940_Q(11);
   n2479 <= BU940_Q(12);
   BU940_CLK <= n177;
   BU940 : C_REG_FD_V7_0
      GENERIC MAP (
         c_width => 13,
         c_has_ce => 0,
         c_sinit_val => "0000000000000",
         c_has_sinit => 0,
         c_ainit_val => "0000000000000",
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
         D => BU940_D,
         Q => BU940_Q,
         CLK => BU940_CLK
      );

   BU969_A(0) <= n2467;
   BU969_A(1) <= n2468;
   BU969_A(2) <= n2469;
   BU969_A(3) <= n2470;
   BU969_A(4) <= n2471;
   BU969_A(5) <= n2472;
   BU969_A(6) <= n2473;
   BU969_A(7) <= n2474;
   BU969_A(8) <= n2475;
   BU969_A(9) <= n2476;
   BU969_A(10) <= n2477;
   BU969_BYPASS <= n2478;
   BU969_CLK <= n177;
   n2504 <= BU969_Q(0);
   n2505 <= BU969_Q(1);
   n2506 <= BU969_Q(2);
   n2507 <= BU969_Q(3);
   n2508 <= BU969_Q(4);
   n2509 <= BU969_Q(5);
   n2510 <= BU969_Q(6);
   n2511 <= BU969_Q(7);
   n2512 <= BU969_Q(8);
   n2513 <= BU969_Q(9);
   n2514 <= BU969_Q(10);
   BU969 : C_TWOS_COMP_V7_0
      GENERIC MAP (
         c_has_aset => 0,
         c_sync_priority => 0,
         c_has_sclr => 0,
         c_width => 11,
         c_enable_rlocs => 0,
         c_has_bypass => 1,
         c_ainit_val => "000000000000",
         c_bypass_low => 1,
         c_pipe_stages => 0,
         c_has_ce => 0,
         c_has_aclr => 0,
         c_sync_enable => 0,
         c_has_ainit => 0,
         c_sinit_val => "000000000000",
         c_has_sset => 0,
         c_has_sinit => 0,
         c_has_s => 0,
         c_bypass_enable => 1,
         c_has_q => 1
      )
      PORT MAP (
         A => BU969_A,
         BYPASS => BU969_BYPASS,
         CLK => BU969_CLK,
         Q => BU969_Q
      );

   BU1055_CLK <= n177;
   BU1055_D(0) <= n2479;
   n2480 <= BU1055_Q(0);
   BU1055 : C_SHIFT_RAM_V7_0
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
         CLK => BU1055_CLK,
         D => BU1055_D,
         Q => BU1055_Q
      );

   BU1063_CLK <= n177;
   BU1063_D(0) <= n2478;
   n2481 <= BU1063_Q(0);
   BU1063 : C_SHIFT_RAM_V7_0
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
         CLK => BU1063_CLK,
         D => BU1063_D,
         Q => BU1063_Q
      );

   BU1074_I0 <= n2480;
   BU1074_I1 <= n2481;
   BU1074_I2 <= n2519;
   BU1074_I3 <= '0';
   n2786 <= BU1074_O;
   BU1074 : LUT4
      GENERIC MAP (
         INIT  => X"9595"
      )
      PORT MAP (
         I0 => BU1074_I0,
         I1 => BU1074_I1,
         I2 => BU1074_I2,
         I3 => BU1074_I3,
         O => BU1074_O
      );

   BU1075_D <= n2786;
   BU1075_C <= n177;
   BU1075_CE <= '1';
   BU1075_PRE <= '0';
   n2521 <= BU1075_Q;
   BU1075 : FDPE
      PORT MAP (
         D => BU1075_D,
         C => BU1075_C,
         CE => BU1075_CE,
         PRE => BU1075_PRE,
         Q => BU1075_Q
      );

   BU1079_I0 <= n2480;
   BU1079_I1 <= n2481;
   BU1079_I2 <= n2519;
   BU1079_I3 <= n2520;
   n2803 <= BU1079_O;
   BU1079 : LUT4
      GENERIC MAP (
         INIT  => X"002a"
      )
      PORT MAP (
         I0 => BU1079_I0,
         I1 => BU1079_I1,
         I2 => BU1079_I2,
         I3 => BU1079_I3,
         O => BU1079_O
      );

   BU1080_D <= n2803;
   BU1080_C <= n177;
   BU1080_CE <= '1';
   n2522 <= BU1080_Q;
   BU1080 : FDE
      PORT MAP (
         D => BU1080_D,
         C => BU1080_C,
         CE => BU1080_CE,
         Q => BU1080_Q
      );

   BU1084_I0 <= '0';
   BU1084_I1 <= n2481;
   BU1084_I2 <= n2519;
   BU1084_I3 <= '0';
   n2819 <= BU1084_O;
   BU1084 : LUT4
      GENERIC MAP (
         INIT  => X"c0c0"
      )
      PORT MAP (
         I0 => BU1084_I0,
         I1 => BU1084_I1,
         I2 => BU1084_I2,
         I3 => BU1084_I3,
         O => BU1084_O
      );

   BU1085_D <= n2819;
   BU1085_C <= n177;
   BU1085_CE <= '1';
   n2518 <= BU1085_Q;
   BU1085 : FDE
      PORT MAP (
         D => BU1085_D,
         C => BU1085_C,
         CE => BU1085_CE,
         Q => BU1085_Q
      );

   BU1087_A(0) <= n2504;
   BU1087_A(1) <= n2505;
   BU1087_A(2) <= n2506;
   BU1087_A(3) <= n2507;
   BU1087_A(4) <= n2508;
   BU1087_A(5) <= n2509;
   BU1087_A(6) <= n2510;
   BU1087_A(7) <= n2511;
   BU1087_A(8) <= n2512;
   BU1087_A(9) <= n2513;
   BU1087_A(10) <= n2514;
   BU1087_CLK <= n177;
   BU1087_ACLR <= '0';
   n2520 <= BU1087_QA_GE_B;
   BU1087 : C_COMPARE_V7_0
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
         c_width => 11,
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
         c_b_value => "11111110110"
      )
      PORT MAP (
         A => BU1087_A,
         CLK => BU1087_CLK,
         ACLR => BU1087_ACLR,
         QA_GE_B => BU1087_QA_GE_B
      );

   BU1126_A(0) <= n2504;
   BU1126_A(1) <= n2505;
   BU1126_A(2) <= n2506;
   BU1126_A(3) <= n2507;
   BU1126_A(4) <= n2508;
   BU1126_A(5) <= n2509;
   BU1126_A(6) <= n2510;
   BU1126_A(7) <= n2511;
   BU1126_A(8) <= n2512;
   BU1126_A(9) <= n2513;
   BU1126_A(10) <= n2514;
   BU1126_CLK <= n177;
   BU1126_ACLR <= '0';
   n2519 <= BU1126_QA_EQ_B;
   BU1126 : C_COMPARE_V7_0
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
         c_width => 11,
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
         c_b_value => "00000000000"
      )
      PORT MAP (
         A => BU1126_A,
         CLK => BU1126_CLK,
         ACLR => BU1126_ACLR,
         QA_EQ_B => BU1126_QA_EQ_B
      );

   BU898_addr(10) <= n2514;
   BU898_addr(9) <= n2513;
   BU898_addr(8) <= n2512;
   BU898_addr(7) <= n2511;
   BU898_addr(6) <= n2510;
   BU898_addr(5) <= n2509;
   BU898_addr(4) <= n2508;
   BU898_addr(3) <= n2507;
   BU898_addr(2) <= n2506;
   BU898_addr(1) <= n2505;
   BU898_addr(0) <= n2504;
   BU898_clk <= n177;
   BU898_din(13) <= '0';
   BU898_din(12) <= '0';
   BU898_din(11) <= '0';
   BU898_din(10) <= '0';
   BU898_din(9) <= '0';
   BU898_din(8) <= '0';
   BU898_din(7) <= '0';
   BU898_din(6) <= '0';
   BU898_din(5) <= '0';
   BU898_din(4) <= '0';
   BU898_din(3) <= '0';
   BU898_din(2) <= '0';
   BU898_din(1) <= '0';
   BU898_din(0) <= '0';
   n2536 <= BU898_dout(13);
   n2535 <= BU898_dout(12);
   n2534 <= BU898_dout(11);
   n2533 <= BU898_dout(10);
   n2532 <= BU898_dout(9);
   n2531 <= BU898_dout(8);
   n2530 <= BU898_dout(7);
   n2529 <= BU898_dout(6);
   n2528 <= BU898_dout(5);
   n2527 <= BU898_dout(4);
   n2526 <= BU898_dout(3);
   n2525 <= BU898_dout(2);
   n2524 <= BU898_dout(1);
   n2523 <= BU898_dout(0);
   BU898_en <= '0';
   BU898_nd <= '0';
   BU898_sinit <= '0';
   BU898_we <= '0';
   BU898 : blkmemsp_v6_0
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
         c_width => 14,
         c_yuse_single_primitive => 0,
         c_has_nd => 0,
         c_enable_rlocs => 0,
         c_has_we => 0,
         c_has_rfd => 0,
         c_has_din => 0,
         c_ybottom_addr => "0",
         c_yen_is_high => 1,
         c_pipe_stages => 1,
         c_depth => 2048,
         c_has_default_data => 0,
         c_limit_data_pitch => 18,
         c_has_sinit => 0,
         c_yydisable_warnings => 1,
         c_mem_init_file => "DDS_SINCOS_TABLE_TRIG_ROM.mif",
         c_default_data => "0000000000000000000",
         c_ymake_bmm => 0,
         c_addr_width => 11
      )
      PORT MAP (
         addr => BU898_addr,
         clk => BU898_clk,
         din => BU898_din,
         dout => BU898_dout,
         en => BU898_en,
         nd => BU898_nd,
         rfd => BU898_rfd,
         rdy => BU898_rdy,
         sinit => BU898_sinit,
         we => BU898_we
      );

   BU1145_A(0) <= '0';
   BU1145_A(1) <= '0';
   BU1145_A(2) <= '0';
   BU1145_A(3) <= '0';
   BU1145_A(4) <= '0';
   BU1145_A(5) <= '0';
   BU1145_A(6) <= '0';
   BU1145_A(7) <= '0';
   BU1145_A(8) <= '0';
   BU1145_A(9) <= '0';
   BU1145_A(10) <= '0';
   BU1145_A(11) <= '0';
   BU1145_A(12) <= '0';
   BU1145_A(13) <= '0';
   BU1145_A(14) <= '0';
   BU1145_B(0) <= n2523;
   BU1145_B(1) <= n2524;
   BU1145_B(2) <= n2525;
   BU1145_B(3) <= n2526;
   BU1145_B(4) <= n2527;
   BU1145_B(5) <= n2528;
   BU1145_B(6) <= n2529;
   BU1145_B(7) <= n2530;
   BU1145_B(8) <= n2531;
   BU1145_B(9) <= n2532;
   BU1145_B(10) <= n2533;
   BU1145_B(11) <= n2534;
   BU1145_B(12) <= n2535;
   BU1145_B(13) <= n2536;
   BU1145_B(14) <= n2518;
   BU1145_C_IN <= n2522;
   BU1145_ADD <= n2521;
   n179 <= BU1145_Q(0);
   n180 <= BU1145_Q(1);
   n181 <= BU1145_Q(2);
   n182 <= BU1145_Q(3);
   n183 <= BU1145_Q(4);
   n184 <= BU1145_Q(5);
   n185 <= BU1145_Q(6);
   n186 <= BU1145_Q(7);
   n187 <= BU1145_Q(8);
   n188 <= BU1145_Q(9);
   n189 <= BU1145_Q(10);
   n190 <= BU1145_Q(11);
   n191 <= BU1145_Q(12);
   n192 <= BU1145_Q(13);
   n193 <= BU1145_Q(14);
   BU1145_CLK <= n177;
   BU1145_CE <= n2552;
   BU1145_SCLR <= n178;
   BU1145 : C_ADDSUB_V7_0
      GENERIC MAP (
         c_has_bypass_with_cin => 0,
         c_a_type => 1,
         c_has_sclr => 1,
         c_has_aset => 0,
         c_has_b_out => 0,
         c_sync_priority => 0,
         c_has_s => 1,
         c_has_q => 1,
         c_bypass_enable => 1,
         c_b_constant => 0,
         c_has_ovfl => 0,
         c_high_bit => 14,
         c_latency => 1,
         c_sinit_val => "000000000000000",
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
         c_b_value => "000000000000000",
         c_add_mode => 2,
         c_has_aclr => 0,
         c_out_width => 15,
         c_low_bit => 0,
         c_ainit_val => "000000000000000",
         c_has_q_ovfl => 0,
         c_has_q_b_out => 0,
         c_has_c_out => 0,
         c_b_width => 15,
         c_a_width => 15,
         c_sync_enable => 0,
         c_has_ce => 1,
         c_has_c_in => 1
      )
      PORT MAP (
         A => BU1145_A,
         B => BU1145_B,
         C_IN => BU1145_C_IN,
         ADD => BU1145_ADD,
         Q => BU1145_Q,
         CLK => BU1145_CLK,
         CE => BU1145_CE,
         SCLR => BU1145_SCLR
      );

   BU1236_CLK <= n177;
   BU1236_SDIN <= n83;
   n2552 <= BU1236_SDOUT;
   BU1236_SCLR <= n178;
   BU1236 : C_SHIFT_FD_V7_0
      GENERIC MAP (
         c_has_aset => 0,
         c_has_d => 0,
         c_sync_priority => 0,
         c_has_sclr => 1,
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
         CLK => BU1236_CLK,
         SDIN => BU1236_SDIN,
         SDOUT => BU1236_SDOUT,
         SCLR => BU1236_SCLR
      );


END xilinx;


-- synthesis translate_on
