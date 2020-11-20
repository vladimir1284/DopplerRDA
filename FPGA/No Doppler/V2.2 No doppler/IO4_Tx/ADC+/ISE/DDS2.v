////////////////////////////////////////////////////////////////////////////////
// Copyright (c) 1995-2008 Xilinx, Inc.  All rights reserved.
////////////////////////////////////////////////////////////////////////////////
//   ____  ____
//  /   /\/   /
// /___/  \  /    Vendor: Xilinx
// \   \   \/     Version: K.31
//  \   \         Application: netgen
//  /   /         Filename: DDS2.v
// /___/   /\     Timestamp: Wed Sep 23 11:15:51 2015
// \   \  /  \ 
//  \___\/\___\
//             
// Command	: -intstyle ise -w -sim -ofmt verilog "D:\Robert\Proyecto Radar Doppler\Proyecto Cyclos_Cuba\FPGA\New_Cyclop\en la pc x band\Programacion FPGA X Band\IO4\ADC+\ISE\tmp\_cg\DDS2.ngc" "D:\Robert\Proyecto Radar Doppler\Proyecto Cyclos_Cuba\FPGA\New_Cyclop\en la pc x band\Programacion FPGA X Band\IO4\ADC+\ISE\tmp\_cg\DDS2.v" 
// Device	: 2v1000fg456-4
// Input file	: D:/Robert/Proyecto Radar Doppler/Proyecto Cyclos_Cuba/FPGA/New_Cyclop/en la pc x band/Programacion FPGA X Band/IO4/ADC+/ISE/tmp/_cg/DDS2.ngc
// Output file	: D:/Robert/Proyecto Radar Doppler/Proyecto Cyclos_Cuba/FPGA/New_Cyclop/en la pc x band/Programacion FPGA X Band/IO4/ADC+/ISE/tmp/_cg/DDS2.v
// # of Modules	: 1
// Design Name	: DDS2
// Xilinx        : C:\Xilinx\10.1\ISE
//             
// Purpose:    
//     This verilog netlist is a verification model and uses simulation 
//     primitives which may not represent the true implementation of the 
//     device, however the netlist is functionally correct and should not 
//     be modified. This file cannot be synthesized and should only be used 
//     with supported simulation tools.
//             
// Reference:  
//     Development System Reference Guide, Chapter 23 and Synthesis and Simulation Design Guide, Chapter 6
//             
////////////////////////////////////////////////////////////////////////////////

`timescale 1 ns/1 ps

module DDS2 (
  sclr, rdy, clk, sine
);
  input sclr;
  output rdy;
  input clk;
  output [19 : 0] sine;
  
  // synthesis translate_off
  
  wire \BU2/U0/pre_rdy ;
  wire \BU2/U0/i_accum/phase_inc[10] ;
  wire \BU2/U0/i_accum/phase_inc[0] ;
  wire \BU2/U0/mutant_x_op_not0001 ;
  wire \BU2/N1 ;
  wire NLW_VCC_P_UNCONNECTED;
  wire NLW_GND_G_UNCONNECTED;
  wire \NLW_BU2/U0/i_rom/Mram_sin_cos_lut_DIB<15>_UNCONNECTED ;
  wire \NLW_BU2/U0/i_rom/Mram_sin_cos_lut_DIB<14>_UNCONNECTED ;
  wire \NLW_BU2/U0/i_rom/Mram_sin_cos_lut_DIB<13>_UNCONNECTED ;
  wire \NLW_BU2/U0/i_rom/Mram_sin_cos_lut_DIB<12>_UNCONNECTED ;
  wire \NLW_BU2/U0/i_rom/Mram_sin_cos_lut_DIB<11>_UNCONNECTED ;
  wire \NLW_BU2/U0/i_rom/Mram_sin_cos_lut_DIB<10>_UNCONNECTED ;
  wire \NLW_BU2/U0/i_rom/Mram_sin_cos_lut_DIB<9>_UNCONNECTED ;
  wire \NLW_BU2/U0/i_rom/Mram_sin_cos_lut_DIB<8>_UNCONNECTED ;
  wire \NLW_BU2/U0/i_rom/Mram_sin_cos_lut_DIB<7>_UNCONNECTED ;
  wire \NLW_BU2/U0/i_rom/Mram_sin_cos_lut_DIB<6>_UNCONNECTED ;
  wire \NLW_BU2/U0/i_rom/Mram_sin_cos_lut_DIB<5>_UNCONNECTED ;
  wire \NLW_BU2/U0/i_rom/Mram_sin_cos_lut_DIB<4>_UNCONNECTED ;
  wire \NLW_BU2/U0/i_rom/Mram_sin_cos_lut_DIB<3>_UNCONNECTED ;
  wire \NLW_BU2/U0/i_rom/Mram_sin_cos_lut_DIB<2>_UNCONNECTED ;
  wire \NLW_BU2/U0/i_rom/Mram_sin_cos_lut_DIB<1>_UNCONNECTED ;
  wire \NLW_BU2/U0/i_rom/Mram_sin_cos_lut_DIB<0>_UNCONNECTED ;
  wire \NLW_BU2/U0/i_comp_eff.i_eff/i_legacy.i_sin_adj/Mmult_result_P<35>_UNCONNECTED ;
  wire \NLW_BU2/U0/i_comp_eff.i_eff/i_legacy.i_sin_adj/Mmult_result_P<34>_UNCONNECTED ;
  wire \NLW_BU2/U0/i_comp_eff.i_eff/i_legacy.i_sin_adj/Mmult_result_P<33>_UNCONNECTED ;
  wire \NLW_BU2/U0/i_comp_eff.i_eff/i_legacy.i_sin_adj/Mmult_result_P<32>_UNCONNECTED ;
  wire \NLW_BU2/U0/i_comp_eff.i_eff/i_legacy.i_sin_adj/Mmult_result_P<31>_UNCONNECTED ;
  wire \NLW_BU2/U0/i_comp_eff.i_eff/i_legacy.i_sin_adj/Mmult_result_P<30>_UNCONNECTED ;
  wire \NLW_BU2/U0/i_comp_eff.i_eff/i_legacy.i_sin_adj/Mmult_result_P<29>_UNCONNECTED ;
  wire \NLW_BU2/U0/i_comp_eff.i_eff/i_legacy.i_sin_adj/Mmult_result_P<28>_UNCONNECTED ;
  wire \NLW_BU2/U0/i_comp_eff.i_eff/i_legacy.i_sin_adj/Mmult_result_P<27>_UNCONNECTED ;
  wire \NLW_BU2/U0/i_comp_eff.i_eff/i_legacy.i_sin_adj/Mmult_result_P<26>_UNCONNECTED ;
  wire \NLW_BU2/U0/i_comp_eff.i_eff/i_legacy.i_sin_adj/Mmult_result_P<25>_UNCONNECTED ;
  wire \NLW_BU2/U0/i_comp_eff.i_eff/i_legacy.i_sin_adj/Mmult_result_P<24>_UNCONNECTED ;
  wire \NLW_BU2/U0/i_comp_eff.i_eff/i_legacy.i_sin_adj/Mmult_result_P<23>_UNCONNECTED ;
  wire \NLW_BU2/U0/i_comp_eff.i_eff/i_legacy.i_sin_adj/Mmult_result_P<22>_UNCONNECTED ;
  wire \NLW_BU2/U0/i_comp_eff.i_eff/i_legacy.i_sin_adj/Mmult_result_P<21>_UNCONNECTED ;
  wire [19 : 0] sine_2;
  wire [9 : 0] \BU2/U0/i_rom/asyn_mod_cos_addr ;
  wire [9 : 0] \BU2/U0/i_rom/mod_cos_addr ;
  wire [8 : 0] \BU2/U0/i_rom/asyn_mod_sin_addr ;
  wire [9 : 0] \BU2/U0/i_rom/mod_sin_addr ;
  wire [17 : 0] \BU2/U0/i_rom/pre_asyn_cos_RAM_op ;
  wire [17 : 0] \BU2/U0/i_rom/cos_RAM_op ;
  wire [17 : 0] \BU2/U0/i_rom/pre_asyn_sin_RAM_op ;
  wire [17 : 0] \BU2/U0/i_rom/sin_RAM_op ;
  wire [16 : 16] \BU2/U0/i_comp_eff.i_eff/phase_error ;
  wire [21 : 11] \BU2/U0/i_comp_eff.i_eff/radian_error ;
  wire [27 : 27] \BU2/U0/acc_phase_adj_pre ;
  wire [10 : 0] \BU2/U0/i_comp_eff.i_eff/d1_eff_phase_error ;
  wire [46 : 27] \BU2/U0/final_sin ;
  wire [28 : 0] \BU2/U0/acc_phase_adjusted ;
  wire [18 : 8] \BU2/U0/i_comp_eff.i_eff/pre_complete ;
  wire [18 : 6] \BU2/U0/i_comp_eff.i_eff/Madd_pre_complete_lut ;
  wire [12 : 0] \BU2/U0/i_comp_eff.i_eff/partial_upper ;
  wire [17 : 6] \BU2/U0/i_comp_eff.i_eff/Madd_pre_complete_cy ;
  wire [14 : 6] \BU2/U0/i_comp_eff.i_eff/partial_lower ;
  wire [13 : 3] \BU2/U0/i_comp_eff.i_eff/Madd_pre_partial_lower_cy ;
  wire [12 : 6] \BU2/U0/i_comp_eff.i_eff/pre_partial_lower ;
  wire [12 : 3] \BU2/U0/i_comp_eff.i_eff/Madd_pre_partial_lower_lut ;
  wire [28 : 0] \BU2/U0/i_comp_eff.i_eff/Madd_off_pre_final_sin_lut ;
  wire [28 : 0] \BU2/U0/i_comp_eff.i_eff/shifted_sin_x ;
  wire [27 : 0] \BU2/U0/i_comp_eff.i_eff/Madd_off_pre_final_sin_cy ;
  wire [20 : 0] \BU2/U0/i_comp_eff.i_eff/sin_mult_adj ;
  wire [11 : 1] \BU2/U0/i_comp_eff.i_eff/Madd_pre_partial_upper_cy ;
  wire [10 : 2] \BU2/U0/i_comp_eff.i_eff/pre_partial_upper ;
  wire [10 : 1] \BU2/U0/i_comp_eff.i_eff/Madd_pre_partial_upper_lut ;
  wire [27 : 0] \BU2/U0/i_accum/acc_phase_b ;
  wire [27 : 1] \BU2/U0/i_accum/i_fabric.i_one_channel.i_accum/Madd_temp_lut ;
  wire [27 : 0] \BU2/U0/acc_phase ;
  wire [26 : 0] \BU2/U0/i_accum/i_fabric.i_one_channel.i_accum/Madd_temp_cy ;
  wire [2 : 0] \BU2/U0/mutant_x_op ;
  wire [2 : 0] \BU2/Result ;
  wire [20 : 0] \BU2/U0/i_comp_eff.i_eff/i_legacy.i_sin_adj/result ;
  wire [9 : 0] \BU2/U0/i_comp_eff.i_eff/i_legacy.i_sin_adj/B_2 ;
  wire [10 : 0] \BU2/U0/i_comp_eff.i_eff/i_legacy.i_sin_adj/A_2 ;
  wire [0 : 0] \BU2/channel ;
  wire [29 : 0] \BU2/U0/i_comp_eff.i_eff/i_legacy.i_shift_sin_pipe/first_q ;
  assign
    sine[19] = sine_2[19],
    sine[18] = sine_2[18],
    sine[17] = sine_2[17],
    sine[16] = sine_2[16],
    sine[15] = sine_2[15],
    sine[14] = sine_2[14],
    sine[13] = sine_2[13],
    sine[12] = sine_2[12],
    sine[11] = sine_2[11],
    sine[10] = sine_2[10],
    sine[9] = sine_2[9],
    sine[8] = sine_2[8],
    sine[7] = sine_2[7],
    sine[6] = sine_2[6],
    sine[5] = sine_2[5],
    sine[4] = sine_2[4],
    sine[3] = sine_2[3],
    sine[2] = sine_2[2],
    sine[1] = sine_2[1],
    sine[0] = sine_2[0];
  VCC   VCC_0 (
    .P(NLW_VCC_P_UNCONNECTED)
  );
  GND   GND_1 (
    .G(NLW_GND_G_UNCONNECTED)
  );
  INV   \BU2/U0/Mcount_mutant_x_op_xor<0>11_INV_0  (
    .I(\BU2/U0/mutant_x_op [0]),
    .O(\BU2/Result [0])
  );
  INV   \BU2/U0/i_comp_eff.i_eff/phase_error_not00011_INV_0  (
    .I(\BU2/U0/acc_phase_adjusted [16]),
    .O(\BU2/U0/i_comp_eff.i_eff/phase_error [16])
  );
  INV   \BU2/U0/i_fabric.i_phase_adj.i_phase_adj_add/Madd_temp_xor<27>11_INV_0  (
    .I(\BU2/U0/acc_phase [27]),
    .O(\BU2/U0/acc_phase_adj_pre [27])
  );
  LUT2 #(
    .INIT ( 4'h9 ))
  \BU2/U0/i_rom/asyn_mod_cos_addr<0>1  (
    .I0(\BU2/U0/acc_phase_adjusted [26]),
    .I1(\BU2/U0/acc_phase_adjusted [17]),
    .O(\BU2/U0/i_rom/asyn_mod_cos_addr [0])
  );
  LUT2 #(
    .INIT ( 4'h9 ))
  \BU2/U0/i_rom/asyn_mod_cos_addr<1>1  (
    .I0(\BU2/U0/acc_phase_adjusted [26]),
    .I1(\BU2/U0/acc_phase_adjusted [18]),
    .O(\BU2/U0/i_rom/asyn_mod_cos_addr [1])
  );
  LUT2 #(
    .INIT ( 4'h9 ))
  \BU2/U0/i_rom/asyn_mod_cos_addr<2>1  (
    .I0(\BU2/U0/acc_phase_adjusted [26]),
    .I1(\BU2/U0/acc_phase_adjusted [19]),
    .O(\BU2/U0/i_rom/asyn_mod_cos_addr [2])
  );
  LUT2 #(
    .INIT ( 4'h9 ))
  \BU2/U0/i_rom/asyn_mod_cos_addr<3>1  (
    .I0(\BU2/U0/acc_phase_adjusted [26]),
    .I1(\BU2/U0/acc_phase_adjusted [20]),
    .O(\BU2/U0/i_rom/asyn_mod_cos_addr [3])
  );
  LUT2 #(
    .INIT ( 4'h9 ))
  \BU2/U0/i_rom/asyn_mod_cos_addr<4>1  (
    .I0(\BU2/U0/acc_phase_adjusted [26]),
    .I1(\BU2/U0/acc_phase_adjusted [21]),
    .O(\BU2/U0/i_rom/asyn_mod_cos_addr [4])
  );
  LUT2 #(
    .INIT ( 4'h9 ))
  \BU2/U0/i_rom/asyn_mod_cos_addr<5>1  (
    .I0(\BU2/U0/acc_phase_adjusted [26]),
    .I1(\BU2/U0/acc_phase_adjusted [22]),
    .O(\BU2/U0/i_rom/asyn_mod_cos_addr [5])
  );
  LUT2 #(
    .INIT ( 4'h9 ))
  \BU2/U0/i_rom/asyn_mod_cos_addr<6>1  (
    .I0(\BU2/U0/acc_phase_adjusted [26]),
    .I1(\BU2/U0/acc_phase_adjusted [23]),
    .O(\BU2/U0/i_rom/asyn_mod_cos_addr [6])
  );
  LUT2 #(
    .INIT ( 4'h9 ))
  \BU2/U0/i_rom/asyn_mod_cos_addr<7>1  (
    .I0(\BU2/U0/acc_phase_adjusted [26]),
    .I1(\BU2/U0/acc_phase_adjusted [24]),
    .O(\BU2/U0/i_rom/asyn_mod_cos_addr [7])
  );
  LUT2 #(
    .INIT ( 4'h9 ))
  \BU2/U0/i_rom/asyn_mod_cos_addr<8>1  (
    .I0(\BU2/U0/acc_phase_adjusted [26]),
    .I1(\BU2/U0/acc_phase_adjusted [25]),
    .O(\BU2/U0/i_rom/asyn_mod_cos_addr [8])
  );
  LUT4 #(
    .INIT ( 16'h0001 ))
  \BU2/U0/pre_rdy1  (
    .I0(sclr),
    .I1(\BU2/U0/mutant_x_op [1]),
    .I2(\BU2/U0/mutant_x_op [2]),
    .I3(\BU2/U0/mutant_x_op [0]),
    .O(\BU2/U0/pre_rdy )
  );
  LUT3 #(
    .INIT ( 8'hFE ))
  \BU2/U0/mutant_x_op_not00011  (
    .I0(\BU2/U0/mutant_x_op [1]),
    .I1(\BU2/U0/mutant_x_op [2]),
    .I2(\BU2/U0/mutant_x_op [0]),
    .O(\BU2/U0/mutant_x_op_not0001 )
  );
  LUT2 #(
    .INIT ( 4'h6 ))
  \BU2/U0/i_rom/asyn_mod_sin_addr<0>1  (
    .I0(\BU2/U0/acc_phase_adjusted [26]),
    .I1(\BU2/U0/acc_phase_adjusted [17]),
    .O(\BU2/U0/i_rom/asyn_mod_sin_addr [0])
  );
  LUT2 #(
    .INIT ( 4'h6 ))
  \BU2/U0/i_rom/asyn_mod_sin_addr<1>1  (
    .I0(\BU2/U0/acc_phase_adjusted [26]),
    .I1(\BU2/U0/acc_phase_adjusted [18]),
    .O(\BU2/U0/i_rom/asyn_mod_sin_addr [1])
  );
  LUT2 #(
    .INIT ( 4'h6 ))
  \BU2/U0/i_rom/asyn_mod_sin_addr<2>1  (
    .I0(\BU2/U0/acc_phase_adjusted [26]),
    .I1(\BU2/U0/acc_phase_adjusted [19]),
    .O(\BU2/U0/i_rom/asyn_mod_sin_addr [2])
  );
  LUT2 #(
    .INIT ( 4'h6 ))
  \BU2/U0/i_rom/asyn_mod_sin_addr<3>1  (
    .I0(\BU2/U0/acc_phase_adjusted [26]),
    .I1(\BU2/U0/acc_phase_adjusted [20]),
    .O(\BU2/U0/i_rom/asyn_mod_sin_addr [3])
  );
  LUT2 #(
    .INIT ( 4'h6 ))
  \BU2/U0/i_rom/asyn_mod_sin_addr<4>1  (
    .I0(\BU2/U0/acc_phase_adjusted [26]),
    .I1(\BU2/U0/acc_phase_adjusted [21]),
    .O(\BU2/U0/i_rom/asyn_mod_sin_addr [4])
  );
  LUT2 #(
    .INIT ( 4'h6 ))
  \BU2/U0/i_rom/asyn_mod_sin_addr<5>1  (
    .I0(\BU2/U0/acc_phase_adjusted [26]),
    .I1(\BU2/U0/acc_phase_adjusted [22]),
    .O(\BU2/U0/i_rom/asyn_mod_sin_addr [5])
  );
  LUT2 #(
    .INIT ( 4'h6 ))
  \BU2/U0/i_rom/asyn_mod_sin_addr<6>1  (
    .I0(\BU2/U0/acc_phase_adjusted [26]),
    .I1(\BU2/U0/acc_phase_adjusted [23]),
    .O(\BU2/U0/i_rom/asyn_mod_sin_addr [6])
  );
  LUT2 #(
    .INIT ( 4'h6 ))
  \BU2/U0/i_rom/asyn_mod_sin_addr<7>1  (
    .I0(\BU2/U0/acc_phase_adjusted [26]),
    .I1(\BU2/U0/acc_phase_adjusted [24]),
    .O(\BU2/U0/i_rom/asyn_mod_sin_addr [7])
  );
  LUT2 #(
    .INIT ( 4'h6 ))
  \BU2/U0/i_rom/asyn_mod_sin_addr<8>1  (
    .I0(\BU2/U0/acc_phase_adjusted [26]),
    .I1(\BU2/U0/acc_phase_adjusted [25]),
    .O(\BU2/U0/i_rom/asyn_mod_sin_addr [8])
  );
  LUT3 #(
    .INIT ( 8'hC9 ))
  \BU2/U0/Mcount_mutant_x_op_xor<2>11  (
    .I0(\BU2/U0/mutant_x_op [1]),
    .I1(\BU2/U0/mutant_x_op [2]),
    .I2(\BU2/U0/mutant_x_op [0]),
    .O(\BU2/Result [2])
  );
  LUT2 #(
    .INIT ( 4'h9 ))
  \BU2/U0/Mcount_mutant_x_op_xor<1>11  (
    .I0(\BU2/U0/mutant_x_op [1]),
    .I1(\BU2/U0/mutant_x_op [0]),
    .O(\BU2/Result [1])
  );
  LUT2 #(
    .INIT ( 4'h6 ))
  \BU2/U0/i_rom/asyn_mod_cos_addr<9>1  (
    .I0(\BU2/U0/acc_phase_adjusted [26]),
    .I1(\BU2/U0/acc_phase_adjusted [27]),
    .O(\BU2/U0/i_rom/asyn_mod_cos_addr [9])
  );
  RAMB16_S18_S18 #(
    .INIT_3E ( 256'h00AA00BF00D500EC0105011F013A01570174019301B301D401F7021A023F0266 ),
    .INIT_3F ( 256'h000200030006000A000E0015001C0025002F003A004600540062007200840096 ),
    .INITP_00 ( 256'h0000000000000000000000000000000000000000000000000000000000000000 ),
    .INITP_01 ( 256'h5555555555555555555555555555555555555555554000000000000000000000 ),
    .INITP_02 ( 256'h5555555555555555555555555555555555555555555555555555555555555555 ),
    .INITP_03 ( 256'h5555555555555555555555555555555555555555555555555555555555555555 ),
    .INITP_04 ( 256'hFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF ),
    .INITP_05 ( 256'hAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAABFFFFFFFFFFFFFFFFFFFFF ),
    .INIT_A ( 18'h00000 ),
    .INIT_B ( 18'h00000 ),
    .INIT_00 ( 256'h185616C5153313A1120F107E0EEC0D5A0BC80A3608A40711057F03ED025B00C9 ),
    .INIT_01 ( 256'h31672FD72E462CB62B2529942804267324E2235021BF202E1E9D1D0B1B7A19E8 ),
    .INIT_02 ( 256'h4A5948CB473D45AF4420429241033F743DE53C563AC6393737A73617348732F7 ),
    .INIT_03 ( 256'h631D619360085E7D5CF15B6659DA584E56C2553553A9521C508F4F024D744BE7 ),
    .INIT_04 ( 256'h7BA47A1E7897771075897402727A70F26F696DE16C586ACF694567BC663264A8 ),
    .INIT_05 ( 256'h93DF925E90DC8F5B8DD88C568AD3895087CC864884C4834081BB80367EB07D2A ),
    .INIT_06 ( 256'hABBFAA44A8C8A74CA5D0A454A2D7A1599FDB9E5D9CDF9B6099E0986096E09560 ),
    .INIT_07 ( 256'hC335C1C1C04CBED7BD62BBECBA76B8FFB788B610B498B320B1A7B02DAEB4AD39 ),
    .INIT_08 ( 256'hDA32D8C6D759D5ECD47FD310D1A2D033CEC3CD53CBE2CA71C900C78EC61BC4A8 ),
    .INIT_09 ( 256'hF0A9EF45EDE2EC7DEB18E9B3E84DE6E6E57FE417E2AFE146DFDDDE73DD08DB9D ),
    .INIT_0A ( 256'h068B053103D7027C0121FFC5FE68FD0BFBADFA4FF8F0F790F630F4CFF36DF20B ),
    .INIT_0B ( 256'h1BCB1A7C192D17DC168B153913E7129411400FEC0E970D410BEB0A94093C07E4 ),
    .INIT_0C ( 256'h305D2F192DD52C8F2B492A0328BC2773262B24E12397224C21011FB41E671D1A ),
    .INIT_0D ( 256'h443242FB41C240893F4F3E153CD93B9D3A60392237E436A43564342332E231A0 ),
    .INIT_0E ( 256'h5740561554EA53BD5290516250334F044DD34CA24B704A3D490947D5469F4569 ),
    .INIT_0F ( 256'h697A685D673F6620650063DF62BE619C60785F545E2F5D0A5BE35ABC5993586A ),
    .INIT_10 ( 256'h7AD579C678B677A676947581746E735A7244712E70176EFF6DE66CCD6BB26A97 ),
    .INIT_11 ( 256'h8B478A47894688448741863D85388433832C8224811C80127F087DFD7CF17BE3 ),
    .INIT_12 ( 256'h9AC599D498E297F096FC96089513941C9325922C913390398F3D8E418D448C46 ),
    .INIT_13 ( 256'hA945A864A783A6A1A5BDA4D9A3F3A30CA225A13CA0539F689E7D9D909CA39BB4 ),
    .INIT_14 ( 256'hB6BFB5EFB51EB44CB37AB2A6B1D0B0FAB023AF4BAE72AD98ACBCABE0AB03AA24 ),
    .INIT_15 ( 256'hC32BC26CC1ACC0EBC029BF66BEA2BDDDBD17BC50BB87BABEB9F4B928B85BB78E ),
    .INIT_16 ( 256'hCE80CDD3CD25CC75CBC5CB13CA61C9ADC8F8C842C78BC6D3C61AC560C4A5C3E8 ),
    .INIT_17 ( 256'hD8B8D81DD781D6E3D645D5A5D505D463D3C0D31CD277D1D0D129D080CFD7CF2C ),
    .INIT_18 ( 256'hE1CCE144E0BAE02FDFA3DF16DE87DDF8DD67DCD5DC42DBAEDB18DA82D9EAD952 ),
    .INIT_19 ( 256'hE9B8E942E8CBE852E7D9E75EE6E3E666E5E7E568E4E8E466E3E3E35FE2DAE254 ),
    .INIT_1A ( 256'hF075F012EFAEEF49EEE2EE7BEE12EDA8ED3CECD0EC62EBF3EB83EB12EAA0EA2C ),
    .INIT_1B ( 256'hF600F5B0F560F50EF4BAF466F410F3B9F361F308F2ADF252F1F5F197F137F0D7 ),
    .INIT_1C ( 256'hFA56FA19F9DCF99DF95EF91CF8DAF897F852F80CF7C5F77CF733F6E8F69CF64F ),
    .INIT_1D ( 256'hFD73FD4AFD20FCF5FCC9FC9CFC6DFC3DFC0CFBD9FBA5FB71FB3AFB03FACAFA91 ),
    .INIT_1E ( 256'hFF56FF41FF2BFF14FEFBFEE1FEC6FEA9FE8CFE6DFE4DFE2CFE09FDE6FDC1FD9A ),
    .INIT_1F ( 256'hFFFEFFFDFFFAFFF6FFF2FFEBFFE4FFDBFFD1FFC6FFBAFFACFF9EFF8EFF7CFF6A ),
    .INIT_20 ( 256'hE7AAE93BEACDEC5FEDF1EF82F114F2A6F438F5CAF75CF8EFFA81FC13FDA5FF37 ),
    .INIT_21 ( 256'hCE99D029D1BAD34AD4DBD66CD7FCD98DDB1EDCB0DE41DFD2E163E2F5E486E618 ),
    .INIT_22 ( 256'hB5A7B735B8C3BA51BBE0BD6EBEFDC08CC21BC3AAC53AC6C9C859C9E9CB79CD09 ),
    .INIT_23 ( 256'h9CE39E6D9FF8A183A30FA49AA626A7B2A93EAACBAC57ADE4AF71B0FEB28CB419 ),
    .INIT_24 ( 256'h845C85E2876988F08A778BFE8D868F0E9097921F93A8953196BB984499CE9B58 ),
    .INIT_25 ( 256'h6C216DA26F2470A5722873AA752D76B0783479B87B3C7CC07E457FCA815082D6 ),
    .INIT_26 ( 256'h544155BC573858B45A305BAC5D295EA7602561A3632164A0662067A069206AA0 ),
    .INIT_27 ( 256'h3CCB3E3F3FB44129429E4414458A4701487849F04B684CE04E594FD3514C52C7 ),
    .INIT_28 ( 256'h25CE273A28A72A142B812CF02E5E2FCD313D32AD341E358F3700387239E53B58 ),
    .INIT_29 ( 256'h0F5710BB121E138314E8164D17B3191A1A811BE91D511EBA2023218D22F82463 ),
    .INIT_2A ( 256'hF975FACFFC29FD84FEDF003B019802F5045305B10710087009D00B310C930DF5 ),
    .INIT_2B ( 256'hE435E584E6D3E824E975EAC7EC19ED6CEEC0F014F169F2BFF415F56CF6C4F81C ),
    .INIT_2C ( 256'hCFA3D0E7D22BD371D4B7D5FDD744D88DD9D5DB1FDC69DDB4DEFFE04CE199E2E6 ),
    .INIT_2D ( 256'hBBCEBD05BE3EBF77C0B1C1EBC327C463C5A0C6DEC81CC95CCA9CCBDDCD1ECE60 ),
    .INIT_2E ( 256'hA8C0A9EBAB16AC43AD70AE9EAFCDB0FCB22DB35EB490B5C3B6F7B82BB961BA97 ),
    .INIT_2F ( 256'h968697A398C199E09B009C219D429E649F88A0ACA1D1A2F6A41DA544A66DA796 ),
    .INIT_30 ( 256'h852B863A874A885A896C8A7F8B928CA68DBC8ED28FE99101921A9333944E9569 ),
    .INIT_31 ( 256'h74B975B976BA77BC78BF79C37AC87BCD7CD47DDC7EE47FEE80F88203830F841D ),
    .INIT_32 ( 256'h653B662C671E6810690469F86AED6BE46CDB6DD46ECD6FC770C371BF72BC73BA ),
    .INIT_33 ( 256'h56BB579C587D595F5A435B275C0D5CF45DDB5EC45FAD609861836270635D644C ),
    .INIT_34 ( 256'h49414A114AE24BB44C864D5A4E304F064FDD50B5518E52685344542054FD55DC ),
    .INIT_35 ( 256'h3CD53D943E543F153FD7409A415E422342E943B044794542460C46D847A54872 ),
    .INIT_36 ( 256'h3180322D32DB338B343B34ED359F3653370837BE3875392D39E63AA03B5B3C18 ),
    .INIT_37 ( 256'h274827E3287F291D29BB2A5B2AFB2B9D2C402CE42D892E302ED72F80302930D4 ),
    .INIT_38 ( 256'h1E341EBC1F461FD1205D20EA217922082299232B23BE245224E8257E261626AE ),
    .INIT_39 ( 256'h164816BE173517AE182718A2191D199A1A191A981B181B9A1C1D1CA11D261DAC ),
    .INIT_3A ( 256'h0F8B0FEE105210B7111E118511EE125812C41330139E140D147D14EE156015D4 ),
    .INIT_3B ( 256'h0A000A500AA00AF20B460B9A0BF00C470C9F0CF80D530DAE0E0B0E690EC90F29 ),
    .INIT_3C ( 256'h05AA05E70624066306A206E40726076907AE07F4083B088408CD0918096409B1 ),
    .INIT_3D ( 256'h028D02B602E0030B03370364039303C303F40427045B048F04C604FD0536056F ),
    .WRITE_MODE_B ( "WRITE_FIRST" ),
    .INITP_06 ( 256'hAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAA ),
    .WRITE_MODE_A ( "READ_FIRST" ),
    .INITP_07 ( 256'hAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAA ))
  \BU2/U0/i_rom/Mram_sin_cos_lut  (
    .CLKA(clk),
    .CLKB(clk),
    .ENA(\BU2/N1 ),
    .ENB(\BU2/N1 ),
    .SSRA(\BU2/channel [0]),
    .SSRB(\BU2/channel [0]),
    .WEA(\BU2/channel [0]),
    .WEB(\BU2/channel [0]),
    .ADDRA({\BU2/U0/i_rom/mod_sin_addr [9], \BU2/U0/i_rom/mod_sin_addr [8], \BU2/U0/i_rom/mod_sin_addr [7], \BU2/U0/i_rom/mod_sin_addr [6], 
\BU2/U0/i_rom/mod_sin_addr [5], \BU2/U0/i_rom/mod_sin_addr [4], \BU2/U0/i_rom/mod_sin_addr [3], \BU2/U0/i_rom/mod_sin_addr [2], 
\BU2/U0/i_rom/mod_sin_addr [1], \BU2/U0/i_rom/mod_sin_addr [0]}),
    .ADDRB({\BU2/U0/i_rom/mod_cos_addr [9], \BU2/U0/i_rom/mod_cos_addr [8], \BU2/U0/i_rom/mod_cos_addr [7], \BU2/U0/i_rom/mod_cos_addr [6], 
\BU2/U0/i_rom/mod_cos_addr [5], \BU2/U0/i_rom/mod_cos_addr [4], \BU2/U0/i_rom/mod_cos_addr [3], \BU2/U0/i_rom/mod_cos_addr [2], 
\BU2/U0/i_rom/mod_cos_addr [1], \BU2/U0/i_rom/mod_cos_addr [0]}),
    .DIA({\BU2/channel [0], \BU2/channel [0], \BU2/channel [0], \BU2/channel [0], \BU2/channel [0], \BU2/channel [0], \BU2/channel [0], 
\BU2/channel [0], \BU2/channel [0], \BU2/channel [0], \BU2/channel [0], \BU2/channel [0], \BU2/channel [0], \BU2/channel [0], \BU2/channel [0], 
\BU2/channel [0]}),
    .DIB({\NLW_BU2/U0/i_rom/Mram_sin_cos_lut_DIB<15>_UNCONNECTED , \NLW_BU2/U0/i_rom/Mram_sin_cos_lut_DIB<14>_UNCONNECTED , 
\NLW_BU2/U0/i_rom/Mram_sin_cos_lut_DIB<13>_UNCONNECTED , \NLW_BU2/U0/i_rom/Mram_sin_cos_lut_DIB<12>_UNCONNECTED , 
\NLW_BU2/U0/i_rom/Mram_sin_cos_lut_DIB<11>_UNCONNECTED , \NLW_BU2/U0/i_rom/Mram_sin_cos_lut_DIB<10>_UNCONNECTED , 
\NLW_BU2/U0/i_rom/Mram_sin_cos_lut_DIB<9>_UNCONNECTED , \NLW_BU2/U0/i_rom/Mram_sin_cos_lut_DIB<8>_UNCONNECTED , 
\NLW_BU2/U0/i_rom/Mram_sin_cos_lut_DIB<7>_UNCONNECTED , \NLW_BU2/U0/i_rom/Mram_sin_cos_lut_DIB<6>_UNCONNECTED , 
\NLW_BU2/U0/i_rom/Mram_sin_cos_lut_DIB<5>_UNCONNECTED , \NLW_BU2/U0/i_rom/Mram_sin_cos_lut_DIB<4>_UNCONNECTED , 
\NLW_BU2/U0/i_rom/Mram_sin_cos_lut_DIB<3>_UNCONNECTED , \NLW_BU2/U0/i_rom/Mram_sin_cos_lut_DIB<2>_UNCONNECTED , 
\NLW_BU2/U0/i_rom/Mram_sin_cos_lut_DIB<1>_UNCONNECTED , \NLW_BU2/U0/i_rom/Mram_sin_cos_lut_DIB<0>_UNCONNECTED }),
    .DIPA({\BU2/channel [0], \BU2/channel [0]}),
    .DIPB({\BU2/channel [0], \BU2/channel [0]}),
    .DOA({\BU2/U0/i_rom/pre_asyn_sin_RAM_op [15], \BU2/U0/i_rom/pre_asyn_sin_RAM_op [14], \BU2/U0/i_rom/pre_asyn_sin_RAM_op [13], 
\BU2/U0/i_rom/pre_asyn_sin_RAM_op [12], \BU2/U0/i_rom/pre_asyn_sin_RAM_op [11], \BU2/U0/i_rom/pre_asyn_sin_RAM_op [10], 
\BU2/U0/i_rom/pre_asyn_sin_RAM_op [9], \BU2/U0/i_rom/pre_asyn_sin_RAM_op [8], \BU2/U0/i_rom/pre_asyn_sin_RAM_op [7], 
\BU2/U0/i_rom/pre_asyn_sin_RAM_op [6], \BU2/U0/i_rom/pre_asyn_sin_RAM_op [5], \BU2/U0/i_rom/pre_asyn_sin_RAM_op [4], 
\BU2/U0/i_rom/pre_asyn_sin_RAM_op [3], \BU2/U0/i_rom/pre_asyn_sin_RAM_op [2], \BU2/U0/i_rom/pre_asyn_sin_RAM_op [1], 
\BU2/U0/i_rom/pre_asyn_sin_RAM_op [0]}),
    .DOPA({\BU2/U0/i_rom/pre_asyn_sin_RAM_op [17], \BU2/U0/i_rom/pre_asyn_sin_RAM_op [16]}),
    .DOB({\BU2/U0/i_rom/pre_asyn_cos_RAM_op [15], \BU2/U0/i_rom/pre_asyn_cos_RAM_op [14], \BU2/U0/i_rom/pre_asyn_cos_RAM_op [13], 
\BU2/U0/i_rom/pre_asyn_cos_RAM_op [12], \BU2/U0/i_rom/pre_asyn_cos_RAM_op [11], \BU2/U0/i_rom/pre_asyn_cos_RAM_op [10], 
\BU2/U0/i_rom/pre_asyn_cos_RAM_op [9], \BU2/U0/i_rom/pre_asyn_cos_RAM_op [8], \BU2/U0/i_rom/pre_asyn_cos_RAM_op [7], 
\BU2/U0/i_rom/pre_asyn_cos_RAM_op [6], \BU2/U0/i_rom/pre_asyn_cos_RAM_op [5], \BU2/U0/i_rom/pre_asyn_cos_RAM_op [4], 
\BU2/U0/i_rom/pre_asyn_cos_RAM_op [3], \BU2/U0/i_rom/pre_asyn_cos_RAM_op [2], \BU2/U0/i_rom/pre_asyn_cos_RAM_op [1], 
\BU2/U0/i_rom/pre_asyn_cos_RAM_op [0]}),
    .DOPB({\BU2/U0/i_rom/pre_asyn_cos_RAM_op [17], \BU2/U0/i_rom/pre_asyn_cos_RAM_op [16]})
  );
  XORCY   \BU2/U0/i_comp_eff.i_eff/Madd_pre_complete_xor<18>  (
    .CI(\BU2/U0/i_comp_eff.i_eff/Madd_pre_complete_cy [17]),
    .LI(\BU2/U0/i_comp_eff.i_eff/Madd_pre_complete_lut [18]),
    .O(\BU2/U0/i_comp_eff.i_eff/pre_complete [18])
  );
  LUT2 #(
    .INIT ( 4'h6 ))
  \BU2/U0/i_comp_eff.i_eff/Madd_pre_complete_lut<18>  (
    .I0(\BU2/U0/i_comp_eff.i_eff/partial_upper [12]),
    .I1(\BU2/U0/i_comp_eff.i_eff/partial_lower [14]),
    .O(\BU2/U0/i_comp_eff.i_eff/Madd_pre_complete_lut [18])
  );
  XORCY   \BU2/U0/i_comp_eff.i_eff/Madd_pre_complete_xor<17>  (
    .CI(\BU2/U0/i_comp_eff.i_eff/Madd_pre_complete_cy [16]),
    .LI(\BU2/U0/i_comp_eff.i_eff/Madd_pre_complete_lut [17]),
    .O(\BU2/U0/i_comp_eff.i_eff/pre_complete [17])
  );
  MUXCY   \BU2/U0/i_comp_eff.i_eff/Madd_pre_complete_cy<17>  (
    .CI(\BU2/U0/i_comp_eff.i_eff/Madd_pre_complete_cy [16]),
    .DI(\BU2/U0/i_comp_eff.i_eff/partial_upper [11]),
    .S(\BU2/U0/i_comp_eff.i_eff/Madd_pre_complete_lut [17]),
    .O(\BU2/U0/i_comp_eff.i_eff/Madd_pre_complete_cy [17])
  );
  LUT2 #(
    .INIT ( 4'h6 ))
  \BU2/U0/i_comp_eff.i_eff/Madd_pre_complete_lut<17>  (
    .I0(\BU2/U0/i_comp_eff.i_eff/partial_upper [11]),
    .I1(\BU2/U0/i_comp_eff.i_eff/partial_lower [14]),
    .O(\BU2/U0/i_comp_eff.i_eff/Madd_pre_complete_lut [17])
  );
  XORCY   \BU2/U0/i_comp_eff.i_eff/Madd_pre_complete_xor<16>  (
    .CI(\BU2/U0/i_comp_eff.i_eff/Madd_pre_complete_cy [15]),
    .LI(\BU2/U0/i_comp_eff.i_eff/Madd_pre_complete_lut [16]),
    .O(\BU2/U0/i_comp_eff.i_eff/pre_complete [16])
  );
  MUXCY   \BU2/U0/i_comp_eff.i_eff/Madd_pre_complete_cy<16>  (
    .CI(\BU2/U0/i_comp_eff.i_eff/Madd_pre_complete_cy [15]),
    .DI(\BU2/U0/i_comp_eff.i_eff/partial_upper [10]),
    .S(\BU2/U0/i_comp_eff.i_eff/Madd_pre_complete_lut [16]),
    .O(\BU2/U0/i_comp_eff.i_eff/Madd_pre_complete_cy [16])
  );
  LUT2 #(
    .INIT ( 4'h6 ))
  \BU2/U0/i_comp_eff.i_eff/Madd_pre_complete_lut<16>  (
    .I0(\BU2/U0/i_comp_eff.i_eff/partial_upper [10]),
    .I1(\BU2/U0/i_comp_eff.i_eff/partial_lower [14]),
    .O(\BU2/U0/i_comp_eff.i_eff/Madd_pre_complete_lut [16])
  );
  XORCY   \BU2/U0/i_comp_eff.i_eff/Madd_pre_complete_xor<15>  (
    .CI(\BU2/U0/i_comp_eff.i_eff/Madd_pre_complete_cy [14]),
    .LI(\BU2/U0/i_comp_eff.i_eff/Madd_pre_complete_lut [15]),
    .O(\BU2/U0/i_comp_eff.i_eff/pre_complete [15])
  );
  MUXCY   \BU2/U0/i_comp_eff.i_eff/Madd_pre_complete_cy<15>  (
    .CI(\BU2/U0/i_comp_eff.i_eff/Madd_pre_complete_cy [14]),
    .DI(\BU2/U0/i_comp_eff.i_eff/partial_upper [9]),
    .S(\BU2/U0/i_comp_eff.i_eff/Madd_pre_complete_lut [15]),
    .O(\BU2/U0/i_comp_eff.i_eff/Madd_pre_complete_cy [15])
  );
  LUT2 #(
    .INIT ( 4'h6 ))
  \BU2/U0/i_comp_eff.i_eff/Madd_pre_complete_lut<15>  (
    .I0(\BU2/U0/i_comp_eff.i_eff/partial_upper [9]),
    .I1(\BU2/U0/i_comp_eff.i_eff/partial_lower [14]),
    .O(\BU2/U0/i_comp_eff.i_eff/Madd_pre_complete_lut [15])
  );
  XORCY   \BU2/U0/i_comp_eff.i_eff/Madd_pre_complete_xor<14>  (
    .CI(\BU2/U0/i_comp_eff.i_eff/Madd_pre_complete_cy [13]),
    .LI(\BU2/U0/i_comp_eff.i_eff/Madd_pre_complete_lut [14]),
    .O(\BU2/U0/i_comp_eff.i_eff/pre_complete [14])
  );
  MUXCY   \BU2/U0/i_comp_eff.i_eff/Madd_pre_complete_cy<14>  (
    .CI(\BU2/U0/i_comp_eff.i_eff/Madd_pre_complete_cy [13]),
    .DI(\BU2/U0/i_comp_eff.i_eff/partial_upper [8]),
    .S(\BU2/U0/i_comp_eff.i_eff/Madd_pre_complete_lut [14]),
    .O(\BU2/U0/i_comp_eff.i_eff/Madd_pre_complete_cy [14])
  );
  LUT2 #(
    .INIT ( 4'h6 ))
  \BU2/U0/i_comp_eff.i_eff/Madd_pre_complete_lut<14>  (
    .I0(\BU2/U0/i_comp_eff.i_eff/partial_upper [8]),
    .I1(\BU2/U0/i_comp_eff.i_eff/partial_lower [14]),
    .O(\BU2/U0/i_comp_eff.i_eff/Madd_pre_complete_lut [14])
  );
  XORCY   \BU2/U0/i_comp_eff.i_eff/Madd_pre_complete_xor<13>  (
    .CI(\BU2/U0/i_comp_eff.i_eff/Madd_pre_complete_cy [12]),
    .LI(\BU2/U0/i_comp_eff.i_eff/Madd_pre_complete_lut [13]),
    .O(\BU2/U0/i_comp_eff.i_eff/pre_complete [13])
  );
  MUXCY   \BU2/U0/i_comp_eff.i_eff/Madd_pre_complete_cy<13>  (
    .CI(\BU2/U0/i_comp_eff.i_eff/Madd_pre_complete_cy [12]),
    .DI(\BU2/U0/i_comp_eff.i_eff/partial_upper [7]),
    .S(\BU2/U0/i_comp_eff.i_eff/Madd_pre_complete_lut [13]),
    .O(\BU2/U0/i_comp_eff.i_eff/Madd_pre_complete_cy [13])
  );
  LUT2 #(
    .INIT ( 4'h6 ))
  \BU2/U0/i_comp_eff.i_eff/Madd_pre_complete_lut<13>  (
    .I0(\BU2/U0/i_comp_eff.i_eff/partial_upper [7]),
    .I1(\BU2/U0/i_comp_eff.i_eff/partial_lower [13]),
    .O(\BU2/U0/i_comp_eff.i_eff/Madd_pre_complete_lut [13])
  );
  XORCY   \BU2/U0/i_comp_eff.i_eff/Madd_pre_complete_xor<12>  (
    .CI(\BU2/U0/i_comp_eff.i_eff/Madd_pre_complete_cy [11]),
    .LI(\BU2/U0/i_comp_eff.i_eff/Madd_pre_complete_lut [12]),
    .O(\BU2/U0/i_comp_eff.i_eff/pre_complete [12])
  );
  MUXCY   \BU2/U0/i_comp_eff.i_eff/Madd_pre_complete_cy<12>  (
    .CI(\BU2/U0/i_comp_eff.i_eff/Madd_pre_complete_cy [11]),
    .DI(\BU2/U0/i_comp_eff.i_eff/partial_upper [6]),
    .S(\BU2/U0/i_comp_eff.i_eff/Madd_pre_complete_lut [12]),
    .O(\BU2/U0/i_comp_eff.i_eff/Madd_pre_complete_cy [12])
  );
  LUT2 #(
    .INIT ( 4'h6 ))
  \BU2/U0/i_comp_eff.i_eff/Madd_pre_complete_lut<12>  (
    .I0(\BU2/U0/i_comp_eff.i_eff/partial_upper [6]),
    .I1(\BU2/U0/i_comp_eff.i_eff/partial_lower [12]),
    .O(\BU2/U0/i_comp_eff.i_eff/Madd_pre_complete_lut [12])
  );
  XORCY   \BU2/U0/i_comp_eff.i_eff/Madd_pre_complete_xor<11>  (
    .CI(\BU2/U0/i_comp_eff.i_eff/Madd_pre_complete_cy [10]),
    .LI(\BU2/U0/i_comp_eff.i_eff/Madd_pre_complete_lut [11]),
    .O(\BU2/U0/i_comp_eff.i_eff/pre_complete [11])
  );
  MUXCY   \BU2/U0/i_comp_eff.i_eff/Madd_pre_complete_cy<11>  (
    .CI(\BU2/U0/i_comp_eff.i_eff/Madd_pre_complete_cy [10]),
    .DI(\BU2/U0/i_comp_eff.i_eff/partial_upper [5]),
    .S(\BU2/U0/i_comp_eff.i_eff/Madd_pre_complete_lut [11]),
    .O(\BU2/U0/i_comp_eff.i_eff/Madd_pre_complete_cy [11])
  );
  LUT2 #(
    .INIT ( 4'h6 ))
  \BU2/U0/i_comp_eff.i_eff/Madd_pre_complete_lut<11>  (
    .I0(\BU2/U0/i_comp_eff.i_eff/partial_upper [5]),
    .I1(\BU2/U0/i_comp_eff.i_eff/partial_lower [11]),
    .O(\BU2/U0/i_comp_eff.i_eff/Madd_pre_complete_lut [11])
  );
  XORCY   \BU2/U0/i_comp_eff.i_eff/Madd_pre_complete_xor<10>  (
    .CI(\BU2/U0/i_comp_eff.i_eff/Madd_pre_complete_cy [9]),
    .LI(\BU2/U0/i_comp_eff.i_eff/Madd_pre_complete_lut [10]),
    .O(\BU2/U0/i_comp_eff.i_eff/pre_complete [10])
  );
  MUXCY   \BU2/U0/i_comp_eff.i_eff/Madd_pre_complete_cy<10>  (
    .CI(\BU2/U0/i_comp_eff.i_eff/Madd_pre_complete_cy [9]),
    .DI(\BU2/U0/i_comp_eff.i_eff/partial_upper [4]),
    .S(\BU2/U0/i_comp_eff.i_eff/Madd_pre_complete_lut [10]),
    .O(\BU2/U0/i_comp_eff.i_eff/Madd_pre_complete_cy [10])
  );
  LUT2 #(
    .INIT ( 4'h6 ))
  \BU2/U0/i_comp_eff.i_eff/Madd_pre_complete_lut<10>  (
    .I0(\BU2/U0/i_comp_eff.i_eff/partial_upper [4]),
    .I1(\BU2/U0/i_comp_eff.i_eff/partial_lower [10]),
    .O(\BU2/U0/i_comp_eff.i_eff/Madd_pre_complete_lut [10])
  );
  XORCY   \BU2/U0/i_comp_eff.i_eff/Madd_pre_complete_xor<9>  (
    .CI(\BU2/U0/i_comp_eff.i_eff/Madd_pre_complete_cy [8]),
    .LI(\BU2/U0/i_comp_eff.i_eff/Madd_pre_complete_lut [9]),
    .O(\BU2/U0/i_comp_eff.i_eff/pre_complete [9])
  );
  MUXCY   \BU2/U0/i_comp_eff.i_eff/Madd_pre_complete_cy<9>  (
    .CI(\BU2/U0/i_comp_eff.i_eff/Madd_pre_complete_cy [8]),
    .DI(\BU2/U0/i_comp_eff.i_eff/partial_upper [3]),
    .S(\BU2/U0/i_comp_eff.i_eff/Madd_pre_complete_lut [9]),
    .O(\BU2/U0/i_comp_eff.i_eff/Madd_pre_complete_cy [9])
  );
  LUT2 #(
    .INIT ( 4'h6 ))
  \BU2/U0/i_comp_eff.i_eff/Madd_pre_complete_lut<9>  (
    .I0(\BU2/U0/i_comp_eff.i_eff/partial_upper [3]),
    .I1(\BU2/U0/i_comp_eff.i_eff/partial_lower [9]),
    .O(\BU2/U0/i_comp_eff.i_eff/Madd_pre_complete_lut [9])
  );
  XORCY   \BU2/U0/i_comp_eff.i_eff/Madd_pre_complete_xor<8>  (
    .CI(\BU2/U0/i_comp_eff.i_eff/Madd_pre_complete_cy [7]),
    .LI(\BU2/U0/i_comp_eff.i_eff/Madd_pre_complete_lut [8]),
    .O(\BU2/U0/i_comp_eff.i_eff/pre_complete [8])
  );
  MUXCY   \BU2/U0/i_comp_eff.i_eff/Madd_pre_complete_cy<8>  (
    .CI(\BU2/U0/i_comp_eff.i_eff/Madd_pre_complete_cy [7]),
    .DI(\BU2/U0/i_comp_eff.i_eff/partial_upper [2]),
    .S(\BU2/U0/i_comp_eff.i_eff/Madd_pre_complete_lut [8]),
    .O(\BU2/U0/i_comp_eff.i_eff/Madd_pre_complete_cy [8])
  );
  LUT2 #(
    .INIT ( 4'h6 ))
  \BU2/U0/i_comp_eff.i_eff/Madd_pre_complete_lut<8>  (
    .I0(\BU2/U0/i_comp_eff.i_eff/partial_upper [2]),
    .I1(\BU2/U0/i_comp_eff.i_eff/partial_lower [8]),
    .O(\BU2/U0/i_comp_eff.i_eff/Madd_pre_complete_lut [8])
  );
  MUXCY   \BU2/U0/i_comp_eff.i_eff/Madd_pre_complete_cy<7>  (
    .CI(\BU2/U0/i_comp_eff.i_eff/Madd_pre_complete_cy [6]),
    .DI(\BU2/U0/i_comp_eff.i_eff/partial_upper [1]),
    .S(\BU2/U0/i_comp_eff.i_eff/Madd_pre_complete_lut [7]),
    .O(\BU2/U0/i_comp_eff.i_eff/Madd_pre_complete_cy [7])
  );
  LUT2 #(
    .INIT ( 4'h6 ))
  \BU2/U0/i_comp_eff.i_eff/Madd_pre_complete_lut<7>  (
    .I0(\BU2/U0/i_comp_eff.i_eff/partial_upper [1]),
    .I1(\BU2/U0/i_comp_eff.i_eff/partial_lower [7]),
    .O(\BU2/U0/i_comp_eff.i_eff/Madd_pre_complete_lut [7])
  );
  MUXCY   \BU2/U0/i_comp_eff.i_eff/Madd_pre_complete_cy<6>  (
    .CI(\BU2/channel [0]),
    .DI(\BU2/U0/i_comp_eff.i_eff/partial_upper [0]),
    .S(\BU2/U0/i_comp_eff.i_eff/Madd_pre_complete_lut [6]),
    .O(\BU2/U0/i_comp_eff.i_eff/Madd_pre_complete_cy [6])
  );
  LUT2 #(
    .INIT ( 4'h6 ))
  \BU2/U0/i_comp_eff.i_eff/Madd_pre_complete_lut<6>  (
    .I0(\BU2/U0/i_comp_eff.i_eff/partial_upper [0]),
    .I1(\BU2/U0/i_comp_eff.i_eff/partial_lower [6]),
    .O(\BU2/U0/i_comp_eff.i_eff/Madd_pre_complete_lut [6])
  );
  MUXCY   \BU2/U0/i_comp_eff.i_eff/Madd_pre_partial_lower_cy<13>  (
    .CI(\BU2/U0/i_comp_eff.i_eff/Madd_pre_partial_lower_cy [12]),
    .DI(\BU2/U0/i_comp_eff.i_eff/d1_eff_phase_error [10]),
    .S(\BU2/channel [0]),
    .O(\BU2/U0/i_comp_eff.i_eff/Madd_pre_partial_lower_cy [13])
  );
  XORCY   \BU2/U0/i_comp_eff.i_eff/Madd_pre_partial_lower_xor<12>  (
    .CI(\BU2/U0/i_comp_eff.i_eff/Madd_pre_partial_lower_cy [11]),
    .LI(\BU2/U0/i_comp_eff.i_eff/Madd_pre_partial_lower_lut [12]),
    .O(\BU2/U0/i_comp_eff.i_eff/pre_partial_lower [12])
  );
  MUXCY   \BU2/U0/i_comp_eff.i_eff/Madd_pre_partial_lower_cy<12>  (
    .CI(\BU2/U0/i_comp_eff.i_eff/Madd_pre_partial_lower_cy [11]),
    .DI(\BU2/U0/i_comp_eff.i_eff/d1_eff_phase_error [9]),
    .S(\BU2/U0/i_comp_eff.i_eff/Madd_pre_partial_lower_lut [12]),
    .O(\BU2/U0/i_comp_eff.i_eff/Madd_pre_partial_lower_cy [12])
  );
  LUT2 #(
    .INIT ( 4'h6 ))
  \BU2/U0/i_comp_eff.i_eff/Madd_pre_partial_lower_lut<12>  (
    .I0(\BU2/U0/i_comp_eff.i_eff/d1_eff_phase_error [9]),
    .I1(\BU2/U0/i_comp_eff.i_eff/d1_eff_phase_error [10]),
    .O(\BU2/U0/i_comp_eff.i_eff/Madd_pre_partial_lower_lut [12])
  );
  XORCY   \BU2/U0/i_comp_eff.i_eff/Madd_pre_partial_lower_xor<11>  (
    .CI(\BU2/U0/i_comp_eff.i_eff/Madd_pre_partial_lower_cy [10]),
    .LI(\BU2/U0/i_comp_eff.i_eff/Madd_pre_partial_lower_lut [11]),
    .O(\BU2/U0/i_comp_eff.i_eff/pre_partial_lower [11])
  );
  MUXCY   \BU2/U0/i_comp_eff.i_eff/Madd_pre_partial_lower_cy<11>  (
    .CI(\BU2/U0/i_comp_eff.i_eff/Madd_pre_partial_lower_cy [10]),
    .DI(\BU2/U0/i_comp_eff.i_eff/d1_eff_phase_error [8]),
    .S(\BU2/U0/i_comp_eff.i_eff/Madd_pre_partial_lower_lut [11]),
    .O(\BU2/U0/i_comp_eff.i_eff/Madd_pre_partial_lower_cy [11])
  );
  LUT2 #(
    .INIT ( 4'h6 ))
  \BU2/U0/i_comp_eff.i_eff/Madd_pre_partial_lower_lut<11>  (
    .I0(\BU2/U0/i_comp_eff.i_eff/d1_eff_phase_error [8]),
    .I1(\BU2/U0/i_comp_eff.i_eff/d1_eff_phase_error [10]),
    .O(\BU2/U0/i_comp_eff.i_eff/Madd_pre_partial_lower_lut [11])
  );
  XORCY   \BU2/U0/i_comp_eff.i_eff/Madd_pre_partial_lower_xor<10>  (
    .CI(\BU2/U0/i_comp_eff.i_eff/Madd_pre_partial_lower_cy [9]),
    .LI(\BU2/U0/i_comp_eff.i_eff/Madd_pre_partial_lower_lut [10]),
    .O(\BU2/U0/i_comp_eff.i_eff/pre_partial_lower [10])
  );
  MUXCY   \BU2/U0/i_comp_eff.i_eff/Madd_pre_partial_lower_cy<10>  (
    .CI(\BU2/U0/i_comp_eff.i_eff/Madd_pre_partial_lower_cy [9]),
    .DI(\BU2/U0/i_comp_eff.i_eff/d1_eff_phase_error [7]),
    .S(\BU2/U0/i_comp_eff.i_eff/Madd_pre_partial_lower_lut [10]),
    .O(\BU2/U0/i_comp_eff.i_eff/Madd_pre_partial_lower_cy [10])
  );
  LUT2 #(
    .INIT ( 4'h6 ))
  \BU2/U0/i_comp_eff.i_eff/Madd_pre_partial_lower_lut<10>  (
    .I0(\BU2/U0/i_comp_eff.i_eff/d1_eff_phase_error [7]),
    .I1(\BU2/U0/i_comp_eff.i_eff/d1_eff_phase_error [10]),
    .O(\BU2/U0/i_comp_eff.i_eff/Madd_pre_partial_lower_lut [10])
  );
  XORCY   \BU2/U0/i_comp_eff.i_eff/Madd_pre_partial_lower_xor<9>  (
    .CI(\BU2/U0/i_comp_eff.i_eff/Madd_pre_partial_lower_cy [8]),
    .LI(\BU2/U0/i_comp_eff.i_eff/Madd_pre_partial_lower_lut [9]),
    .O(\BU2/U0/i_comp_eff.i_eff/pre_partial_lower [9])
  );
  MUXCY   \BU2/U0/i_comp_eff.i_eff/Madd_pre_partial_lower_cy<9>  (
    .CI(\BU2/U0/i_comp_eff.i_eff/Madd_pre_partial_lower_cy [8]),
    .DI(\BU2/U0/i_comp_eff.i_eff/d1_eff_phase_error [6]),
    .S(\BU2/U0/i_comp_eff.i_eff/Madd_pre_partial_lower_lut [9]),
    .O(\BU2/U0/i_comp_eff.i_eff/Madd_pre_partial_lower_cy [9])
  );
  LUT2 #(
    .INIT ( 4'h6 ))
  \BU2/U0/i_comp_eff.i_eff/Madd_pre_partial_lower_lut<9>  (
    .I0(\BU2/U0/i_comp_eff.i_eff/d1_eff_phase_error [6]),
    .I1(\BU2/U0/i_comp_eff.i_eff/d1_eff_phase_error [9]),
    .O(\BU2/U0/i_comp_eff.i_eff/Madd_pre_partial_lower_lut [9])
  );
  XORCY   \BU2/U0/i_comp_eff.i_eff/Madd_pre_partial_lower_xor<8>  (
    .CI(\BU2/U0/i_comp_eff.i_eff/Madd_pre_partial_lower_cy [7]),
    .LI(\BU2/U0/i_comp_eff.i_eff/Madd_pre_partial_lower_lut [8]),
    .O(\BU2/U0/i_comp_eff.i_eff/pre_partial_lower [8])
  );
  MUXCY   \BU2/U0/i_comp_eff.i_eff/Madd_pre_partial_lower_cy<8>  (
    .CI(\BU2/U0/i_comp_eff.i_eff/Madd_pre_partial_lower_cy [7]),
    .DI(\BU2/U0/i_comp_eff.i_eff/d1_eff_phase_error [5]),
    .S(\BU2/U0/i_comp_eff.i_eff/Madd_pre_partial_lower_lut [8]),
    .O(\BU2/U0/i_comp_eff.i_eff/Madd_pre_partial_lower_cy [8])
  );
  LUT2 #(
    .INIT ( 4'h6 ))
  \BU2/U0/i_comp_eff.i_eff/Madd_pre_partial_lower_lut<8>  (
    .I0(\BU2/U0/i_comp_eff.i_eff/d1_eff_phase_error [5]),
    .I1(\BU2/U0/i_comp_eff.i_eff/d1_eff_phase_error [8]),
    .O(\BU2/U0/i_comp_eff.i_eff/Madd_pre_partial_lower_lut [8])
  );
  XORCY   \BU2/U0/i_comp_eff.i_eff/Madd_pre_partial_lower_xor<7>  (
    .CI(\BU2/U0/i_comp_eff.i_eff/Madd_pre_partial_lower_cy [6]),
    .LI(\BU2/U0/i_comp_eff.i_eff/Madd_pre_partial_lower_lut [7]),
    .O(\BU2/U0/i_comp_eff.i_eff/pre_partial_lower [7])
  );
  MUXCY   \BU2/U0/i_comp_eff.i_eff/Madd_pre_partial_lower_cy<7>  (
    .CI(\BU2/U0/i_comp_eff.i_eff/Madd_pre_partial_lower_cy [6]),
    .DI(\BU2/U0/i_comp_eff.i_eff/d1_eff_phase_error [4]),
    .S(\BU2/U0/i_comp_eff.i_eff/Madd_pre_partial_lower_lut [7]),
    .O(\BU2/U0/i_comp_eff.i_eff/Madd_pre_partial_lower_cy [7])
  );
  LUT2 #(
    .INIT ( 4'h6 ))
  \BU2/U0/i_comp_eff.i_eff/Madd_pre_partial_lower_lut<7>  (
    .I0(\BU2/U0/i_comp_eff.i_eff/d1_eff_phase_error [4]),
    .I1(\BU2/U0/i_comp_eff.i_eff/d1_eff_phase_error [7]),
    .O(\BU2/U0/i_comp_eff.i_eff/Madd_pre_partial_lower_lut [7])
  );
  XORCY   \BU2/U0/i_comp_eff.i_eff/Madd_pre_partial_lower_xor<6>  (
    .CI(\BU2/U0/i_comp_eff.i_eff/Madd_pre_partial_lower_cy [5]),
    .LI(\BU2/U0/i_comp_eff.i_eff/Madd_pre_partial_lower_lut [6]),
    .O(\BU2/U0/i_comp_eff.i_eff/pre_partial_lower [6])
  );
  MUXCY   \BU2/U0/i_comp_eff.i_eff/Madd_pre_partial_lower_cy<6>  (
    .CI(\BU2/U0/i_comp_eff.i_eff/Madd_pre_partial_lower_cy [5]),
    .DI(\BU2/U0/i_comp_eff.i_eff/d1_eff_phase_error [3]),
    .S(\BU2/U0/i_comp_eff.i_eff/Madd_pre_partial_lower_lut [6]),
    .O(\BU2/U0/i_comp_eff.i_eff/Madd_pre_partial_lower_cy [6])
  );
  LUT2 #(
    .INIT ( 4'h6 ))
  \BU2/U0/i_comp_eff.i_eff/Madd_pre_partial_lower_lut<6>  (
    .I0(\BU2/U0/i_comp_eff.i_eff/d1_eff_phase_error [3]),
    .I1(\BU2/U0/i_comp_eff.i_eff/d1_eff_phase_error [6]),
    .O(\BU2/U0/i_comp_eff.i_eff/Madd_pre_partial_lower_lut [6])
  );
  MUXCY   \BU2/U0/i_comp_eff.i_eff/Madd_pre_partial_lower_cy<5>  (
    .CI(\BU2/U0/i_comp_eff.i_eff/Madd_pre_partial_lower_cy [4]),
    .DI(\BU2/U0/i_comp_eff.i_eff/d1_eff_phase_error [2]),
    .S(\BU2/U0/i_comp_eff.i_eff/Madd_pre_partial_lower_lut [5]),
    .O(\BU2/U0/i_comp_eff.i_eff/Madd_pre_partial_lower_cy [5])
  );
  LUT2 #(
    .INIT ( 4'h6 ))
  \BU2/U0/i_comp_eff.i_eff/Madd_pre_partial_lower_lut<5>  (
    .I0(\BU2/U0/i_comp_eff.i_eff/d1_eff_phase_error [2]),
    .I1(\BU2/U0/i_comp_eff.i_eff/d1_eff_phase_error [5]),
    .O(\BU2/U0/i_comp_eff.i_eff/Madd_pre_partial_lower_lut [5])
  );
  MUXCY   \BU2/U0/i_comp_eff.i_eff/Madd_pre_partial_lower_cy<4>  (
    .CI(\BU2/U0/i_comp_eff.i_eff/Madd_pre_partial_lower_cy [3]),
    .DI(\BU2/U0/i_comp_eff.i_eff/d1_eff_phase_error [1]),
    .S(\BU2/U0/i_comp_eff.i_eff/Madd_pre_partial_lower_lut [4]),
    .O(\BU2/U0/i_comp_eff.i_eff/Madd_pre_partial_lower_cy [4])
  );
  LUT2 #(
    .INIT ( 4'h6 ))
  \BU2/U0/i_comp_eff.i_eff/Madd_pre_partial_lower_lut<4>  (
    .I0(\BU2/U0/i_comp_eff.i_eff/d1_eff_phase_error [1]),
    .I1(\BU2/U0/i_comp_eff.i_eff/d1_eff_phase_error [4]),
    .O(\BU2/U0/i_comp_eff.i_eff/Madd_pre_partial_lower_lut [4])
  );
  MUXCY   \BU2/U0/i_comp_eff.i_eff/Madd_pre_partial_lower_cy<3>  (
    .CI(\BU2/channel [0]),
    .DI(\BU2/U0/i_comp_eff.i_eff/d1_eff_phase_error [0]),
    .S(\BU2/U0/i_comp_eff.i_eff/Madd_pre_partial_lower_lut [3]),
    .O(\BU2/U0/i_comp_eff.i_eff/Madd_pre_partial_lower_cy [3])
  );
  LUT2 #(
    .INIT ( 4'h6 ))
  \BU2/U0/i_comp_eff.i_eff/Madd_pre_partial_lower_lut<3>  (
    .I0(\BU2/U0/i_comp_eff.i_eff/d1_eff_phase_error [0]),
    .I1(\BU2/U0/i_comp_eff.i_eff/d1_eff_phase_error [3]),
    .O(\BU2/U0/i_comp_eff.i_eff/Madd_pre_partial_lower_lut [3])
  );
  XORCY   \BU2/U0/i_comp_eff.i_eff/Madd_off_pre_final_sin_xor<28>  (
    .CI(\BU2/U0/i_comp_eff.i_eff/Madd_off_pre_final_sin_cy [27]),
    .LI(\BU2/U0/i_comp_eff.i_eff/Madd_off_pre_final_sin_lut [28]),
    .O(\BU2/U0/final_sin [46])
  );
  LUT2 #(
    .INIT ( 4'h6 ))
  \BU2/U0/i_comp_eff.i_eff/Madd_off_pre_final_sin_lut<28>  (
    .I0(\BU2/U0/i_comp_eff.i_eff/shifted_sin_x [28]),
    .I1(\BU2/U0/i_comp_eff.i_eff/sin_mult_adj [20]),
    .O(\BU2/U0/i_comp_eff.i_eff/Madd_off_pre_final_sin_lut [28])
  );
  XORCY   \BU2/U0/i_comp_eff.i_eff/Madd_off_pre_final_sin_xor<27>  (
    .CI(\BU2/U0/i_comp_eff.i_eff/Madd_off_pre_final_sin_cy [26]),
    .LI(\BU2/U0/i_comp_eff.i_eff/Madd_off_pre_final_sin_lut [27]),
    .O(\BU2/U0/final_sin [45])
  );
  MUXCY   \BU2/U0/i_comp_eff.i_eff/Madd_off_pre_final_sin_cy<27>  (
    .CI(\BU2/U0/i_comp_eff.i_eff/Madd_off_pre_final_sin_cy [26]),
    .DI(\BU2/U0/i_comp_eff.i_eff/shifted_sin_x [27]),
    .S(\BU2/U0/i_comp_eff.i_eff/Madd_off_pre_final_sin_lut [27]),
    .O(\BU2/U0/i_comp_eff.i_eff/Madd_off_pre_final_sin_cy [27])
  );
  LUT2 #(
    .INIT ( 4'h6 ))
  \BU2/U0/i_comp_eff.i_eff/Madd_off_pre_final_sin_lut<27>  (
    .I0(\BU2/U0/i_comp_eff.i_eff/shifted_sin_x [27]),
    .I1(\BU2/U0/i_comp_eff.i_eff/sin_mult_adj [20]),
    .O(\BU2/U0/i_comp_eff.i_eff/Madd_off_pre_final_sin_lut [27])
  );
  XORCY   \BU2/U0/i_comp_eff.i_eff/Madd_off_pre_final_sin_xor<26>  (
    .CI(\BU2/U0/i_comp_eff.i_eff/Madd_off_pre_final_sin_cy [25]),
    .LI(\BU2/U0/i_comp_eff.i_eff/Madd_off_pre_final_sin_lut [26]),
    .O(\BU2/U0/final_sin [44])
  );
  MUXCY   \BU2/U0/i_comp_eff.i_eff/Madd_off_pre_final_sin_cy<26>  (
    .CI(\BU2/U0/i_comp_eff.i_eff/Madd_off_pre_final_sin_cy [25]),
    .DI(\BU2/U0/i_comp_eff.i_eff/shifted_sin_x [26]),
    .S(\BU2/U0/i_comp_eff.i_eff/Madd_off_pre_final_sin_lut [26]),
    .O(\BU2/U0/i_comp_eff.i_eff/Madd_off_pre_final_sin_cy [26])
  );
  LUT2 #(
    .INIT ( 4'h6 ))
  \BU2/U0/i_comp_eff.i_eff/Madd_off_pre_final_sin_lut<26>  (
    .I0(\BU2/U0/i_comp_eff.i_eff/shifted_sin_x [26]),
    .I1(\BU2/U0/i_comp_eff.i_eff/sin_mult_adj [20]),
    .O(\BU2/U0/i_comp_eff.i_eff/Madd_off_pre_final_sin_lut [26])
  );
  XORCY   \BU2/U0/i_comp_eff.i_eff/Madd_off_pre_final_sin_xor<25>  (
    .CI(\BU2/U0/i_comp_eff.i_eff/Madd_off_pre_final_sin_cy [24]),
    .LI(\BU2/U0/i_comp_eff.i_eff/Madd_off_pre_final_sin_lut [25]),
    .O(\BU2/U0/final_sin [43])
  );
  MUXCY   \BU2/U0/i_comp_eff.i_eff/Madd_off_pre_final_sin_cy<25>  (
    .CI(\BU2/U0/i_comp_eff.i_eff/Madd_off_pre_final_sin_cy [24]),
    .DI(\BU2/U0/i_comp_eff.i_eff/shifted_sin_x [25]),
    .S(\BU2/U0/i_comp_eff.i_eff/Madd_off_pre_final_sin_lut [25]),
    .O(\BU2/U0/i_comp_eff.i_eff/Madd_off_pre_final_sin_cy [25])
  );
  LUT2 #(
    .INIT ( 4'h6 ))
  \BU2/U0/i_comp_eff.i_eff/Madd_off_pre_final_sin_lut<25>  (
    .I0(\BU2/U0/i_comp_eff.i_eff/shifted_sin_x [25]),
    .I1(\BU2/U0/i_comp_eff.i_eff/sin_mult_adj [20]),
    .O(\BU2/U0/i_comp_eff.i_eff/Madd_off_pre_final_sin_lut [25])
  );
  XORCY   \BU2/U0/i_comp_eff.i_eff/Madd_off_pre_final_sin_xor<24>  (
    .CI(\BU2/U0/i_comp_eff.i_eff/Madd_off_pre_final_sin_cy [23]),
    .LI(\BU2/U0/i_comp_eff.i_eff/Madd_off_pre_final_sin_lut [24]),
    .O(\BU2/U0/final_sin [42])
  );
  MUXCY   \BU2/U0/i_comp_eff.i_eff/Madd_off_pre_final_sin_cy<24>  (
    .CI(\BU2/U0/i_comp_eff.i_eff/Madd_off_pre_final_sin_cy [23]),
    .DI(\BU2/U0/i_comp_eff.i_eff/shifted_sin_x [24]),
    .S(\BU2/U0/i_comp_eff.i_eff/Madd_off_pre_final_sin_lut [24]),
    .O(\BU2/U0/i_comp_eff.i_eff/Madd_off_pre_final_sin_cy [24])
  );
  LUT2 #(
    .INIT ( 4'h6 ))
  \BU2/U0/i_comp_eff.i_eff/Madd_off_pre_final_sin_lut<24>  (
    .I0(\BU2/U0/i_comp_eff.i_eff/shifted_sin_x [24]),
    .I1(\BU2/U0/i_comp_eff.i_eff/sin_mult_adj [20]),
    .O(\BU2/U0/i_comp_eff.i_eff/Madd_off_pre_final_sin_lut [24])
  );
  XORCY   \BU2/U0/i_comp_eff.i_eff/Madd_off_pre_final_sin_xor<23>  (
    .CI(\BU2/U0/i_comp_eff.i_eff/Madd_off_pre_final_sin_cy [22]),
    .LI(\BU2/U0/i_comp_eff.i_eff/Madd_off_pre_final_sin_lut [23]),
    .O(\BU2/U0/final_sin [41])
  );
  MUXCY   \BU2/U0/i_comp_eff.i_eff/Madd_off_pre_final_sin_cy<23>  (
    .CI(\BU2/U0/i_comp_eff.i_eff/Madd_off_pre_final_sin_cy [22]),
    .DI(\BU2/U0/i_comp_eff.i_eff/shifted_sin_x [23]),
    .S(\BU2/U0/i_comp_eff.i_eff/Madd_off_pre_final_sin_lut [23]),
    .O(\BU2/U0/i_comp_eff.i_eff/Madd_off_pre_final_sin_cy [23])
  );
  LUT2 #(
    .INIT ( 4'h6 ))
  \BU2/U0/i_comp_eff.i_eff/Madd_off_pre_final_sin_lut<23>  (
    .I0(\BU2/U0/i_comp_eff.i_eff/shifted_sin_x [23]),
    .I1(\BU2/U0/i_comp_eff.i_eff/sin_mult_adj [20]),
    .O(\BU2/U0/i_comp_eff.i_eff/Madd_off_pre_final_sin_lut [23])
  );
  XORCY   \BU2/U0/i_comp_eff.i_eff/Madd_off_pre_final_sin_xor<22>  (
    .CI(\BU2/U0/i_comp_eff.i_eff/Madd_off_pre_final_sin_cy [21]),
    .LI(\BU2/U0/i_comp_eff.i_eff/Madd_off_pre_final_sin_lut [22]),
    .O(\BU2/U0/final_sin [40])
  );
  MUXCY   \BU2/U0/i_comp_eff.i_eff/Madd_off_pre_final_sin_cy<22>  (
    .CI(\BU2/U0/i_comp_eff.i_eff/Madd_off_pre_final_sin_cy [21]),
    .DI(\BU2/U0/i_comp_eff.i_eff/shifted_sin_x [22]),
    .S(\BU2/U0/i_comp_eff.i_eff/Madd_off_pre_final_sin_lut [22]),
    .O(\BU2/U0/i_comp_eff.i_eff/Madd_off_pre_final_sin_cy [22])
  );
  LUT2 #(
    .INIT ( 4'h6 ))
  \BU2/U0/i_comp_eff.i_eff/Madd_off_pre_final_sin_lut<22>  (
    .I0(\BU2/U0/i_comp_eff.i_eff/shifted_sin_x [22]),
    .I1(\BU2/U0/i_comp_eff.i_eff/sin_mult_adj [20]),
    .O(\BU2/U0/i_comp_eff.i_eff/Madd_off_pre_final_sin_lut [22])
  );
  XORCY   \BU2/U0/i_comp_eff.i_eff/Madd_off_pre_final_sin_xor<21>  (
    .CI(\BU2/U0/i_comp_eff.i_eff/Madd_off_pre_final_sin_cy [20]),
    .LI(\BU2/U0/i_comp_eff.i_eff/Madd_off_pre_final_sin_lut [21]),
    .O(\BU2/U0/final_sin [39])
  );
  MUXCY   \BU2/U0/i_comp_eff.i_eff/Madd_off_pre_final_sin_cy<21>  (
    .CI(\BU2/U0/i_comp_eff.i_eff/Madd_off_pre_final_sin_cy [20]),
    .DI(\BU2/U0/i_comp_eff.i_eff/shifted_sin_x [21]),
    .S(\BU2/U0/i_comp_eff.i_eff/Madd_off_pre_final_sin_lut [21]),
    .O(\BU2/U0/i_comp_eff.i_eff/Madd_off_pre_final_sin_cy [21])
  );
  LUT2 #(
    .INIT ( 4'h6 ))
  \BU2/U0/i_comp_eff.i_eff/Madd_off_pre_final_sin_lut<21>  (
    .I0(\BU2/U0/i_comp_eff.i_eff/shifted_sin_x [21]),
    .I1(\BU2/U0/i_comp_eff.i_eff/sin_mult_adj [20]),
    .O(\BU2/U0/i_comp_eff.i_eff/Madd_off_pre_final_sin_lut [21])
  );
  XORCY   \BU2/U0/i_comp_eff.i_eff/Madd_off_pre_final_sin_xor<20>  (
    .CI(\BU2/U0/i_comp_eff.i_eff/Madd_off_pre_final_sin_cy [19]),
    .LI(\BU2/U0/i_comp_eff.i_eff/Madd_off_pre_final_sin_lut [20]),
    .O(\BU2/U0/final_sin [38])
  );
  MUXCY   \BU2/U0/i_comp_eff.i_eff/Madd_off_pre_final_sin_cy<20>  (
    .CI(\BU2/U0/i_comp_eff.i_eff/Madd_off_pre_final_sin_cy [19]),
    .DI(\BU2/U0/i_comp_eff.i_eff/shifted_sin_x [20]),
    .S(\BU2/U0/i_comp_eff.i_eff/Madd_off_pre_final_sin_lut [20]),
    .O(\BU2/U0/i_comp_eff.i_eff/Madd_off_pre_final_sin_cy [20])
  );
  LUT2 #(
    .INIT ( 4'h6 ))
  \BU2/U0/i_comp_eff.i_eff/Madd_off_pre_final_sin_lut<20>  (
    .I0(\BU2/U0/i_comp_eff.i_eff/shifted_sin_x [20]),
    .I1(\BU2/U0/i_comp_eff.i_eff/sin_mult_adj [20]),
    .O(\BU2/U0/i_comp_eff.i_eff/Madd_off_pre_final_sin_lut [20])
  );
  XORCY   \BU2/U0/i_comp_eff.i_eff/Madd_off_pre_final_sin_xor<19>  (
    .CI(\BU2/U0/i_comp_eff.i_eff/Madd_off_pre_final_sin_cy [18]),
    .LI(\BU2/U0/i_comp_eff.i_eff/Madd_off_pre_final_sin_lut [19]),
    .O(\BU2/U0/final_sin [37])
  );
  MUXCY   \BU2/U0/i_comp_eff.i_eff/Madd_off_pre_final_sin_cy<19>  (
    .CI(\BU2/U0/i_comp_eff.i_eff/Madd_off_pre_final_sin_cy [18]),
    .DI(\BU2/U0/i_comp_eff.i_eff/shifted_sin_x [19]),
    .S(\BU2/U0/i_comp_eff.i_eff/Madd_off_pre_final_sin_lut [19]),
    .O(\BU2/U0/i_comp_eff.i_eff/Madd_off_pre_final_sin_cy [19])
  );
  LUT2 #(
    .INIT ( 4'h6 ))
  \BU2/U0/i_comp_eff.i_eff/Madd_off_pre_final_sin_lut<19>  (
    .I0(\BU2/U0/i_comp_eff.i_eff/shifted_sin_x [19]),
    .I1(\BU2/U0/i_comp_eff.i_eff/sin_mult_adj [19]),
    .O(\BU2/U0/i_comp_eff.i_eff/Madd_off_pre_final_sin_lut [19])
  );
  XORCY   \BU2/U0/i_comp_eff.i_eff/Madd_off_pre_final_sin_xor<18>  (
    .CI(\BU2/U0/i_comp_eff.i_eff/Madd_off_pre_final_sin_cy [17]),
    .LI(\BU2/U0/i_comp_eff.i_eff/Madd_off_pre_final_sin_lut [18]),
    .O(\BU2/U0/final_sin [36])
  );
  MUXCY   \BU2/U0/i_comp_eff.i_eff/Madd_off_pre_final_sin_cy<18>  (
    .CI(\BU2/U0/i_comp_eff.i_eff/Madd_off_pre_final_sin_cy [17]),
    .DI(\BU2/U0/i_comp_eff.i_eff/shifted_sin_x [18]),
    .S(\BU2/U0/i_comp_eff.i_eff/Madd_off_pre_final_sin_lut [18]),
    .O(\BU2/U0/i_comp_eff.i_eff/Madd_off_pre_final_sin_cy [18])
  );
  LUT2 #(
    .INIT ( 4'h6 ))
  \BU2/U0/i_comp_eff.i_eff/Madd_off_pre_final_sin_lut<18>  (
    .I0(\BU2/U0/i_comp_eff.i_eff/shifted_sin_x [18]),
    .I1(\BU2/U0/i_comp_eff.i_eff/sin_mult_adj [18]),
    .O(\BU2/U0/i_comp_eff.i_eff/Madd_off_pre_final_sin_lut [18])
  );
  XORCY   \BU2/U0/i_comp_eff.i_eff/Madd_off_pre_final_sin_xor<17>  (
    .CI(\BU2/U0/i_comp_eff.i_eff/Madd_off_pre_final_sin_cy [16]),
    .LI(\BU2/U0/i_comp_eff.i_eff/Madd_off_pre_final_sin_lut [17]),
    .O(\BU2/U0/final_sin [35])
  );
  MUXCY   \BU2/U0/i_comp_eff.i_eff/Madd_off_pre_final_sin_cy<17>  (
    .CI(\BU2/U0/i_comp_eff.i_eff/Madd_off_pre_final_sin_cy [16]),
    .DI(\BU2/U0/i_comp_eff.i_eff/shifted_sin_x [17]),
    .S(\BU2/U0/i_comp_eff.i_eff/Madd_off_pre_final_sin_lut [17]),
    .O(\BU2/U0/i_comp_eff.i_eff/Madd_off_pre_final_sin_cy [17])
  );
  LUT2 #(
    .INIT ( 4'h6 ))
  \BU2/U0/i_comp_eff.i_eff/Madd_off_pre_final_sin_lut<17>  (
    .I0(\BU2/U0/i_comp_eff.i_eff/shifted_sin_x [17]),
    .I1(\BU2/U0/i_comp_eff.i_eff/sin_mult_adj [17]),
    .O(\BU2/U0/i_comp_eff.i_eff/Madd_off_pre_final_sin_lut [17])
  );
  XORCY   \BU2/U0/i_comp_eff.i_eff/Madd_off_pre_final_sin_xor<16>  (
    .CI(\BU2/U0/i_comp_eff.i_eff/Madd_off_pre_final_sin_cy [15]),
    .LI(\BU2/U0/i_comp_eff.i_eff/Madd_off_pre_final_sin_lut [16]),
    .O(\BU2/U0/final_sin [34])
  );
  MUXCY   \BU2/U0/i_comp_eff.i_eff/Madd_off_pre_final_sin_cy<16>  (
    .CI(\BU2/U0/i_comp_eff.i_eff/Madd_off_pre_final_sin_cy [15]),
    .DI(\BU2/U0/i_comp_eff.i_eff/shifted_sin_x [16]),
    .S(\BU2/U0/i_comp_eff.i_eff/Madd_off_pre_final_sin_lut [16]),
    .O(\BU2/U0/i_comp_eff.i_eff/Madd_off_pre_final_sin_cy [16])
  );
  LUT2 #(
    .INIT ( 4'h6 ))
  \BU2/U0/i_comp_eff.i_eff/Madd_off_pre_final_sin_lut<16>  (
    .I0(\BU2/U0/i_comp_eff.i_eff/shifted_sin_x [16]),
    .I1(\BU2/U0/i_comp_eff.i_eff/sin_mult_adj [16]),
    .O(\BU2/U0/i_comp_eff.i_eff/Madd_off_pre_final_sin_lut [16])
  );
  XORCY   \BU2/U0/i_comp_eff.i_eff/Madd_off_pre_final_sin_xor<15>  (
    .CI(\BU2/U0/i_comp_eff.i_eff/Madd_off_pre_final_sin_cy [14]),
    .LI(\BU2/U0/i_comp_eff.i_eff/Madd_off_pre_final_sin_lut [15]),
    .O(\BU2/U0/final_sin [33])
  );
  MUXCY   \BU2/U0/i_comp_eff.i_eff/Madd_off_pre_final_sin_cy<15>  (
    .CI(\BU2/U0/i_comp_eff.i_eff/Madd_off_pre_final_sin_cy [14]),
    .DI(\BU2/U0/i_comp_eff.i_eff/shifted_sin_x [15]),
    .S(\BU2/U0/i_comp_eff.i_eff/Madd_off_pre_final_sin_lut [15]),
    .O(\BU2/U0/i_comp_eff.i_eff/Madd_off_pre_final_sin_cy [15])
  );
  LUT2 #(
    .INIT ( 4'h6 ))
  \BU2/U0/i_comp_eff.i_eff/Madd_off_pre_final_sin_lut<15>  (
    .I0(\BU2/U0/i_comp_eff.i_eff/shifted_sin_x [15]),
    .I1(\BU2/U0/i_comp_eff.i_eff/sin_mult_adj [15]),
    .O(\BU2/U0/i_comp_eff.i_eff/Madd_off_pre_final_sin_lut [15])
  );
  XORCY   \BU2/U0/i_comp_eff.i_eff/Madd_off_pre_final_sin_xor<14>  (
    .CI(\BU2/U0/i_comp_eff.i_eff/Madd_off_pre_final_sin_cy [13]),
    .LI(\BU2/U0/i_comp_eff.i_eff/Madd_off_pre_final_sin_lut [14]),
    .O(\BU2/U0/final_sin [32])
  );
  MUXCY   \BU2/U0/i_comp_eff.i_eff/Madd_off_pre_final_sin_cy<14>  (
    .CI(\BU2/U0/i_comp_eff.i_eff/Madd_off_pre_final_sin_cy [13]),
    .DI(\BU2/U0/i_comp_eff.i_eff/shifted_sin_x [14]),
    .S(\BU2/U0/i_comp_eff.i_eff/Madd_off_pre_final_sin_lut [14]),
    .O(\BU2/U0/i_comp_eff.i_eff/Madd_off_pre_final_sin_cy [14])
  );
  LUT2 #(
    .INIT ( 4'h6 ))
  \BU2/U0/i_comp_eff.i_eff/Madd_off_pre_final_sin_lut<14>  (
    .I0(\BU2/U0/i_comp_eff.i_eff/shifted_sin_x [14]),
    .I1(\BU2/U0/i_comp_eff.i_eff/sin_mult_adj [14]),
    .O(\BU2/U0/i_comp_eff.i_eff/Madd_off_pre_final_sin_lut [14])
  );
  XORCY   \BU2/U0/i_comp_eff.i_eff/Madd_off_pre_final_sin_xor<13>  (
    .CI(\BU2/U0/i_comp_eff.i_eff/Madd_off_pre_final_sin_cy [12]),
    .LI(\BU2/U0/i_comp_eff.i_eff/Madd_off_pre_final_sin_lut [13]),
    .O(\BU2/U0/final_sin [31])
  );
  MUXCY   \BU2/U0/i_comp_eff.i_eff/Madd_off_pre_final_sin_cy<13>  (
    .CI(\BU2/U0/i_comp_eff.i_eff/Madd_off_pre_final_sin_cy [12]),
    .DI(\BU2/U0/i_comp_eff.i_eff/shifted_sin_x [13]),
    .S(\BU2/U0/i_comp_eff.i_eff/Madd_off_pre_final_sin_lut [13]),
    .O(\BU2/U0/i_comp_eff.i_eff/Madd_off_pre_final_sin_cy [13])
  );
  LUT2 #(
    .INIT ( 4'h6 ))
  \BU2/U0/i_comp_eff.i_eff/Madd_off_pre_final_sin_lut<13>  (
    .I0(\BU2/U0/i_comp_eff.i_eff/shifted_sin_x [13]),
    .I1(\BU2/U0/i_comp_eff.i_eff/sin_mult_adj [13]),
    .O(\BU2/U0/i_comp_eff.i_eff/Madd_off_pre_final_sin_lut [13])
  );
  XORCY   \BU2/U0/i_comp_eff.i_eff/Madd_off_pre_final_sin_xor<12>  (
    .CI(\BU2/U0/i_comp_eff.i_eff/Madd_off_pre_final_sin_cy [11]),
    .LI(\BU2/U0/i_comp_eff.i_eff/Madd_off_pre_final_sin_lut [12]),
    .O(\BU2/U0/final_sin [30])
  );
  MUXCY   \BU2/U0/i_comp_eff.i_eff/Madd_off_pre_final_sin_cy<12>  (
    .CI(\BU2/U0/i_comp_eff.i_eff/Madd_off_pre_final_sin_cy [11]),
    .DI(\BU2/U0/i_comp_eff.i_eff/shifted_sin_x [12]),
    .S(\BU2/U0/i_comp_eff.i_eff/Madd_off_pre_final_sin_lut [12]),
    .O(\BU2/U0/i_comp_eff.i_eff/Madd_off_pre_final_sin_cy [12])
  );
  LUT2 #(
    .INIT ( 4'h6 ))
  \BU2/U0/i_comp_eff.i_eff/Madd_off_pre_final_sin_lut<12>  (
    .I0(\BU2/U0/i_comp_eff.i_eff/shifted_sin_x [12]),
    .I1(\BU2/U0/i_comp_eff.i_eff/sin_mult_adj [12]),
    .O(\BU2/U0/i_comp_eff.i_eff/Madd_off_pre_final_sin_lut [12])
  );
  XORCY   \BU2/U0/i_comp_eff.i_eff/Madd_off_pre_final_sin_xor<11>  (
    .CI(\BU2/U0/i_comp_eff.i_eff/Madd_off_pre_final_sin_cy [10]),
    .LI(\BU2/U0/i_comp_eff.i_eff/Madd_off_pre_final_sin_lut [11]),
    .O(\BU2/U0/final_sin [29])
  );
  MUXCY   \BU2/U0/i_comp_eff.i_eff/Madd_off_pre_final_sin_cy<11>  (
    .CI(\BU2/U0/i_comp_eff.i_eff/Madd_off_pre_final_sin_cy [10]),
    .DI(\BU2/U0/i_comp_eff.i_eff/shifted_sin_x [11]),
    .S(\BU2/U0/i_comp_eff.i_eff/Madd_off_pre_final_sin_lut [11]),
    .O(\BU2/U0/i_comp_eff.i_eff/Madd_off_pre_final_sin_cy [11])
  );
  LUT2 #(
    .INIT ( 4'h6 ))
  \BU2/U0/i_comp_eff.i_eff/Madd_off_pre_final_sin_lut<11>  (
    .I0(\BU2/U0/i_comp_eff.i_eff/shifted_sin_x [11]),
    .I1(\BU2/U0/i_comp_eff.i_eff/sin_mult_adj [11]),
    .O(\BU2/U0/i_comp_eff.i_eff/Madd_off_pre_final_sin_lut [11])
  );
  XORCY   \BU2/U0/i_comp_eff.i_eff/Madd_off_pre_final_sin_xor<10>  (
    .CI(\BU2/U0/i_comp_eff.i_eff/Madd_off_pre_final_sin_cy [9]),
    .LI(\BU2/U0/i_comp_eff.i_eff/Madd_off_pre_final_sin_lut [10]),
    .O(\BU2/U0/final_sin [28])
  );
  MUXCY   \BU2/U0/i_comp_eff.i_eff/Madd_off_pre_final_sin_cy<10>  (
    .CI(\BU2/U0/i_comp_eff.i_eff/Madd_off_pre_final_sin_cy [9]),
    .DI(\BU2/U0/i_comp_eff.i_eff/shifted_sin_x [10]),
    .S(\BU2/U0/i_comp_eff.i_eff/Madd_off_pre_final_sin_lut [10]),
    .O(\BU2/U0/i_comp_eff.i_eff/Madd_off_pre_final_sin_cy [10])
  );
  LUT2 #(
    .INIT ( 4'h6 ))
  \BU2/U0/i_comp_eff.i_eff/Madd_off_pre_final_sin_lut<10>  (
    .I0(\BU2/U0/i_comp_eff.i_eff/shifted_sin_x [10]),
    .I1(\BU2/U0/i_comp_eff.i_eff/sin_mult_adj [10]),
    .O(\BU2/U0/i_comp_eff.i_eff/Madd_off_pre_final_sin_lut [10])
  );
  XORCY   \BU2/U0/i_comp_eff.i_eff/Madd_off_pre_final_sin_xor<9>  (
    .CI(\BU2/U0/i_comp_eff.i_eff/Madd_off_pre_final_sin_cy [8]),
    .LI(\BU2/U0/i_comp_eff.i_eff/Madd_off_pre_final_sin_lut [9]),
    .O(\BU2/U0/final_sin [27])
  );
  MUXCY   \BU2/U0/i_comp_eff.i_eff/Madd_off_pre_final_sin_cy<9>  (
    .CI(\BU2/U0/i_comp_eff.i_eff/Madd_off_pre_final_sin_cy [8]),
    .DI(\BU2/U0/i_comp_eff.i_eff/shifted_sin_x [9]),
    .S(\BU2/U0/i_comp_eff.i_eff/Madd_off_pre_final_sin_lut [9]),
    .O(\BU2/U0/i_comp_eff.i_eff/Madd_off_pre_final_sin_cy [9])
  );
  LUT2 #(
    .INIT ( 4'h6 ))
  \BU2/U0/i_comp_eff.i_eff/Madd_off_pre_final_sin_lut<9>  (
    .I0(\BU2/U0/i_comp_eff.i_eff/shifted_sin_x [9]),
    .I1(\BU2/U0/i_comp_eff.i_eff/sin_mult_adj [9]),
    .O(\BU2/U0/i_comp_eff.i_eff/Madd_off_pre_final_sin_lut [9])
  );
  MUXCY   \BU2/U0/i_comp_eff.i_eff/Madd_off_pre_final_sin_cy<8>  (
    .CI(\BU2/U0/i_comp_eff.i_eff/Madd_off_pre_final_sin_cy [7]),
    .DI(\BU2/U0/i_comp_eff.i_eff/shifted_sin_x [8]),
    .S(\BU2/U0/i_comp_eff.i_eff/Madd_off_pre_final_sin_lut [8]),
    .O(\BU2/U0/i_comp_eff.i_eff/Madd_off_pre_final_sin_cy [8])
  );
  LUT2 #(
    .INIT ( 4'h6 ))
  \BU2/U0/i_comp_eff.i_eff/Madd_off_pre_final_sin_lut<8>  (
    .I0(\BU2/U0/i_comp_eff.i_eff/shifted_sin_x [8]),
    .I1(\BU2/U0/i_comp_eff.i_eff/sin_mult_adj [8]),
    .O(\BU2/U0/i_comp_eff.i_eff/Madd_off_pre_final_sin_lut [8])
  );
  MUXCY   \BU2/U0/i_comp_eff.i_eff/Madd_off_pre_final_sin_cy<7>  (
    .CI(\BU2/U0/i_comp_eff.i_eff/Madd_off_pre_final_sin_cy [6]),
    .DI(\BU2/U0/i_comp_eff.i_eff/shifted_sin_x [7]),
    .S(\BU2/U0/i_comp_eff.i_eff/Madd_off_pre_final_sin_lut [7]),
    .O(\BU2/U0/i_comp_eff.i_eff/Madd_off_pre_final_sin_cy [7])
  );
  LUT2 #(
    .INIT ( 4'h6 ))
  \BU2/U0/i_comp_eff.i_eff/Madd_off_pre_final_sin_lut<7>  (
    .I0(\BU2/U0/i_comp_eff.i_eff/shifted_sin_x [7]),
    .I1(\BU2/U0/i_comp_eff.i_eff/sin_mult_adj [7]),
    .O(\BU2/U0/i_comp_eff.i_eff/Madd_off_pre_final_sin_lut [7])
  );
  MUXCY   \BU2/U0/i_comp_eff.i_eff/Madd_off_pre_final_sin_cy<6>  (
    .CI(\BU2/U0/i_comp_eff.i_eff/Madd_off_pre_final_sin_cy [5]),
    .DI(\BU2/U0/i_comp_eff.i_eff/shifted_sin_x [6]),
    .S(\BU2/U0/i_comp_eff.i_eff/Madd_off_pre_final_sin_lut [6]),
    .O(\BU2/U0/i_comp_eff.i_eff/Madd_off_pre_final_sin_cy [6])
  );
  LUT2 #(
    .INIT ( 4'h6 ))
  \BU2/U0/i_comp_eff.i_eff/Madd_off_pre_final_sin_lut<6>  (
    .I0(\BU2/U0/i_comp_eff.i_eff/shifted_sin_x [6]),
    .I1(\BU2/U0/i_comp_eff.i_eff/sin_mult_adj [6]),
    .O(\BU2/U0/i_comp_eff.i_eff/Madd_off_pre_final_sin_lut [6])
  );
  MUXCY   \BU2/U0/i_comp_eff.i_eff/Madd_off_pre_final_sin_cy<5>  (
    .CI(\BU2/U0/i_comp_eff.i_eff/Madd_off_pre_final_sin_cy [4]),
    .DI(\BU2/U0/i_comp_eff.i_eff/shifted_sin_x [5]),
    .S(\BU2/U0/i_comp_eff.i_eff/Madd_off_pre_final_sin_lut [5]),
    .O(\BU2/U0/i_comp_eff.i_eff/Madd_off_pre_final_sin_cy [5])
  );
  LUT2 #(
    .INIT ( 4'h6 ))
  \BU2/U0/i_comp_eff.i_eff/Madd_off_pre_final_sin_lut<5>  (
    .I0(\BU2/U0/i_comp_eff.i_eff/shifted_sin_x [5]),
    .I1(\BU2/U0/i_comp_eff.i_eff/sin_mult_adj [5]),
    .O(\BU2/U0/i_comp_eff.i_eff/Madd_off_pre_final_sin_lut [5])
  );
  MUXCY   \BU2/U0/i_comp_eff.i_eff/Madd_off_pre_final_sin_cy<4>  (
    .CI(\BU2/U0/i_comp_eff.i_eff/Madd_off_pre_final_sin_cy [3]),
    .DI(\BU2/U0/i_comp_eff.i_eff/shifted_sin_x [4]),
    .S(\BU2/U0/i_comp_eff.i_eff/Madd_off_pre_final_sin_lut [4]),
    .O(\BU2/U0/i_comp_eff.i_eff/Madd_off_pre_final_sin_cy [4])
  );
  LUT2 #(
    .INIT ( 4'h6 ))
  \BU2/U0/i_comp_eff.i_eff/Madd_off_pre_final_sin_lut<4>  (
    .I0(\BU2/U0/i_comp_eff.i_eff/shifted_sin_x [4]),
    .I1(\BU2/U0/i_comp_eff.i_eff/sin_mult_adj [4]),
    .O(\BU2/U0/i_comp_eff.i_eff/Madd_off_pre_final_sin_lut [4])
  );
  MUXCY   \BU2/U0/i_comp_eff.i_eff/Madd_off_pre_final_sin_cy<3>  (
    .CI(\BU2/U0/i_comp_eff.i_eff/Madd_off_pre_final_sin_cy [2]),
    .DI(\BU2/U0/i_comp_eff.i_eff/shifted_sin_x [3]),
    .S(\BU2/U0/i_comp_eff.i_eff/Madd_off_pre_final_sin_lut [3]),
    .O(\BU2/U0/i_comp_eff.i_eff/Madd_off_pre_final_sin_cy [3])
  );
  LUT2 #(
    .INIT ( 4'h6 ))
  \BU2/U0/i_comp_eff.i_eff/Madd_off_pre_final_sin_lut<3>  (
    .I0(\BU2/U0/i_comp_eff.i_eff/shifted_sin_x [3]),
    .I1(\BU2/U0/i_comp_eff.i_eff/sin_mult_adj [3]),
    .O(\BU2/U0/i_comp_eff.i_eff/Madd_off_pre_final_sin_lut [3])
  );
  MUXCY   \BU2/U0/i_comp_eff.i_eff/Madd_off_pre_final_sin_cy<2>  (
    .CI(\BU2/U0/i_comp_eff.i_eff/Madd_off_pre_final_sin_cy [1]),
    .DI(\BU2/U0/i_comp_eff.i_eff/shifted_sin_x [2]),
    .S(\BU2/U0/i_comp_eff.i_eff/Madd_off_pre_final_sin_lut [2]),
    .O(\BU2/U0/i_comp_eff.i_eff/Madd_off_pre_final_sin_cy [2])
  );
  LUT2 #(
    .INIT ( 4'h6 ))
  \BU2/U0/i_comp_eff.i_eff/Madd_off_pre_final_sin_lut<2>  (
    .I0(\BU2/U0/i_comp_eff.i_eff/shifted_sin_x [2]),
    .I1(\BU2/U0/i_comp_eff.i_eff/sin_mult_adj [2]),
    .O(\BU2/U0/i_comp_eff.i_eff/Madd_off_pre_final_sin_lut [2])
  );
  MUXCY   \BU2/U0/i_comp_eff.i_eff/Madd_off_pre_final_sin_cy<1>  (
    .CI(\BU2/U0/i_comp_eff.i_eff/Madd_off_pre_final_sin_cy [0]),
    .DI(\BU2/U0/i_comp_eff.i_eff/shifted_sin_x [1]),
    .S(\BU2/U0/i_comp_eff.i_eff/Madd_off_pre_final_sin_lut [1]),
    .O(\BU2/U0/i_comp_eff.i_eff/Madd_off_pre_final_sin_cy [1])
  );
  LUT2 #(
    .INIT ( 4'h6 ))
  \BU2/U0/i_comp_eff.i_eff/Madd_off_pre_final_sin_lut<1>  (
    .I0(\BU2/U0/i_comp_eff.i_eff/shifted_sin_x [1]),
    .I1(\BU2/U0/i_comp_eff.i_eff/sin_mult_adj [1]),
    .O(\BU2/U0/i_comp_eff.i_eff/Madd_off_pre_final_sin_lut [1])
  );
  MUXCY   \BU2/U0/i_comp_eff.i_eff/Madd_off_pre_final_sin_cy<0>  (
    .CI(\BU2/channel [0]),
    .DI(\BU2/U0/i_comp_eff.i_eff/shifted_sin_x [0]),
    .S(\BU2/U0/i_comp_eff.i_eff/Madd_off_pre_final_sin_lut [0]),
    .O(\BU2/U0/i_comp_eff.i_eff/Madd_off_pre_final_sin_cy [0])
  );
  LUT2 #(
    .INIT ( 4'h6 ))
  \BU2/U0/i_comp_eff.i_eff/Madd_off_pre_final_sin_lut<0>  (
    .I0(\BU2/U0/i_comp_eff.i_eff/shifted_sin_x [0]),
    .I1(\BU2/U0/i_comp_eff.i_eff/sin_mult_adj [0]),
    .O(\BU2/U0/i_comp_eff.i_eff/Madd_off_pre_final_sin_lut [0])
  );
  MUXCY   \BU2/U0/i_comp_eff.i_eff/Madd_pre_partial_upper_cy<11>  (
    .CI(\BU2/U0/i_comp_eff.i_eff/Madd_pre_partial_upper_cy [10]),
    .DI(\BU2/U0/i_comp_eff.i_eff/d1_eff_phase_error [10]),
    .S(\BU2/channel [0]),
    .O(\BU2/U0/i_comp_eff.i_eff/Madd_pre_partial_upper_cy [11])
  );
  XORCY   \BU2/U0/i_comp_eff.i_eff/Madd_pre_partial_upper_xor<10>  (
    .CI(\BU2/U0/i_comp_eff.i_eff/Madd_pre_partial_upper_cy [9]),
    .LI(\BU2/U0/i_comp_eff.i_eff/Madd_pre_partial_upper_lut [10]),
    .O(\BU2/U0/i_comp_eff.i_eff/pre_partial_upper [10])
  );
  MUXCY   \BU2/U0/i_comp_eff.i_eff/Madd_pre_partial_upper_cy<10>  (
    .CI(\BU2/U0/i_comp_eff.i_eff/Madd_pre_partial_upper_cy [9]),
    .DI(\BU2/U0/i_comp_eff.i_eff/d1_eff_phase_error [9]),
    .S(\BU2/U0/i_comp_eff.i_eff/Madd_pre_partial_upper_lut [10]),
    .O(\BU2/U0/i_comp_eff.i_eff/Madd_pre_partial_upper_cy [10])
  );
  LUT2 #(
    .INIT ( 4'h6 ))
  \BU2/U0/i_comp_eff.i_eff/Madd_pre_partial_upper_lut<10>  (
    .I0(\BU2/U0/i_comp_eff.i_eff/d1_eff_phase_error [9]),
    .I1(\BU2/U0/i_comp_eff.i_eff/d1_eff_phase_error [10]),
    .O(\BU2/U0/i_comp_eff.i_eff/Madd_pre_partial_upper_lut [10])
  );
  XORCY   \BU2/U0/i_comp_eff.i_eff/Madd_pre_partial_upper_xor<9>  (
    .CI(\BU2/U0/i_comp_eff.i_eff/Madd_pre_partial_upper_cy [8]),
    .LI(\BU2/U0/i_comp_eff.i_eff/Madd_pre_partial_upper_lut [9]),
    .O(\BU2/U0/i_comp_eff.i_eff/pre_partial_upper [9])
  );
  MUXCY   \BU2/U0/i_comp_eff.i_eff/Madd_pre_partial_upper_cy<9>  (
    .CI(\BU2/U0/i_comp_eff.i_eff/Madd_pre_partial_upper_cy [8]),
    .DI(\BU2/U0/i_comp_eff.i_eff/d1_eff_phase_error [8]),
    .S(\BU2/U0/i_comp_eff.i_eff/Madd_pre_partial_upper_lut [9]),
    .O(\BU2/U0/i_comp_eff.i_eff/Madd_pre_partial_upper_cy [9])
  );
  LUT2 #(
    .INIT ( 4'h6 ))
  \BU2/U0/i_comp_eff.i_eff/Madd_pre_partial_upper_lut<9>  (
    .I0(\BU2/U0/i_comp_eff.i_eff/d1_eff_phase_error [8]),
    .I1(\BU2/U0/i_comp_eff.i_eff/d1_eff_phase_error [9]),
    .O(\BU2/U0/i_comp_eff.i_eff/Madd_pre_partial_upper_lut [9])
  );
  XORCY   \BU2/U0/i_comp_eff.i_eff/Madd_pre_partial_upper_xor<8>  (
    .CI(\BU2/U0/i_comp_eff.i_eff/Madd_pre_partial_upper_cy [7]),
    .LI(\BU2/U0/i_comp_eff.i_eff/Madd_pre_partial_upper_lut [8]),
    .O(\BU2/U0/i_comp_eff.i_eff/pre_partial_upper [8])
  );
  MUXCY   \BU2/U0/i_comp_eff.i_eff/Madd_pre_partial_upper_cy<8>  (
    .CI(\BU2/U0/i_comp_eff.i_eff/Madd_pre_partial_upper_cy [7]),
    .DI(\BU2/U0/i_comp_eff.i_eff/d1_eff_phase_error [7]),
    .S(\BU2/U0/i_comp_eff.i_eff/Madd_pre_partial_upper_lut [8]),
    .O(\BU2/U0/i_comp_eff.i_eff/Madd_pre_partial_upper_cy [8])
  );
  LUT2 #(
    .INIT ( 4'h6 ))
  \BU2/U0/i_comp_eff.i_eff/Madd_pre_partial_upper_lut<8>  (
    .I0(\BU2/U0/i_comp_eff.i_eff/d1_eff_phase_error [7]),
    .I1(\BU2/U0/i_comp_eff.i_eff/d1_eff_phase_error [8]),
    .O(\BU2/U0/i_comp_eff.i_eff/Madd_pre_partial_upper_lut [8])
  );
  XORCY   \BU2/U0/i_comp_eff.i_eff/Madd_pre_partial_upper_xor<7>  (
    .CI(\BU2/U0/i_comp_eff.i_eff/Madd_pre_partial_upper_cy [6]),
    .LI(\BU2/U0/i_comp_eff.i_eff/Madd_pre_partial_upper_lut [7]),
    .O(\BU2/U0/i_comp_eff.i_eff/pre_partial_upper [7])
  );
  MUXCY   \BU2/U0/i_comp_eff.i_eff/Madd_pre_partial_upper_cy<7>  (
    .CI(\BU2/U0/i_comp_eff.i_eff/Madd_pre_partial_upper_cy [6]),
    .DI(\BU2/U0/i_comp_eff.i_eff/d1_eff_phase_error [6]),
    .S(\BU2/U0/i_comp_eff.i_eff/Madd_pre_partial_upper_lut [7]),
    .O(\BU2/U0/i_comp_eff.i_eff/Madd_pre_partial_upper_cy [7])
  );
  LUT2 #(
    .INIT ( 4'h6 ))
  \BU2/U0/i_comp_eff.i_eff/Madd_pre_partial_upper_lut<7>  (
    .I0(\BU2/U0/i_comp_eff.i_eff/d1_eff_phase_error [6]),
    .I1(\BU2/U0/i_comp_eff.i_eff/d1_eff_phase_error [7]),
    .O(\BU2/U0/i_comp_eff.i_eff/Madd_pre_partial_upper_lut [7])
  );
  XORCY   \BU2/U0/i_comp_eff.i_eff/Madd_pre_partial_upper_xor<6>  (
    .CI(\BU2/U0/i_comp_eff.i_eff/Madd_pre_partial_upper_cy [5]),
    .LI(\BU2/U0/i_comp_eff.i_eff/Madd_pre_partial_upper_lut [6]),
    .O(\BU2/U0/i_comp_eff.i_eff/pre_partial_upper [6])
  );
  MUXCY   \BU2/U0/i_comp_eff.i_eff/Madd_pre_partial_upper_cy<6>  (
    .CI(\BU2/U0/i_comp_eff.i_eff/Madd_pre_partial_upper_cy [5]),
    .DI(\BU2/U0/i_comp_eff.i_eff/d1_eff_phase_error [5]),
    .S(\BU2/U0/i_comp_eff.i_eff/Madd_pre_partial_upper_lut [6]),
    .O(\BU2/U0/i_comp_eff.i_eff/Madd_pre_partial_upper_cy [6])
  );
  LUT2 #(
    .INIT ( 4'h6 ))
  \BU2/U0/i_comp_eff.i_eff/Madd_pre_partial_upper_lut<6>  (
    .I0(\BU2/U0/i_comp_eff.i_eff/d1_eff_phase_error [5]),
    .I1(\BU2/U0/i_comp_eff.i_eff/d1_eff_phase_error [6]),
    .O(\BU2/U0/i_comp_eff.i_eff/Madd_pre_partial_upper_lut [6])
  );
  XORCY   \BU2/U0/i_comp_eff.i_eff/Madd_pre_partial_upper_xor<5>  (
    .CI(\BU2/U0/i_comp_eff.i_eff/Madd_pre_partial_upper_cy [4]),
    .LI(\BU2/U0/i_comp_eff.i_eff/Madd_pre_partial_upper_lut [5]),
    .O(\BU2/U0/i_comp_eff.i_eff/pre_partial_upper [5])
  );
  MUXCY   \BU2/U0/i_comp_eff.i_eff/Madd_pre_partial_upper_cy<5>  (
    .CI(\BU2/U0/i_comp_eff.i_eff/Madd_pre_partial_upper_cy [4]),
    .DI(\BU2/U0/i_comp_eff.i_eff/d1_eff_phase_error [4]),
    .S(\BU2/U0/i_comp_eff.i_eff/Madd_pre_partial_upper_lut [5]),
    .O(\BU2/U0/i_comp_eff.i_eff/Madd_pre_partial_upper_cy [5])
  );
  LUT2 #(
    .INIT ( 4'h6 ))
  \BU2/U0/i_comp_eff.i_eff/Madd_pre_partial_upper_lut<5>  (
    .I0(\BU2/U0/i_comp_eff.i_eff/d1_eff_phase_error [4]),
    .I1(\BU2/U0/i_comp_eff.i_eff/d1_eff_phase_error [5]),
    .O(\BU2/U0/i_comp_eff.i_eff/Madd_pre_partial_upper_lut [5])
  );
  XORCY   \BU2/U0/i_comp_eff.i_eff/Madd_pre_partial_upper_xor<4>  (
    .CI(\BU2/U0/i_comp_eff.i_eff/Madd_pre_partial_upper_cy [3]),
    .LI(\BU2/U0/i_comp_eff.i_eff/Madd_pre_partial_upper_lut [4]),
    .O(\BU2/U0/i_comp_eff.i_eff/pre_partial_upper [4])
  );
  MUXCY   \BU2/U0/i_comp_eff.i_eff/Madd_pre_partial_upper_cy<4>  (
    .CI(\BU2/U0/i_comp_eff.i_eff/Madd_pre_partial_upper_cy [3]),
    .DI(\BU2/U0/i_comp_eff.i_eff/d1_eff_phase_error [3]),
    .S(\BU2/U0/i_comp_eff.i_eff/Madd_pre_partial_upper_lut [4]),
    .O(\BU2/U0/i_comp_eff.i_eff/Madd_pre_partial_upper_cy [4])
  );
  LUT2 #(
    .INIT ( 4'h6 ))
  \BU2/U0/i_comp_eff.i_eff/Madd_pre_partial_upper_lut<4>  (
    .I0(\BU2/U0/i_comp_eff.i_eff/d1_eff_phase_error [3]),
    .I1(\BU2/U0/i_comp_eff.i_eff/d1_eff_phase_error [4]),
    .O(\BU2/U0/i_comp_eff.i_eff/Madd_pre_partial_upper_lut [4])
  );
  XORCY   \BU2/U0/i_comp_eff.i_eff/Madd_pre_partial_upper_xor<3>  (
    .CI(\BU2/U0/i_comp_eff.i_eff/Madd_pre_partial_upper_cy [2]),
    .LI(\BU2/U0/i_comp_eff.i_eff/Madd_pre_partial_upper_lut [3]),
    .O(\BU2/U0/i_comp_eff.i_eff/pre_partial_upper [3])
  );
  MUXCY   \BU2/U0/i_comp_eff.i_eff/Madd_pre_partial_upper_cy<3>  (
    .CI(\BU2/U0/i_comp_eff.i_eff/Madd_pre_partial_upper_cy [2]),
    .DI(\BU2/U0/i_comp_eff.i_eff/d1_eff_phase_error [2]),
    .S(\BU2/U0/i_comp_eff.i_eff/Madd_pre_partial_upper_lut [3]),
    .O(\BU2/U0/i_comp_eff.i_eff/Madd_pre_partial_upper_cy [3])
  );
  LUT2 #(
    .INIT ( 4'h6 ))
  \BU2/U0/i_comp_eff.i_eff/Madd_pre_partial_upper_lut<3>  (
    .I0(\BU2/U0/i_comp_eff.i_eff/d1_eff_phase_error [2]),
    .I1(\BU2/U0/i_comp_eff.i_eff/d1_eff_phase_error [3]),
    .O(\BU2/U0/i_comp_eff.i_eff/Madd_pre_partial_upper_lut [3])
  );
  XORCY   \BU2/U0/i_comp_eff.i_eff/Madd_pre_partial_upper_xor<2>  (
    .CI(\BU2/U0/i_comp_eff.i_eff/Madd_pre_partial_upper_cy [1]),
    .LI(\BU2/U0/i_comp_eff.i_eff/Madd_pre_partial_upper_lut [2]),
    .O(\BU2/U0/i_comp_eff.i_eff/pre_partial_upper [2])
  );
  MUXCY   \BU2/U0/i_comp_eff.i_eff/Madd_pre_partial_upper_cy<2>  (
    .CI(\BU2/U0/i_comp_eff.i_eff/Madd_pre_partial_upper_cy [1]),
    .DI(\BU2/U0/i_comp_eff.i_eff/d1_eff_phase_error [1]),
    .S(\BU2/U0/i_comp_eff.i_eff/Madd_pre_partial_upper_lut [2]),
    .O(\BU2/U0/i_comp_eff.i_eff/Madd_pre_partial_upper_cy [2])
  );
  LUT2 #(
    .INIT ( 4'h6 ))
  \BU2/U0/i_comp_eff.i_eff/Madd_pre_partial_upper_lut<2>  (
    .I0(\BU2/U0/i_comp_eff.i_eff/d1_eff_phase_error [1]),
    .I1(\BU2/U0/i_comp_eff.i_eff/d1_eff_phase_error [2]),
    .O(\BU2/U0/i_comp_eff.i_eff/Madd_pre_partial_upper_lut [2])
  );
  MUXCY   \BU2/U0/i_comp_eff.i_eff/Madd_pre_partial_upper_cy<1>  (
    .CI(\BU2/channel [0]),
    .DI(\BU2/U0/i_comp_eff.i_eff/d1_eff_phase_error [0]),
    .S(\BU2/U0/i_comp_eff.i_eff/Madd_pre_partial_upper_lut [1]),
    .O(\BU2/U0/i_comp_eff.i_eff/Madd_pre_partial_upper_cy [1])
  );
  LUT2 #(
    .INIT ( 4'h6 ))
  \BU2/U0/i_comp_eff.i_eff/Madd_pre_partial_upper_lut<1>  (
    .I0(\BU2/U0/i_comp_eff.i_eff/d1_eff_phase_error [0]),
    .I1(\BU2/U0/i_comp_eff.i_eff/d1_eff_phase_error [1]),
    .O(\BU2/U0/i_comp_eff.i_eff/Madd_pre_partial_upper_lut [1])
  );
  XORCY   \BU2/U0/i_accum/i_fabric.i_one_channel.i_accum/Madd_temp_xor<27>  (
    .CI(\BU2/U0/i_accum/i_fabric.i_one_channel.i_accum/Madd_temp_cy [26]),
    .LI(\BU2/U0/i_accum/i_fabric.i_one_channel.i_accum/Madd_temp_lut [27]),
    .O(\BU2/U0/i_accum/acc_phase_b [27])
  );
  LUT2 #(
    .INIT ( 4'h6 ))
  \BU2/U0/i_accum/i_fabric.i_one_channel.i_accum/Madd_temp_lut<27>  (
    .I0(\BU2/U0/acc_phase [27]),
    .I1(\BU2/U0/i_accum/phase_inc[0] ),
    .O(\BU2/U0/i_accum/i_fabric.i_one_channel.i_accum/Madd_temp_lut [27])
  );
  XORCY   \BU2/U0/i_accum/i_fabric.i_one_channel.i_accum/Madd_temp_xor<26>  (
    .CI(\BU2/U0/i_accum/i_fabric.i_one_channel.i_accum/Madd_temp_cy [25]),
    .LI(\BU2/U0/i_accum/i_fabric.i_one_channel.i_accum/Madd_temp_lut [26]),
    .O(\BU2/U0/i_accum/acc_phase_b [26])
  );
  MUXCY   \BU2/U0/i_accum/i_fabric.i_one_channel.i_accum/Madd_temp_cy<26>  (
    .CI(\BU2/U0/i_accum/i_fabric.i_one_channel.i_accum/Madd_temp_cy [25]),
    .DI(\BU2/U0/acc_phase [26]),
    .S(\BU2/U0/i_accum/i_fabric.i_one_channel.i_accum/Madd_temp_lut [26]),
    .O(\BU2/U0/i_accum/i_fabric.i_one_channel.i_accum/Madd_temp_cy [26])
  );
  LUT2 #(
    .INIT ( 4'h6 ))
  \BU2/U0/i_accum/i_fabric.i_one_channel.i_accum/Madd_temp_lut<26>  (
    .I0(\BU2/U0/acc_phase [26]),
    .I1(\BU2/U0/i_accum/phase_inc[0] ),
    .O(\BU2/U0/i_accum/i_fabric.i_one_channel.i_accum/Madd_temp_lut [26])
  );
  XORCY   \BU2/U0/i_accum/i_fabric.i_one_channel.i_accum/Madd_temp_xor<25>  (
    .CI(\BU2/U0/i_accum/i_fabric.i_one_channel.i_accum/Madd_temp_cy [24]),
    .LI(\BU2/U0/i_accum/i_fabric.i_one_channel.i_accum/Madd_temp_lut [25]),
    .O(\BU2/U0/i_accum/acc_phase_b [25])
  );
  MUXCY   \BU2/U0/i_accum/i_fabric.i_one_channel.i_accum/Madd_temp_cy<25>  (
    .CI(\BU2/U0/i_accum/i_fabric.i_one_channel.i_accum/Madd_temp_cy [24]),
    .DI(\BU2/U0/acc_phase [25]),
    .S(\BU2/U0/i_accum/i_fabric.i_one_channel.i_accum/Madd_temp_lut [25]),
    .O(\BU2/U0/i_accum/i_fabric.i_one_channel.i_accum/Madd_temp_cy [25])
  );
  LUT2 #(
    .INIT ( 4'h6 ))
  \BU2/U0/i_accum/i_fabric.i_one_channel.i_accum/Madd_temp_lut<25>  (
    .I0(\BU2/U0/acc_phase [25]),
    .I1(\BU2/U0/i_accum/phase_inc[0] ),
    .O(\BU2/U0/i_accum/i_fabric.i_one_channel.i_accum/Madd_temp_lut [25])
  );
  XORCY   \BU2/U0/i_accum/i_fabric.i_one_channel.i_accum/Madd_temp_xor<24>  (
    .CI(\BU2/U0/i_accum/i_fabric.i_one_channel.i_accum/Madd_temp_cy [23]),
    .LI(\BU2/U0/i_accum/i_fabric.i_one_channel.i_accum/Madd_temp_lut [24]),
    .O(\BU2/U0/i_accum/acc_phase_b [24])
  );
  MUXCY   \BU2/U0/i_accum/i_fabric.i_one_channel.i_accum/Madd_temp_cy<24>  (
    .CI(\BU2/U0/i_accum/i_fabric.i_one_channel.i_accum/Madd_temp_cy [23]),
    .DI(\BU2/U0/acc_phase [24]),
    .S(\BU2/U0/i_accum/i_fabric.i_one_channel.i_accum/Madd_temp_lut [24]),
    .O(\BU2/U0/i_accum/i_fabric.i_one_channel.i_accum/Madd_temp_cy [24])
  );
  LUT2 #(
    .INIT ( 4'h6 ))
  \BU2/U0/i_accum/i_fabric.i_one_channel.i_accum/Madd_temp_lut<24>  (
    .I0(\BU2/U0/acc_phase [24]),
    .I1(\BU2/U0/i_accum/phase_inc[0] ),
    .O(\BU2/U0/i_accum/i_fabric.i_one_channel.i_accum/Madd_temp_lut [24])
  );
  XORCY   \BU2/U0/i_accum/i_fabric.i_one_channel.i_accum/Madd_temp_xor<23>  (
    .CI(\BU2/U0/i_accum/i_fabric.i_one_channel.i_accum/Madd_temp_cy [22]),
    .LI(\BU2/U0/i_accum/i_fabric.i_one_channel.i_accum/Madd_temp_lut [23]),
    .O(\BU2/U0/i_accum/acc_phase_b [23])
  );
  MUXCY   \BU2/U0/i_accum/i_fabric.i_one_channel.i_accum/Madd_temp_cy<23>  (
    .CI(\BU2/U0/i_accum/i_fabric.i_one_channel.i_accum/Madd_temp_cy [22]),
    .DI(\BU2/U0/acc_phase [23]),
    .S(\BU2/U0/i_accum/i_fabric.i_one_channel.i_accum/Madd_temp_lut [23]),
    .O(\BU2/U0/i_accum/i_fabric.i_one_channel.i_accum/Madd_temp_cy [23])
  );
  LUT2 #(
    .INIT ( 4'h6 ))
  \BU2/U0/i_accum/i_fabric.i_one_channel.i_accum/Madd_temp_lut<23>  (
    .I0(\BU2/U0/acc_phase [23]),
    .I1(\BU2/U0/i_accum/phase_inc[0] ),
    .O(\BU2/U0/i_accum/i_fabric.i_one_channel.i_accum/Madd_temp_lut [23])
  );
  XORCY   \BU2/U0/i_accum/i_fabric.i_one_channel.i_accum/Madd_temp_xor<22>  (
    .CI(\BU2/U0/i_accum/i_fabric.i_one_channel.i_accum/Madd_temp_cy [21]),
    .LI(\BU2/U0/i_accum/i_fabric.i_one_channel.i_accum/Madd_temp_lut [22]),
    .O(\BU2/U0/i_accum/acc_phase_b [22])
  );
  MUXCY   \BU2/U0/i_accum/i_fabric.i_one_channel.i_accum/Madd_temp_cy<22>  (
    .CI(\BU2/U0/i_accum/i_fabric.i_one_channel.i_accum/Madd_temp_cy [21]),
    .DI(\BU2/U0/acc_phase [22]),
    .S(\BU2/U0/i_accum/i_fabric.i_one_channel.i_accum/Madd_temp_lut [22]),
    .O(\BU2/U0/i_accum/i_fabric.i_one_channel.i_accum/Madd_temp_cy [22])
  );
  LUT2 #(
    .INIT ( 4'h6 ))
  \BU2/U0/i_accum/i_fabric.i_one_channel.i_accum/Madd_temp_lut<22>  (
    .I0(\BU2/U0/acc_phase [22]),
    .I1(\BU2/U0/i_accum/phase_inc[0] ),
    .O(\BU2/U0/i_accum/i_fabric.i_one_channel.i_accum/Madd_temp_lut [22])
  );
  XORCY   \BU2/U0/i_accum/i_fabric.i_one_channel.i_accum/Madd_temp_xor<21>  (
    .CI(\BU2/U0/i_accum/i_fabric.i_one_channel.i_accum/Madd_temp_cy [20]),
    .LI(\BU2/U0/i_accum/i_fabric.i_one_channel.i_accum/Madd_temp_lut [21]),
    .O(\BU2/U0/i_accum/acc_phase_b [21])
  );
  MUXCY   \BU2/U0/i_accum/i_fabric.i_one_channel.i_accum/Madd_temp_cy<21>  (
    .CI(\BU2/U0/i_accum/i_fabric.i_one_channel.i_accum/Madd_temp_cy [20]),
    .DI(\BU2/U0/acc_phase [21]),
    .S(\BU2/U0/i_accum/i_fabric.i_one_channel.i_accum/Madd_temp_lut [21]),
    .O(\BU2/U0/i_accum/i_fabric.i_one_channel.i_accum/Madd_temp_cy [21])
  );
  LUT2 #(
    .INIT ( 4'h6 ))
  \BU2/U0/i_accum/i_fabric.i_one_channel.i_accum/Madd_temp_lut<21>  (
    .I0(\BU2/U0/acc_phase [21]),
    .I1(\BU2/U0/i_accum/phase_inc[10] ),
    .O(\BU2/U0/i_accum/i_fabric.i_one_channel.i_accum/Madd_temp_lut [21])
  );
  XORCY   \BU2/U0/i_accum/i_fabric.i_one_channel.i_accum/Madd_temp_xor<20>  (
    .CI(\BU2/U0/i_accum/i_fabric.i_one_channel.i_accum/Madd_temp_cy [19]),
    .LI(\BU2/U0/i_accum/i_fabric.i_one_channel.i_accum/Madd_temp_lut [20]),
    .O(\BU2/U0/i_accum/acc_phase_b [20])
  );
  MUXCY   \BU2/U0/i_accum/i_fabric.i_one_channel.i_accum/Madd_temp_cy<20>  (
    .CI(\BU2/U0/i_accum/i_fabric.i_one_channel.i_accum/Madd_temp_cy [19]),
    .DI(\BU2/U0/acc_phase [20]),
    .S(\BU2/U0/i_accum/i_fabric.i_one_channel.i_accum/Madd_temp_lut [20]),
    .O(\BU2/U0/i_accum/i_fabric.i_one_channel.i_accum/Madd_temp_cy [20])
  );
  LUT2 #(
    .INIT ( 4'h6 ))
  \BU2/U0/i_accum/i_fabric.i_one_channel.i_accum/Madd_temp_lut<20>  (
    .I0(\BU2/U0/acc_phase [20]),
    .I1(\BU2/U0/i_accum/phase_inc[0] ),
    .O(\BU2/U0/i_accum/i_fabric.i_one_channel.i_accum/Madd_temp_lut [20])
  );
  XORCY   \BU2/U0/i_accum/i_fabric.i_one_channel.i_accum/Madd_temp_xor<19>  (
    .CI(\BU2/U0/i_accum/i_fabric.i_one_channel.i_accum/Madd_temp_cy [18]),
    .LI(\BU2/U0/i_accum/i_fabric.i_one_channel.i_accum/Madd_temp_lut [19]),
    .O(\BU2/U0/i_accum/acc_phase_b [19])
  );
  MUXCY   \BU2/U0/i_accum/i_fabric.i_one_channel.i_accum/Madd_temp_cy<19>  (
    .CI(\BU2/U0/i_accum/i_fabric.i_one_channel.i_accum/Madd_temp_cy [18]),
    .DI(\BU2/U0/acc_phase [19]),
    .S(\BU2/U0/i_accum/i_fabric.i_one_channel.i_accum/Madd_temp_lut [19]),
    .O(\BU2/U0/i_accum/i_fabric.i_one_channel.i_accum/Madd_temp_cy [19])
  );
  LUT2 #(
    .INIT ( 4'h6 ))
  \BU2/U0/i_accum/i_fabric.i_one_channel.i_accum/Madd_temp_lut<19>  (
    .I0(\BU2/U0/acc_phase [19]),
    .I1(\BU2/U0/i_accum/phase_inc[10] ),
    .O(\BU2/U0/i_accum/i_fabric.i_one_channel.i_accum/Madd_temp_lut [19])
  );
  XORCY   \BU2/U0/i_accum/i_fabric.i_one_channel.i_accum/Madd_temp_xor<18>  (
    .CI(\BU2/U0/i_accum/i_fabric.i_one_channel.i_accum/Madd_temp_cy [17]),
    .LI(\BU2/U0/i_accum/i_fabric.i_one_channel.i_accum/Madd_temp_lut [18]),
    .O(\BU2/U0/i_accum/acc_phase_b [18])
  );
  MUXCY   \BU2/U0/i_accum/i_fabric.i_one_channel.i_accum/Madd_temp_cy<18>  (
    .CI(\BU2/U0/i_accum/i_fabric.i_one_channel.i_accum/Madd_temp_cy [17]),
    .DI(\BU2/U0/acc_phase [18]),
    .S(\BU2/U0/i_accum/i_fabric.i_one_channel.i_accum/Madd_temp_lut [18]),
    .O(\BU2/U0/i_accum/i_fabric.i_one_channel.i_accum/Madd_temp_cy [18])
  );
  LUT2 #(
    .INIT ( 4'h6 ))
  \BU2/U0/i_accum/i_fabric.i_one_channel.i_accum/Madd_temp_lut<18>  (
    .I0(\BU2/U0/acc_phase [18]),
    .I1(\BU2/U0/i_accum/phase_inc[0] ),
    .O(\BU2/U0/i_accum/i_fabric.i_one_channel.i_accum/Madd_temp_lut [18])
  );
  XORCY   \BU2/U0/i_accum/i_fabric.i_one_channel.i_accum/Madd_temp_xor<17>  (
    .CI(\BU2/U0/i_accum/i_fabric.i_one_channel.i_accum/Madd_temp_cy [16]),
    .LI(\BU2/U0/i_accum/i_fabric.i_one_channel.i_accum/Madd_temp_lut [17]),
    .O(\BU2/U0/i_accum/acc_phase_b [17])
  );
  MUXCY   \BU2/U0/i_accum/i_fabric.i_one_channel.i_accum/Madd_temp_cy<17>  (
    .CI(\BU2/U0/i_accum/i_fabric.i_one_channel.i_accum/Madd_temp_cy [16]),
    .DI(\BU2/U0/acc_phase [17]),
    .S(\BU2/U0/i_accum/i_fabric.i_one_channel.i_accum/Madd_temp_lut [17]),
    .O(\BU2/U0/i_accum/i_fabric.i_one_channel.i_accum/Madd_temp_cy [17])
  );
  LUT2 #(
    .INIT ( 4'h6 ))
  \BU2/U0/i_accum/i_fabric.i_one_channel.i_accum/Madd_temp_lut<17>  (
    .I0(\BU2/U0/acc_phase [17]),
    .I1(\BU2/U0/i_accum/phase_inc[0] ),
    .O(\BU2/U0/i_accum/i_fabric.i_one_channel.i_accum/Madd_temp_lut [17])
  );
  XORCY   \BU2/U0/i_accum/i_fabric.i_one_channel.i_accum/Madd_temp_xor<16>  (
    .CI(\BU2/U0/i_accum/i_fabric.i_one_channel.i_accum/Madd_temp_cy [15]),
    .LI(\BU2/U0/i_accum/i_fabric.i_one_channel.i_accum/Madd_temp_lut [16]),
    .O(\BU2/U0/i_accum/acc_phase_b [16])
  );
  MUXCY   \BU2/U0/i_accum/i_fabric.i_one_channel.i_accum/Madd_temp_cy<16>  (
    .CI(\BU2/U0/i_accum/i_fabric.i_one_channel.i_accum/Madd_temp_cy [15]),
    .DI(\BU2/U0/acc_phase [16]),
    .S(\BU2/U0/i_accum/i_fabric.i_one_channel.i_accum/Madd_temp_lut [16]),
    .O(\BU2/U0/i_accum/i_fabric.i_one_channel.i_accum/Madd_temp_cy [16])
  );
  LUT2 #(
    .INIT ( 4'h6 ))
  \BU2/U0/i_accum/i_fabric.i_one_channel.i_accum/Madd_temp_lut<16>  (
    .I0(\BU2/U0/acc_phase [16]),
    .I1(\BU2/U0/i_accum/phase_inc[0] ),
    .O(\BU2/U0/i_accum/i_fabric.i_one_channel.i_accum/Madd_temp_lut [16])
  );
  XORCY   \BU2/U0/i_accum/i_fabric.i_one_channel.i_accum/Madd_temp_xor<15>  (
    .CI(\BU2/U0/i_accum/i_fabric.i_one_channel.i_accum/Madd_temp_cy [14]),
    .LI(\BU2/U0/i_accum/i_fabric.i_one_channel.i_accum/Madd_temp_lut [15]),
    .O(\BU2/U0/i_accum/acc_phase_b [15])
  );
  MUXCY   \BU2/U0/i_accum/i_fabric.i_one_channel.i_accum/Madd_temp_cy<15>  (
    .CI(\BU2/U0/i_accum/i_fabric.i_one_channel.i_accum/Madd_temp_cy [14]),
    .DI(\BU2/U0/acc_phase [15]),
    .S(\BU2/U0/i_accum/i_fabric.i_one_channel.i_accum/Madd_temp_lut [15]),
    .O(\BU2/U0/i_accum/i_fabric.i_one_channel.i_accum/Madd_temp_cy [15])
  );
  LUT2 #(
    .INIT ( 4'h6 ))
  \BU2/U0/i_accum/i_fabric.i_one_channel.i_accum/Madd_temp_lut<15>  (
    .I0(\BU2/U0/acc_phase [15]),
    .I1(\BU2/U0/i_accum/phase_inc[10] ),
    .O(\BU2/U0/i_accum/i_fabric.i_one_channel.i_accum/Madd_temp_lut [15])
  );
  XORCY   \BU2/U0/i_accum/i_fabric.i_one_channel.i_accum/Madd_temp_xor<14>  (
    .CI(\BU2/U0/i_accum/i_fabric.i_one_channel.i_accum/Madd_temp_cy [13]),
    .LI(\BU2/U0/i_accum/i_fabric.i_one_channel.i_accum/Madd_temp_lut [14]),
    .O(\BU2/U0/i_accum/acc_phase_b [14])
  );
  MUXCY   \BU2/U0/i_accum/i_fabric.i_one_channel.i_accum/Madd_temp_cy<14>  (
    .CI(\BU2/U0/i_accum/i_fabric.i_one_channel.i_accum/Madd_temp_cy [13]),
    .DI(\BU2/U0/acc_phase [14]),
    .S(\BU2/U0/i_accum/i_fabric.i_one_channel.i_accum/Madd_temp_lut [14]),
    .O(\BU2/U0/i_accum/i_fabric.i_one_channel.i_accum/Madd_temp_cy [14])
  );
  LUT2 #(
    .INIT ( 4'h6 ))
  \BU2/U0/i_accum/i_fabric.i_one_channel.i_accum/Madd_temp_lut<14>  (
    .I0(\BU2/U0/acc_phase [14]),
    .I1(\BU2/U0/i_accum/phase_inc[10] ),
    .O(\BU2/U0/i_accum/i_fabric.i_one_channel.i_accum/Madd_temp_lut [14])
  );
  XORCY   \BU2/U0/i_accum/i_fabric.i_one_channel.i_accum/Madd_temp_xor<13>  (
    .CI(\BU2/U0/i_accum/i_fabric.i_one_channel.i_accum/Madd_temp_cy [12]),
    .LI(\BU2/U0/i_accum/i_fabric.i_one_channel.i_accum/Madd_temp_lut [13]),
    .O(\BU2/U0/i_accum/acc_phase_b [13])
  );
  MUXCY   \BU2/U0/i_accum/i_fabric.i_one_channel.i_accum/Madd_temp_cy<13>  (
    .CI(\BU2/U0/i_accum/i_fabric.i_one_channel.i_accum/Madd_temp_cy [12]),
    .DI(\BU2/U0/acc_phase [13]),
    .S(\BU2/U0/i_accum/i_fabric.i_one_channel.i_accum/Madd_temp_lut [13]),
    .O(\BU2/U0/i_accum/i_fabric.i_one_channel.i_accum/Madd_temp_cy [13])
  );
  LUT2 #(
    .INIT ( 4'h6 ))
  \BU2/U0/i_accum/i_fabric.i_one_channel.i_accum/Madd_temp_lut<13>  (
    .I0(\BU2/U0/acc_phase [13]),
    .I1(\BU2/U0/i_accum/phase_inc[10] ),
    .O(\BU2/U0/i_accum/i_fabric.i_one_channel.i_accum/Madd_temp_lut [13])
  );
  XORCY   \BU2/U0/i_accum/i_fabric.i_one_channel.i_accum/Madd_temp_xor<12>  (
    .CI(\BU2/U0/i_accum/i_fabric.i_one_channel.i_accum/Madd_temp_cy [11]),
    .LI(\BU2/U0/i_accum/i_fabric.i_one_channel.i_accum/Madd_temp_lut [12]),
    .O(\BU2/U0/i_accum/acc_phase_b [12])
  );
  MUXCY   \BU2/U0/i_accum/i_fabric.i_one_channel.i_accum/Madd_temp_cy<12>  (
    .CI(\BU2/U0/i_accum/i_fabric.i_one_channel.i_accum/Madd_temp_cy [11]),
    .DI(\BU2/U0/acc_phase [12]),
    .S(\BU2/U0/i_accum/i_fabric.i_one_channel.i_accum/Madd_temp_lut [12]),
    .O(\BU2/U0/i_accum/i_fabric.i_one_channel.i_accum/Madd_temp_cy [12])
  );
  LUT2 #(
    .INIT ( 4'h6 ))
  \BU2/U0/i_accum/i_fabric.i_one_channel.i_accum/Madd_temp_lut<12>  (
    .I0(\BU2/U0/acc_phase [12]),
    .I1(\BU2/U0/i_accum/phase_inc[10] ),
    .O(\BU2/U0/i_accum/i_fabric.i_one_channel.i_accum/Madd_temp_lut [12])
  );
  XORCY   \BU2/U0/i_accum/i_fabric.i_one_channel.i_accum/Madd_temp_xor<11>  (
    .CI(\BU2/U0/i_accum/i_fabric.i_one_channel.i_accum/Madd_temp_cy [10]),
    .LI(\BU2/U0/i_accum/i_fabric.i_one_channel.i_accum/Madd_temp_lut [11]),
    .O(\BU2/U0/i_accum/acc_phase_b [11])
  );
  MUXCY   \BU2/U0/i_accum/i_fabric.i_one_channel.i_accum/Madd_temp_cy<11>  (
    .CI(\BU2/U0/i_accum/i_fabric.i_one_channel.i_accum/Madd_temp_cy [10]),
    .DI(\BU2/U0/acc_phase [11]),
    .S(\BU2/U0/i_accum/i_fabric.i_one_channel.i_accum/Madd_temp_lut [11]),
    .O(\BU2/U0/i_accum/i_fabric.i_one_channel.i_accum/Madd_temp_cy [11])
  );
  LUT2 #(
    .INIT ( 4'h6 ))
  \BU2/U0/i_accum/i_fabric.i_one_channel.i_accum/Madd_temp_lut<11>  (
    .I0(\BU2/U0/acc_phase [11]),
    .I1(\BU2/U0/i_accum/phase_inc[0] ),
    .O(\BU2/U0/i_accum/i_fabric.i_one_channel.i_accum/Madd_temp_lut [11])
  );
  XORCY   \BU2/U0/i_accum/i_fabric.i_one_channel.i_accum/Madd_temp_xor<10>  (
    .CI(\BU2/U0/i_accum/i_fabric.i_one_channel.i_accum/Madd_temp_cy [9]),
    .LI(\BU2/U0/i_accum/i_fabric.i_one_channel.i_accum/Madd_temp_lut [10]),
    .O(\BU2/U0/i_accum/acc_phase_b [10])
  );
  MUXCY   \BU2/U0/i_accum/i_fabric.i_one_channel.i_accum/Madd_temp_cy<10>  (
    .CI(\BU2/U0/i_accum/i_fabric.i_one_channel.i_accum/Madd_temp_cy [9]),
    .DI(\BU2/U0/acc_phase [10]),
    .S(\BU2/U0/i_accum/i_fabric.i_one_channel.i_accum/Madd_temp_lut [10]),
    .O(\BU2/U0/i_accum/i_fabric.i_one_channel.i_accum/Madd_temp_cy [10])
  );
  LUT2 #(
    .INIT ( 4'h6 ))
  \BU2/U0/i_accum/i_fabric.i_one_channel.i_accum/Madd_temp_lut<10>  (
    .I0(\BU2/U0/acc_phase [10]),
    .I1(\BU2/U0/i_accum/phase_inc[10] ),
    .O(\BU2/U0/i_accum/i_fabric.i_one_channel.i_accum/Madd_temp_lut [10])
  );
  XORCY   \BU2/U0/i_accum/i_fabric.i_one_channel.i_accum/Madd_temp_xor<9>  (
    .CI(\BU2/U0/i_accum/i_fabric.i_one_channel.i_accum/Madd_temp_cy [8]),
    .LI(\BU2/U0/i_accum/i_fabric.i_one_channel.i_accum/Madd_temp_lut [9]),
    .O(\BU2/U0/i_accum/acc_phase_b [9])
  );
  MUXCY   \BU2/U0/i_accum/i_fabric.i_one_channel.i_accum/Madd_temp_cy<9>  (
    .CI(\BU2/U0/i_accum/i_fabric.i_one_channel.i_accum/Madd_temp_cy [8]),
    .DI(\BU2/U0/acc_phase [9]),
    .S(\BU2/U0/i_accum/i_fabric.i_one_channel.i_accum/Madd_temp_lut [9]),
    .O(\BU2/U0/i_accum/i_fabric.i_one_channel.i_accum/Madd_temp_cy [9])
  );
  LUT2 #(
    .INIT ( 4'h6 ))
  \BU2/U0/i_accum/i_fabric.i_one_channel.i_accum/Madd_temp_lut<9>  (
    .I0(\BU2/U0/acc_phase [9]),
    .I1(\BU2/U0/i_accum/phase_inc[0] ),
    .O(\BU2/U0/i_accum/i_fabric.i_one_channel.i_accum/Madd_temp_lut [9])
  );
  XORCY   \BU2/U0/i_accum/i_fabric.i_one_channel.i_accum/Madd_temp_xor<8>  (
    .CI(\BU2/U0/i_accum/i_fabric.i_one_channel.i_accum/Madd_temp_cy [7]),
    .LI(\BU2/U0/i_accum/i_fabric.i_one_channel.i_accum/Madd_temp_lut [8]),
    .O(\BU2/U0/i_accum/acc_phase_b [8])
  );
  MUXCY   \BU2/U0/i_accum/i_fabric.i_one_channel.i_accum/Madd_temp_cy<8>  (
    .CI(\BU2/U0/i_accum/i_fabric.i_one_channel.i_accum/Madd_temp_cy [7]),
    .DI(\BU2/U0/acc_phase [8]),
    .S(\BU2/U0/i_accum/i_fabric.i_one_channel.i_accum/Madd_temp_lut [8]),
    .O(\BU2/U0/i_accum/i_fabric.i_one_channel.i_accum/Madd_temp_cy [8])
  );
  LUT2 #(
    .INIT ( 4'h6 ))
  \BU2/U0/i_accum/i_fabric.i_one_channel.i_accum/Madd_temp_lut<8>  (
    .I0(\BU2/U0/acc_phase [8]),
    .I1(\BU2/U0/i_accum/phase_inc[10] ),
    .O(\BU2/U0/i_accum/i_fabric.i_one_channel.i_accum/Madd_temp_lut [8])
  );
  XORCY   \BU2/U0/i_accum/i_fabric.i_one_channel.i_accum/Madd_temp_xor<7>  (
    .CI(\BU2/U0/i_accum/i_fabric.i_one_channel.i_accum/Madd_temp_cy [6]),
    .LI(\BU2/U0/i_accum/i_fabric.i_one_channel.i_accum/Madd_temp_lut [7]),
    .O(\BU2/U0/i_accum/acc_phase_b [7])
  );
  MUXCY   \BU2/U0/i_accum/i_fabric.i_one_channel.i_accum/Madd_temp_cy<7>  (
    .CI(\BU2/U0/i_accum/i_fabric.i_one_channel.i_accum/Madd_temp_cy [6]),
    .DI(\BU2/U0/acc_phase [7]),
    .S(\BU2/U0/i_accum/i_fabric.i_one_channel.i_accum/Madd_temp_lut [7]),
    .O(\BU2/U0/i_accum/i_fabric.i_one_channel.i_accum/Madd_temp_cy [7])
  );
  LUT2 #(
    .INIT ( 4'h6 ))
  \BU2/U0/i_accum/i_fabric.i_one_channel.i_accum/Madd_temp_lut<7>  (
    .I0(\BU2/U0/acc_phase [7]),
    .I1(\BU2/U0/i_accum/phase_inc[10] ),
    .O(\BU2/U0/i_accum/i_fabric.i_one_channel.i_accum/Madd_temp_lut [7])
  );
  XORCY   \BU2/U0/i_accum/i_fabric.i_one_channel.i_accum/Madd_temp_xor<6>  (
    .CI(\BU2/U0/i_accum/i_fabric.i_one_channel.i_accum/Madd_temp_cy [5]),
    .LI(\BU2/U0/i_accum/i_fabric.i_one_channel.i_accum/Madd_temp_lut [6]),
    .O(\BU2/U0/i_accum/acc_phase_b [6])
  );
  MUXCY   \BU2/U0/i_accum/i_fabric.i_one_channel.i_accum/Madd_temp_cy<6>  (
    .CI(\BU2/U0/i_accum/i_fabric.i_one_channel.i_accum/Madd_temp_cy [5]),
    .DI(\BU2/U0/acc_phase [6]),
    .S(\BU2/U0/i_accum/i_fabric.i_one_channel.i_accum/Madd_temp_lut [6]),
    .O(\BU2/U0/i_accum/i_fabric.i_one_channel.i_accum/Madd_temp_cy [6])
  );
  LUT2 #(
    .INIT ( 4'h6 ))
  \BU2/U0/i_accum/i_fabric.i_one_channel.i_accum/Madd_temp_lut<6>  (
    .I0(\BU2/U0/acc_phase [6]),
    .I1(\BU2/U0/i_accum/phase_inc[10] ),
    .O(\BU2/U0/i_accum/i_fabric.i_one_channel.i_accum/Madd_temp_lut [6])
  );
  XORCY   \BU2/U0/i_accum/i_fabric.i_one_channel.i_accum/Madd_temp_xor<5>  (
    .CI(\BU2/U0/i_accum/i_fabric.i_one_channel.i_accum/Madd_temp_cy [4]),
    .LI(\BU2/U0/i_accum/i_fabric.i_one_channel.i_accum/Madd_temp_lut [5]),
    .O(\BU2/U0/i_accum/acc_phase_b [5])
  );
  MUXCY   \BU2/U0/i_accum/i_fabric.i_one_channel.i_accum/Madd_temp_cy<5>  (
    .CI(\BU2/U0/i_accum/i_fabric.i_one_channel.i_accum/Madd_temp_cy [4]),
    .DI(\BU2/U0/acc_phase [5]),
    .S(\BU2/U0/i_accum/i_fabric.i_one_channel.i_accum/Madd_temp_lut [5]),
    .O(\BU2/U0/i_accum/i_fabric.i_one_channel.i_accum/Madd_temp_cy [5])
  );
  LUT2 #(
    .INIT ( 4'h6 ))
  \BU2/U0/i_accum/i_fabric.i_one_channel.i_accum/Madd_temp_lut<5>  (
    .I0(\BU2/U0/acc_phase [5]),
    .I1(\BU2/U0/i_accum/phase_inc[0] ),
    .O(\BU2/U0/i_accum/i_fabric.i_one_channel.i_accum/Madd_temp_lut [5])
  );
  XORCY   \BU2/U0/i_accum/i_fabric.i_one_channel.i_accum/Madd_temp_xor<4>  (
    .CI(\BU2/U0/i_accum/i_fabric.i_one_channel.i_accum/Madd_temp_cy [3]),
    .LI(\BU2/U0/i_accum/i_fabric.i_one_channel.i_accum/Madd_temp_lut [4]),
    .O(\BU2/U0/i_accum/acc_phase_b [4])
  );
  MUXCY   \BU2/U0/i_accum/i_fabric.i_one_channel.i_accum/Madd_temp_cy<4>  (
    .CI(\BU2/U0/i_accum/i_fabric.i_one_channel.i_accum/Madd_temp_cy [3]),
    .DI(\BU2/U0/acc_phase [4]),
    .S(\BU2/U0/i_accum/i_fabric.i_one_channel.i_accum/Madd_temp_lut [4]),
    .O(\BU2/U0/i_accum/i_fabric.i_one_channel.i_accum/Madd_temp_cy [4])
  );
  LUT2 #(
    .INIT ( 4'h6 ))
  \BU2/U0/i_accum/i_fabric.i_one_channel.i_accum/Madd_temp_lut<4>  (
    .I0(\BU2/U0/acc_phase [4]),
    .I1(\BU2/U0/i_accum/phase_inc[0] ),
    .O(\BU2/U0/i_accum/i_fabric.i_one_channel.i_accum/Madd_temp_lut [4])
  );
  XORCY   \BU2/U0/i_accum/i_fabric.i_one_channel.i_accum/Madd_temp_xor<3>  (
    .CI(\BU2/U0/i_accum/i_fabric.i_one_channel.i_accum/Madd_temp_cy [2]),
    .LI(\BU2/U0/i_accum/i_fabric.i_one_channel.i_accum/Madd_temp_lut [3]),
    .O(\BU2/U0/i_accum/acc_phase_b [3])
  );
  MUXCY   \BU2/U0/i_accum/i_fabric.i_one_channel.i_accum/Madd_temp_cy<3>  (
    .CI(\BU2/U0/i_accum/i_fabric.i_one_channel.i_accum/Madd_temp_cy [2]),
    .DI(\BU2/U0/acc_phase [3]),
    .S(\BU2/U0/i_accum/i_fabric.i_one_channel.i_accum/Madd_temp_lut [3]),
    .O(\BU2/U0/i_accum/i_fabric.i_one_channel.i_accum/Madd_temp_cy [3])
  );
  LUT2 #(
    .INIT ( 4'h6 ))
  \BU2/U0/i_accum/i_fabric.i_one_channel.i_accum/Madd_temp_lut<3>  (
    .I0(\BU2/U0/acc_phase [3]),
    .I1(\BU2/U0/i_accum/phase_inc[0] ),
    .O(\BU2/U0/i_accum/i_fabric.i_one_channel.i_accum/Madd_temp_lut [3])
  );
  XORCY   \BU2/U0/i_accum/i_fabric.i_one_channel.i_accum/Madd_temp_xor<2>  (
    .CI(\BU2/U0/i_accum/i_fabric.i_one_channel.i_accum/Madd_temp_cy [1]),
    .LI(\BU2/U0/i_accum/i_fabric.i_one_channel.i_accum/Madd_temp_lut [2]),
    .O(\BU2/U0/i_accum/acc_phase_b [2])
  );
  MUXCY   \BU2/U0/i_accum/i_fabric.i_one_channel.i_accum/Madd_temp_cy<2>  (
    .CI(\BU2/U0/i_accum/i_fabric.i_one_channel.i_accum/Madd_temp_cy [1]),
    .DI(\BU2/U0/acc_phase [2]),
    .S(\BU2/U0/i_accum/i_fabric.i_one_channel.i_accum/Madd_temp_lut [2]),
    .O(\BU2/U0/i_accum/i_fabric.i_one_channel.i_accum/Madd_temp_cy [2])
  );
  LUT2 #(
    .INIT ( 4'h6 ))
  \BU2/U0/i_accum/i_fabric.i_one_channel.i_accum/Madd_temp_lut<2>  (
    .I0(\BU2/U0/acc_phase [2]),
    .I1(\BU2/U0/i_accum/phase_inc[0] ),
    .O(\BU2/U0/i_accum/i_fabric.i_one_channel.i_accum/Madd_temp_lut [2])
  );
  XORCY   \BU2/U0/i_accum/i_fabric.i_one_channel.i_accum/Madd_temp_xor<1>  (
    .CI(\BU2/U0/i_accum/i_fabric.i_one_channel.i_accum/Madd_temp_cy [0]),
    .LI(\BU2/U0/i_accum/i_fabric.i_one_channel.i_accum/Madd_temp_lut [1]),
    .O(\BU2/U0/i_accum/acc_phase_b [1])
  );
  MUXCY   \BU2/U0/i_accum/i_fabric.i_one_channel.i_accum/Madd_temp_cy<1>  (
    .CI(\BU2/U0/i_accum/i_fabric.i_one_channel.i_accum/Madd_temp_cy [0]),
    .DI(\BU2/U0/acc_phase [1]),
    .S(\BU2/U0/i_accum/i_fabric.i_one_channel.i_accum/Madd_temp_lut [1]),
    .O(\BU2/U0/i_accum/i_fabric.i_one_channel.i_accum/Madd_temp_cy [1])
  );
  LUT2 #(
    .INIT ( 4'h6 ))
  \BU2/U0/i_accum/i_fabric.i_one_channel.i_accum/Madd_temp_lut<1>  (
    .I0(\BU2/U0/acc_phase [1]),
    .I1(\BU2/U0/i_accum/phase_inc[10] ),
    .O(\BU2/U0/i_accum/i_fabric.i_one_channel.i_accum/Madd_temp_lut [1])
  );
  MUXCY   \BU2/U0/i_accum/i_fabric.i_one_channel.i_accum/Madd_temp_cy<0>  (
    .CI(\BU2/channel [0]),
    .DI(\BU2/U0/acc_phase [0]),
    .S(\BU2/U0/i_accum/acc_phase_b [0]),
    .O(\BU2/U0/i_accum/i_fabric.i_one_channel.i_accum/Madd_temp_cy [0])
  );
  LUT2 #(
    .INIT ( 4'h6 ))
  \BU2/U0/i_accum/i_fabric.i_one_channel.i_accum/Madd_temp_lut<0>  (
    .I0(\BU2/U0/acc_phase [0]),
    .I1(\BU2/U0/i_accum/phase_inc[0] ),
    .O(\BU2/U0/i_accum/acc_phase_b [0])
  );
  FDSE #(
    .INIT ( 1'b1 ))
  \BU2/U0/mutant_x_op_2  (
    .C(clk),
    .CE(\BU2/U0/mutant_x_op_not0001 ),
    .D(\BU2/Result [2]),
    .S(sclr),
    .Q(\BU2/U0/mutant_x_op [2])
  );
  FDSE #(
    .INIT ( 1'b1 ))
  \BU2/U0/mutant_x_op_1  (
    .C(clk),
    .CE(\BU2/U0/mutant_x_op_not0001 ),
    .D(\BU2/Result [1]),
    .S(sclr),
    .Q(\BU2/U0/mutant_x_op [1])
  );
  FDSE #(
    .INIT ( 1'b1 ))
  \BU2/U0/mutant_x_op_0  (
    .C(clk),
    .CE(\BU2/U0/mutant_x_op_not0001 ),
    .D(\BU2/Result [0]),
    .S(sclr),
    .Q(\BU2/U0/mutant_x_op [0])
  );
  MULT18X18   \BU2/U0/i_comp_eff.i_eff/i_legacy.i_sin_adj/Mmult_result  (
    .A({\BU2/U0/i_comp_eff.i_eff/i_legacy.i_sin_adj/A_2 [10], \BU2/U0/i_comp_eff.i_eff/i_legacy.i_sin_adj/A_2 [10], 
\BU2/U0/i_comp_eff.i_eff/i_legacy.i_sin_adj/A_2 [10], \BU2/U0/i_comp_eff.i_eff/i_legacy.i_sin_adj/A_2 [10], 
\BU2/U0/i_comp_eff.i_eff/i_legacy.i_sin_adj/A_2 [10], \BU2/U0/i_comp_eff.i_eff/i_legacy.i_sin_adj/A_2 [10], 
\BU2/U0/i_comp_eff.i_eff/i_legacy.i_sin_adj/A_2 [10], \BU2/U0/i_comp_eff.i_eff/i_legacy.i_sin_adj/A_2 [10], 
\BU2/U0/i_comp_eff.i_eff/i_legacy.i_sin_adj/A_2 [9], \BU2/U0/i_comp_eff.i_eff/i_legacy.i_sin_adj/A_2 [8], 
\BU2/U0/i_comp_eff.i_eff/i_legacy.i_sin_adj/A_2 [7], \BU2/U0/i_comp_eff.i_eff/i_legacy.i_sin_adj/A_2 [6], 
\BU2/U0/i_comp_eff.i_eff/i_legacy.i_sin_adj/A_2 [5], \BU2/U0/i_comp_eff.i_eff/i_legacy.i_sin_adj/A_2 [4], 
\BU2/U0/i_comp_eff.i_eff/i_legacy.i_sin_adj/A_2 [3], \BU2/U0/i_comp_eff.i_eff/i_legacy.i_sin_adj/A_2 [2], 
\BU2/U0/i_comp_eff.i_eff/i_legacy.i_sin_adj/A_2 [1], \BU2/U0/i_comp_eff.i_eff/i_legacy.i_sin_adj/A_2 [0]}),
    .B({\BU2/U0/i_comp_eff.i_eff/i_legacy.i_sin_adj/B_2 [9], \BU2/U0/i_comp_eff.i_eff/i_legacy.i_sin_adj/B_2 [9], 
\BU2/U0/i_comp_eff.i_eff/i_legacy.i_sin_adj/B_2 [9], \BU2/U0/i_comp_eff.i_eff/i_legacy.i_sin_adj/B_2 [9], 
\BU2/U0/i_comp_eff.i_eff/i_legacy.i_sin_adj/B_2 [9], \BU2/U0/i_comp_eff.i_eff/i_legacy.i_sin_adj/B_2 [9], 
\BU2/U0/i_comp_eff.i_eff/i_legacy.i_sin_adj/B_2 [9], \BU2/U0/i_comp_eff.i_eff/i_legacy.i_sin_adj/B_2 [9], 
\BU2/U0/i_comp_eff.i_eff/i_legacy.i_sin_adj/B_2 [9], \BU2/U0/i_comp_eff.i_eff/i_legacy.i_sin_adj/B_2 [8], 
\BU2/U0/i_comp_eff.i_eff/i_legacy.i_sin_adj/B_2 [7], \BU2/U0/i_comp_eff.i_eff/i_legacy.i_sin_adj/B_2 [6], 
\BU2/U0/i_comp_eff.i_eff/i_legacy.i_sin_adj/B_2 [5], \BU2/U0/i_comp_eff.i_eff/i_legacy.i_sin_adj/B_2 [4], 
\BU2/U0/i_comp_eff.i_eff/i_legacy.i_sin_adj/B_2 [3], \BU2/U0/i_comp_eff.i_eff/i_legacy.i_sin_adj/B_2 [2], 
\BU2/U0/i_comp_eff.i_eff/i_legacy.i_sin_adj/B_2 [1], \BU2/U0/i_comp_eff.i_eff/i_legacy.i_sin_adj/B_2 [0]}),
    .P({\NLW_BU2/U0/i_comp_eff.i_eff/i_legacy.i_sin_adj/Mmult_result_P<35>_UNCONNECTED , 
\NLW_BU2/U0/i_comp_eff.i_eff/i_legacy.i_sin_adj/Mmult_result_P<34>_UNCONNECTED , 
\NLW_BU2/U0/i_comp_eff.i_eff/i_legacy.i_sin_adj/Mmult_result_P<33>_UNCONNECTED , 
\NLW_BU2/U0/i_comp_eff.i_eff/i_legacy.i_sin_adj/Mmult_result_P<32>_UNCONNECTED , 
\NLW_BU2/U0/i_comp_eff.i_eff/i_legacy.i_sin_adj/Mmult_result_P<31>_UNCONNECTED , 
\NLW_BU2/U0/i_comp_eff.i_eff/i_legacy.i_sin_adj/Mmult_result_P<30>_UNCONNECTED , 
\NLW_BU2/U0/i_comp_eff.i_eff/i_legacy.i_sin_adj/Mmult_result_P<29>_UNCONNECTED , 
\NLW_BU2/U0/i_comp_eff.i_eff/i_legacy.i_sin_adj/Mmult_result_P<28>_UNCONNECTED , 
\NLW_BU2/U0/i_comp_eff.i_eff/i_legacy.i_sin_adj/Mmult_result_P<27>_UNCONNECTED , 
\NLW_BU2/U0/i_comp_eff.i_eff/i_legacy.i_sin_adj/Mmult_result_P<26>_UNCONNECTED , 
\NLW_BU2/U0/i_comp_eff.i_eff/i_legacy.i_sin_adj/Mmult_result_P<25>_UNCONNECTED , 
\NLW_BU2/U0/i_comp_eff.i_eff/i_legacy.i_sin_adj/Mmult_result_P<24>_UNCONNECTED , 
\NLW_BU2/U0/i_comp_eff.i_eff/i_legacy.i_sin_adj/Mmult_result_P<23>_UNCONNECTED , 
\NLW_BU2/U0/i_comp_eff.i_eff/i_legacy.i_sin_adj/Mmult_result_P<22>_UNCONNECTED , 
\NLW_BU2/U0/i_comp_eff.i_eff/i_legacy.i_sin_adj/Mmult_result_P<21>_UNCONNECTED , \BU2/U0/i_comp_eff.i_eff/i_legacy.i_sin_adj/result [20], 
\BU2/U0/i_comp_eff.i_eff/i_legacy.i_sin_adj/result [19], \BU2/U0/i_comp_eff.i_eff/i_legacy.i_sin_adj/result [18], 
\BU2/U0/i_comp_eff.i_eff/i_legacy.i_sin_adj/result [17], \BU2/U0/i_comp_eff.i_eff/i_legacy.i_sin_adj/result [16], 
\BU2/U0/i_comp_eff.i_eff/i_legacy.i_sin_adj/result [15], \BU2/U0/i_comp_eff.i_eff/i_legacy.i_sin_adj/result [14], 
\BU2/U0/i_comp_eff.i_eff/i_legacy.i_sin_adj/result [13], \BU2/U0/i_comp_eff.i_eff/i_legacy.i_sin_adj/result [12], 
\BU2/U0/i_comp_eff.i_eff/i_legacy.i_sin_adj/result [11], \BU2/U0/i_comp_eff.i_eff/i_legacy.i_sin_adj/result [10], 
\BU2/U0/i_comp_eff.i_eff/i_legacy.i_sin_adj/result [9], \BU2/U0/i_comp_eff.i_eff/i_legacy.i_sin_adj/result [8], 
\BU2/U0/i_comp_eff.i_eff/i_legacy.i_sin_adj/result [7], \BU2/U0/i_comp_eff.i_eff/i_legacy.i_sin_adj/result [6], 
\BU2/U0/i_comp_eff.i_eff/i_legacy.i_sin_adj/result [5], \BU2/U0/i_comp_eff.i_eff/i_legacy.i_sin_adj/result [4], 
\BU2/U0/i_comp_eff.i_eff/i_legacy.i_sin_adj/result [3], \BU2/U0/i_comp_eff.i_eff/i_legacy.i_sin_adj/result [2], 
\BU2/U0/i_comp_eff.i_eff/i_legacy.i_sin_adj/result [1], \BU2/U0/i_comp_eff.i_eff/i_legacy.i_sin_adj/result [0]})
  );
  VCC   \BU2/XST_VCC  (
    .P(\BU2/N1 )
  );
  GND   \BU2/XST_GND  (
    .G(\BU2/channel [0])
  );
  VCC   \BU2/U0/i_accum/i_fabric.i_common.i_ph_inc_ctrl2dsp_speedup/XST_VCC  (
    .P(\BU2/U0/i_accum/phase_inc[10] )
  );
  GND   \BU2/U0/i_accum/i_fabric.i_common.i_ph_inc_ctrl2dsp_speedup/XST_GND  (
    .G(\BU2/U0/i_accum/phase_inc[0] )
  );
  FD #(
    .INIT ( 1'b0 ))
  \BU2/U0/i_comp_eff.i_eff/i_legacy.i_shift_sin_pipe/pipe_2_28  (
    .C(clk),
    .D(\BU2/U0/i_comp_eff.i_eff/i_legacy.i_shift_sin_pipe/first_q [28]),
    .Q(\BU2/U0/i_comp_eff.i_eff/shifted_sin_x [28])
  );
  FD #(
    .INIT ( 1'b0 ))
  \BU2/U0/i_comp_eff.i_eff/i_legacy.i_shift_sin_pipe/pipe_2_27  (
    .C(clk),
    .D(\BU2/U0/i_comp_eff.i_eff/i_legacy.i_shift_sin_pipe/first_q [27]),
    .Q(\BU2/U0/i_comp_eff.i_eff/shifted_sin_x [27])
  );
  FD #(
    .INIT ( 1'b0 ))
  \BU2/U0/i_comp_eff.i_eff/i_legacy.i_shift_sin_pipe/pipe_2_26  (
    .C(clk),
    .D(\BU2/U0/i_comp_eff.i_eff/i_legacy.i_shift_sin_pipe/first_q [26]),
    .Q(\BU2/U0/i_comp_eff.i_eff/shifted_sin_x [26])
  );
  FD #(
    .INIT ( 1'b0 ))
  \BU2/U0/i_comp_eff.i_eff/i_legacy.i_shift_sin_pipe/pipe_2_25  (
    .C(clk),
    .D(\BU2/U0/i_comp_eff.i_eff/i_legacy.i_shift_sin_pipe/first_q [25]),
    .Q(\BU2/U0/i_comp_eff.i_eff/shifted_sin_x [25])
  );
  FD #(
    .INIT ( 1'b0 ))
  \BU2/U0/i_comp_eff.i_eff/i_legacy.i_shift_sin_pipe/pipe_2_24  (
    .C(clk),
    .D(\BU2/U0/i_comp_eff.i_eff/i_legacy.i_shift_sin_pipe/first_q [24]),
    .Q(\BU2/U0/i_comp_eff.i_eff/shifted_sin_x [24])
  );
  FD #(
    .INIT ( 1'b0 ))
  \BU2/U0/i_comp_eff.i_eff/i_legacy.i_shift_sin_pipe/pipe_2_23  (
    .C(clk),
    .D(\BU2/U0/i_comp_eff.i_eff/i_legacy.i_shift_sin_pipe/first_q [23]),
    .Q(\BU2/U0/i_comp_eff.i_eff/shifted_sin_x [23])
  );
  FD #(
    .INIT ( 1'b0 ))
  \BU2/U0/i_comp_eff.i_eff/i_legacy.i_shift_sin_pipe/pipe_2_22  (
    .C(clk),
    .D(\BU2/U0/i_comp_eff.i_eff/i_legacy.i_shift_sin_pipe/first_q [22]),
    .Q(\BU2/U0/i_comp_eff.i_eff/shifted_sin_x [22])
  );
  FD #(
    .INIT ( 1'b0 ))
  \BU2/U0/i_comp_eff.i_eff/i_legacy.i_shift_sin_pipe/pipe_2_21  (
    .C(clk),
    .D(\BU2/U0/i_comp_eff.i_eff/i_legacy.i_shift_sin_pipe/first_q [21]),
    .Q(\BU2/U0/i_comp_eff.i_eff/shifted_sin_x [21])
  );
  FD #(
    .INIT ( 1'b0 ))
  \BU2/U0/i_comp_eff.i_eff/i_legacy.i_shift_sin_pipe/pipe_2_20  (
    .C(clk),
    .D(\BU2/U0/i_comp_eff.i_eff/i_legacy.i_shift_sin_pipe/first_q [20]),
    .Q(\BU2/U0/i_comp_eff.i_eff/shifted_sin_x [20])
  );
  FD #(
    .INIT ( 1'b0 ))
  \BU2/U0/i_comp_eff.i_eff/i_legacy.i_shift_sin_pipe/pipe_2_19  (
    .C(clk),
    .D(\BU2/U0/i_comp_eff.i_eff/i_legacy.i_shift_sin_pipe/first_q [19]),
    .Q(\BU2/U0/i_comp_eff.i_eff/shifted_sin_x [19])
  );
  FD #(
    .INIT ( 1'b0 ))
  \BU2/U0/i_comp_eff.i_eff/i_legacy.i_shift_sin_pipe/pipe_2_18  (
    .C(clk),
    .D(\BU2/U0/i_comp_eff.i_eff/i_legacy.i_shift_sin_pipe/first_q [18]),
    .Q(\BU2/U0/i_comp_eff.i_eff/shifted_sin_x [18])
  );
  FD #(
    .INIT ( 1'b0 ))
  \BU2/U0/i_comp_eff.i_eff/i_legacy.i_shift_sin_pipe/pipe_2_17  (
    .C(clk),
    .D(\BU2/U0/i_comp_eff.i_eff/i_legacy.i_shift_sin_pipe/first_q [17]),
    .Q(\BU2/U0/i_comp_eff.i_eff/shifted_sin_x [17])
  );
  FD #(
    .INIT ( 1'b0 ))
  \BU2/U0/i_comp_eff.i_eff/i_legacy.i_shift_sin_pipe/pipe_2_16  (
    .C(clk),
    .D(\BU2/U0/i_comp_eff.i_eff/i_legacy.i_shift_sin_pipe/first_q [16]),
    .Q(\BU2/U0/i_comp_eff.i_eff/shifted_sin_x [16])
  );
  FD #(
    .INIT ( 1'b0 ))
  \BU2/U0/i_comp_eff.i_eff/i_legacy.i_shift_sin_pipe/pipe_2_15  (
    .C(clk),
    .D(\BU2/U0/i_comp_eff.i_eff/i_legacy.i_shift_sin_pipe/first_q [15]),
    .Q(\BU2/U0/i_comp_eff.i_eff/shifted_sin_x [15])
  );
  FD #(
    .INIT ( 1'b0 ))
  \BU2/U0/i_comp_eff.i_eff/i_legacy.i_shift_sin_pipe/pipe_2_14  (
    .C(clk),
    .D(\BU2/U0/i_comp_eff.i_eff/i_legacy.i_shift_sin_pipe/first_q [14]),
    .Q(\BU2/U0/i_comp_eff.i_eff/shifted_sin_x [14])
  );
  FD #(
    .INIT ( 1'b0 ))
  \BU2/U0/i_comp_eff.i_eff/i_legacy.i_shift_sin_pipe/pipe_2_13  (
    .C(clk),
    .D(\BU2/U0/i_comp_eff.i_eff/i_legacy.i_shift_sin_pipe/first_q [13]),
    .Q(\BU2/U0/i_comp_eff.i_eff/shifted_sin_x [13])
  );
  FD #(
    .INIT ( 1'b0 ))
  \BU2/U0/i_comp_eff.i_eff/i_legacy.i_shift_sin_pipe/pipe_2_12  (
    .C(clk),
    .D(\BU2/U0/i_comp_eff.i_eff/i_legacy.i_shift_sin_pipe/first_q [12]),
    .Q(\BU2/U0/i_comp_eff.i_eff/shifted_sin_x [12])
  );
  FD #(
    .INIT ( 1'b0 ))
  \BU2/U0/i_comp_eff.i_eff/i_legacy.i_shift_sin_pipe/pipe_2_11  (
    .C(clk),
    .D(\BU2/U0/i_comp_eff.i_eff/i_legacy.i_shift_sin_pipe/first_q [11]),
    .Q(\BU2/U0/i_comp_eff.i_eff/shifted_sin_x [11])
  );
  FD #(
    .INIT ( 1'b0 ))
  \BU2/U0/i_comp_eff.i_eff/i_legacy.i_shift_sin_pipe/pipe_2_10  (
    .C(clk),
    .D(\BU2/U0/i_comp_eff.i_eff/i_legacy.i_shift_sin_pipe/first_q [10]),
    .Q(\BU2/U0/i_comp_eff.i_eff/shifted_sin_x [10])
  );
  FD #(
    .INIT ( 1'b0 ))
  \BU2/U0/i_comp_eff.i_eff/i_legacy.i_shift_sin_pipe/pipe_2_9  (
    .C(clk),
    .D(\BU2/U0/i_comp_eff.i_eff/i_legacy.i_shift_sin_pipe/first_q [9]),
    .Q(\BU2/U0/i_comp_eff.i_eff/shifted_sin_x [9])
  );
  FD #(
    .INIT ( 1'b0 ))
  \BU2/U0/i_comp_eff.i_eff/i_legacy.i_shift_sin_pipe/pipe_2_8  (
    .C(clk),
    .D(\BU2/U0/i_comp_eff.i_eff/i_legacy.i_shift_sin_pipe/first_q [8]),
    .Q(\BU2/U0/i_comp_eff.i_eff/shifted_sin_x [8])
  );
  FD #(
    .INIT ( 1'b0 ))
  \BU2/U0/i_comp_eff.i_eff/i_legacy.i_shift_sin_pipe/pipe_2_7  (
    .C(clk),
    .D(\BU2/U0/i_comp_eff.i_eff/i_legacy.i_shift_sin_pipe/first_q [7]),
    .Q(\BU2/U0/i_comp_eff.i_eff/shifted_sin_x [7])
  );
  FD #(
    .INIT ( 1'b0 ))
  \BU2/U0/i_comp_eff.i_eff/i_legacy.i_shift_sin_pipe/pipe_2_6  (
    .C(clk),
    .D(\BU2/U0/i_comp_eff.i_eff/i_legacy.i_shift_sin_pipe/first_q [6]),
    .Q(\BU2/U0/i_comp_eff.i_eff/shifted_sin_x [6])
  );
  FD #(
    .INIT ( 1'b0 ))
  \BU2/U0/i_comp_eff.i_eff/i_legacy.i_shift_sin_pipe/pipe_2_5  (
    .C(clk),
    .D(\BU2/U0/i_comp_eff.i_eff/i_legacy.i_shift_sin_pipe/first_q [5]),
    .Q(\BU2/U0/i_comp_eff.i_eff/shifted_sin_x [5])
  );
  FD #(
    .INIT ( 1'b0 ))
  \BU2/U0/i_comp_eff.i_eff/i_legacy.i_shift_sin_pipe/pipe_2_4  (
    .C(clk),
    .D(\BU2/U0/i_comp_eff.i_eff/i_legacy.i_shift_sin_pipe/first_q [4]),
    .Q(\BU2/U0/i_comp_eff.i_eff/shifted_sin_x [4])
  );
  FD #(
    .INIT ( 1'b0 ))
  \BU2/U0/i_comp_eff.i_eff/i_legacy.i_shift_sin_pipe/pipe_2_3  (
    .C(clk),
    .D(\BU2/U0/i_comp_eff.i_eff/i_legacy.i_shift_sin_pipe/first_q [3]),
    .Q(\BU2/U0/i_comp_eff.i_eff/shifted_sin_x [3])
  );
  FD #(
    .INIT ( 1'b0 ))
  \BU2/U0/i_comp_eff.i_eff/i_legacy.i_shift_sin_pipe/pipe_2_2  (
    .C(clk),
    .D(\BU2/U0/i_comp_eff.i_eff/i_legacy.i_shift_sin_pipe/first_q [2]),
    .Q(\BU2/U0/i_comp_eff.i_eff/shifted_sin_x [2])
  );
  FD #(
    .INIT ( 1'b0 ))
  \BU2/U0/i_comp_eff.i_eff/i_legacy.i_shift_sin_pipe/pipe_2_1  (
    .C(clk),
    .D(\BU2/U0/i_comp_eff.i_eff/i_legacy.i_shift_sin_pipe/first_q [1]),
    .Q(\BU2/U0/i_comp_eff.i_eff/shifted_sin_x [1])
  );
  FD #(
    .INIT ( 1'b0 ))
  \BU2/U0/i_comp_eff.i_eff/i_legacy.i_shift_sin_pipe/pipe_2_0  (
    .C(clk),
    .D(\BU2/U0/i_comp_eff.i_eff/i_legacy.i_shift_sin_pipe/first_q [0]),
    .Q(\BU2/U0/i_comp_eff.i_eff/shifted_sin_x [0])
  );
  FD #(
    .INIT ( 1'b0 ))
  \BU2/U0/i_comp_eff.i_eff/i_legacy.i_shift_sin_pipe/first_q_29  (
    .C(clk),
    .D(\BU2/channel [0]),
    .Q(\BU2/U0/i_comp_eff.i_eff/i_legacy.i_shift_sin_pipe/first_q [29])
  );
  FD #(
    .INIT ( 1'b0 ))
  \BU2/U0/i_comp_eff.i_eff/i_legacy.i_shift_sin_pipe/first_q_28  (
    .C(clk),
    .D(\BU2/U0/i_rom/sin_RAM_op [17]),
    .Q(\BU2/U0/i_comp_eff.i_eff/i_legacy.i_shift_sin_pipe/first_q [28])
  );
  FD #(
    .INIT ( 1'b0 ))
  \BU2/U0/i_comp_eff.i_eff/i_legacy.i_shift_sin_pipe/first_q_27  (
    .C(clk),
    .D(\BU2/U0/i_rom/sin_RAM_op [16]),
    .Q(\BU2/U0/i_comp_eff.i_eff/i_legacy.i_shift_sin_pipe/first_q [27])
  );
  FD #(
    .INIT ( 1'b0 ))
  \BU2/U0/i_comp_eff.i_eff/i_legacy.i_shift_sin_pipe/first_q_26  (
    .C(clk),
    .D(\BU2/U0/i_rom/sin_RAM_op [15]),
    .Q(\BU2/U0/i_comp_eff.i_eff/i_legacy.i_shift_sin_pipe/first_q [26])
  );
  FD #(
    .INIT ( 1'b0 ))
  \BU2/U0/i_comp_eff.i_eff/i_legacy.i_shift_sin_pipe/first_q_25  (
    .C(clk),
    .D(\BU2/U0/i_rom/sin_RAM_op [14]),
    .Q(\BU2/U0/i_comp_eff.i_eff/i_legacy.i_shift_sin_pipe/first_q [25])
  );
  FD #(
    .INIT ( 1'b0 ))
  \BU2/U0/i_comp_eff.i_eff/i_legacy.i_shift_sin_pipe/first_q_24  (
    .C(clk),
    .D(\BU2/U0/i_rom/sin_RAM_op [13]),
    .Q(\BU2/U0/i_comp_eff.i_eff/i_legacy.i_shift_sin_pipe/first_q [24])
  );
  FD #(
    .INIT ( 1'b0 ))
  \BU2/U0/i_comp_eff.i_eff/i_legacy.i_shift_sin_pipe/first_q_23  (
    .C(clk),
    .D(\BU2/U0/i_rom/sin_RAM_op [12]),
    .Q(\BU2/U0/i_comp_eff.i_eff/i_legacy.i_shift_sin_pipe/first_q [23])
  );
  FD #(
    .INIT ( 1'b0 ))
  \BU2/U0/i_comp_eff.i_eff/i_legacy.i_shift_sin_pipe/first_q_22  (
    .C(clk),
    .D(\BU2/U0/i_rom/sin_RAM_op [11]),
    .Q(\BU2/U0/i_comp_eff.i_eff/i_legacy.i_shift_sin_pipe/first_q [22])
  );
  FD #(
    .INIT ( 1'b0 ))
  \BU2/U0/i_comp_eff.i_eff/i_legacy.i_shift_sin_pipe/first_q_21  (
    .C(clk),
    .D(\BU2/U0/i_rom/sin_RAM_op [10]),
    .Q(\BU2/U0/i_comp_eff.i_eff/i_legacy.i_shift_sin_pipe/first_q [21])
  );
  FD #(
    .INIT ( 1'b0 ))
  \BU2/U0/i_comp_eff.i_eff/i_legacy.i_shift_sin_pipe/first_q_20  (
    .C(clk),
    .D(\BU2/U0/i_rom/sin_RAM_op [9]),
    .Q(\BU2/U0/i_comp_eff.i_eff/i_legacy.i_shift_sin_pipe/first_q [20])
  );
  FD #(
    .INIT ( 1'b0 ))
  \BU2/U0/i_comp_eff.i_eff/i_legacy.i_shift_sin_pipe/first_q_19  (
    .C(clk),
    .D(\BU2/U0/i_rom/sin_RAM_op [8]),
    .Q(\BU2/U0/i_comp_eff.i_eff/i_legacy.i_shift_sin_pipe/first_q [19])
  );
  FD #(
    .INIT ( 1'b0 ))
  \BU2/U0/i_comp_eff.i_eff/i_legacy.i_shift_sin_pipe/first_q_18  (
    .C(clk),
    .D(\BU2/U0/i_rom/sin_RAM_op [7]),
    .Q(\BU2/U0/i_comp_eff.i_eff/i_legacy.i_shift_sin_pipe/first_q [18])
  );
  FD #(
    .INIT ( 1'b0 ))
  \BU2/U0/i_comp_eff.i_eff/i_legacy.i_shift_sin_pipe/first_q_17  (
    .C(clk),
    .D(\BU2/U0/i_rom/sin_RAM_op [6]),
    .Q(\BU2/U0/i_comp_eff.i_eff/i_legacy.i_shift_sin_pipe/first_q [17])
  );
  FD #(
    .INIT ( 1'b0 ))
  \BU2/U0/i_comp_eff.i_eff/i_legacy.i_shift_sin_pipe/first_q_16  (
    .C(clk),
    .D(\BU2/U0/i_rom/sin_RAM_op [5]),
    .Q(\BU2/U0/i_comp_eff.i_eff/i_legacy.i_shift_sin_pipe/first_q [16])
  );
  FD #(
    .INIT ( 1'b0 ))
  \BU2/U0/i_comp_eff.i_eff/i_legacy.i_shift_sin_pipe/first_q_15  (
    .C(clk),
    .D(\BU2/U0/i_rom/sin_RAM_op [4]),
    .Q(\BU2/U0/i_comp_eff.i_eff/i_legacy.i_shift_sin_pipe/first_q [15])
  );
  FD #(
    .INIT ( 1'b0 ))
  \BU2/U0/i_comp_eff.i_eff/i_legacy.i_shift_sin_pipe/first_q_14  (
    .C(clk),
    .D(\BU2/U0/i_rom/sin_RAM_op [3]),
    .Q(\BU2/U0/i_comp_eff.i_eff/i_legacy.i_shift_sin_pipe/first_q [14])
  );
  FD #(
    .INIT ( 1'b0 ))
  \BU2/U0/i_comp_eff.i_eff/i_legacy.i_shift_sin_pipe/first_q_13  (
    .C(clk),
    .D(\BU2/U0/i_rom/sin_RAM_op [2]),
    .Q(\BU2/U0/i_comp_eff.i_eff/i_legacy.i_shift_sin_pipe/first_q [13])
  );
  FD #(
    .INIT ( 1'b0 ))
  \BU2/U0/i_comp_eff.i_eff/i_legacy.i_shift_sin_pipe/first_q_12  (
    .C(clk),
    .D(\BU2/U0/i_rom/sin_RAM_op [1]),
    .Q(\BU2/U0/i_comp_eff.i_eff/i_legacy.i_shift_sin_pipe/first_q [12])
  );
  FD #(
    .INIT ( 1'b0 ))
  \BU2/U0/i_comp_eff.i_eff/i_legacy.i_shift_sin_pipe/first_q_11  (
    .C(clk),
    .D(\BU2/U0/i_rom/sin_RAM_op [0]),
    .Q(\BU2/U0/i_comp_eff.i_eff/i_legacy.i_shift_sin_pipe/first_q [11])
  );
  FD #(
    .INIT ( 1'b0 ))
  \BU2/U0/i_comp_eff.i_eff/i_legacy.i_shift_sin_pipe/first_q_10  (
    .C(clk),
    .D(\BU2/channel [0]),
    .Q(\BU2/U0/i_comp_eff.i_eff/i_legacy.i_shift_sin_pipe/first_q [10])
  );
  FD #(
    .INIT ( 1'b0 ))
  \BU2/U0/i_comp_eff.i_eff/i_legacy.i_shift_sin_pipe/first_q_9  (
    .C(clk),
    .D(\BU2/channel [0]),
    .Q(\BU2/U0/i_comp_eff.i_eff/i_legacy.i_shift_sin_pipe/first_q [9])
  );
  FD #(
    .INIT ( 1'b0 ))
  \BU2/U0/i_comp_eff.i_eff/i_legacy.i_shift_sin_pipe/first_q_8  (
    .C(clk),
    .D(\BU2/N1 ),
    .Q(\BU2/U0/i_comp_eff.i_eff/i_legacy.i_shift_sin_pipe/first_q [8])
  );
  FD #(
    .INIT ( 1'b0 ))
  \BU2/U0/i_comp_eff.i_eff/i_legacy.i_shift_sin_pipe/first_q_7  (
    .C(clk),
    .D(\BU2/channel [0]),
    .Q(\BU2/U0/i_comp_eff.i_eff/i_legacy.i_shift_sin_pipe/first_q [7])
  );
  FD #(
    .INIT ( 1'b0 ))
  \BU2/U0/i_comp_eff.i_eff/i_legacy.i_shift_sin_pipe/first_q_6  (
    .C(clk),
    .D(\BU2/channel [0]),
    .Q(\BU2/U0/i_comp_eff.i_eff/i_legacy.i_shift_sin_pipe/first_q [6])
  );
  FD #(
    .INIT ( 1'b0 ))
  \BU2/U0/i_comp_eff.i_eff/i_legacy.i_shift_sin_pipe/first_q_5  (
    .C(clk),
    .D(\BU2/channel [0]),
    .Q(\BU2/U0/i_comp_eff.i_eff/i_legacy.i_shift_sin_pipe/first_q [5])
  );
  FD #(
    .INIT ( 1'b0 ))
  \BU2/U0/i_comp_eff.i_eff/i_legacy.i_shift_sin_pipe/first_q_4  (
    .C(clk),
    .D(\BU2/channel [0]),
    .Q(\BU2/U0/i_comp_eff.i_eff/i_legacy.i_shift_sin_pipe/first_q [4])
  );
  FD #(
    .INIT ( 1'b0 ))
  \BU2/U0/i_comp_eff.i_eff/i_legacy.i_shift_sin_pipe/first_q_3  (
    .C(clk),
    .D(\BU2/channel [0]),
    .Q(\BU2/U0/i_comp_eff.i_eff/i_legacy.i_shift_sin_pipe/first_q [3])
  );
  FD #(
    .INIT ( 1'b0 ))
  \BU2/U0/i_comp_eff.i_eff/i_legacy.i_shift_sin_pipe/first_q_2  (
    .C(clk),
    .D(\BU2/channel [0]),
    .Q(\BU2/U0/i_comp_eff.i_eff/i_legacy.i_shift_sin_pipe/first_q [2])
  );
  FD #(
    .INIT ( 1'b0 ))
  \BU2/U0/i_comp_eff.i_eff/i_legacy.i_shift_sin_pipe/first_q_1  (
    .C(clk),
    .D(\BU2/channel [0]),
    .Q(\BU2/U0/i_comp_eff.i_eff/i_legacy.i_shift_sin_pipe/first_q [1])
  );
  FD #(
    .INIT ( 1'b0 ))
  \BU2/U0/i_comp_eff.i_eff/i_legacy.i_shift_sin_pipe/first_q_0  (
    .C(clk),
    .D(\BU2/channel [0]),
    .Q(\BU2/U0/i_comp_eff.i_eff/i_legacy.i_shift_sin_pipe/first_q [0])
  );
  FDR #(
    .INIT ( 1'b0 ))
  \BU2/U0/i_rdy.i_single_channel.i_non_trivial_lat.i_rdy/opt_has_reg.i_reg/fd/output_1  (
    .C(clk),
    .D(\BU2/U0/pre_rdy ),
    .R(sclr),
    .Q(rdy)
  );
  FD #(
    .INIT ( 1'b0 ))
  \BU2/U0/i_fabric.i_ph_adj_pipe/opt_has_reg.i_reg/fd/output_28  (
    .C(clk),
    .D(\BU2/U0/acc_phase_adj_pre [27]),
    .Q(\BU2/U0/acc_phase_adjusted [27])
  );
  FD #(
    .INIT ( 1'b0 ))
  \BU2/U0/i_fabric.i_ph_adj_pipe/opt_has_reg.i_reg/fd/output_27  (
    .C(clk),
    .D(\BU2/U0/acc_phase [26]),
    .Q(\BU2/U0/acc_phase_adjusted [26])
  );
  FD #(
    .INIT ( 1'b0 ))
  \BU2/U0/i_fabric.i_ph_adj_pipe/opt_has_reg.i_reg/fd/output_26  (
    .C(clk),
    .D(\BU2/U0/acc_phase [25]),
    .Q(\BU2/U0/acc_phase_adjusted [25])
  );
  FD #(
    .INIT ( 1'b0 ))
  \BU2/U0/i_fabric.i_ph_adj_pipe/opt_has_reg.i_reg/fd/output_25  (
    .C(clk),
    .D(\BU2/U0/acc_phase [24]),
    .Q(\BU2/U0/acc_phase_adjusted [24])
  );
  FD #(
    .INIT ( 1'b0 ))
  \BU2/U0/i_fabric.i_ph_adj_pipe/opt_has_reg.i_reg/fd/output_24  (
    .C(clk),
    .D(\BU2/U0/acc_phase [23]),
    .Q(\BU2/U0/acc_phase_adjusted [23])
  );
  FD #(
    .INIT ( 1'b0 ))
  \BU2/U0/i_fabric.i_ph_adj_pipe/opt_has_reg.i_reg/fd/output_23  (
    .C(clk),
    .D(\BU2/U0/acc_phase [22]),
    .Q(\BU2/U0/acc_phase_adjusted [22])
  );
  FD #(
    .INIT ( 1'b0 ))
  \BU2/U0/i_fabric.i_ph_adj_pipe/opt_has_reg.i_reg/fd/output_22  (
    .C(clk),
    .D(\BU2/U0/acc_phase [21]),
    .Q(\BU2/U0/acc_phase_adjusted [21])
  );
  FD #(
    .INIT ( 1'b0 ))
  \BU2/U0/i_fabric.i_ph_adj_pipe/opt_has_reg.i_reg/fd/output_21  (
    .C(clk),
    .D(\BU2/U0/acc_phase [20]),
    .Q(\BU2/U0/acc_phase_adjusted [20])
  );
  FD #(
    .INIT ( 1'b0 ))
  \BU2/U0/i_fabric.i_ph_adj_pipe/opt_has_reg.i_reg/fd/output_20  (
    .C(clk),
    .D(\BU2/U0/acc_phase [19]),
    .Q(\BU2/U0/acc_phase_adjusted [19])
  );
  FD #(
    .INIT ( 1'b0 ))
  \BU2/U0/i_fabric.i_ph_adj_pipe/opt_has_reg.i_reg/fd/output_19  (
    .C(clk),
    .D(\BU2/U0/acc_phase [18]),
    .Q(\BU2/U0/acc_phase_adjusted [18])
  );
  FD #(
    .INIT ( 1'b0 ))
  \BU2/U0/i_fabric.i_ph_adj_pipe/opt_has_reg.i_reg/fd/output_18  (
    .C(clk),
    .D(\BU2/U0/acc_phase [17]),
    .Q(\BU2/U0/acc_phase_adjusted [17])
  );
  FD #(
    .INIT ( 1'b0 ))
  \BU2/U0/i_fabric.i_ph_adj_pipe/opt_has_reg.i_reg/fd/output_17  (
    .C(clk),
    .D(\BU2/U0/acc_phase [16]),
    .Q(\BU2/U0/acc_phase_adjusted [16])
  );
  FD #(
    .INIT ( 1'b0 ))
  \BU2/U0/i_fabric.i_ph_adj_pipe/opt_has_reg.i_reg/fd/output_16  (
    .C(clk),
    .D(\BU2/U0/acc_phase [15]),
    .Q(\BU2/U0/acc_phase_adjusted [15])
  );
  FD #(
    .INIT ( 1'b0 ))
  \BU2/U0/i_fabric.i_ph_adj_pipe/opt_has_reg.i_reg/fd/output_15  (
    .C(clk),
    .D(\BU2/U0/acc_phase [14]),
    .Q(\BU2/U0/acc_phase_adjusted [14])
  );
  FD #(
    .INIT ( 1'b0 ))
  \BU2/U0/i_fabric.i_ph_adj_pipe/opt_has_reg.i_reg/fd/output_14  (
    .C(clk),
    .D(\BU2/U0/acc_phase [13]),
    .Q(\BU2/U0/acc_phase_adjusted [13])
  );
  FD #(
    .INIT ( 1'b0 ))
  \BU2/U0/i_fabric.i_ph_adj_pipe/opt_has_reg.i_reg/fd/output_13  (
    .C(clk),
    .D(\BU2/U0/acc_phase [12]),
    .Q(\BU2/U0/acc_phase_adjusted [12])
  );
  FD #(
    .INIT ( 1'b0 ))
  \BU2/U0/i_fabric.i_ph_adj_pipe/opt_has_reg.i_reg/fd/output_12  (
    .C(clk),
    .D(\BU2/U0/acc_phase [11]),
    .Q(\BU2/U0/acc_phase_adjusted [11])
  );
  FD #(
    .INIT ( 1'b0 ))
  \BU2/U0/i_fabric.i_ph_adj_pipe/opt_has_reg.i_reg/fd/output_11  (
    .C(clk),
    .D(\BU2/U0/acc_phase [10]),
    .Q(\BU2/U0/acc_phase_adjusted [10])
  );
  FD #(
    .INIT ( 1'b0 ))
  \BU2/U0/i_fabric.i_ph_adj_pipe/opt_has_reg.i_reg/fd/output_10  (
    .C(clk),
    .D(\BU2/U0/acc_phase [9]),
    .Q(\BU2/U0/acc_phase_adjusted [9])
  );
  FD #(
    .INIT ( 1'b0 ))
  \BU2/U0/i_fabric.i_ph_adj_pipe/opt_has_reg.i_reg/fd/output_9  (
    .C(clk),
    .D(\BU2/U0/acc_phase [8]),
    .Q(\BU2/U0/acc_phase_adjusted [8])
  );
  FD #(
    .INIT ( 1'b0 ))
  \BU2/U0/i_fabric.i_ph_adj_pipe/opt_has_reg.i_reg/fd/output_8  (
    .C(clk),
    .D(\BU2/U0/acc_phase [7]),
    .Q(\BU2/U0/acc_phase_adjusted [7])
  );
  FD #(
    .INIT ( 1'b0 ))
  \BU2/U0/i_fabric.i_ph_adj_pipe/opt_has_reg.i_reg/fd/output_7  (
    .C(clk),
    .D(\BU2/U0/acc_phase [6]),
    .Q(\BU2/U0/acc_phase_adjusted [6])
  );
  FDR #(
    .INIT ( 1'b0 ))
  \BU2/U0/i_has_sine.i_sin_op/opt_has_reg.i_reg/fd/output_20  (
    .C(clk),
    .D(\BU2/U0/final_sin [46]),
    .R(\BU2/channel [0]),
    .Q(sine_2[19])
  );
  FDR #(
    .INIT ( 1'b0 ))
  \BU2/U0/i_has_sine.i_sin_op/opt_has_reg.i_reg/fd/output_19  (
    .C(clk),
    .D(\BU2/U0/final_sin [45]),
    .R(\BU2/channel [0]),
    .Q(sine_2[18])
  );
  FDR #(
    .INIT ( 1'b0 ))
  \BU2/U0/i_has_sine.i_sin_op/opt_has_reg.i_reg/fd/output_18  (
    .C(clk),
    .D(\BU2/U0/final_sin [44]),
    .R(\BU2/channel [0]),
    .Q(sine_2[17])
  );
  FDR #(
    .INIT ( 1'b0 ))
  \BU2/U0/i_has_sine.i_sin_op/opt_has_reg.i_reg/fd/output_17  (
    .C(clk),
    .D(\BU2/U0/final_sin [43]),
    .R(\BU2/channel [0]),
    .Q(sine_2[16])
  );
  FDR #(
    .INIT ( 1'b0 ))
  \BU2/U0/i_has_sine.i_sin_op/opt_has_reg.i_reg/fd/output_16  (
    .C(clk),
    .D(\BU2/U0/final_sin [42]),
    .R(\BU2/channel [0]),
    .Q(sine_2[15])
  );
  FDR #(
    .INIT ( 1'b0 ))
  \BU2/U0/i_has_sine.i_sin_op/opt_has_reg.i_reg/fd/output_15  (
    .C(clk),
    .D(\BU2/U0/final_sin [41]),
    .R(\BU2/channel [0]),
    .Q(sine_2[14])
  );
  FDR #(
    .INIT ( 1'b0 ))
  \BU2/U0/i_has_sine.i_sin_op/opt_has_reg.i_reg/fd/output_14  (
    .C(clk),
    .D(\BU2/U0/final_sin [40]),
    .R(\BU2/channel [0]),
    .Q(sine_2[13])
  );
  FDR #(
    .INIT ( 1'b0 ))
  \BU2/U0/i_has_sine.i_sin_op/opt_has_reg.i_reg/fd/output_13  (
    .C(clk),
    .D(\BU2/U0/final_sin [39]),
    .R(\BU2/channel [0]),
    .Q(sine_2[12])
  );
  FDR #(
    .INIT ( 1'b0 ))
  \BU2/U0/i_has_sine.i_sin_op/opt_has_reg.i_reg/fd/output_12  (
    .C(clk),
    .D(\BU2/U0/final_sin [38]),
    .R(\BU2/channel [0]),
    .Q(sine_2[11])
  );
  FDR #(
    .INIT ( 1'b0 ))
  \BU2/U0/i_has_sine.i_sin_op/opt_has_reg.i_reg/fd/output_11  (
    .C(clk),
    .D(\BU2/U0/final_sin [37]),
    .R(\BU2/channel [0]),
    .Q(sine_2[10])
  );
  FDR #(
    .INIT ( 1'b0 ))
  \BU2/U0/i_has_sine.i_sin_op/opt_has_reg.i_reg/fd/output_10  (
    .C(clk),
    .D(\BU2/U0/final_sin [36]),
    .R(\BU2/channel [0]),
    .Q(sine_2[9])
  );
  FDR #(
    .INIT ( 1'b0 ))
  \BU2/U0/i_has_sine.i_sin_op/opt_has_reg.i_reg/fd/output_9  (
    .C(clk),
    .D(\BU2/U0/final_sin [35]),
    .R(\BU2/channel [0]),
    .Q(sine_2[8])
  );
  FDR #(
    .INIT ( 1'b0 ))
  \BU2/U0/i_has_sine.i_sin_op/opt_has_reg.i_reg/fd/output_8  (
    .C(clk),
    .D(\BU2/U0/final_sin [34]),
    .R(\BU2/channel [0]),
    .Q(sine_2[7])
  );
  FDR #(
    .INIT ( 1'b0 ))
  \BU2/U0/i_has_sine.i_sin_op/opt_has_reg.i_reg/fd/output_7  (
    .C(clk),
    .D(\BU2/U0/final_sin [33]),
    .R(\BU2/channel [0]),
    .Q(sine_2[6])
  );
  FDR #(
    .INIT ( 1'b0 ))
  \BU2/U0/i_has_sine.i_sin_op/opt_has_reg.i_reg/fd/output_6  (
    .C(clk),
    .D(\BU2/U0/final_sin [32]),
    .R(\BU2/channel [0]),
    .Q(sine_2[5])
  );
  FDR #(
    .INIT ( 1'b0 ))
  \BU2/U0/i_has_sine.i_sin_op/opt_has_reg.i_reg/fd/output_5  (
    .C(clk),
    .D(\BU2/U0/final_sin [31]),
    .R(\BU2/channel [0]),
    .Q(sine_2[4])
  );
  FDR #(
    .INIT ( 1'b0 ))
  \BU2/U0/i_has_sine.i_sin_op/opt_has_reg.i_reg/fd/output_4  (
    .C(clk),
    .D(\BU2/U0/final_sin [30]),
    .R(\BU2/channel [0]),
    .Q(sine_2[3])
  );
  FDR #(
    .INIT ( 1'b0 ))
  \BU2/U0/i_has_sine.i_sin_op/opt_has_reg.i_reg/fd/output_3  (
    .C(clk),
    .D(\BU2/U0/final_sin [29]),
    .R(\BU2/channel [0]),
    .Q(sine_2[2])
  );
  FDR #(
    .INIT ( 1'b0 ))
  \BU2/U0/i_has_sine.i_sin_op/opt_has_reg.i_reg/fd/output_2  (
    .C(clk),
    .D(\BU2/U0/final_sin [28]),
    .R(\BU2/channel [0]),
    .Q(sine_2[1])
  );
  FDR #(
    .INIT ( 1'b0 ))
  \BU2/U0/i_has_sine.i_sin_op/opt_has_reg.i_reg/fd/output_1  (
    .C(clk),
    .D(\BU2/U0/final_sin [27]),
    .R(\BU2/channel [0]),
    .Q(sine_2[0])
  );
  FDR #(
    .INIT ( 1'b0 ))
  \BU2/U0/i_accum/i_fabric.i_common.i_phase_acc/opt_has_reg.i_reg/fd/output_28  (
    .C(clk),
    .D(\BU2/U0/i_accum/acc_phase_b [27]),
    .R(sclr),
    .Q(\BU2/U0/acc_phase [27])
  );
  FDR #(
    .INIT ( 1'b0 ))
  \BU2/U0/i_accum/i_fabric.i_common.i_phase_acc/opt_has_reg.i_reg/fd/output_27  (
    .C(clk),
    .D(\BU2/U0/i_accum/acc_phase_b [26]),
    .R(sclr),
    .Q(\BU2/U0/acc_phase [26])
  );
  FDR #(
    .INIT ( 1'b0 ))
  \BU2/U0/i_accum/i_fabric.i_common.i_phase_acc/opt_has_reg.i_reg/fd/output_26  (
    .C(clk),
    .D(\BU2/U0/i_accum/acc_phase_b [25]),
    .R(sclr),
    .Q(\BU2/U0/acc_phase [25])
  );
  FDR #(
    .INIT ( 1'b0 ))
  \BU2/U0/i_accum/i_fabric.i_common.i_phase_acc/opt_has_reg.i_reg/fd/output_25  (
    .C(clk),
    .D(\BU2/U0/i_accum/acc_phase_b [24]),
    .R(sclr),
    .Q(\BU2/U0/acc_phase [24])
  );
  FDR #(
    .INIT ( 1'b0 ))
  \BU2/U0/i_accum/i_fabric.i_common.i_phase_acc/opt_has_reg.i_reg/fd/output_24  (
    .C(clk),
    .D(\BU2/U0/i_accum/acc_phase_b [23]),
    .R(sclr),
    .Q(\BU2/U0/acc_phase [23])
  );
  FDR #(
    .INIT ( 1'b0 ))
  \BU2/U0/i_accum/i_fabric.i_common.i_phase_acc/opt_has_reg.i_reg/fd/output_23  (
    .C(clk),
    .D(\BU2/U0/i_accum/acc_phase_b [22]),
    .R(sclr),
    .Q(\BU2/U0/acc_phase [22])
  );
  FDR #(
    .INIT ( 1'b0 ))
  \BU2/U0/i_accum/i_fabric.i_common.i_phase_acc/opt_has_reg.i_reg/fd/output_22  (
    .C(clk),
    .D(\BU2/U0/i_accum/acc_phase_b [21]),
    .R(sclr),
    .Q(\BU2/U0/acc_phase [21])
  );
  FDR #(
    .INIT ( 1'b0 ))
  \BU2/U0/i_accum/i_fabric.i_common.i_phase_acc/opt_has_reg.i_reg/fd/output_21  (
    .C(clk),
    .D(\BU2/U0/i_accum/acc_phase_b [20]),
    .R(sclr),
    .Q(\BU2/U0/acc_phase [20])
  );
  FDR #(
    .INIT ( 1'b0 ))
  \BU2/U0/i_accum/i_fabric.i_common.i_phase_acc/opt_has_reg.i_reg/fd/output_20  (
    .C(clk),
    .D(\BU2/U0/i_accum/acc_phase_b [19]),
    .R(sclr),
    .Q(\BU2/U0/acc_phase [19])
  );
  FDR #(
    .INIT ( 1'b0 ))
  \BU2/U0/i_accum/i_fabric.i_common.i_phase_acc/opt_has_reg.i_reg/fd/output_19  (
    .C(clk),
    .D(\BU2/U0/i_accum/acc_phase_b [18]),
    .R(sclr),
    .Q(\BU2/U0/acc_phase [18])
  );
  FDR #(
    .INIT ( 1'b0 ))
  \BU2/U0/i_accum/i_fabric.i_common.i_phase_acc/opt_has_reg.i_reg/fd/output_18  (
    .C(clk),
    .D(\BU2/U0/i_accum/acc_phase_b [17]),
    .R(sclr),
    .Q(\BU2/U0/acc_phase [17])
  );
  FDR #(
    .INIT ( 1'b0 ))
  \BU2/U0/i_accum/i_fabric.i_common.i_phase_acc/opt_has_reg.i_reg/fd/output_17  (
    .C(clk),
    .D(\BU2/U0/i_accum/acc_phase_b [16]),
    .R(sclr),
    .Q(\BU2/U0/acc_phase [16])
  );
  FDR #(
    .INIT ( 1'b0 ))
  \BU2/U0/i_accum/i_fabric.i_common.i_phase_acc/opt_has_reg.i_reg/fd/output_16  (
    .C(clk),
    .D(\BU2/U0/i_accum/acc_phase_b [15]),
    .R(sclr),
    .Q(\BU2/U0/acc_phase [15])
  );
  FDR #(
    .INIT ( 1'b0 ))
  \BU2/U0/i_accum/i_fabric.i_common.i_phase_acc/opt_has_reg.i_reg/fd/output_15  (
    .C(clk),
    .D(\BU2/U0/i_accum/acc_phase_b [14]),
    .R(sclr),
    .Q(\BU2/U0/acc_phase [14])
  );
  FDR #(
    .INIT ( 1'b0 ))
  \BU2/U0/i_accum/i_fabric.i_common.i_phase_acc/opt_has_reg.i_reg/fd/output_14  (
    .C(clk),
    .D(\BU2/U0/i_accum/acc_phase_b [13]),
    .R(sclr),
    .Q(\BU2/U0/acc_phase [13])
  );
  FDR #(
    .INIT ( 1'b0 ))
  \BU2/U0/i_accum/i_fabric.i_common.i_phase_acc/opt_has_reg.i_reg/fd/output_13  (
    .C(clk),
    .D(\BU2/U0/i_accum/acc_phase_b [12]),
    .R(sclr),
    .Q(\BU2/U0/acc_phase [12])
  );
  FDR #(
    .INIT ( 1'b0 ))
  \BU2/U0/i_accum/i_fabric.i_common.i_phase_acc/opt_has_reg.i_reg/fd/output_12  (
    .C(clk),
    .D(\BU2/U0/i_accum/acc_phase_b [11]),
    .R(sclr),
    .Q(\BU2/U0/acc_phase [11])
  );
  FDR #(
    .INIT ( 1'b0 ))
  \BU2/U0/i_accum/i_fabric.i_common.i_phase_acc/opt_has_reg.i_reg/fd/output_11  (
    .C(clk),
    .D(\BU2/U0/i_accum/acc_phase_b [10]),
    .R(sclr),
    .Q(\BU2/U0/acc_phase [10])
  );
  FDR #(
    .INIT ( 1'b0 ))
  \BU2/U0/i_accum/i_fabric.i_common.i_phase_acc/opt_has_reg.i_reg/fd/output_10  (
    .C(clk),
    .D(\BU2/U0/i_accum/acc_phase_b [9]),
    .R(sclr),
    .Q(\BU2/U0/acc_phase [9])
  );
  FDR #(
    .INIT ( 1'b0 ))
  \BU2/U0/i_accum/i_fabric.i_common.i_phase_acc/opt_has_reg.i_reg/fd/output_9  (
    .C(clk),
    .D(\BU2/U0/i_accum/acc_phase_b [8]),
    .R(sclr),
    .Q(\BU2/U0/acc_phase [8])
  );
  FDR #(
    .INIT ( 1'b0 ))
  \BU2/U0/i_accum/i_fabric.i_common.i_phase_acc/opt_has_reg.i_reg/fd/output_8  (
    .C(clk),
    .D(\BU2/U0/i_accum/acc_phase_b [7]),
    .R(sclr),
    .Q(\BU2/U0/acc_phase [7])
  );
  FDR #(
    .INIT ( 1'b0 ))
  \BU2/U0/i_accum/i_fabric.i_common.i_phase_acc/opt_has_reg.i_reg/fd/output_7  (
    .C(clk),
    .D(\BU2/U0/i_accum/acc_phase_b [6]),
    .R(sclr),
    .Q(\BU2/U0/acc_phase [6])
  );
  FDR #(
    .INIT ( 1'b0 ))
  \BU2/U0/i_accum/i_fabric.i_common.i_phase_acc/opt_has_reg.i_reg/fd/output_6  (
    .C(clk),
    .D(\BU2/U0/i_accum/acc_phase_b [5]),
    .R(sclr),
    .Q(\BU2/U0/acc_phase [5])
  );
  FDR #(
    .INIT ( 1'b0 ))
  \BU2/U0/i_accum/i_fabric.i_common.i_phase_acc/opt_has_reg.i_reg/fd/output_5  (
    .C(clk),
    .D(\BU2/U0/i_accum/acc_phase_b [4]),
    .R(sclr),
    .Q(\BU2/U0/acc_phase [4])
  );
  FDR #(
    .INIT ( 1'b0 ))
  \BU2/U0/i_accum/i_fabric.i_common.i_phase_acc/opt_has_reg.i_reg/fd/output_4  (
    .C(clk),
    .D(\BU2/U0/i_accum/acc_phase_b [3]),
    .R(sclr),
    .Q(\BU2/U0/acc_phase [3])
  );
  FDR #(
    .INIT ( 1'b0 ))
  \BU2/U0/i_accum/i_fabric.i_common.i_phase_acc/opt_has_reg.i_reg/fd/output_3  (
    .C(clk),
    .D(\BU2/U0/i_accum/acc_phase_b [2]),
    .R(sclr),
    .Q(\BU2/U0/acc_phase [2])
  );
  FDR #(
    .INIT ( 1'b0 ))
  \BU2/U0/i_accum/i_fabric.i_common.i_phase_acc/opt_has_reg.i_reg/fd/output_2  (
    .C(clk),
    .D(\BU2/U0/i_accum/acc_phase_b [1]),
    .R(sclr),
    .Q(\BU2/U0/acc_phase [1])
  );
  FDR #(
    .INIT ( 1'b0 ))
  \BU2/U0/i_accum/i_fabric.i_common.i_phase_acc/opt_has_reg.i_reg/fd/output_1  (
    .C(clk),
    .D(\BU2/U0/i_accum/acc_phase_b [0]),
    .R(sclr),
    .Q(\BU2/U0/acc_phase [0])
  );
  FD #(
    .INIT ( 1'b0 ))
  \BU2/U0/i_comp_eff.i_eff/i_ccm.i_by_hand.i_not_dsp48a.i_complete/opt_has_reg.i_reg/fd/output_11  (
    .C(clk),
    .D(\BU2/U0/i_comp_eff.i_eff/pre_complete [18]),
    .Q(\BU2/U0/i_comp_eff.i_eff/radian_error [21])
  );
  FD #(
    .INIT ( 1'b0 ))
  \BU2/U0/i_comp_eff.i_eff/i_ccm.i_by_hand.i_not_dsp48a.i_complete/opt_has_reg.i_reg/fd/output_10  (
    .C(clk),
    .D(\BU2/U0/i_comp_eff.i_eff/pre_complete [17]),
    .Q(\BU2/U0/i_comp_eff.i_eff/radian_error [20])
  );
  FD #(
    .INIT ( 1'b0 ))
  \BU2/U0/i_comp_eff.i_eff/i_ccm.i_by_hand.i_not_dsp48a.i_complete/opt_has_reg.i_reg/fd/output_9  (
    .C(clk),
    .D(\BU2/U0/i_comp_eff.i_eff/pre_complete [16]),
    .Q(\BU2/U0/i_comp_eff.i_eff/radian_error [19])
  );
  FD #(
    .INIT ( 1'b0 ))
  \BU2/U0/i_comp_eff.i_eff/i_ccm.i_by_hand.i_not_dsp48a.i_complete/opt_has_reg.i_reg/fd/output_8  (
    .C(clk),
    .D(\BU2/U0/i_comp_eff.i_eff/pre_complete [15]),
    .Q(\BU2/U0/i_comp_eff.i_eff/radian_error [18])
  );
  FD #(
    .INIT ( 1'b0 ))
  \BU2/U0/i_comp_eff.i_eff/i_ccm.i_by_hand.i_not_dsp48a.i_complete/opt_has_reg.i_reg/fd/output_7  (
    .C(clk),
    .D(\BU2/U0/i_comp_eff.i_eff/pre_complete [14]),
    .Q(\BU2/U0/i_comp_eff.i_eff/radian_error [17])
  );
  FD #(
    .INIT ( 1'b0 ))
  \BU2/U0/i_comp_eff.i_eff/i_ccm.i_by_hand.i_not_dsp48a.i_complete/opt_has_reg.i_reg/fd/output_6  (
    .C(clk),
    .D(\BU2/U0/i_comp_eff.i_eff/pre_complete [13]),
    .Q(\BU2/U0/i_comp_eff.i_eff/radian_error [16])
  );
  FD #(
    .INIT ( 1'b0 ))
  \BU2/U0/i_comp_eff.i_eff/i_ccm.i_by_hand.i_not_dsp48a.i_complete/opt_has_reg.i_reg/fd/output_5  (
    .C(clk),
    .D(\BU2/U0/i_comp_eff.i_eff/pre_complete [12]),
    .Q(\BU2/U0/i_comp_eff.i_eff/radian_error [15])
  );
  FD #(
    .INIT ( 1'b0 ))
  \BU2/U0/i_comp_eff.i_eff/i_ccm.i_by_hand.i_not_dsp48a.i_complete/opt_has_reg.i_reg/fd/output_4  (
    .C(clk),
    .D(\BU2/U0/i_comp_eff.i_eff/pre_complete [11]),
    .Q(\BU2/U0/i_comp_eff.i_eff/radian_error [14])
  );
  FD #(
    .INIT ( 1'b0 ))
  \BU2/U0/i_comp_eff.i_eff/i_ccm.i_by_hand.i_not_dsp48a.i_complete/opt_has_reg.i_reg/fd/output_3  (
    .C(clk),
    .D(\BU2/U0/i_comp_eff.i_eff/pre_complete [10]),
    .Q(\BU2/U0/i_comp_eff.i_eff/radian_error [13])
  );
  FD #(
    .INIT ( 1'b0 ))
  \BU2/U0/i_comp_eff.i_eff/i_ccm.i_by_hand.i_not_dsp48a.i_complete/opt_has_reg.i_reg/fd/output_2  (
    .C(clk),
    .D(\BU2/U0/i_comp_eff.i_eff/pre_complete [9]),
    .Q(\BU2/U0/i_comp_eff.i_eff/radian_error [12])
  );
  FD #(
    .INIT ( 1'b0 ))
  \BU2/U0/i_comp_eff.i_eff/i_ccm.i_by_hand.i_not_dsp48a.i_complete/opt_has_reg.i_reg/fd/output_1  (
    .C(clk),
    .D(\BU2/U0/i_comp_eff.i_eff/pre_complete [8]),
    .Q(\BU2/U0/i_comp_eff.i_eff/radian_error [11])
  );
  FD #(
    .INIT ( 1'b0 ))
  \BU2/U0/i_comp_eff.i_eff/i_ccm.i_by_hand.i_eff_balance_delaya/opt_has_reg.i_reg/fd/output_11  (
    .C(clk),
    .D(\BU2/U0/i_comp_eff.i_eff/phase_error [16]),
    .Q(\BU2/U0/i_comp_eff.i_eff/d1_eff_phase_error [10])
  );
  FD #(
    .INIT ( 1'b0 ))
  \BU2/U0/i_comp_eff.i_eff/i_ccm.i_by_hand.i_eff_balance_delaya/opt_has_reg.i_reg/fd/output_10  (
    .C(clk),
    .D(\BU2/U0/acc_phase_adjusted [15]),
    .Q(\BU2/U0/i_comp_eff.i_eff/d1_eff_phase_error [9])
  );
  FD #(
    .INIT ( 1'b0 ))
  \BU2/U0/i_comp_eff.i_eff/i_ccm.i_by_hand.i_eff_balance_delaya/opt_has_reg.i_reg/fd/output_9  (
    .C(clk),
    .D(\BU2/U0/acc_phase_adjusted [14]),
    .Q(\BU2/U0/i_comp_eff.i_eff/d1_eff_phase_error [8])
  );
  FD #(
    .INIT ( 1'b0 ))
  \BU2/U0/i_comp_eff.i_eff/i_ccm.i_by_hand.i_eff_balance_delaya/opt_has_reg.i_reg/fd/output_8  (
    .C(clk),
    .D(\BU2/U0/acc_phase_adjusted [13]),
    .Q(\BU2/U0/i_comp_eff.i_eff/d1_eff_phase_error [7])
  );
  FD #(
    .INIT ( 1'b0 ))
  \BU2/U0/i_comp_eff.i_eff/i_ccm.i_by_hand.i_eff_balance_delaya/opt_has_reg.i_reg/fd/output_7  (
    .C(clk),
    .D(\BU2/U0/acc_phase_adjusted [12]),
    .Q(\BU2/U0/i_comp_eff.i_eff/d1_eff_phase_error [6])
  );
  FD #(
    .INIT ( 1'b0 ))
  \BU2/U0/i_comp_eff.i_eff/i_ccm.i_by_hand.i_eff_balance_delaya/opt_has_reg.i_reg/fd/output_6  (
    .C(clk),
    .D(\BU2/U0/acc_phase_adjusted [11]),
    .Q(\BU2/U0/i_comp_eff.i_eff/d1_eff_phase_error [5])
  );
  FD #(
    .INIT ( 1'b0 ))
  \BU2/U0/i_comp_eff.i_eff/i_ccm.i_by_hand.i_eff_balance_delaya/opt_has_reg.i_reg/fd/output_5  (
    .C(clk),
    .D(\BU2/U0/acc_phase_adjusted [10]),
    .Q(\BU2/U0/i_comp_eff.i_eff/d1_eff_phase_error [4])
  );
  FD #(
    .INIT ( 1'b0 ))
  \BU2/U0/i_comp_eff.i_eff/i_ccm.i_by_hand.i_eff_balance_delaya/opt_has_reg.i_reg/fd/output_4  (
    .C(clk),
    .D(\BU2/U0/acc_phase_adjusted [9]),
    .Q(\BU2/U0/i_comp_eff.i_eff/d1_eff_phase_error [3])
  );
  FD #(
    .INIT ( 1'b0 ))
  \BU2/U0/i_comp_eff.i_eff/i_ccm.i_by_hand.i_eff_balance_delaya/opt_has_reg.i_reg/fd/output_3  (
    .C(clk),
    .D(\BU2/U0/acc_phase_adjusted [8]),
    .Q(\BU2/U0/i_comp_eff.i_eff/d1_eff_phase_error [2])
  );
  FD #(
    .INIT ( 1'b0 ))
  \BU2/U0/i_comp_eff.i_eff/i_ccm.i_by_hand.i_eff_balance_delaya/opt_has_reg.i_reg/fd/output_2  (
    .C(clk),
    .D(\BU2/U0/acc_phase_adjusted [7]),
    .Q(\BU2/U0/i_comp_eff.i_eff/d1_eff_phase_error [1])
  );
  FD #(
    .INIT ( 1'b0 ))
  \BU2/U0/i_comp_eff.i_eff/i_ccm.i_by_hand.i_eff_balance_delaya/opt_has_reg.i_reg/fd/output_1  (
    .C(clk),
    .D(\BU2/U0/acc_phase_adjusted [6]),
    .Q(\BU2/U0/i_comp_eff.i_eff/d1_eff_phase_error [0])
  );
  FD #(
    .INIT ( 1'b0 ))
  \BU2/U0/i_comp_eff.i_eff/i_ccm.i_by_hand.i_partial_upper/opt_has_reg.i_reg/fd/output_13  (
    .C(clk),
    .D(\BU2/U0/i_comp_eff.i_eff/Madd_pre_partial_upper_cy [11]),
    .Q(\BU2/U0/i_comp_eff.i_eff/partial_upper [12])
  );
  FD #(
    .INIT ( 1'b0 ))
  \BU2/U0/i_comp_eff.i_eff/i_ccm.i_by_hand.i_partial_upper/opt_has_reg.i_reg/fd/output_12  (
    .C(clk),
    .D(\BU2/U0/i_comp_eff.i_eff/Madd_pre_partial_upper_cy [10]),
    .Q(\BU2/U0/i_comp_eff.i_eff/partial_upper [11])
  );
  FD #(
    .INIT ( 1'b0 ))
  \BU2/U0/i_comp_eff.i_eff/i_ccm.i_by_hand.i_partial_upper/opt_has_reg.i_reg/fd/output_11  (
    .C(clk),
    .D(\BU2/U0/i_comp_eff.i_eff/pre_partial_upper [10]),
    .Q(\BU2/U0/i_comp_eff.i_eff/partial_upper [10])
  );
  FD #(
    .INIT ( 1'b0 ))
  \BU2/U0/i_comp_eff.i_eff/i_ccm.i_by_hand.i_partial_upper/opt_has_reg.i_reg/fd/output_10  (
    .C(clk),
    .D(\BU2/U0/i_comp_eff.i_eff/pre_partial_upper [9]),
    .Q(\BU2/U0/i_comp_eff.i_eff/partial_upper [9])
  );
  FD #(
    .INIT ( 1'b0 ))
  \BU2/U0/i_comp_eff.i_eff/i_ccm.i_by_hand.i_partial_upper/opt_has_reg.i_reg/fd/output_9  (
    .C(clk),
    .D(\BU2/U0/i_comp_eff.i_eff/pre_partial_upper [8]),
    .Q(\BU2/U0/i_comp_eff.i_eff/partial_upper [8])
  );
  FD #(
    .INIT ( 1'b0 ))
  \BU2/U0/i_comp_eff.i_eff/i_ccm.i_by_hand.i_partial_upper/opt_has_reg.i_reg/fd/output_8  (
    .C(clk),
    .D(\BU2/U0/i_comp_eff.i_eff/pre_partial_upper [7]),
    .Q(\BU2/U0/i_comp_eff.i_eff/partial_upper [7])
  );
  FD #(
    .INIT ( 1'b0 ))
  \BU2/U0/i_comp_eff.i_eff/i_ccm.i_by_hand.i_partial_upper/opt_has_reg.i_reg/fd/output_7  (
    .C(clk),
    .D(\BU2/U0/i_comp_eff.i_eff/pre_partial_upper [6]),
    .Q(\BU2/U0/i_comp_eff.i_eff/partial_upper [6])
  );
  FD #(
    .INIT ( 1'b0 ))
  \BU2/U0/i_comp_eff.i_eff/i_ccm.i_by_hand.i_partial_upper/opt_has_reg.i_reg/fd/output_6  (
    .C(clk),
    .D(\BU2/U0/i_comp_eff.i_eff/pre_partial_upper [5]),
    .Q(\BU2/U0/i_comp_eff.i_eff/partial_upper [5])
  );
  FD #(
    .INIT ( 1'b0 ))
  \BU2/U0/i_comp_eff.i_eff/i_ccm.i_by_hand.i_partial_upper/opt_has_reg.i_reg/fd/output_5  (
    .C(clk),
    .D(\BU2/U0/i_comp_eff.i_eff/pre_partial_upper [4]),
    .Q(\BU2/U0/i_comp_eff.i_eff/partial_upper [4])
  );
  FD #(
    .INIT ( 1'b0 ))
  \BU2/U0/i_comp_eff.i_eff/i_ccm.i_by_hand.i_partial_upper/opt_has_reg.i_reg/fd/output_4  (
    .C(clk),
    .D(\BU2/U0/i_comp_eff.i_eff/pre_partial_upper [3]),
    .Q(\BU2/U0/i_comp_eff.i_eff/partial_upper [3])
  );
  FD #(
    .INIT ( 1'b0 ))
  \BU2/U0/i_comp_eff.i_eff/i_ccm.i_by_hand.i_partial_upper/opt_has_reg.i_reg/fd/output_3  (
    .C(clk),
    .D(\BU2/U0/i_comp_eff.i_eff/pre_partial_upper [2]),
    .Q(\BU2/U0/i_comp_eff.i_eff/partial_upper [2])
  );
  FD #(
    .INIT ( 1'b0 ))
  \BU2/U0/i_comp_eff.i_eff/i_ccm.i_by_hand.i_partial_upper/opt_has_reg.i_reg/fd/output_2  (
    .C(clk),
    .D(\BU2/U0/i_comp_eff.i_eff/Madd_pre_partial_upper_lut [1]),
    .Q(\BU2/U0/i_comp_eff.i_eff/partial_upper [1])
  );
  FD #(
    .INIT ( 1'b0 ))
  \BU2/U0/i_comp_eff.i_eff/i_ccm.i_by_hand.i_partial_upper/opt_has_reg.i_reg/fd/output_1  (
    .C(clk),
    .D(\BU2/U0/i_comp_eff.i_eff/d1_eff_phase_error [0]),
    .Q(\BU2/U0/i_comp_eff.i_eff/partial_upper [0])
  );
  FD #(
    .INIT ( 1'b0 ))
  \BU2/U0/i_comp_eff.i_eff/i_ccm.i_by_hand.i_partial_lower/opt_has_reg.i_reg/fd/output_15  (
    .C(clk),
    .D(\BU2/U0/i_comp_eff.i_eff/Madd_pre_partial_lower_cy [13]),
    .Q(\BU2/U0/i_comp_eff.i_eff/partial_lower [14])
  );
  FD #(
    .INIT ( 1'b0 ))
  \BU2/U0/i_comp_eff.i_eff/i_ccm.i_by_hand.i_partial_lower/opt_has_reg.i_reg/fd/output_14  (
    .C(clk),
    .D(\BU2/U0/i_comp_eff.i_eff/Madd_pre_partial_lower_cy [12]),
    .Q(\BU2/U0/i_comp_eff.i_eff/partial_lower [13])
  );
  FD #(
    .INIT ( 1'b0 ))
  \BU2/U0/i_comp_eff.i_eff/i_ccm.i_by_hand.i_partial_lower/opt_has_reg.i_reg/fd/output_13  (
    .C(clk),
    .D(\BU2/U0/i_comp_eff.i_eff/pre_partial_lower [12]),
    .Q(\BU2/U0/i_comp_eff.i_eff/partial_lower [12])
  );
  FD #(
    .INIT ( 1'b0 ))
  \BU2/U0/i_comp_eff.i_eff/i_ccm.i_by_hand.i_partial_lower/opt_has_reg.i_reg/fd/output_12  (
    .C(clk),
    .D(\BU2/U0/i_comp_eff.i_eff/pre_partial_lower [11]),
    .Q(\BU2/U0/i_comp_eff.i_eff/partial_lower [11])
  );
  FD #(
    .INIT ( 1'b0 ))
  \BU2/U0/i_comp_eff.i_eff/i_ccm.i_by_hand.i_partial_lower/opt_has_reg.i_reg/fd/output_11  (
    .C(clk),
    .D(\BU2/U0/i_comp_eff.i_eff/pre_partial_lower [10]),
    .Q(\BU2/U0/i_comp_eff.i_eff/partial_lower [10])
  );
  FD #(
    .INIT ( 1'b0 ))
  \BU2/U0/i_comp_eff.i_eff/i_ccm.i_by_hand.i_partial_lower/opt_has_reg.i_reg/fd/output_10  (
    .C(clk),
    .D(\BU2/U0/i_comp_eff.i_eff/pre_partial_lower [9]),
    .Q(\BU2/U0/i_comp_eff.i_eff/partial_lower [9])
  );
  FD #(
    .INIT ( 1'b0 ))
  \BU2/U0/i_comp_eff.i_eff/i_ccm.i_by_hand.i_partial_lower/opt_has_reg.i_reg/fd/output_9  (
    .C(clk),
    .D(\BU2/U0/i_comp_eff.i_eff/pre_partial_lower [8]),
    .Q(\BU2/U0/i_comp_eff.i_eff/partial_lower [8])
  );
  FD #(
    .INIT ( 1'b0 ))
  \BU2/U0/i_comp_eff.i_eff/i_ccm.i_by_hand.i_partial_lower/opt_has_reg.i_reg/fd/output_8  (
    .C(clk),
    .D(\BU2/U0/i_comp_eff.i_eff/pre_partial_lower [7]),
    .Q(\BU2/U0/i_comp_eff.i_eff/partial_lower [7])
  );
  FD #(
    .INIT ( 1'b0 ))
  \BU2/U0/i_comp_eff.i_eff/i_ccm.i_by_hand.i_partial_lower/opt_has_reg.i_reg/fd/output_7  (
    .C(clk),
    .D(\BU2/U0/i_comp_eff.i_eff/pre_partial_lower [6]),
    .Q(\BU2/U0/i_comp_eff.i_eff/partial_lower [6])
  );
  FD #(
    .INIT ( 1'b0 ))
  \BU2/U0/i_comp_eff.i_eff/i_legacy.i_sin_adj/i_input_a_reg/opt_has_reg.i_reg/fd/output_11  (
    .C(clk),
    .D(\BU2/U0/i_comp_eff.i_eff/radian_error [21]),
    .Q(\BU2/U0/i_comp_eff.i_eff/i_legacy.i_sin_adj/A_2 [10])
  );
  FD #(
    .INIT ( 1'b0 ))
  \BU2/U0/i_comp_eff.i_eff/i_legacy.i_sin_adj/i_input_a_reg/opt_has_reg.i_reg/fd/output_10  (
    .C(clk),
    .D(\BU2/U0/i_comp_eff.i_eff/radian_error [20]),
    .Q(\BU2/U0/i_comp_eff.i_eff/i_legacy.i_sin_adj/A_2 [9])
  );
  FD #(
    .INIT ( 1'b0 ))
  \BU2/U0/i_comp_eff.i_eff/i_legacy.i_sin_adj/i_input_a_reg/opt_has_reg.i_reg/fd/output_9  (
    .C(clk),
    .D(\BU2/U0/i_comp_eff.i_eff/radian_error [19]),
    .Q(\BU2/U0/i_comp_eff.i_eff/i_legacy.i_sin_adj/A_2 [8])
  );
  FD #(
    .INIT ( 1'b0 ))
  \BU2/U0/i_comp_eff.i_eff/i_legacy.i_sin_adj/i_input_a_reg/opt_has_reg.i_reg/fd/output_8  (
    .C(clk),
    .D(\BU2/U0/i_comp_eff.i_eff/radian_error [18]),
    .Q(\BU2/U0/i_comp_eff.i_eff/i_legacy.i_sin_adj/A_2 [7])
  );
  FD #(
    .INIT ( 1'b0 ))
  \BU2/U0/i_comp_eff.i_eff/i_legacy.i_sin_adj/i_input_a_reg/opt_has_reg.i_reg/fd/output_7  (
    .C(clk),
    .D(\BU2/U0/i_comp_eff.i_eff/radian_error [17]),
    .Q(\BU2/U0/i_comp_eff.i_eff/i_legacy.i_sin_adj/A_2 [6])
  );
  FD #(
    .INIT ( 1'b0 ))
  \BU2/U0/i_comp_eff.i_eff/i_legacy.i_sin_adj/i_input_a_reg/opt_has_reg.i_reg/fd/output_6  (
    .C(clk),
    .D(\BU2/U0/i_comp_eff.i_eff/radian_error [16]),
    .Q(\BU2/U0/i_comp_eff.i_eff/i_legacy.i_sin_adj/A_2 [5])
  );
  FD #(
    .INIT ( 1'b0 ))
  \BU2/U0/i_comp_eff.i_eff/i_legacy.i_sin_adj/i_input_a_reg/opt_has_reg.i_reg/fd/output_5  (
    .C(clk),
    .D(\BU2/U0/i_comp_eff.i_eff/radian_error [15]),
    .Q(\BU2/U0/i_comp_eff.i_eff/i_legacy.i_sin_adj/A_2 [4])
  );
  FD #(
    .INIT ( 1'b0 ))
  \BU2/U0/i_comp_eff.i_eff/i_legacy.i_sin_adj/i_input_a_reg/opt_has_reg.i_reg/fd/output_4  (
    .C(clk),
    .D(\BU2/U0/i_comp_eff.i_eff/radian_error [14]),
    .Q(\BU2/U0/i_comp_eff.i_eff/i_legacy.i_sin_adj/A_2 [3])
  );
  FD #(
    .INIT ( 1'b0 ))
  \BU2/U0/i_comp_eff.i_eff/i_legacy.i_sin_adj/i_input_a_reg/opt_has_reg.i_reg/fd/output_3  (
    .C(clk),
    .D(\BU2/U0/i_comp_eff.i_eff/radian_error [13]),
    .Q(\BU2/U0/i_comp_eff.i_eff/i_legacy.i_sin_adj/A_2 [2])
  );
  FD #(
    .INIT ( 1'b0 ))
  \BU2/U0/i_comp_eff.i_eff/i_legacy.i_sin_adj/i_input_a_reg/opt_has_reg.i_reg/fd/output_2  (
    .C(clk),
    .D(\BU2/U0/i_comp_eff.i_eff/radian_error [12]),
    .Q(\BU2/U0/i_comp_eff.i_eff/i_legacy.i_sin_adj/A_2 [1])
  );
  FD #(
    .INIT ( 1'b0 ))
  \BU2/U0/i_comp_eff.i_eff/i_legacy.i_sin_adj/i_input_a_reg/opt_has_reg.i_reg/fd/output_1  (
    .C(clk),
    .D(\BU2/U0/i_comp_eff.i_eff/radian_error [11]),
    .Q(\BU2/U0/i_comp_eff.i_eff/i_legacy.i_sin_adj/A_2 [0])
  );
  FD #(
    .INIT ( 1'b0 ))
  \BU2/U0/i_comp_eff.i_eff/i_legacy.i_sin_adj/i_input_b_reg/opt_has_reg.i_reg/fd/output_10  (
    .C(clk),
    .D(\BU2/U0/i_rom/cos_RAM_op [17]),
    .Q(\BU2/U0/i_comp_eff.i_eff/i_legacy.i_sin_adj/B_2 [9])
  );
  FD #(
    .INIT ( 1'b0 ))
  \BU2/U0/i_comp_eff.i_eff/i_legacy.i_sin_adj/i_input_b_reg/opt_has_reg.i_reg/fd/output_9  (
    .C(clk),
    .D(\BU2/U0/i_rom/cos_RAM_op [16]),
    .Q(\BU2/U0/i_comp_eff.i_eff/i_legacy.i_sin_adj/B_2 [8])
  );
  FD #(
    .INIT ( 1'b0 ))
  \BU2/U0/i_comp_eff.i_eff/i_legacy.i_sin_adj/i_input_b_reg/opt_has_reg.i_reg/fd/output_8  (
    .C(clk),
    .D(\BU2/U0/i_rom/cos_RAM_op [15]),
    .Q(\BU2/U0/i_comp_eff.i_eff/i_legacy.i_sin_adj/B_2 [7])
  );
  FD #(
    .INIT ( 1'b0 ))
  \BU2/U0/i_comp_eff.i_eff/i_legacy.i_sin_adj/i_input_b_reg/opt_has_reg.i_reg/fd/output_7  (
    .C(clk),
    .D(\BU2/U0/i_rom/cos_RAM_op [14]),
    .Q(\BU2/U0/i_comp_eff.i_eff/i_legacy.i_sin_adj/B_2 [6])
  );
  FD #(
    .INIT ( 1'b0 ))
  \BU2/U0/i_comp_eff.i_eff/i_legacy.i_sin_adj/i_input_b_reg/opt_has_reg.i_reg/fd/output_6  (
    .C(clk),
    .D(\BU2/U0/i_rom/cos_RAM_op [13]),
    .Q(\BU2/U0/i_comp_eff.i_eff/i_legacy.i_sin_adj/B_2 [5])
  );
  FD #(
    .INIT ( 1'b0 ))
  \BU2/U0/i_comp_eff.i_eff/i_legacy.i_sin_adj/i_input_b_reg/opt_has_reg.i_reg/fd/output_5  (
    .C(clk),
    .D(\BU2/U0/i_rom/cos_RAM_op [12]),
    .Q(\BU2/U0/i_comp_eff.i_eff/i_legacy.i_sin_adj/B_2 [4])
  );
  FD #(
    .INIT ( 1'b0 ))
  \BU2/U0/i_comp_eff.i_eff/i_legacy.i_sin_adj/i_input_b_reg/opt_has_reg.i_reg/fd/output_4  (
    .C(clk),
    .D(\BU2/U0/i_rom/cos_RAM_op [11]),
    .Q(\BU2/U0/i_comp_eff.i_eff/i_legacy.i_sin_adj/B_2 [3])
  );
  FD #(
    .INIT ( 1'b0 ))
  \BU2/U0/i_comp_eff.i_eff/i_legacy.i_sin_adj/i_input_b_reg/opt_has_reg.i_reg/fd/output_3  (
    .C(clk),
    .D(\BU2/U0/i_rom/cos_RAM_op [10]),
    .Q(\BU2/U0/i_comp_eff.i_eff/i_legacy.i_sin_adj/B_2 [2])
  );
  FD #(
    .INIT ( 1'b0 ))
  \BU2/U0/i_comp_eff.i_eff/i_legacy.i_sin_adj/i_input_b_reg/opt_has_reg.i_reg/fd/output_2  (
    .C(clk),
    .D(\BU2/U0/i_rom/cos_RAM_op [9]),
    .Q(\BU2/U0/i_comp_eff.i_eff/i_legacy.i_sin_adj/B_2 [1])
  );
  FD #(
    .INIT ( 1'b0 ))
  \BU2/U0/i_comp_eff.i_eff/i_legacy.i_sin_adj/i_input_b_reg/opt_has_reg.i_reg/fd/output_1  (
    .C(clk),
    .D(\BU2/U0/i_rom/cos_RAM_op [8]),
    .Q(\BU2/U0/i_comp_eff.i_eff/i_legacy.i_sin_adj/B_2 [0])
  );
  FD #(
    .INIT ( 1'b0 ))
  \BU2/U0/i_comp_eff.i_eff/i_legacy.i_sin_adj/i_output_reg/opt_has_reg.i_reg/fd/output_21  (
    .C(clk),
    .D(\BU2/U0/i_comp_eff.i_eff/i_legacy.i_sin_adj/result [20]),
    .Q(\BU2/U0/i_comp_eff.i_eff/sin_mult_adj [20])
  );
  FD #(
    .INIT ( 1'b0 ))
  \BU2/U0/i_comp_eff.i_eff/i_legacy.i_sin_adj/i_output_reg/opt_has_reg.i_reg/fd/output_20  (
    .C(clk),
    .D(\BU2/U0/i_comp_eff.i_eff/i_legacy.i_sin_adj/result [19]),
    .Q(\BU2/U0/i_comp_eff.i_eff/sin_mult_adj [19])
  );
  FD #(
    .INIT ( 1'b0 ))
  \BU2/U0/i_comp_eff.i_eff/i_legacy.i_sin_adj/i_output_reg/opt_has_reg.i_reg/fd/output_19  (
    .C(clk),
    .D(\BU2/U0/i_comp_eff.i_eff/i_legacy.i_sin_adj/result [18]),
    .Q(\BU2/U0/i_comp_eff.i_eff/sin_mult_adj [18])
  );
  FD #(
    .INIT ( 1'b0 ))
  \BU2/U0/i_comp_eff.i_eff/i_legacy.i_sin_adj/i_output_reg/opt_has_reg.i_reg/fd/output_18  (
    .C(clk),
    .D(\BU2/U0/i_comp_eff.i_eff/i_legacy.i_sin_adj/result [17]),
    .Q(\BU2/U0/i_comp_eff.i_eff/sin_mult_adj [17])
  );
  FD #(
    .INIT ( 1'b0 ))
  \BU2/U0/i_comp_eff.i_eff/i_legacy.i_sin_adj/i_output_reg/opt_has_reg.i_reg/fd/output_17  (
    .C(clk),
    .D(\BU2/U0/i_comp_eff.i_eff/i_legacy.i_sin_adj/result [16]),
    .Q(\BU2/U0/i_comp_eff.i_eff/sin_mult_adj [16])
  );
  FD #(
    .INIT ( 1'b0 ))
  \BU2/U0/i_comp_eff.i_eff/i_legacy.i_sin_adj/i_output_reg/opt_has_reg.i_reg/fd/output_16  (
    .C(clk),
    .D(\BU2/U0/i_comp_eff.i_eff/i_legacy.i_sin_adj/result [15]),
    .Q(\BU2/U0/i_comp_eff.i_eff/sin_mult_adj [15])
  );
  FD #(
    .INIT ( 1'b0 ))
  \BU2/U0/i_comp_eff.i_eff/i_legacy.i_sin_adj/i_output_reg/opt_has_reg.i_reg/fd/output_15  (
    .C(clk),
    .D(\BU2/U0/i_comp_eff.i_eff/i_legacy.i_sin_adj/result [14]),
    .Q(\BU2/U0/i_comp_eff.i_eff/sin_mult_adj [14])
  );
  FD #(
    .INIT ( 1'b0 ))
  \BU2/U0/i_comp_eff.i_eff/i_legacy.i_sin_adj/i_output_reg/opt_has_reg.i_reg/fd/output_14  (
    .C(clk),
    .D(\BU2/U0/i_comp_eff.i_eff/i_legacy.i_sin_adj/result [13]),
    .Q(\BU2/U0/i_comp_eff.i_eff/sin_mult_adj [13])
  );
  FD #(
    .INIT ( 1'b0 ))
  \BU2/U0/i_comp_eff.i_eff/i_legacy.i_sin_adj/i_output_reg/opt_has_reg.i_reg/fd/output_13  (
    .C(clk),
    .D(\BU2/U0/i_comp_eff.i_eff/i_legacy.i_sin_adj/result [12]),
    .Q(\BU2/U0/i_comp_eff.i_eff/sin_mult_adj [12])
  );
  FD #(
    .INIT ( 1'b0 ))
  \BU2/U0/i_comp_eff.i_eff/i_legacy.i_sin_adj/i_output_reg/opt_has_reg.i_reg/fd/output_12  (
    .C(clk),
    .D(\BU2/U0/i_comp_eff.i_eff/i_legacy.i_sin_adj/result [11]),
    .Q(\BU2/U0/i_comp_eff.i_eff/sin_mult_adj [11])
  );
  FD #(
    .INIT ( 1'b0 ))
  \BU2/U0/i_comp_eff.i_eff/i_legacy.i_sin_adj/i_output_reg/opt_has_reg.i_reg/fd/output_11  (
    .C(clk),
    .D(\BU2/U0/i_comp_eff.i_eff/i_legacy.i_sin_adj/result [10]),
    .Q(\BU2/U0/i_comp_eff.i_eff/sin_mult_adj [10])
  );
  FD #(
    .INIT ( 1'b0 ))
  \BU2/U0/i_comp_eff.i_eff/i_legacy.i_sin_adj/i_output_reg/opt_has_reg.i_reg/fd/output_10  (
    .C(clk),
    .D(\BU2/U0/i_comp_eff.i_eff/i_legacy.i_sin_adj/result [9]),
    .Q(\BU2/U0/i_comp_eff.i_eff/sin_mult_adj [9])
  );
  FD #(
    .INIT ( 1'b0 ))
  \BU2/U0/i_comp_eff.i_eff/i_legacy.i_sin_adj/i_output_reg/opt_has_reg.i_reg/fd/output_9  (
    .C(clk),
    .D(\BU2/U0/i_comp_eff.i_eff/i_legacy.i_sin_adj/result [8]),
    .Q(\BU2/U0/i_comp_eff.i_eff/sin_mult_adj [8])
  );
  FD #(
    .INIT ( 1'b0 ))
  \BU2/U0/i_comp_eff.i_eff/i_legacy.i_sin_adj/i_output_reg/opt_has_reg.i_reg/fd/output_8  (
    .C(clk),
    .D(\BU2/U0/i_comp_eff.i_eff/i_legacy.i_sin_adj/result [7]),
    .Q(\BU2/U0/i_comp_eff.i_eff/sin_mult_adj [7])
  );
  FD #(
    .INIT ( 1'b0 ))
  \BU2/U0/i_comp_eff.i_eff/i_legacy.i_sin_adj/i_output_reg/opt_has_reg.i_reg/fd/output_7  (
    .C(clk),
    .D(\BU2/U0/i_comp_eff.i_eff/i_legacy.i_sin_adj/result [6]),
    .Q(\BU2/U0/i_comp_eff.i_eff/sin_mult_adj [6])
  );
  FD #(
    .INIT ( 1'b0 ))
  \BU2/U0/i_comp_eff.i_eff/i_legacy.i_sin_adj/i_output_reg/opt_has_reg.i_reg/fd/output_6  (
    .C(clk),
    .D(\BU2/U0/i_comp_eff.i_eff/i_legacy.i_sin_adj/result [5]),
    .Q(\BU2/U0/i_comp_eff.i_eff/sin_mult_adj [5])
  );
  FD #(
    .INIT ( 1'b0 ))
  \BU2/U0/i_comp_eff.i_eff/i_legacy.i_sin_adj/i_output_reg/opt_has_reg.i_reg/fd/output_5  (
    .C(clk),
    .D(\BU2/U0/i_comp_eff.i_eff/i_legacy.i_sin_adj/result [4]),
    .Q(\BU2/U0/i_comp_eff.i_eff/sin_mult_adj [4])
  );
  FD #(
    .INIT ( 1'b0 ))
  \BU2/U0/i_comp_eff.i_eff/i_legacy.i_sin_adj/i_output_reg/opt_has_reg.i_reg/fd/output_4  (
    .C(clk),
    .D(\BU2/U0/i_comp_eff.i_eff/i_legacy.i_sin_adj/result [3]),
    .Q(\BU2/U0/i_comp_eff.i_eff/sin_mult_adj [3])
  );
  FD #(
    .INIT ( 1'b0 ))
  \BU2/U0/i_comp_eff.i_eff/i_legacy.i_sin_adj/i_output_reg/opt_has_reg.i_reg/fd/output_3  (
    .C(clk),
    .D(\BU2/U0/i_comp_eff.i_eff/i_legacy.i_sin_adj/result [2]),
    .Q(\BU2/U0/i_comp_eff.i_eff/sin_mult_adj [2])
  );
  FD #(
    .INIT ( 1'b0 ))
  \BU2/U0/i_comp_eff.i_eff/i_legacy.i_sin_adj/i_output_reg/opt_has_reg.i_reg/fd/output_2  (
    .C(clk),
    .D(\BU2/U0/i_comp_eff.i_eff/i_legacy.i_sin_adj/result [1]),
    .Q(\BU2/U0/i_comp_eff.i_eff/sin_mult_adj [1])
  );
  FD #(
    .INIT ( 1'b0 ))
  \BU2/U0/i_comp_eff.i_eff/i_legacy.i_sin_adj/i_output_reg/opt_has_reg.i_reg/fd/output_1  (
    .C(clk),
    .D(\BU2/U0/i_comp_eff.i_eff/i_legacy.i_sin_adj/result [0]),
    .Q(\BU2/U0/i_comp_eff.i_eff/sin_mult_adj [0])
  );
  FD #(
    .INIT ( 1'b0 ))
  \BU2/U0/i_rom/i_rtl.i_half_table.i_rom_reg_a/opt_has_reg.i_reg/fd/output_18  (
    .C(clk),
    .D(\BU2/U0/i_rom/pre_asyn_sin_RAM_op [17]),
    .Q(\BU2/U0/i_rom/sin_RAM_op [17])
  );
  FD #(
    .INIT ( 1'b0 ))
  \BU2/U0/i_rom/i_rtl.i_half_table.i_rom_reg_a/opt_has_reg.i_reg/fd/output_17  (
    .C(clk),
    .D(\BU2/U0/i_rom/pre_asyn_sin_RAM_op [16]),
    .Q(\BU2/U0/i_rom/sin_RAM_op [16])
  );
  FD #(
    .INIT ( 1'b0 ))
  \BU2/U0/i_rom/i_rtl.i_half_table.i_rom_reg_a/opt_has_reg.i_reg/fd/output_16  (
    .C(clk),
    .D(\BU2/U0/i_rom/pre_asyn_sin_RAM_op [15]),
    .Q(\BU2/U0/i_rom/sin_RAM_op [15])
  );
  FD #(
    .INIT ( 1'b0 ))
  \BU2/U0/i_rom/i_rtl.i_half_table.i_rom_reg_a/opt_has_reg.i_reg/fd/output_15  (
    .C(clk),
    .D(\BU2/U0/i_rom/pre_asyn_sin_RAM_op [14]),
    .Q(\BU2/U0/i_rom/sin_RAM_op [14])
  );
  FD #(
    .INIT ( 1'b0 ))
  \BU2/U0/i_rom/i_rtl.i_half_table.i_rom_reg_a/opt_has_reg.i_reg/fd/output_14  (
    .C(clk),
    .D(\BU2/U0/i_rom/pre_asyn_sin_RAM_op [13]),
    .Q(\BU2/U0/i_rom/sin_RAM_op [13])
  );
  FD #(
    .INIT ( 1'b0 ))
  \BU2/U0/i_rom/i_rtl.i_half_table.i_rom_reg_a/opt_has_reg.i_reg/fd/output_13  (
    .C(clk),
    .D(\BU2/U0/i_rom/pre_asyn_sin_RAM_op [12]),
    .Q(\BU2/U0/i_rom/sin_RAM_op [12])
  );
  FD #(
    .INIT ( 1'b0 ))
  \BU2/U0/i_rom/i_rtl.i_half_table.i_rom_reg_a/opt_has_reg.i_reg/fd/output_12  (
    .C(clk),
    .D(\BU2/U0/i_rom/pre_asyn_sin_RAM_op [11]),
    .Q(\BU2/U0/i_rom/sin_RAM_op [11])
  );
  FD #(
    .INIT ( 1'b0 ))
  \BU2/U0/i_rom/i_rtl.i_half_table.i_rom_reg_a/opt_has_reg.i_reg/fd/output_11  (
    .C(clk),
    .D(\BU2/U0/i_rom/pre_asyn_sin_RAM_op [10]),
    .Q(\BU2/U0/i_rom/sin_RAM_op [10])
  );
  FD #(
    .INIT ( 1'b0 ))
  \BU2/U0/i_rom/i_rtl.i_half_table.i_rom_reg_a/opt_has_reg.i_reg/fd/output_10  (
    .C(clk),
    .D(\BU2/U0/i_rom/pre_asyn_sin_RAM_op [9]),
    .Q(\BU2/U0/i_rom/sin_RAM_op [9])
  );
  FD #(
    .INIT ( 1'b0 ))
  \BU2/U0/i_rom/i_rtl.i_half_table.i_rom_reg_a/opt_has_reg.i_reg/fd/output_9  (
    .C(clk),
    .D(\BU2/U0/i_rom/pre_asyn_sin_RAM_op [8]),
    .Q(\BU2/U0/i_rom/sin_RAM_op [8])
  );
  FD #(
    .INIT ( 1'b0 ))
  \BU2/U0/i_rom/i_rtl.i_half_table.i_rom_reg_a/opt_has_reg.i_reg/fd/output_8  (
    .C(clk),
    .D(\BU2/U0/i_rom/pre_asyn_sin_RAM_op [7]),
    .Q(\BU2/U0/i_rom/sin_RAM_op [7])
  );
  FD #(
    .INIT ( 1'b0 ))
  \BU2/U0/i_rom/i_rtl.i_half_table.i_rom_reg_a/opt_has_reg.i_reg/fd/output_7  (
    .C(clk),
    .D(\BU2/U0/i_rom/pre_asyn_sin_RAM_op [6]),
    .Q(\BU2/U0/i_rom/sin_RAM_op [6])
  );
  FD #(
    .INIT ( 1'b0 ))
  \BU2/U0/i_rom/i_rtl.i_half_table.i_rom_reg_a/opt_has_reg.i_reg/fd/output_6  (
    .C(clk),
    .D(\BU2/U0/i_rom/pre_asyn_sin_RAM_op [5]),
    .Q(\BU2/U0/i_rom/sin_RAM_op [5])
  );
  FD #(
    .INIT ( 1'b0 ))
  \BU2/U0/i_rom/i_rtl.i_half_table.i_rom_reg_a/opt_has_reg.i_reg/fd/output_5  (
    .C(clk),
    .D(\BU2/U0/i_rom/pre_asyn_sin_RAM_op [4]),
    .Q(\BU2/U0/i_rom/sin_RAM_op [4])
  );
  FD #(
    .INIT ( 1'b0 ))
  \BU2/U0/i_rom/i_rtl.i_half_table.i_rom_reg_a/opt_has_reg.i_reg/fd/output_4  (
    .C(clk),
    .D(\BU2/U0/i_rom/pre_asyn_sin_RAM_op [3]),
    .Q(\BU2/U0/i_rom/sin_RAM_op [3])
  );
  FD #(
    .INIT ( 1'b0 ))
  \BU2/U0/i_rom/i_rtl.i_half_table.i_rom_reg_a/opt_has_reg.i_reg/fd/output_3  (
    .C(clk),
    .D(\BU2/U0/i_rom/pre_asyn_sin_RAM_op [2]),
    .Q(\BU2/U0/i_rom/sin_RAM_op [2])
  );
  FD #(
    .INIT ( 1'b0 ))
  \BU2/U0/i_rom/i_rtl.i_half_table.i_rom_reg_a/opt_has_reg.i_reg/fd/output_2  (
    .C(clk),
    .D(\BU2/U0/i_rom/pre_asyn_sin_RAM_op [1]),
    .Q(\BU2/U0/i_rom/sin_RAM_op [1])
  );
  FD #(
    .INIT ( 1'b0 ))
  \BU2/U0/i_rom/i_rtl.i_half_table.i_rom_reg_a/opt_has_reg.i_reg/fd/output_1  (
    .C(clk),
    .D(\BU2/U0/i_rom/pre_asyn_sin_RAM_op [0]),
    .Q(\BU2/U0/i_rom/sin_RAM_op [0])
  );
  FD #(
    .INIT ( 1'b0 ))
  \BU2/U0/i_rom/i_rtl.i_half_table.i_rom_reg_b/opt_has_reg.i_reg/fd/output_18  (
    .C(clk),
    .D(\BU2/U0/i_rom/pre_asyn_cos_RAM_op [17]),
    .Q(\BU2/U0/i_rom/cos_RAM_op [17])
  );
  FD #(
    .INIT ( 1'b0 ))
  \BU2/U0/i_rom/i_rtl.i_half_table.i_rom_reg_b/opt_has_reg.i_reg/fd/output_17  (
    .C(clk),
    .D(\BU2/U0/i_rom/pre_asyn_cos_RAM_op [16]),
    .Q(\BU2/U0/i_rom/cos_RAM_op [16])
  );
  FD #(
    .INIT ( 1'b0 ))
  \BU2/U0/i_rom/i_rtl.i_half_table.i_rom_reg_b/opt_has_reg.i_reg/fd/output_16  (
    .C(clk),
    .D(\BU2/U0/i_rom/pre_asyn_cos_RAM_op [15]),
    .Q(\BU2/U0/i_rom/cos_RAM_op [15])
  );
  FD #(
    .INIT ( 1'b0 ))
  \BU2/U0/i_rom/i_rtl.i_half_table.i_rom_reg_b/opt_has_reg.i_reg/fd/output_15  (
    .C(clk),
    .D(\BU2/U0/i_rom/pre_asyn_cos_RAM_op [14]),
    .Q(\BU2/U0/i_rom/cos_RAM_op [14])
  );
  FD #(
    .INIT ( 1'b0 ))
  \BU2/U0/i_rom/i_rtl.i_half_table.i_rom_reg_b/opt_has_reg.i_reg/fd/output_14  (
    .C(clk),
    .D(\BU2/U0/i_rom/pre_asyn_cos_RAM_op [13]),
    .Q(\BU2/U0/i_rom/cos_RAM_op [13])
  );
  FD #(
    .INIT ( 1'b0 ))
  \BU2/U0/i_rom/i_rtl.i_half_table.i_rom_reg_b/opt_has_reg.i_reg/fd/output_13  (
    .C(clk),
    .D(\BU2/U0/i_rom/pre_asyn_cos_RAM_op [12]),
    .Q(\BU2/U0/i_rom/cos_RAM_op [12])
  );
  FD #(
    .INIT ( 1'b0 ))
  \BU2/U0/i_rom/i_rtl.i_half_table.i_rom_reg_b/opt_has_reg.i_reg/fd/output_12  (
    .C(clk),
    .D(\BU2/U0/i_rom/pre_asyn_cos_RAM_op [11]),
    .Q(\BU2/U0/i_rom/cos_RAM_op [11])
  );
  FD #(
    .INIT ( 1'b0 ))
  \BU2/U0/i_rom/i_rtl.i_half_table.i_rom_reg_b/opt_has_reg.i_reg/fd/output_11  (
    .C(clk),
    .D(\BU2/U0/i_rom/pre_asyn_cos_RAM_op [10]),
    .Q(\BU2/U0/i_rom/cos_RAM_op [10])
  );
  FD #(
    .INIT ( 1'b0 ))
  \BU2/U0/i_rom/i_rtl.i_half_table.i_rom_reg_b/opt_has_reg.i_reg/fd/output_10  (
    .C(clk),
    .D(\BU2/U0/i_rom/pre_asyn_cos_RAM_op [9]),
    .Q(\BU2/U0/i_rom/cos_RAM_op [9])
  );
  FD #(
    .INIT ( 1'b0 ))
  \BU2/U0/i_rom/i_rtl.i_half_table.i_rom_reg_b/opt_has_reg.i_reg/fd/output_9  (
    .C(clk),
    .D(\BU2/U0/i_rom/pre_asyn_cos_RAM_op [8]),
    .Q(\BU2/U0/i_rom/cos_RAM_op [8])
  );
  FD #(
    .INIT ( 1'b0 ))
  \BU2/U0/i_rom/i_rtl.i_half_table.i_has_sin.i_addr_reg_a/opt_has_reg.i_reg/fd/output_10  (
    .C(clk),
    .D(\BU2/U0/acc_phase_adjusted [27]),
    .Q(\BU2/U0/i_rom/mod_sin_addr [9])
  );
  FD #(
    .INIT ( 1'b0 ))
  \BU2/U0/i_rom/i_rtl.i_half_table.i_has_sin.i_addr_reg_a/opt_has_reg.i_reg/fd/output_9  (
    .C(clk),
    .D(\BU2/U0/i_rom/asyn_mod_sin_addr [8]),
    .Q(\BU2/U0/i_rom/mod_sin_addr [8])
  );
  FD #(
    .INIT ( 1'b0 ))
  \BU2/U0/i_rom/i_rtl.i_half_table.i_has_sin.i_addr_reg_a/opt_has_reg.i_reg/fd/output_8  (
    .C(clk),
    .D(\BU2/U0/i_rom/asyn_mod_sin_addr [7]),
    .Q(\BU2/U0/i_rom/mod_sin_addr [7])
  );
  FD #(
    .INIT ( 1'b0 ))
  \BU2/U0/i_rom/i_rtl.i_half_table.i_has_sin.i_addr_reg_a/opt_has_reg.i_reg/fd/output_7  (
    .C(clk),
    .D(\BU2/U0/i_rom/asyn_mod_sin_addr [6]),
    .Q(\BU2/U0/i_rom/mod_sin_addr [6])
  );
  FD #(
    .INIT ( 1'b0 ))
  \BU2/U0/i_rom/i_rtl.i_half_table.i_has_sin.i_addr_reg_a/opt_has_reg.i_reg/fd/output_6  (
    .C(clk),
    .D(\BU2/U0/i_rom/asyn_mod_sin_addr [5]),
    .Q(\BU2/U0/i_rom/mod_sin_addr [5])
  );
  FD #(
    .INIT ( 1'b0 ))
  \BU2/U0/i_rom/i_rtl.i_half_table.i_has_sin.i_addr_reg_a/opt_has_reg.i_reg/fd/output_5  (
    .C(clk),
    .D(\BU2/U0/i_rom/asyn_mod_sin_addr [4]),
    .Q(\BU2/U0/i_rom/mod_sin_addr [4])
  );
  FD #(
    .INIT ( 1'b0 ))
  \BU2/U0/i_rom/i_rtl.i_half_table.i_has_sin.i_addr_reg_a/opt_has_reg.i_reg/fd/output_4  (
    .C(clk),
    .D(\BU2/U0/i_rom/asyn_mod_sin_addr [3]),
    .Q(\BU2/U0/i_rom/mod_sin_addr [3])
  );
  FD #(
    .INIT ( 1'b0 ))
  \BU2/U0/i_rom/i_rtl.i_half_table.i_has_sin.i_addr_reg_a/opt_has_reg.i_reg/fd/output_3  (
    .C(clk),
    .D(\BU2/U0/i_rom/asyn_mod_sin_addr [2]),
    .Q(\BU2/U0/i_rom/mod_sin_addr [2])
  );
  FD #(
    .INIT ( 1'b0 ))
  \BU2/U0/i_rom/i_rtl.i_half_table.i_has_sin.i_addr_reg_a/opt_has_reg.i_reg/fd/output_2  (
    .C(clk),
    .D(\BU2/U0/i_rom/asyn_mod_sin_addr [1]),
    .Q(\BU2/U0/i_rom/mod_sin_addr [1])
  );
  FD #(
    .INIT ( 1'b0 ))
  \BU2/U0/i_rom/i_rtl.i_half_table.i_has_sin.i_addr_reg_a/opt_has_reg.i_reg/fd/output_1  (
    .C(clk),
    .D(\BU2/U0/i_rom/asyn_mod_sin_addr [0]),
    .Q(\BU2/U0/i_rom/mod_sin_addr [0])
  );
  FD #(
    .INIT ( 1'b0 ))
  \BU2/U0/i_rom/i_rtl.i_half_table.i_has_cos.i_addr_reg_b/opt_has_reg.i_reg/fd/output_10  (
    .C(clk),
    .D(\BU2/U0/i_rom/asyn_mod_cos_addr [9]),
    .Q(\BU2/U0/i_rom/mod_cos_addr [9])
  );
  FD #(
    .INIT ( 1'b0 ))
  \BU2/U0/i_rom/i_rtl.i_half_table.i_has_cos.i_addr_reg_b/opt_has_reg.i_reg/fd/output_9  (
    .C(clk),
    .D(\BU2/U0/i_rom/asyn_mod_cos_addr [8]),
    .Q(\BU2/U0/i_rom/mod_cos_addr [8])
  );
  FD #(
    .INIT ( 1'b0 ))
  \BU2/U0/i_rom/i_rtl.i_half_table.i_has_cos.i_addr_reg_b/opt_has_reg.i_reg/fd/output_8  (
    .C(clk),
    .D(\BU2/U0/i_rom/asyn_mod_cos_addr [7]),
    .Q(\BU2/U0/i_rom/mod_cos_addr [7])
  );
  FD #(
    .INIT ( 1'b0 ))
  \BU2/U0/i_rom/i_rtl.i_half_table.i_has_cos.i_addr_reg_b/opt_has_reg.i_reg/fd/output_7  (
    .C(clk),
    .D(\BU2/U0/i_rom/asyn_mod_cos_addr [6]),
    .Q(\BU2/U0/i_rom/mod_cos_addr [6])
  );
  FD #(
    .INIT ( 1'b0 ))
  \BU2/U0/i_rom/i_rtl.i_half_table.i_has_cos.i_addr_reg_b/opt_has_reg.i_reg/fd/output_6  (
    .C(clk),
    .D(\BU2/U0/i_rom/asyn_mod_cos_addr [5]),
    .Q(\BU2/U0/i_rom/mod_cos_addr [5])
  );
  FD #(
    .INIT ( 1'b0 ))
  \BU2/U0/i_rom/i_rtl.i_half_table.i_has_cos.i_addr_reg_b/opt_has_reg.i_reg/fd/output_5  (
    .C(clk),
    .D(\BU2/U0/i_rom/asyn_mod_cos_addr [4]),
    .Q(\BU2/U0/i_rom/mod_cos_addr [4])
  );
  FD #(
    .INIT ( 1'b0 ))
  \BU2/U0/i_rom/i_rtl.i_half_table.i_has_cos.i_addr_reg_b/opt_has_reg.i_reg/fd/output_4  (
    .C(clk),
    .D(\BU2/U0/i_rom/asyn_mod_cos_addr [3]),
    .Q(\BU2/U0/i_rom/mod_cos_addr [3])
  );
  FD #(
    .INIT ( 1'b0 ))
  \BU2/U0/i_rom/i_rtl.i_half_table.i_has_cos.i_addr_reg_b/opt_has_reg.i_reg/fd/output_3  (
    .C(clk),
    .D(\BU2/U0/i_rom/asyn_mod_cos_addr [2]),
    .Q(\BU2/U0/i_rom/mod_cos_addr [2])
  );
  FD #(
    .INIT ( 1'b0 ))
  \BU2/U0/i_rom/i_rtl.i_half_table.i_has_cos.i_addr_reg_b/opt_has_reg.i_reg/fd/output_2  (
    .C(clk),
    .D(\BU2/U0/i_rom/asyn_mod_cos_addr [1]),
    .Q(\BU2/U0/i_rom/mod_cos_addr [1])
  );
  FD #(
    .INIT ( 1'b0 ))
  \BU2/U0/i_rom/i_rtl.i_half_table.i_has_cos.i_addr_reg_b/opt_has_reg.i_reg/fd/output_1  (
    .C(clk),
    .D(\BU2/U0/i_rom/asyn_mod_cos_addr [0]),
    .Q(\BU2/U0/i_rom/mod_cos_addr [0])
  );

// synthesis translate_on

endmodule

// synthesis translate_off

`timescale  1 ps / 1 ps

module glbl ();

    parameter ROC_WIDTH = 100000;
    parameter TOC_WIDTH = 0;

    wire GSR;
    wire GTS;
    wire PRLD;

    reg GSR_int;
    reg GTS_int;
    reg PRLD_int;

//--------   JTAG Globals --------------
    wire JTAG_TDO_GLBL;
    wire JTAG_TCK_GLBL;
    wire JTAG_TDI_GLBL;
    wire JTAG_TMS_GLBL;
    wire JTAG_TRST_GLBL;

    reg JTAG_CAPTURE_GLBL;
    reg JTAG_RESET_GLBL;
    reg JTAG_SHIFT_GLBL;
    reg JTAG_UPDATE_GLBL;

    reg JTAG_SEL1_GLBL = 0;
    reg JTAG_SEL2_GLBL = 0 ;
    reg JTAG_SEL3_GLBL = 0;
    reg JTAG_SEL4_GLBL = 0;

    reg JTAG_USER_TDO1_GLBL = 1'bz;
    reg JTAG_USER_TDO2_GLBL = 1'bz;
    reg JTAG_USER_TDO3_GLBL = 1'bz;
    reg JTAG_USER_TDO4_GLBL = 1'bz;

    assign (weak1, weak0) GSR = GSR_int;
    assign (weak1, weak0) GTS = GTS_int;
    assign (weak1, weak0) PRLD = PRLD_int;

    initial begin
	GSR_int = 1'b1;
	PRLD_int = 1'b1;
	#(ROC_WIDTH)
	GSR_int = 1'b0;
	PRLD_int = 1'b0;
    end

    initial begin
	GTS_int = 1'b1;
	#(TOC_WIDTH)
	GTS_int = 1'b0;
    end

endmodule

// synthesis translate_on
