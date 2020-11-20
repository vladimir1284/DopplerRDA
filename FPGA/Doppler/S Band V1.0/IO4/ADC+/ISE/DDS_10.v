////////////////////////////////////////////////////////////////////////////////
// Copyright (c) 1995-2008 Xilinx, Inc.  All rights reserved.
////////////////////////////////////////////////////////////////////////////////
//   ____  ____
//  /   /\/   /
// /___/  \  /    Vendor: Xilinx
// \   \   \/     Version: K.31
//  \   \         Application: netgen
//  /   /         Filename: DDS_10.v
// /___/   /\     Timestamp: Fri Feb 28 11:02:48 2020
// \   \  /  \ 
//  \___\/\___\
//             
// Command	: -intstyle ise -w -sim -ofmt verilog "D:\Proyecto Radar CSB\Doppler RDA\FPGA\Doppler\S Band\IO4\ADC+\ISE\tmp\_cg\DDS_10.ngc" "D:\Proyecto Radar CSB\Doppler RDA\FPGA\Doppler\S Band\IO4\ADC+\ISE\tmp\_cg\DDS_10.v" 
// Device	: 2v1000fg456-4
// Input file	: D:/Proyecto Radar CSB/Doppler RDA/FPGA/Doppler/S Band/IO4/ADC+/ISE/tmp/_cg/DDS_10.ngc
// Output file	: D:/Proyecto Radar CSB/Doppler RDA/FPGA/Doppler/S Band/IO4/ADC+/ISE/tmp/_cg/DDS_10.v
// # of Modules	: 1
// Design Name	: DDS_10
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

module DDS_10 (
  rdy, clk, sine
);
  output rdy;
  input clk;
  output [13 : 0] sine;
  
  // synthesis translate_off
  
  wire \BU2/U0/lfsr3_1411 ;
  wire \BU2/U0/lfsr4_1311 ;
  wire \BU2/U0/lfsr2_1311 ;
  wire \BU2/channel<0>_shift4_916 ;
  wire \BU2/channel<0>_shift3_915 ;
  wire \BU2/channel<0>_shift2_914 ;
  wire \BU2/channel<0>_shift1_913 ;
  wire \BU2/U0/lfsr3_141_912 ;
  wire \BU2/U0/Mshreg_lfsr3_14_911 ;
  wire \BU2/U0/lfsr4_131_910 ;
  wire \BU2/U0/Mshreg_lfsr4_13_909 ;
  wire \BU2/U0/lfsr2_131_908 ;
  wire \BU2/U0/Mshreg_lfsr2_13_907 ;
  wire \BU2/N13 ;
  wire \BU2/N12 ;
  wire \BU2/U0/i_rom/Madd_asyn_sin_ls1_xor<6>11_904 ;
  wire \BU2/N2 ;
  wire \BU2/U0/i_rom/Madd_asyn_sin_ls1_xor<6>1 ;
  wire \BU2/U0/i_rom/N27 ;
  wire \BU2/U0/i_rom/N6 ;
  wire \BU2/N11 ;
  wire \BU2/U0/i_rom/N4 ;
  wire \BU2/U0/i_rom/N101 ;
  wire \BU2/N10 ;
  wire \BU2/U0/lfsr2_132_895 ;
  wire \BU2/U0/lfsr3_142_894 ;
  wire \BU2/U0/lfsr2_not0001 ;
  wire \BU2/U0/lfsr1_not0001 ;
  wire \BU2/U0/lfsr3_not0001 ;
  wire \BU2/U0/lfsr4_not0001 ;
  wire \BU2/U0/lfsr4_132_877 ;
  wire \BU2/U0/lfsr4[15] ;
  wire \BU2/U0/lfsr4[14] ;
  wire \BU2/U0/mutant_x_op_not0001 ;
  wire \BU2/U0/lfsr4[0] ;
  wire \BU2/U0/lfsr4[1] ;
  wire \BU2/U0/lfsr4[2] ;
  wire \BU2/U0/lfsr4[3] ;
  wire \BU2/U0/lfsr4[4] ;
  wire \BU2/U0/lfsr4[5] ;
  wire \BU2/U0/lfsr4[6] ;
  wire \BU2/U0/lfsr4[7] ;
  wire \BU2/U0/lfsr4[8] ;
  wire \BU2/U0/lfsr4[9] ;
  wire \BU2/U0/i_accum/phase_inc[0] ;
  wire \BU2/U0/i_accum/phase_inc[10] ;
  wire \BU2/U0/pre_rdy ;
  wire \BU2/U0/i_rom/Madd_asyn_sin_ms22 ;
  wire \BU2/U0/i_rom/Madd_asyn_sin_ms24 ;
  wire \BU2/U0/i_rom/Madd_asyn_sin_ms26 ;
  wire \BU2/U0/i_rom/Madd_asyn_sin_ms28 ;
  wire \BU2/U0/i_rom/Madd_asyn_sin_ms210 ;
  wire \BU2/U0/i_rom/Madd_asyn_sin_ms212 ;
  wire \BU2/U0/i_rom/Madd_asyn_sin_ms2 ;
  wire \BU2/U0/i_rom/Madd_asyn_sin_ls1 ;
  wire \BU2/N1 ;
  wire \BU2/ce ;
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
  wire \NLW_BU2/U0/i_rom/Mram_sin_cos_lut_DOA<15>_UNCONNECTED ;
  wire \NLW_BU2/U0/i_rom/Mram_sin_cos_lut_DOA<14>_UNCONNECTED ;
  wire \NLW_BU2/U0/i_rom/Mram_sin_cos_lut_DOA<13>_UNCONNECTED ;
  wire \NLW_BU2/U0/i_rom/Mram_sin_cos_lut_DOPA<1>_UNCONNECTED ;
  wire \NLW_BU2/U0/i_rom/Mram_sin_cos_lut_DOPA<0>_UNCONNECTED ;
  wire \NLW_BU2/U0/i_rom/Mram_sin_cos_lut_DOB<15>_UNCONNECTED ;
  wire \NLW_BU2/U0/i_rom/Mram_sin_cos_lut_DOB<14>_UNCONNECTED ;
  wire \NLW_BU2/U0/i_rom/Mram_sin_cos_lut_DOB<13>_UNCONNECTED ;
  wire \NLW_BU2/U0/i_rom/Mram_sin_cos_lut_DOB<12>_UNCONNECTED ;
  wire \NLW_BU2/U0/i_rom/Mram_sin_cos_lut_DOB<11>_UNCONNECTED ;
  wire \NLW_BU2/U0/i_rom/Mram_sin_cos_lut_DOB<10>_UNCONNECTED ;
  wire \NLW_BU2/U0/i_rom/Mram_sin_cos_lut_DOB<9>_UNCONNECTED ;
  wire \NLW_BU2/U0/i_rom/Mram_sin_cos_lut_DOB<8>_UNCONNECTED ;
  wire \NLW_BU2/U0/i_rom/Mram_sin_cos_lut_DOB<7>_UNCONNECTED ;
  wire \NLW_BU2/U0/i_rom/Mram_sin_cos_lut_DOB<6>_UNCONNECTED ;
  wire \NLW_BU2/U0/i_rom/Mram_sin_cos_lut_DOB<5>_UNCONNECTED ;
  wire \NLW_BU2/U0/i_rom/Mram_sin_cos_lut_DOB<4>_UNCONNECTED ;
  wire \NLW_BU2/U0/i_rom/Mram_sin_cos_lut_DOB<3>_UNCONNECTED ;
  wire \NLW_BU2/U0/i_rom/Mram_sin_cos_lut_DOB<2>_UNCONNECTED ;
  wire \NLW_BU2/U0/i_rom/Mram_sin_cos_lut_DOB<1>_UNCONNECTED ;
  wire \NLW_BU2/U0/i_rom/Mram_sin_cos_lut_DOB<0>_UNCONNECTED ;
  wire \NLW_BU2/U0/i_rom/Mram_sin_cos_lut_DOPB<1>_UNCONNECTED ;
  wire \NLW_BU2/U0/i_rom/Mram_sin_cos_lut_DOPB<0>_UNCONNECTED ;
  wire [13 : 0] sine_2;
  wire [8 : 0] \BU2/U0/i_rom/asyn_mod_sin_addr ;
  wire [12 : 0] \BU2/U0/lfsr1 ;
  wire [2 : 0] \BU2/U0/mutant_x_op ;
  wire [2 : 0] \BU2/U0/Result ;
  wire [9 : 0] \BU2/U0/lfsr2 ;
  wire [10 : 0] \BU2/U0/Madd_precombine1_lut ;
  wire [9 : 0] \BU2/U0/Madd_precombine1_cy ;
  wire [9 : 0] \BU2/U0/lfsr3 ;
  wire [10 : 0] \BU2/U0/Madd_precombine2_lut ;
  wire [9 : 0] \BU2/U0/Madd_precombine2_cy ;
  wire [31 : 1] \BU2/U0/i_accum/i_fabric.i_one_channel.i_accum/Madd_temp_lut ;
  wire [30 : 0] \BU2/U0/i_accum/i_fabric.i_one_channel.i_accum/Madd_temp_cy ;
  wire [11 : 0] \BU2/U0/Madd_precombine3_lut ;
  wire [10 : 0] \BU2/U0/Madd_precombine3_cy ;
  wire [31 : 12] \BU2/U0/i_fabric.i_dither_add.i_dither_add/Madd_temp_lut ;
  wire [30 : 12] \BU2/U0/i_fabric.i_dither_add.i_dither_add/Madd_temp_cy ;
  wire [10 : 1] \BU2/U0/precombine2 ;
  wire [10 : 0] \BU2/U0/combine2 ;
  wire [10 : 1] \BU2/U0/precombine1 ;
  wire [10 : 0] \BU2/U0/combine1 ;
  wire [11 : 2] \BU2/U0/precombine3 ;
  wire [11 : 2] \BU2/U0/combine3 ;
  wire [31 : 21] \BU2/U0/acc_phase_shaped_pre ;
  wire [31 : 21] \BU2/U0/acc_phase_shaped ;
  wire [31 : 0] \BU2/U0/acc_phase_adjusted ;
  wire [44 : 31] \BU2/U0/final_sin ;
  wire [31 : 0] \BU2/U0/i_accum/acc_phase_b ;
  wire [31 : 0] \BU2/U0/acc_phase ;
  wire [6 : 1] \BU2/U0/i_rom/asyn_sin_ls1 ;
  wire [6 : 6] \BU2/U0/i_rom/Madd_asyn_sin_ls1_cy ;
  wire [7 : 0] \BU2/U0/i_rom/sin_ls1 ;
  wire [6 : 0] \BU2/U0/i_rom/asyn_sin_ms1 ;
  wire [0 : 0] \BU2/U0/i_rom/sin_ms1 ;
  wire [6 : 1] \BU2/U0/i_rom/asyn_sin_ms2 ;
  wire [12 : 0] \BU2/U0/i_rom/pre_asyn_sin_RAM_op ;
  wire [12 : 1] \BU2/U0/i_rom/sin_RAM_op ;
  wire [0 : 0] \BU2/channel ;
  wire [1 : 0] \BU2/U0/i_rom/i_rtl.i_quarter_table.i_addr_reg_c/first_q ;
  assign
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
  FDRE #(
    .INIT ( 1'b0 ))
  \BU2/U0/lfsr3_142  (
    .C(clk),
    .CE(\BU2/N1 ),
    .D(\BU2/U0/lfsr3_1411 ),
    .R(\BU2/channel [0]),
    .Q(\BU2/U0/lfsr3_142_894 )
  );
  LUT2 #(
    .INIT ( 4'h8 ))
  \BU2/U0/lfsr3_141  (
    .I0(\BU2/U0/lfsr3_141_912 ),
    .I1(\BU2/channel<0>_shift4_916 ),
    .O(\BU2/U0/lfsr3_1411 )
  );
  FDRE #(
    .INIT ( 1'b0 ))
  \BU2/U0/lfsr4_132  (
    .C(clk),
    .CE(\BU2/N1 ),
    .D(\BU2/U0/lfsr4_1311 ),
    .R(\BU2/channel [0]),
    .Q(\BU2/U0/lfsr4_132_877 )
  );
  LUT2 #(
    .INIT ( 4'h8 ))
  \BU2/U0/lfsr4_131  (
    .I0(\BU2/U0/lfsr4_131_910 ),
    .I1(\BU2/channel<0>_shift3_915 ),
    .O(\BU2/U0/lfsr4_1311 )
  );
  FDRE #(
    .INIT ( 1'b0 ))
  \BU2/U0/lfsr2_132  (
    .C(clk),
    .CE(\BU2/N1 ),
    .D(\BU2/U0/lfsr2_1311 ),
    .R(\BU2/channel [0]),
    .Q(\BU2/U0/lfsr2_132_895 )
  );
  LUT2 #(
    .INIT ( 4'h8 ))
  \BU2/U0/lfsr2_131  (
    .I0(\BU2/U0/lfsr2_131_908 ),
    .I1(\BU2/channel<0>_shift3_915 ),
    .O(\BU2/U0/lfsr2_1311 )
  );
  FDRE   \BU2/channel<0>_shift4  (
    .C(clk),
    .CE(\BU2/N1 ),
    .D(\BU2/channel<0>_shift3_915 ),
    .R(\BU2/channel [0]),
    .Q(\BU2/channel<0>_shift4_916 )
  );
  FDRE   \BU2/channel<0>_shift3  (
    .C(clk),
    .CE(\BU2/N1 ),
    .D(\BU2/channel<0>_shift2_914 ),
    .R(\BU2/channel [0]),
    .Q(\BU2/channel<0>_shift3_915 )
  );
  FDRE   \BU2/channel<0>_shift2  (
    .C(clk),
    .CE(\BU2/N1 ),
    .D(\BU2/channel<0>_shift1_913 ),
    .R(\BU2/channel [0]),
    .Q(\BU2/channel<0>_shift2_914 )
  );
  FDRE   \BU2/channel<0>_shift1  (
    .C(clk),
    .CE(\BU2/N1 ),
    .D(\BU2/N1 ),
    .R(\BU2/channel [0]),
    .Q(\BU2/channel<0>_shift1_913 )
  );
  FDE #(
    .INIT ( 1'b0 ))
  \BU2/U0/lfsr3_14  (
    .C(clk),
    .CE(\BU2/N1 ),
    .D(\BU2/U0/Mshreg_lfsr3_14_911 ),
    .Q(\BU2/U0/lfsr3_141_912 )
  );
  SRL16E #(
    .INIT ( 16'h0000 ))
  \BU2/U0/Mshreg_lfsr3_14  (
    .A0(\BU2/channel [0]),
    .A1(\BU2/N1 ),
    .A2(\BU2/channel [0]),
    .A3(\BU2/channel [0]),
    .CE(\BU2/N1 ),
    .CLK(clk),
    .D(\BU2/U0/lfsr3 [9]),
    .Q(\BU2/U0/Mshreg_lfsr3_14_911 )
  );
  FDE #(
    .INIT ( 1'b0 ))
  \BU2/U0/lfsr4_13  (
    .C(clk),
    .CE(\BU2/N1 ),
    .D(\BU2/U0/Mshreg_lfsr4_13_909 ),
    .Q(\BU2/U0/lfsr4_131_910 )
  );
  SRL16E #(
    .INIT ( 16'h0000 ))
  \BU2/U0/Mshreg_lfsr4_13  (
    .A0(\BU2/N1 ),
    .A1(\BU2/channel [0]),
    .A2(\BU2/channel [0]),
    .A3(\BU2/channel [0]),
    .CE(\BU2/N1 ),
    .CLK(clk),
    .D(\BU2/U0/lfsr4[9] ),
    .Q(\BU2/U0/Mshreg_lfsr4_13_909 )
  );
  FDE #(
    .INIT ( 1'b0 ))
  \BU2/U0/lfsr2_13  (
    .C(clk),
    .CE(\BU2/N1 ),
    .D(\BU2/U0/Mshreg_lfsr2_13_907 ),
    .Q(\BU2/U0/lfsr2_131_908 )
  );
  SRL16E #(
    .INIT ( 16'h0000 ))
  \BU2/U0/Mshreg_lfsr2_13  (
    .A0(\BU2/N1 ),
    .A1(\BU2/channel [0]),
    .A2(\BU2/channel [0]),
    .A3(\BU2/channel [0]),
    .CE(\BU2/N1 ),
    .CLK(clk),
    .D(\BU2/U0/lfsr2 [9]),
    .Q(\BU2/U0/Mshreg_lfsr2_13_907 )
  );
  LUT4_D #(
    .INIT ( 16'hFFFE ))
  \BU2/U0/i_rom/Madd_asyn_sin_ls1_xor<4>1_SW0  (
    .I0(\BU2/U0/i_rom/sin_RAM_op [3]),
    .I1(\BU2/U0/i_rom/sin_RAM_op [2]),
    .I2(\BU2/U0/i_rom/Madd_asyn_sin_ls1 ),
    .I3(\BU2/U0/i_rom/sin_RAM_op [1]),
    .LO(\BU2/N13 ),
    .O(\BU2/N2 )
  );
  LUT2_D #(
    .INIT ( 4'hE ))
  \BU2/U0/i_rom/Madd_asyn_sin_ls1_xor<2>111  (
    .I0(\BU2/U0/i_rom/sin_RAM_op [1]),
    .I1(\BU2/U0/i_rom/Madd_asyn_sin_ls1 ),
    .LO(\BU2/N12 ),
    .O(\BU2/U0/i_rom/N4 )
  );
  LUT4_D #(
    .INIT ( 16'hFF7F ))
  \BU2/U0/i_rom/Madd_asyn_sin_ms2_xor<5>111  (
    .I0(\BU2/U0/i_rom/Madd_asyn_sin_ms24 ),
    .I1(\BU2/U0/i_rom/Madd_asyn_sin_ms26 ),
    .I2(\BU2/U0/i_rom/Madd_asyn_sin_ms28 ),
    .I3(\BU2/U0/i_rom/N101 ),
    .LO(\BU2/N11 ),
    .O(\BU2/U0/i_rom/N6 )
  );
  LUT3_D #(
    .INIT ( 8'h7F ))
  \BU2/U0/i_rom/Madd_asyn_sin_ms2_xor<2>111  (
    .I0(\BU2/U0/i_rom/Madd_asyn_sin_ms22 ),
    .I1(\BU2/U0/i_rom/sin_ls1 [7]),
    .I2(\BU2/U0/i_rom/sin_ms1 [0]),
    .LO(\BU2/N10 ),
    .O(\BU2/U0/i_rom/N101 )
  );
  RAMB16_S18_S18 #(
    .INIT_A ( 18'h00000 ),
    .INIT_B ( 18'h00000 ),
    .INIT_00 ( 256'h0185016C0153013A0121010800EF00D600BC00A3008A00710058003F0026000D ),
    .INIT_01 ( 256'h031602FD02E402CB02B2029902800267024E0235021C020301EA01D101B8019E ),
    .INIT_02 ( 256'h04A5048C0474045B04420429041003F703DE03C503AC0393037A03610348032F ),
    .INIT_03 ( 256'h06310619060005E705CF05B6059D0585056C0553053A0521050904F004D704BE ),
    .INIT_04 ( 256'h07BA07A107890771075807400727070F06F606DE06C506AD0694067B0663064A ),
    .INIT_05 ( 256'h093D0925090D08F508DD08C508AD0894087C0864084C0833081B080307EB07D2 ),
    .INIT_06 ( 256'h0ABB0AA40A8C0A740A5C0A450A2D0A1509FD09E509CD09B5099D0985096D0955 ),
    .INIT_07 ( 256'h0C330C1B0C040BED0BD50BBE0BA70B8F0B780B600B490B310B1A0B020AEB0AD3 ),
    .INIT_08 ( 256'h0DA20D8C0D750D5E0D470D300D190D020CEB0CD40CBD0CA60C8F0C780C610C4A ),
    .INIT_09 ( 256'h0F0A0EF30EDD0EC70EB10E9A0E840E6E0E570E410E2A0E140DFD0DE60DD00DB9 ),
    .INIT_0A ( 256'h10681052103C102710110FFB0FE60FD00FBA0FA40F8E0F780F620F4C0F360F20 ),
    .INIT_0B ( 256'h11BC11A71192117D11681153113D1128111310FE10E810D310BE10A81093107D ),
    .INIT_0C ( 256'h130512F012DC12C812B3129F128B12761262124D12381224120F11FA11E511D1 ),
    .INIT_0D ( 256'h1442142E141B140713F413E013CC13B913A51391137D136913551341132D1319 ),
    .INIT_0E ( 256'h15731560154D153B15281515150214EF14DC14C914B614A3148F147C14691455 ),
    .INIT_0F ( 256'h1696168416731661164F163D162B1618160615F415E215CF15BD15AA15981585 ),
    .INIT_10 ( 256'h17AC179B178A1779176817571746173417231712170016EF16DD16CB16BA16A8 ),
    .INIT_11 ( 256'h18B318A3189318831873186218521842183118211810180017EF17DE17CE17BD ),
    .INIT_12 ( 256'h19AB199C198D197E196E195F19501940193119211912190218F218E318D318C3 ),
    .INIT_13 ( 256'h1A931A851A771A681A5A1A4C1A3E1A2F1A211A121A0419F519E619D719C919BA ),
    .INIT_14 ( 256'h1B6A1B5D1B501B431B361B291B1B1B0E1B011AF31AE61AD81ACA1ABC1AAF1AA1 ),
    .INIT_15 ( 256'h1C311C251C191C0D1C011BF51BE91BDC1BD01BC31BB71BAA1B9E1B911B841B77 ),
    .INIT_16 ( 256'h1CE61CDB1CD11CC61CBB1CB01CA41C991C8E1C821C771C6C1C601C541C491C3D ),
    .INIT_17 ( 256'h1D8A1D801D761D6C1D631D591D4F1D441D3A1D301D261D1B1D111D061CFC1CF1 ),
    .INIT_18 ( 256'h1E1B1E121E0A1E011DF81DF01DE71DDE1DD51DCC1DC21DB91DB01DA61D9D1D93 ),
    .INIT_19 ( 256'h1E9A1E921E8B1E831E7C1E741E6C1E651E5D1E551E4D1E451E3C1E341E2C1E23 ),
    .INIT_1A ( 256'h1F051EFF1EF91EF31EEC1EE61EDF1ED91ED21ECB1EC41EBD1EB61EAF1EA81EA1 ),
    .INIT_1B ( 256'h1F5E1F591F541F4F1F4A1F451F3F1F3A1F341F2F1F291F231F1D1F181F121F0C ),
    .INIT_1C ( 256'h1FA41FA01F9C1F981F941F901F8C1F881F831F7F1F7A1F761F711F6D1F681F63 ),
    .INIT_1D ( 256'h1FD51FD31FD01FCD1FCB1FC81FC51FC21FBF1FBC1FB81FB51FB21FAE1FAB1FA7 ),
    .WRITE_MODE_B ( "WRITE_FIRST" ),
    .INIT_1E ( 256'h1FF41FF21FF11FEF1FEE1FEC1FEA1FE91FE71FE51FE31FE11FDF1FDC1FDA1FD8 ),
    .WRITE_MODE_A ( "READ_FIRST" ),
    .INIT_1F ( 256'h1FFE1FFE1FFE1FFE1FFD1FFD1FFC1FFC1FFB1FFB1FFA1FF91FF81FF71FF61FF5 ))
  \BU2/U0/i_rom/Mram_sin_cos_lut  (
    .CLKA(clk),
    .CLKB(clk),
    .ENA(\BU2/N1 ),
    .ENB(\BU2/N1 ),
    .SSRA(\BU2/channel [0]),
    .SSRB(\BU2/channel [0]),
    .WEA(\BU2/channel [0]),
    .WEB(\BU2/channel [0]),
    .ADDRA({\BU2/channel [0], \BU2/U0/i_rom/asyn_mod_sin_addr [8], \BU2/U0/i_rom/asyn_mod_sin_addr [7], \BU2/U0/i_rom/asyn_mod_sin_addr [6], 
\BU2/U0/i_rom/asyn_mod_sin_addr [5], \BU2/U0/i_rom/asyn_mod_sin_addr [4], \BU2/U0/i_rom/asyn_mod_sin_addr [3], \BU2/U0/i_rom/asyn_mod_sin_addr [2], 
\BU2/U0/i_rom/asyn_mod_sin_addr [1], \BU2/U0/i_rom/asyn_mod_sin_addr [0]}),
    .ADDRB({\BU2/channel [0], \BU2/channel [0], \BU2/channel [0], \BU2/channel [0], \BU2/channel [0], \BU2/channel [0], \BU2/channel [0], 
\BU2/channel [0], \BU2/channel [0], \BU2/channel [0]}),
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
    .DOA({\NLW_BU2/U0/i_rom/Mram_sin_cos_lut_DOA<15>_UNCONNECTED , \NLW_BU2/U0/i_rom/Mram_sin_cos_lut_DOA<14>_UNCONNECTED , 
\NLW_BU2/U0/i_rom/Mram_sin_cos_lut_DOA<13>_UNCONNECTED , \BU2/U0/i_rom/pre_asyn_sin_RAM_op [12], \BU2/U0/i_rom/pre_asyn_sin_RAM_op [11], 
\BU2/U0/i_rom/pre_asyn_sin_RAM_op [10], \BU2/U0/i_rom/pre_asyn_sin_RAM_op [9], \BU2/U0/i_rom/pre_asyn_sin_RAM_op [8], 
\BU2/U0/i_rom/pre_asyn_sin_RAM_op [7], \BU2/U0/i_rom/pre_asyn_sin_RAM_op [6], \BU2/U0/i_rom/pre_asyn_sin_RAM_op [5], 
\BU2/U0/i_rom/pre_asyn_sin_RAM_op [4], \BU2/U0/i_rom/pre_asyn_sin_RAM_op [3], \BU2/U0/i_rom/pre_asyn_sin_RAM_op [2], 
\BU2/U0/i_rom/pre_asyn_sin_RAM_op [1], \BU2/U0/i_rom/pre_asyn_sin_RAM_op [0]}),
    .DOPA({\NLW_BU2/U0/i_rom/Mram_sin_cos_lut_DOPA<1>_UNCONNECTED , \NLW_BU2/U0/i_rom/Mram_sin_cos_lut_DOPA<0>_UNCONNECTED }),
    .DOB({\NLW_BU2/U0/i_rom/Mram_sin_cos_lut_DOB<15>_UNCONNECTED , \NLW_BU2/U0/i_rom/Mram_sin_cos_lut_DOB<14>_UNCONNECTED , 
\NLW_BU2/U0/i_rom/Mram_sin_cos_lut_DOB<13>_UNCONNECTED , \NLW_BU2/U0/i_rom/Mram_sin_cos_lut_DOB<12>_UNCONNECTED , 
\NLW_BU2/U0/i_rom/Mram_sin_cos_lut_DOB<11>_UNCONNECTED , \NLW_BU2/U0/i_rom/Mram_sin_cos_lut_DOB<10>_UNCONNECTED , 
\NLW_BU2/U0/i_rom/Mram_sin_cos_lut_DOB<9>_UNCONNECTED , \NLW_BU2/U0/i_rom/Mram_sin_cos_lut_DOB<8>_UNCONNECTED , 
\NLW_BU2/U0/i_rom/Mram_sin_cos_lut_DOB<7>_UNCONNECTED , \NLW_BU2/U0/i_rom/Mram_sin_cos_lut_DOB<6>_UNCONNECTED , 
\NLW_BU2/U0/i_rom/Mram_sin_cos_lut_DOB<5>_UNCONNECTED , \NLW_BU2/U0/i_rom/Mram_sin_cos_lut_DOB<4>_UNCONNECTED , 
\NLW_BU2/U0/i_rom/Mram_sin_cos_lut_DOB<3>_UNCONNECTED , \NLW_BU2/U0/i_rom/Mram_sin_cos_lut_DOB<2>_UNCONNECTED , 
\NLW_BU2/U0/i_rom/Mram_sin_cos_lut_DOB<1>_UNCONNECTED , \NLW_BU2/U0/i_rom/Mram_sin_cos_lut_DOB<0>_UNCONNECTED }),
    .DOPB({\NLW_BU2/U0/i_rom/Mram_sin_cos_lut_DOPB<1>_UNCONNECTED , \NLW_BU2/U0/i_rom/Mram_sin_cos_lut_DOPB<0>_UNCONNECTED })
  );
  INV   \BU2/U0/Mcount_mutant_x_op_xor<0>11_INV_0  (
    .I(\BU2/U0/mutant_x_op [0]),
    .O(\BU2/U0/Result [0])
  );
  LUT4 #(
    .INIT ( 16'h5A78 ))
  \BU2/U0/i_rom/Madd_asyn_sin_ls1_xor<5>1  (
    .I0(\BU2/U0/i_rom/asyn_sin_ms1 [6]),
    .I1(\BU2/U0/i_rom/sin_RAM_op [4]),
    .I2(\BU2/U0/i_rom/sin_RAM_op [5]),
    .I3(\BU2/N13 ),
    .O(\BU2/U0/i_rom/asyn_sin_ls1 [5])
  );
  LUT4 #(
    .INIT ( 16'h5A78 ))
  \BU2/U0/i_rom/Madd_asyn_sin_ls1_xor<2>12  (
    .I0(\BU2/U0/i_rom/asyn_sin_ms1 [6]),
    .I1(\BU2/U0/i_rom/Madd_asyn_sin_ls1 ),
    .I2(\BU2/U0/i_rom/sin_RAM_op [2]),
    .I3(\BU2/U0/i_rom/sin_RAM_op [1]),
    .O(\BU2/U0/i_rom/asyn_sin_ls1 [2])
  );
  LUT4 #(
    .INIT ( 16'h6AAA ))
  \BU2/U0/i_rom/Madd_asyn_sin_ms2_xor<2>12  (
    .I0(\BU2/U0/i_rom/Madd_asyn_sin_ms24 ),
    .I1(\BU2/U0/i_rom/Madd_asyn_sin_ms22 ),
    .I2(\BU2/U0/i_rom/sin_ls1 [7]),
    .I3(\BU2/U0/i_rom/sin_ms1 [0]),
    .O(\BU2/U0/i_rom/asyn_sin_ms2 [2])
  );
  LUT3 #(
    .INIT ( 8'h6C ))
  \BU2/U0/i_rom/Madd_asyn_sin_ls1_xor<4>11  (
    .I0(\BU2/U0/i_rom/asyn_sin_ms1 [6]),
    .I1(\BU2/U0/i_rom/sin_RAM_op [4]),
    .I2(\BU2/N2 ),
    .O(\BU2/U0/i_rom/asyn_sin_ls1 [4])
  );
  LUT4 #(
    .INIT ( 16'h0001 ))
  \BU2/U0/i_rom/Madd_asyn_sin_ls1_cy<6>111  (
    .I0(\BU2/U0/i_rom/sin_RAM_op [3]),
    .I1(\BU2/U0/i_rom/sin_RAM_op [4]),
    .I2(\BU2/N12 ),
    .I3(\BU2/U0/i_rom/sin_RAM_op [2]),
    .O(\BU2/U0/i_rom/N27 )
  );
  MUXF5   \BU2/U0/i_rom/Madd_asyn_sin_ls1_xor<6>1_f5  (
    .I0(\BU2/U0/i_rom/Madd_asyn_sin_ls1_xor<6>11_904 ),
    .I1(\BU2/U0/i_rom/Madd_asyn_sin_ls1_xor<6>1 ),
    .S(\BU2/U0/i_rom/sin_RAM_op [6]),
    .O(\BU2/U0/i_rom/asyn_sin_ls1 [6])
  );
  LUT4 #(
    .INIT ( 16'hFE00 ))
  \BU2/U0/i_rom/Madd_asyn_sin_ls1_xor<6>12  (
    .I0(\BU2/U0/i_rom/sin_RAM_op [5]),
    .I1(\BU2/U0/i_rom/sin_RAM_op [4]),
    .I2(\BU2/N2 ),
    .I3(\BU2/U0/i_rom/asyn_sin_ms1 [6]),
    .O(\BU2/U0/i_rom/Madd_asyn_sin_ls1_xor<6>11_904 )
  );
  LUT3 #(
    .INIT ( 8'h73 ))
  \BU2/U0/i_rom/Madd_asyn_sin_ls1_xor<6>11  (
    .I0(\BU2/U0/i_rom/sin_RAM_op [5]),
    .I1(\BU2/U0/i_rom/asyn_sin_ms1 [6]),
    .I2(\BU2/U0/i_rom/N27 ),
    .O(\BU2/U0/i_rom/Madd_asyn_sin_ls1_xor<6>1 )
  );
  LUT4 #(
    .INIT ( 16'h0200 ))
  \BU2/U0/i_rom/Madd_asyn_sin_ls1_cy<6>12  (
    .I0(\BU2/U0/i_rom/asyn_sin_ms1 [6]),
    .I1(\BU2/U0/i_rom/sin_RAM_op [5]),
    .I2(\BU2/U0/i_rom/sin_RAM_op [6]),
    .I3(\BU2/U0/i_rom/N27 ),
    .O(\BU2/U0/i_rom/Madd_asyn_sin_ls1_cy [6])
  );
  LUT3 #(
    .INIT ( 8'hA6 ))
  \BU2/U0/i_rom/Madd_asyn_sin_ms2_xor<6>11  (
    .I0(\BU2/U0/i_rom/Madd_asyn_sin_ms212 ),
    .I1(\BU2/U0/i_rom/Madd_asyn_sin_ms210 ),
    .I2(\BU2/U0/i_rom/N6 ),
    .O(\BU2/U0/i_rom/asyn_sin_ms2 [6])
  );
  LUT2 #(
    .INIT ( 4'h9 ))
  \BU2/U0/i_rom/Madd_asyn_sin_ms2_xor<5>12  (
    .I0(\BU2/U0/i_rom/Madd_asyn_sin_ms210 ),
    .I1(\BU2/N11 ),
    .O(\BU2/U0/i_rom/asyn_sin_ms2 [5])
  );
  LUT4 #(
    .INIT ( 16'h5A78 ))
  \BU2/U0/i_rom/Madd_asyn_sin_ls1_xor<3>11  (
    .I0(\BU2/U0/i_rom/asyn_sin_ms1 [6]),
    .I1(\BU2/U0/i_rom/N4 ),
    .I2(\BU2/U0/i_rom/sin_RAM_op [3]),
    .I3(\BU2/U0/i_rom/sin_RAM_op [2]),
    .O(\BU2/U0/i_rom/asyn_sin_ls1 [3])
  );
  LUT4 #(
    .INIT ( 16'h9AAA ))
  \BU2/U0/i_rom/Madd_asyn_sin_ms2_xor<4>11  (
    .I0(\BU2/U0/i_rom/Madd_asyn_sin_ms28 ),
    .I1(\BU2/U0/i_rom/N101 ),
    .I2(\BU2/U0/i_rom/Madd_asyn_sin_ms26 ),
    .I3(\BU2/U0/i_rom/Madd_asyn_sin_ms24 ),
    .O(\BU2/U0/i_rom/asyn_sin_ms2 [4])
  );
  LUT3 #(
    .INIT ( 8'h9C ))
  \BU2/U0/i_rom/Madd_asyn_sin_ms2_xor<3>11  (
    .I0(\BU2/N10 ),
    .I1(\BU2/U0/i_rom/Madd_asyn_sin_ms26 ),
    .I2(\BU2/U0/i_rom/Madd_asyn_sin_ms24 ),
    .O(\BU2/U0/i_rom/asyn_sin_ms2 [3])
  );
  LUT4 #(
    .INIT ( 16'h9669 ))
  \BU2/U0/lfsr1_not00011  (
    .I0(\BU2/U0/lfsr1 [0]),
    .I1(\BU2/U0/lfsr1 [10]),
    .I2(\BU2/U0/lfsr1 [12]),
    .I3(\BU2/U0/lfsr1 [9]),
    .O(\BU2/U0/lfsr1_not0001 )
  );
  LUT4 #(
    .INIT ( 16'h9669 ))
  \BU2/U0/lfsr2_not00011  (
    .I0(\BU2/U0/lfsr2 [0]),
    .I1(\BU2/U0/lfsr2_132_895 ),
    .I2(\BU2/U0/lfsr2 [4]),
    .I3(\BU2/U0/lfsr2 [8]),
    .O(\BU2/U0/lfsr2_not0001 )
  );
  LUT4 #(
    .INIT ( 16'h9669 ))
  \BU2/U0/lfsr4_not00011  (
    .I0(\BU2/U0/lfsr4[0] ),
    .I1(\BU2/U0/lfsr4_132_877 ),
    .I2(\BU2/U0/lfsr4[15] ),
    .I3(\BU2/U0/lfsr4[4] ),
    .O(\BU2/U0/lfsr4_not0001 )
  );
  LUT3 #(
    .INIT ( 8'hA9 ))
  \BU2/U0/Mcount_mutant_x_op_xor<2>11  (
    .I0(\BU2/U0/mutant_x_op [2]),
    .I1(\BU2/U0/mutant_x_op [1]),
    .I2(\BU2/U0/mutant_x_op [0]),
    .O(\BU2/U0/Result [2])
  );
  LUT3 #(
    .INIT ( 8'h6C ))
  \BU2/U0/i_rom/Madd_asyn_sin_ls1_xor<1>11  (
    .I0(\BU2/U0/i_rom/asyn_sin_ms1 [6]),
    .I1(\BU2/U0/i_rom/sin_RAM_op [1]),
    .I2(\BU2/U0/i_rom/Madd_asyn_sin_ls1 ),
    .O(\BU2/U0/i_rom/asyn_sin_ls1 [1])
  );
  LUT3 #(
    .INIT ( 8'h6C ))
  \BU2/U0/i_rom/Madd_asyn_sin_ms2_xor<1>11  (
    .I0(\BU2/U0/i_rom/sin_ls1 [7]),
    .I1(\BU2/U0/i_rom/Madd_asyn_sin_ms22 ),
    .I2(\BU2/U0/i_rom/sin_ms1 [0]),
    .O(\BU2/U0/i_rom/asyn_sin_ms2 [1])
  );
  LUT2 #(
    .INIT ( 4'h9 ))
  \BU2/U0/Mcount_mutant_x_op_xor<1>11  (
    .I0(\BU2/U0/mutant_x_op [1]),
    .I1(\BU2/U0/mutant_x_op [0]),
    .O(\BU2/U0/Result [1])
  );
  LUT2 #(
    .INIT ( 4'h6 ))
  \BU2/U0/i_rom/Madd_asyn_sin_ms21  (
    .I0(\BU2/U0/i_rom/sin_ms1 [0]),
    .I1(\BU2/U0/i_rom/sin_ls1 [7]),
    .O(\BU2/U0/i_rom/Madd_asyn_sin_ms2 )
  );
  LUT2 #(
    .INIT ( 4'h6 ))
  \BU2/U0/i_rom/asyn_sin_ms1<0>1  (
    .I0(\BU2/U0/i_rom/asyn_sin_ms1 [6]),
    .I1(\BU2/U0/i_rom/sin_RAM_op [7]),
    .O(\BU2/U0/i_rom/asyn_sin_ms1 [0])
  );
  LUT2 #(
    .INIT ( 4'h6 ))
  \BU2/U0/i_rom/asyn_sin_ms1<1>1  (
    .I0(\BU2/U0/i_rom/asyn_sin_ms1 [6]),
    .I1(\BU2/U0/i_rom/sin_RAM_op [8]),
    .O(\BU2/U0/i_rom/asyn_sin_ms1 [1])
  );
  LUT2 #(
    .INIT ( 4'h6 ))
  \BU2/U0/i_rom/asyn_sin_ms1<2>1  (
    .I0(\BU2/U0/i_rom/asyn_sin_ms1 [6]),
    .I1(\BU2/U0/i_rom/sin_RAM_op [9]),
    .O(\BU2/U0/i_rom/asyn_sin_ms1 [2])
  );
  LUT2 #(
    .INIT ( 4'h6 ))
  \BU2/U0/i_rom/asyn_sin_ms1<3>1  (
    .I0(\BU2/U0/i_rom/asyn_sin_ms1 [6]),
    .I1(\BU2/U0/i_rom/sin_RAM_op [10]),
    .O(\BU2/U0/i_rom/asyn_sin_ms1 [3])
  );
  LUT2 #(
    .INIT ( 4'h6 ))
  \BU2/U0/i_rom/asyn_sin_ms1<4>1  (
    .I0(\BU2/U0/i_rom/asyn_sin_ms1 [6]),
    .I1(\BU2/U0/i_rom/sin_RAM_op [11]),
    .O(\BU2/U0/i_rom/asyn_sin_ms1 [4])
  );
  LUT2 #(
    .INIT ( 4'h6 ))
  \BU2/U0/i_rom/asyn_sin_ms1<5>1  (
    .I0(\BU2/U0/i_rom/asyn_sin_ms1 [6]),
    .I1(\BU2/U0/i_rom/sin_RAM_op [12]),
    .O(\BU2/U0/i_rom/asyn_sin_ms1 [5])
  );
  LUT2 #(
    .INIT ( 4'h9 ))
  \BU2/U0/lfsr3_not00011  (
    .I0(\BU2/U0/lfsr3 [0]),
    .I1(\BU2/U0/lfsr3_142_894 ),
    .O(\BU2/U0/lfsr3_not0001 )
  );
  LUT2 #(
    .INIT ( 4'h1 ))
  \BU2/U0/pre_rdy_and00001  (
    .I0(\BU2/U0/mutant_x_op [1]),
    .I1(\BU2/U0/mutant_x_op [2]),
    .O(\BU2/U0/pre_rdy )
  );
  LUT2 #(
    .INIT ( 4'h6 ))
  \BU2/U0/i_rom/asyn_mod_sin_addr<0>1  (
    .I0(\BU2/U0/acc_phase_shaped [30]),
    .I1(\BU2/U0/acc_phase_shaped [21]),
    .O(\BU2/U0/i_rom/asyn_mod_sin_addr [0])
  );
  LUT2 #(
    .INIT ( 4'h6 ))
  \BU2/U0/i_rom/asyn_mod_sin_addr<1>1  (
    .I0(\BU2/U0/acc_phase_shaped [30]),
    .I1(\BU2/U0/acc_phase_shaped [22]),
    .O(\BU2/U0/i_rom/asyn_mod_sin_addr [1])
  );
  LUT2 #(
    .INIT ( 4'h6 ))
  \BU2/U0/i_rom/asyn_mod_sin_addr<2>1  (
    .I0(\BU2/U0/acc_phase_shaped [30]),
    .I1(\BU2/U0/acc_phase_shaped [23]),
    .O(\BU2/U0/i_rom/asyn_mod_sin_addr [2])
  );
  LUT2 #(
    .INIT ( 4'h6 ))
  \BU2/U0/i_rom/asyn_mod_sin_addr<3>1  (
    .I0(\BU2/U0/acc_phase_shaped [30]),
    .I1(\BU2/U0/acc_phase_shaped [24]),
    .O(\BU2/U0/i_rom/asyn_mod_sin_addr [3])
  );
  LUT2 #(
    .INIT ( 4'h6 ))
  \BU2/U0/i_rom/asyn_mod_sin_addr<4>1  (
    .I0(\BU2/U0/acc_phase_shaped [30]),
    .I1(\BU2/U0/acc_phase_shaped [25]),
    .O(\BU2/U0/i_rom/asyn_mod_sin_addr [4])
  );
  LUT2 #(
    .INIT ( 4'h6 ))
  \BU2/U0/i_rom/asyn_mod_sin_addr<5>1  (
    .I0(\BU2/U0/acc_phase_shaped [30]),
    .I1(\BU2/U0/acc_phase_shaped [26]),
    .O(\BU2/U0/i_rom/asyn_mod_sin_addr [5])
  );
  LUT2 #(
    .INIT ( 4'h6 ))
  \BU2/U0/i_rom/asyn_mod_sin_addr<6>1  (
    .I0(\BU2/U0/acc_phase_shaped [30]),
    .I1(\BU2/U0/acc_phase_shaped [27]),
    .O(\BU2/U0/i_rom/asyn_mod_sin_addr [6])
  );
  LUT2 #(
    .INIT ( 4'h6 ))
  \BU2/U0/i_rom/asyn_mod_sin_addr<7>1  (
    .I0(\BU2/U0/acc_phase_shaped [30]),
    .I1(\BU2/U0/acc_phase_shaped [28]),
    .O(\BU2/U0/i_rom/asyn_mod_sin_addr [7])
  );
  LUT2 #(
    .INIT ( 4'h6 ))
  \BU2/U0/i_rom/asyn_mod_sin_addr<8>1  (
    .I0(\BU2/U0/acc_phase_shaped [30]),
    .I1(\BU2/U0/acc_phase_shaped [29]),
    .O(\BU2/U0/i_rom/asyn_mod_sin_addr [8])
  );
  LUT3 #(
    .INIT ( 8'hFE ))
  \BU2/U0/mutant_x_op_not00011  (
    .I0(\BU2/U0/mutant_x_op [1]),
    .I1(\BU2/U0/mutant_x_op [0]),
    .I2(\BU2/U0/mutant_x_op [2]),
    .O(\BU2/U0/mutant_x_op_not0001 )
  );
  FDRE #(
    .INIT ( 1'b0 ))
  \BU2/U0/lfsr2_0  (
    .C(clk),
    .CE(\BU2/N1 ),
    .D(\BU2/U0/lfsr2_not0001 ),
    .R(\BU2/channel [0]),
    .Q(\BU2/U0/lfsr2 [0])
  );
  FDRE #(
    .INIT ( 1'b0 ))
  \BU2/U0/lfsr2_1  (
    .C(clk),
    .CE(\BU2/N1 ),
    .D(\BU2/U0/lfsr2 [0]),
    .R(\BU2/channel [0]),
    .Q(\BU2/U0/lfsr2 [1])
  );
  FDRE #(
    .INIT ( 1'b0 ))
  \BU2/U0/lfsr2_2  (
    .C(clk),
    .CE(\BU2/N1 ),
    .D(\BU2/U0/lfsr2 [1]),
    .R(\BU2/channel [0]),
    .Q(\BU2/U0/lfsr2 [2])
  );
  FDRE #(
    .INIT ( 1'b0 ))
  \BU2/U0/lfsr2_3  (
    .C(clk),
    .CE(\BU2/N1 ),
    .D(\BU2/U0/lfsr2 [2]),
    .R(\BU2/channel [0]),
    .Q(\BU2/U0/lfsr2 [3])
  );
  FDRE #(
    .INIT ( 1'b0 ))
  \BU2/U0/lfsr2_4  (
    .C(clk),
    .CE(\BU2/N1 ),
    .D(\BU2/U0/lfsr2 [3]),
    .R(\BU2/channel [0]),
    .Q(\BU2/U0/lfsr2 [4])
  );
  FDRE #(
    .INIT ( 1'b0 ))
  \BU2/U0/lfsr2_5  (
    .C(clk),
    .CE(\BU2/N1 ),
    .D(\BU2/U0/lfsr2 [4]),
    .R(\BU2/channel [0]),
    .Q(\BU2/U0/lfsr2 [5])
  );
  FDRE #(
    .INIT ( 1'b0 ))
  \BU2/U0/lfsr2_6  (
    .C(clk),
    .CE(\BU2/N1 ),
    .D(\BU2/U0/lfsr2 [5]),
    .R(\BU2/channel [0]),
    .Q(\BU2/U0/lfsr2 [6])
  );
  FDRE #(
    .INIT ( 1'b0 ))
  \BU2/U0/lfsr2_7  (
    .C(clk),
    .CE(\BU2/N1 ),
    .D(\BU2/U0/lfsr2 [6]),
    .R(\BU2/channel [0]),
    .Q(\BU2/U0/lfsr2 [7])
  );
  FDRE #(
    .INIT ( 1'b0 ))
  \BU2/U0/lfsr2_8  (
    .C(clk),
    .CE(\BU2/N1 ),
    .D(\BU2/U0/lfsr2 [7]),
    .R(\BU2/channel [0]),
    .Q(\BU2/U0/lfsr2 [8])
  );
  FDRE #(
    .INIT ( 1'b0 ))
  \BU2/U0/lfsr2_9  (
    .C(clk),
    .CE(\BU2/N1 ),
    .D(\BU2/U0/lfsr2 [8]),
    .R(\BU2/channel [0]),
    .Q(\BU2/U0/lfsr2 [9])
  );
  FDRE #(
    .INIT ( 1'b0 ))
  \BU2/U0/lfsr1_0  (
    .C(clk),
    .CE(\BU2/N1 ),
    .D(\BU2/U0/lfsr1_not0001 ),
    .R(\BU2/channel [0]),
    .Q(\BU2/U0/lfsr1 [0])
  );
  FDRE #(
    .INIT ( 1'b0 ))
  \BU2/U0/lfsr1_1  (
    .C(clk),
    .CE(\BU2/N1 ),
    .D(\BU2/U0/lfsr1 [0]),
    .R(\BU2/channel [0]),
    .Q(\BU2/U0/lfsr1 [1])
  );
  FDRE #(
    .INIT ( 1'b0 ))
  \BU2/U0/lfsr1_2  (
    .C(clk),
    .CE(\BU2/N1 ),
    .D(\BU2/U0/lfsr1 [1]),
    .R(\BU2/channel [0]),
    .Q(\BU2/U0/lfsr1 [2])
  );
  FDRE #(
    .INIT ( 1'b0 ))
  \BU2/U0/lfsr1_3  (
    .C(clk),
    .CE(\BU2/N1 ),
    .D(\BU2/U0/lfsr1 [2]),
    .R(\BU2/channel [0]),
    .Q(\BU2/U0/lfsr1 [3])
  );
  FDRE #(
    .INIT ( 1'b0 ))
  \BU2/U0/lfsr1_4  (
    .C(clk),
    .CE(\BU2/N1 ),
    .D(\BU2/U0/lfsr1 [3]),
    .R(\BU2/channel [0]),
    .Q(\BU2/U0/lfsr1 [4])
  );
  FDRE #(
    .INIT ( 1'b0 ))
  \BU2/U0/lfsr1_5  (
    .C(clk),
    .CE(\BU2/N1 ),
    .D(\BU2/U0/lfsr1 [4]),
    .R(\BU2/channel [0]),
    .Q(\BU2/U0/lfsr1 [5])
  );
  FDRE #(
    .INIT ( 1'b0 ))
  \BU2/U0/lfsr1_6  (
    .C(clk),
    .CE(\BU2/N1 ),
    .D(\BU2/U0/lfsr1 [5]),
    .R(\BU2/channel [0]),
    .Q(\BU2/U0/lfsr1 [6])
  );
  FDRE #(
    .INIT ( 1'b0 ))
  \BU2/U0/lfsr1_7  (
    .C(clk),
    .CE(\BU2/N1 ),
    .D(\BU2/U0/lfsr1 [6]),
    .R(\BU2/channel [0]),
    .Q(\BU2/U0/lfsr1 [7])
  );
  FDRE #(
    .INIT ( 1'b0 ))
  \BU2/U0/lfsr1_8  (
    .C(clk),
    .CE(\BU2/N1 ),
    .D(\BU2/U0/lfsr1 [7]),
    .R(\BU2/channel [0]),
    .Q(\BU2/U0/lfsr1 [8])
  );
  FDRE #(
    .INIT ( 1'b0 ))
  \BU2/U0/lfsr1_9  (
    .C(clk),
    .CE(\BU2/N1 ),
    .D(\BU2/U0/lfsr1 [8]),
    .R(\BU2/channel [0]),
    .Q(\BU2/U0/lfsr1 [9])
  );
  FDRE #(
    .INIT ( 1'b0 ))
  \BU2/U0/lfsr1_10  (
    .C(clk),
    .CE(\BU2/N1 ),
    .D(\BU2/U0/lfsr1 [9]),
    .R(\BU2/channel [0]),
    .Q(\BU2/U0/lfsr1 [10])
  );
  FDRE #(
    .INIT ( 1'b0 ))
  \BU2/U0/lfsr1_11  (
    .C(clk),
    .CE(\BU2/N1 ),
    .D(\BU2/U0/lfsr1 [10]),
    .R(\BU2/channel [0]),
    .Q(\BU2/U0/lfsr1 [11])
  );
  FDRE #(
    .INIT ( 1'b0 ))
  \BU2/U0/lfsr1_12  (
    .C(clk),
    .CE(\BU2/N1 ),
    .D(\BU2/U0/lfsr1 [11]),
    .R(\BU2/channel [0]),
    .Q(\BU2/U0/lfsr1 [12])
  );
  FDRE #(
    .INIT ( 1'b0 ))
  \BU2/U0/lfsr3_0  (
    .C(clk),
    .CE(\BU2/N1 ),
    .D(\BU2/U0/lfsr3_not0001 ),
    .R(\BU2/channel [0]),
    .Q(\BU2/U0/lfsr3 [0])
  );
  FDRE #(
    .INIT ( 1'b0 ))
  \BU2/U0/lfsr3_1  (
    .C(clk),
    .CE(\BU2/N1 ),
    .D(\BU2/U0/lfsr3 [0]),
    .R(\BU2/channel [0]),
    .Q(\BU2/U0/lfsr3 [1])
  );
  FDRE #(
    .INIT ( 1'b0 ))
  \BU2/U0/lfsr3_2  (
    .C(clk),
    .CE(\BU2/N1 ),
    .D(\BU2/U0/lfsr3 [1]),
    .R(\BU2/channel [0]),
    .Q(\BU2/U0/lfsr3 [2])
  );
  FDRE #(
    .INIT ( 1'b0 ))
  \BU2/U0/lfsr3_3  (
    .C(clk),
    .CE(\BU2/N1 ),
    .D(\BU2/U0/lfsr3 [2]),
    .R(\BU2/channel [0]),
    .Q(\BU2/U0/lfsr3 [3])
  );
  FDRE #(
    .INIT ( 1'b0 ))
  \BU2/U0/lfsr3_4  (
    .C(clk),
    .CE(\BU2/N1 ),
    .D(\BU2/U0/lfsr3 [3]),
    .R(\BU2/channel [0]),
    .Q(\BU2/U0/lfsr3 [4])
  );
  FDRE #(
    .INIT ( 1'b0 ))
  \BU2/U0/lfsr3_5  (
    .C(clk),
    .CE(\BU2/N1 ),
    .D(\BU2/U0/lfsr3 [4]),
    .R(\BU2/channel [0]),
    .Q(\BU2/U0/lfsr3 [5])
  );
  FDRE #(
    .INIT ( 1'b0 ))
  \BU2/U0/lfsr3_6  (
    .C(clk),
    .CE(\BU2/N1 ),
    .D(\BU2/U0/lfsr3 [5]),
    .R(\BU2/channel [0]),
    .Q(\BU2/U0/lfsr3 [6])
  );
  FDRE #(
    .INIT ( 1'b0 ))
  \BU2/U0/lfsr3_7  (
    .C(clk),
    .CE(\BU2/N1 ),
    .D(\BU2/U0/lfsr3 [6]),
    .R(\BU2/channel [0]),
    .Q(\BU2/U0/lfsr3 [7])
  );
  FDRE #(
    .INIT ( 1'b0 ))
  \BU2/U0/lfsr3_8  (
    .C(clk),
    .CE(\BU2/N1 ),
    .D(\BU2/U0/lfsr3 [7]),
    .R(\BU2/channel [0]),
    .Q(\BU2/U0/lfsr3 [8])
  );
  FDRE #(
    .INIT ( 1'b0 ))
  \BU2/U0/lfsr3_9  (
    .C(clk),
    .CE(\BU2/N1 ),
    .D(\BU2/U0/lfsr3 [8]),
    .R(\BU2/channel [0]),
    .Q(\BU2/U0/lfsr3 [9])
  );
  FDRE #(
    .INIT ( 1'b0 ))
  \BU2/U0/lfsr4_0  (
    .C(clk),
    .CE(\BU2/N1 ),
    .D(\BU2/U0/lfsr4_not0001 ),
    .R(\BU2/channel [0]),
    .Q(\BU2/U0/lfsr4[0] )
  );
  FDRE #(
    .INIT ( 1'b0 ))
  \BU2/U0/lfsr4_1  (
    .C(clk),
    .CE(\BU2/N1 ),
    .D(\BU2/U0/lfsr4[0] ),
    .R(\BU2/channel [0]),
    .Q(\BU2/U0/lfsr4[1] )
  );
  FDRE #(
    .INIT ( 1'b0 ))
  \BU2/U0/lfsr4_2  (
    .C(clk),
    .CE(\BU2/N1 ),
    .D(\BU2/U0/lfsr4[1] ),
    .R(\BU2/channel [0]),
    .Q(\BU2/U0/lfsr4[2] )
  );
  FDRE #(
    .INIT ( 1'b0 ))
  \BU2/U0/lfsr4_3  (
    .C(clk),
    .CE(\BU2/N1 ),
    .D(\BU2/U0/lfsr4[2] ),
    .R(\BU2/channel [0]),
    .Q(\BU2/U0/lfsr4[3] )
  );
  FDRE #(
    .INIT ( 1'b0 ))
  \BU2/U0/lfsr4_4  (
    .C(clk),
    .CE(\BU2/N1 ),
    .D(\BU2/U0/lfsr4[3] ),
    .R(\BU2/channel [0]),
    .Q(\BU2/U0/lfsr4[4] )
  );
  FDRE #(
    .INIT ( 1'b0 ))
  \BU2/U0/lfsr4_5  (
    .C(clk),
    .CE(\BU2/N1 ),
    .D(\BU2/U0/lfsr4[4] ),
    .R(\BU2/channel [0]),
    .Q(\BU2/U0/lfsr4[5] )
  );
  FDRE #(
    .INIT ( 1'b0 ))
  \BU2/U0/lfsr4_6  (
    .C(clk),
    .CE(\BU2/N1 ),
    .D(\BU2/U0/lfsr4[5] ),
    .R(\BU2/channel [0]),
    .Q(\BU2/U0/lfsr4[6] )
  );
  FDRE #(
    .INIT ( 1'b0 ))
  \BU2/U0/lfsr4_7  (
    .C(clk),
    .CE(\BU2/N1 ),
    .D(\BU2/U0/lfsr4[6] ),
    .R(\BU2/channel [0]),
    .Q(\BU2/U0/lfsr4[7] )
  );
  FDRE #(
    .INIT ( 1'b0 ))
  \BU2/U0/lfsr4_8  (
    .C(clk),
    .CE(\BU2/N1 ),
    .D(\BU2/U0/lfsr4[7] ),
    .R(\BU2/channel [0]),
    .Q(\BU2/U0/lfsr4[8] )
  );
  FDRE #(
    .INIT ( 1'b0 ))
  \BU2/U0/lfsr4_9  (
    .C(clk),
    .CE(\BU2/N1 ),
    .D(\BU2/U0/lfsr4[8] ),
    .R(\BU2/channel [0]),
    .Q(\BU2/U0/lfsr4[9] )
  );
  FDRE #(
    .INIT ( 1'b0 ))
  \BU2/U0/lfsr4_14  (
    .C(clk),
    .CE(\BU2/N1 ),
    .D(\BU2/U0/lfsr4_132_877 ),
    .R(\BU2/channel [0]),
    .Q(\BU2/U0/lfsr4[14] )
  );
  FDRE #(
    .INIT ( 1'b0 ))
  \BU2/U0/lfsr4_15  (
    .C(clk),
    .CE(\BU2/N1 ),
    .D(\BU2/U0/lfsr4[14] ),
    .R(\BU2/channel [0]),
    .Q(\BU2/U0/lfsr4[15] )
  );
  FDE #(
    .INIT ( 1'b1 ))
  \BU2/U0/mutant_x_op_0  (
    .C(clk),
    .CE(\BU2/U0/mutant_x_op_not0001 ),
    .D(\BU2/U0/Result [0]),
    .Q(\BU2/U0/mutant_x_op [0])
  );
  FDE #(
    .INIT ( 1'b1 ))
  \BU2/U0/mutant_x_op_1  (
    .C(clk),
    .CE(\BU2/U0/mutant_x_op_not0001 ),
    .D(\BU2/U0/Result [1]),
    .Q(\BU2/U0/mutant_x_op [1])
  );
  FDE #(
    .INIT ( 1'b1 ))
  \BU2/U0/mutant_x_op_2  (
    .C(clk),
    .CE(\BU2/U0/mutant_x_op_not0001 ),
    .D(\BU2/U0/Result [2]),
    .Q(\BU2/U0/mutant_x_op [2])
  );
  LUT2 #(
    .INIT ( 4'h6 ))
  \BU2/U0/Madd_precombine1_lut<0>  (
    .I0(\BU2/U0/lfsr1 [0]),
    .I1(\BU2/U0/lfsr2 [0]),
    .O(\BU2/U0/Madd_precombine1_lut [0])
  );
  MUXCY   \BU2/U0/Madd_precombine1_cy<0>  (
    .CI(\BU2/channel [0]),
    .DI(\BU2/U0/lfsr1 [0]),
    .S(\BU2/U0/Madd_precombine1_lut [0]),
    .O(\BU2/U0/Madd_precombine1_cy [0])
  );
  LUT2 #(
    .INIT ( 4'h6 ))
  \BU2/U0/Madd_precombine1_lut<1>  (
    .I0(\BU2/U0/lfsr1 [1]),
    .I1(\BU2/U0/lfsr2 [1]),
    .O(\BU2/U0/Madd_precombine1_lut [1])
  );
  MUXCY   \BU2/U0/Madd_precombine1_cy<1>  (
    .CI(\BU2/U0/Madd_precombine1_cy [0]),
    .DI(\BU2/U0/lfsr1 [1]),
    .S(\BU2/U0/Madd_precombine1_lut [1]),
    .O(\BU2/U0/Madd_precombine1_cy [1])
  );
  XORCY   \BU2/U0/Madd_precombine1_xor<1>  (
    .CI(\BU2/U0/Madd_precombine1_cy [0]),
    .LI(\BU2/U0/Madd_precombine1_lut [1]),
    .O(\BU2/U0/precombine1 [1])
  );
  LUT2 #(
    .INIT ( 4'h6 ))
  \BU2/U0/Madd_precombine1_lut<2>  (
    .I0(\BU2/U0/lfsr1 [2]),
    .I1(\BU2/U0/lfsr2 [2]),
    .O(\BU2/U0/Madd_precombine1_lut [2])
  );
  MUXCY   \BU2/U0/Madd_precombine1_cy<2>  (
    .CI(\BU2/U0/Madd_precombine1_cy [1]),
    .DI(\BU2/U0/lfsr1 [2]),
    .S(\BU2/U0/Madd_precombine1_lut [2]),
    .O(\BU2/U0/Madd_precombine1_cy [2])
  );
  XORCY   \BU2/U0/Madd_precombine1_xor<2>  (
    .CI(\BU2/U0/Madd_precombine1_cy [1]),
    .LI(\BU2/U0/Madd_precombine1_lut [2]),
    .O(\BU2/U0/precombine1 [2])
  );
  LUT2 #(
    .INIT ( 4'h6 ))
  \BU2/U0/Madd_precombine1_lut<3>  (
    .I0(\BU2/U0/lfsr1 [3]),
    .I1(\BU2/U0/lfsr2 [3]),
    .O(\BU2/U0/Madd_precombine1_lut [3])
  );
  MUXCY   \BU2/U0/Madd_precombine1_cy<3>  (
    .CI(\BU2/U0/Madd_precombine1_cy [2]),
    .DI(\BU2/U0/lfsr1 [3]),
    .S(\BU2/U0/Madd_precombine1_lut [3]),
    .O(\BU2/U0/Madd_precombine1_cy [3])
  );
  XORCY   \BU2/U0/Madd_precombine1_xor<3>  (
    .CI(\BU2/U0/Madd_precombine1_cy [2]),
    .LI(\BU2/U0/Madd_precombine1_lut [3]),
    .O(\BU2/U0/precombine1 [3])
  );
  LUT2 #(
    .INIT ( 4'h6 ))
  \BU2/U0/Madd_precombine1_lut<4>  (
    .I0(\BU2/U0/lfsr1 [4]),
    .I1(\BU2/U0/lfsr2 [4]),
    .O(\BU2/U0/Madd_precombine1_lut [4])
  );
  MUXCY   \BU2/U0/Madd_precombine1_cy<4>  (
    .CI(\BU2/U0/Madd_precombine1_cy [3]),
    .DI(\BU2/U0/lfsr1 [4]),
    .S(\BU2/U0/Madd_precombine1_lut [4]),
    .O(\BU2/U0/Madd_precombine1_cy [4])
  );
  XORCY   \BU2/U0/Madd_precombine1_xor<4>  (
    .CI(\BU2/U0/Madd_precombine1_cy [3]),
    .LI(\BU2/U0/Madd_precombine1_lut [4]),
    .O(\BU2/U0/precombine1 [4])
  );
  LUT2 #(
    .INIT ( 4'h6 ))
  \BU2/U0/Madd_precombine1_lut<5>  (
    .I0(\BU2/U0/lfsr1 [5]),
    .I1(\BU2/U0/lfsr2 [5]),
    .O(\BU2/U0/Madd_precombine1_lut [5])
  );
  MUXCY   \BU2/U0/Madd_precombine1_cy<5>  (
    .CI(\BU2/U0/Madd_precombine1_cy [4]),
    .DI(\BU2/U0/lfsr1 [5]),
    .S(\BU2/U0/Madd_precombine1_lut [5]),
    .O(\BU2/U0/Madd_precombine1_cy [5])
  );
  XORCY   \BU2/U0/Madd_precombine1_xor<5>  (
    .CI(\BU2/U0/Madd_precombine1_cy [4]),
    .LI(\BU2/U0/Madd_precombine1_lut [5]),
    .O(\BU2/U0/precombine1 [5])
  );
  LUT2 #(
    .INIT ( 4'h6 ))
  \BU2/U0/Madd_precombine1_lut<6>  (
    .I0(\BU2/U0/lfsr1 [6]),
    .I1(\BU2/U0/lfsr2 [6]),
    .O(\BU2/U0/Madd_precombine1_lut [6])
  );
  MUXCY   \BU2/U0/Madd_precombine1_cy<6>  (
    .CI(\BU2/U0/Madd_precombine1_cy [5]),
    .DI(\BU2/U0/lfsr1 [6]),
    .S(\BU2/U0/Madd_precombine1_lut [6]),
    .O(\BU2/U0/Madd_precombine1_cy [6])
  );
  XORCY   \BU2/U0/Madd_precombine1_xor<6>  (
    .CI(\BU2/U0/Madd_precombine1_cy [5]),
    .LI(\BU2/U0/Madd_precombine1_lut [6]),
    .O(\BU2/U0/precombine1 [6])
  );
  LUT2 #(
    .INIT ( 4'h6 ))
  \BU2/U0/Madd_precombine1_lut<7>  (
    .I0(\BU2/U0/lfsr1 [7]),
    .I1(\BU2/U0/lfsr2 [7]),
    .O(\BU2/U0/Madd_precombine1_lut [7])
  );
  MUXCY   \BU2/U0/Madd_precombine1_cy<7>  (
    .CI(\BU2/U0/Madd_precombine1_cy [6]),
    .DI(\BU2/U0/lfsr1 [7]),
    .S(\BU2/U0/Madd_precombine1_lut [7]),
    .O(\BU2/U0/Madd_precombine1_cy [7])
  );
  XORCY   \BU2/U0/Madd_precombine1_xor<7>  (
    .CI(\BU2/U0/Madd_precombine1_cy [6]),
    .LI(\BU2/U0/Madd_precombine1_lut [7]),
    .O(\BU2/U0/precombine1 [7])
  );
  LUT2 #(
    .INIT ( 4'h6 ))
  \BU2/U0/Madd_precombine1_lut<8>  (
    .I0(\BU2/U0/lfsr1 [8]),
    .I1(\BU2/U0/lfsr2 [8]),
    .O(\BU2/U0/Madd_precombine1_lut [8])
  );
  MUXCY   \BU2/U0/Madd_precombine1_cy<8>  (
    .CI(\BU2/U0/Madd_precombine1_cy [7]),
    .DI(\BU2/U0/lfsr1 [8]),
    .S(\BU2/U0/Madd_precombine1_lut [8]),
    .O(\BU2/U0/Madd_precombine1_cy [8])
  );
  XORCY   \BU2/U0/Madd_precombine1_xor<8>  (
    .CI(\BU2/U0/Madd_precombine1_cy [7]),
    .LI(\BU2/U0/Madd_precombine1_lut [8]),
    .O(\BU2/U0/precombine1 [8])
  );
  LUT2 #(
    .INIT ( 4'h6 ))
  \BU2/U0/Madd_precombine1_lut<9>  (
    .I0(\BU2/U0/lfsr1 [9]),
    .I1(\BU2/U0/lfsr2 [9]),
    .O(\BU2/U0/Madd_precombine1_lut [9])
  );
  MUXCY   \BU2/U0/Madd_precombine1_cy<9>  (
    .CI(\BU2/U0/Madd_precombine1_cy [8]),
    .DI(\BU2/U0/lfsr1 [9]),
    .S(\BU2/U0/Madd_precombine1_lut [9]),
    .O(\BU2/U0/Madd_precombine1_cy [9])
  );
  XORCY   \BU2/U0/Madd_precombine1_xor<9>  (
    .CI(\BU2/U0/Madd_precombine1_cy [8]),
    .LI(\BU2/U0/Madd_precombine1_lut [9]),
    .O(\BU2/U0/precombine1 [9])
  );
  LUT2 #(
    .INIT ( 4'h6 ))
  \BU2/U0/Madd_precombine1_lut<10>  (
    .I0(\BU2/U0/lfsr1 [9]),
    .I1(\BU2/U0/lfsr2 [9]),
    .O(\BU2/U0/Madd_precombine1_lut [10])
  );
  XORCY   \BU2/U0/Madd_precombine1_xor<10>  (
    .CI(\BU2/U0/Madd_precombine1_cy [9]),
    .LI(\BU2/U0/Madd_precombine1_lut [10]),
    .O(\BU2/U0/precombine1 [10])
  );
  LUT2 #(
    .INIT ( 4'h6 ))
  \BU2/U0/Madd_precombine2_lut<0>  (
    .I0(\BU2/U0/lfsr3 [0]),
    .I1(\BU2/U0/lfsr4[0] ),
    .O(\BU2/U0/Madd_precombine2_lut [0])
  );
  MUXCY   \BU2/U0/Madd_precombine2_cy<0>  (
    .CI(\BU2/channel [0]),
    .DI(\BU2/U0/lfsr3 [0]),
    .S(\BU2/U0/Madd_precombine2_lut [0]),
    .O(\BU2/U0/Madd_precombine2_cy [0])
  );
  LUT2 #(
    .INIT ( 4'h6 ))
  \BU2/U0/Madd_precombine2_lut<1>  (
    .I0(\BU2/U0/lfsr3 [1]),
    .I1(\BU2/U0/lfsr4[1] ),
    .O(\BU2/U0/Madd_precombine2_lut [1])
  );
  MUXCY   \BU2/U0/Madd_precombine2_cy<1>  (
    .CI(\BU2/U0/Madd_precombine2_cy [0]),
    .DI(\BU2/U0/lfsr3 [1]),
    .S(\BU2/U0/Madd_precombine2_lut [1]),
    .O(\BU2/U0/Madd_precombine2_cy [1])
  );
  XORCY   \BU2/U0/Madd_precombine2_xor<1>  (
    .CI(\BU2/U0/Madd_precombine2_cy [0]),
    .LI(\BU2/U0/Madd_precombine2_lut [1]),
    .O(\BU2/U0/precombine2 [1])
  );
  LUT2 #(
    .INIT ( 4'h6 ))
  \BU2/U0/Madd_precombine2_lut<2>  (
    .I0(\BU2/U0/lfsr3 [2]),
    .I1(\BU2/U0/lfsr4[2] ),
    .O(\BU2/U0/Madd_precombine2_lut [2])
  );
  MUXCY   \BU2/U0/Madd_precombine2_cy<2>  (
    .CI(\BU2/U0/Madd_precombine2_cy [1]),
    .DI(\BU2/U0/lfsr3 [2]),
    .S(\BU2/U0/Madd_precombine2_lut [2]),
    .O(\BU2/U0/Madd_precombine2_cy [2])
  );
  XORCY   \BU2/U0/Madd_precombine2_xor<2>  (
    .CI(\BU2/U0/Madd_precombine2_cy [1]),
    .LI(\BU2/U0/Madd_precombine2_lut [2]),
    .O(\BU2/U0/precombine2 [2])
  );
  LUT2 #(
    .INIT ( 4'h6 ))
  \BU2/U0/Madd_precombine2_lut<3>  (
    .I0(\BU2/U0/lfsr3 [3]),
    .I1(\BU2/U0/lfsr4[3] ),
    .O(\BU2/U0/Madd_precombine2_lut [3])
  );
  MUXCY   \BU2/U0/Madd_precombine2_cy<3>  (
    .CI(\BU2/U0/Madd_precombine2_cy [2]),
    .DI(\BU2/U0/lfsr3 [3]),
    .S(\BU2/U0/Madd_precombine2_lut [3]),
    .O(\BU2/U0/Madd_precombine2_cy [3])
  );
  XORCY   \BU2/U0/Madd_precombine2_xor<3>  (
    .CI(\BU2/U0/Madd_precombine2_cy [2]),
    .LI(\BU2/U0/Madd_precombine2_lut [3]),
    .O(\BU2/U0/precombine2 [3])
  );
  LUT2 #(
    .INIT ( 4'h6 ))
  \BU2/U0/Madd_precombine2_lut<4>  (
    .I0(\BU2/U0/lfsr3 [4]),
    .I1(\BU2/U0/lfsr4[4] ),
    .O(\BU2/U0/Madd_precombine2_lut [4])
  );
  MUXCY   \BU2/U0/Madd_precombine2_cy<4>  (
    .CI(\BU2/U0/Madd_precombine2_cy [3]),
    .DI(\BU2/U0/lfsr3 [4]),
    .S(\BU2/U0/Madd_precombine2_lut [4]),
    .O(\BU2/U0/Madd_precombine2_cy [4])
  );
  XORCY   \BU2/U0/Madd_precombine2_xor<4>  (
    .CI(\BU2/U0/Madd_precombine2_cy [3]),
    .LI(\BU2/U0/Madd_precombine2_lut [4]),
    .O(\BU2/U0/precombine2 [4])
  );
  LUT2 #(
    .INIT ( 4'h6 ))
  \BU2/U0/Madd_precombine2_lut<5>  (
    .I0(\BU2/U0/lfsr3 [5]),
    .I1(\BU2/U0/lfsr4[5] ),
    .O(\BU2/U0/Madd_precombine2_lut [5])
  );
  MUXCY   \BU2/U0/Madd_precombine2_cy<5>  (
    .CI(\BU2/U0/Madd_precombine2_cy [4]),
    .DI(\BU2/U0/lfsr3 [5]),
    .S(\BU2/U0/Madd_precombine2_lut [5]),
    .O(\BU2/U0/Madd_precombine2_cy [5])
  );
  XORCY   \BU2/U0/Madd_precombine2_xor<5>  (
    .CI(\BU2/U0/Madd_precombine2_cy [4]),
    .LI(\BU2/U0/Madd_precombine2_lut [5]),
    .O(\BU2/U0/precombine2 [5])
  );
  LUT2 #(
    .INIT ( 4'h6 ))
  \BU2/U0/Madd_precombine2_lut<6>  (
    .I0(\BU2/U0/lfsr3 [6]),
    .I1(\BU2/U0/lfsr4[6] ),
    .O(\BU2/U0/Madd_precombine2_lut [6])
  );
  MUXCY   \BU2/U0/Madd_precombine2_cy<6>  (
    .CI(\BU2/U0/Madd_precombine2_cy [5]),
    .DI(\BU2/U0/lfsr3 [6]),
    .S(\BU2/U0/Madd_precombine2_lut [6]),
    .O(\BU2/U0/Madd_precombine2_cy [6])
  );
  XORCY   \BU2/U0/Madd_precombine2_xor<6>  (
    .CI(\BU2/U0/Madd_precombine2_cy [5]),
    .LI(\BU2/U0/Madd_precombine2_lut [6]),
    .O(\BU2/U0/precombine2 [6])
  );
  LUT2 #(
    .INIT ( 4'h6 ))
  \BU2/U0/Madd_precombine2_lut<7>  (
    .I0(\BU2/U0/lfsr3 [7]),
    .I1(\BU2/U0/lfsr4[7] ),
    .O(\BU2/U0/Madd_precombine2_lut [7])
  );
  MUXCY   \BU2/U0/Madd_precombine2_cy<7>  (
    .CI(\BU2/U0/Madd_precombine2_cy [6]),
    .DI(\BU2/U0/lfsr3 [7]),
    .S(\BU2/U0/Madd_precombine2_lut [7]),
    .O(\BU2/U0/Madd_precombine2_cy [7])
  );
  XORCY   \BU2/U0/Madd_precombine2_xor<7>  (
    .CI(\BU2/U0/Madd_precombine2_cy [6]),
    .LI(\BU2/U0/Madd_precombine2_lut [7]),
    .O(\BU2/U0/precombine2 [7])
  );
  LUT2 #(
    .INIT ( 4'h6 ))
  \BU2/U0/Madd_precombine2_lut<8>  (
    .I0(\BU2/U0/lfsr3 [8]),
    .I1(\BU2/U0/lfsr4[8] ),
    .O(\BU2/U0/Madd_precombine2_lut [8])
  );
  MUXCY   \BU2/U0/Madd_precombine2_cy<8>  (
    .CI(\BU2/U0/Madd_precombine2_cy [7]),
    .DI(\BU2/U0/lfsr3 [8]),
    .S(\BU2/U0/Madd_precombine2_lut [8]),
    .O(\BU2/U0/Madd_precombine2_cy [8])
  );
  XORCY   \BU2/U0/Madd_precombine2_xor<8>  (
    .CI(\BU2/U0/Madd_precombine2_cy [7]),
    .LI(\BU2/U0/Madd_precombine2_lut [8]),
    .O(\BU2/U0/precombine2 [8])
  );
  LUT2 #(
    .INIT ( 4'h6 ))
  \BU2/U0/Madd_precombine2_lut<9>  (
    .I0(\BU2/U0/lfsr3 [9]),
    .I1(\BU2/U0/lfsr4[9] ),
    .O(\BU2/U0/Madd_precombine2_lut [9])
  );
  MUXCY   \BU2/U0/Madd_precombine2_cy<9>  (
    .CI(\BU2/U0/Madd_precombine2_cy [8]),
    .DI(\BU2/U0/lfsr3 [9]),
    .S(\BU2/U0/Madd_precombine2_lut [9]),
    .O(\BU2/U0/Madd_precombine2_cy [9])
  );
  XORCY   \BU2/U0/Madd_precombine2_xor<9>  (
    .CI(\BU2/U0/Madd_precombine2_cy [8]),
    .LI(\BU2/U0/Madd_precombine2_lut [9]),
    .O(\BU2/U0/precombine2 [9])
  );
  LUT2 #(
    .INIT ( 4'h6 ))
  \BU2/U0/Madd_precombine2_lut<10>  (
    .I0(\BU2/U0/lfsr3 [9]),
    .I1(\BU2/U0/lfsr4[9] ),
    .O(\BU2/U0/Madd_precombine2_lut [10])
  );
  XORCY   \BU2/U0/Madd_precombine2_xor<10>  (
    .CI(\BU2/U0/Madd_precombine2_cy [9]),
    .LI(\BU2/U0/Madd_precombine2_lut [10]),
    .O(\BU2/U0/precombine2 [10])
  );
  LUT2 #(
    .INIT ( 4'h6 ))
  \BU2/U0/i_accum/i_fabric.i_one_channel.i_accum/Madd_temp_lut<0>  (
    .I0(\BU2/U0/i_accum/phase_inc[0] ),
    .I1(\BU2/U0/acc_phase [0]),
    .O(\BU2/U0/i_accum/acc_phase_b [0])
  );
  MUXCY   \BU2/U0/i_accum/i_fabric.i_one_channel.i_accum/Madd_temp_cy<0>  (
    .CI(\BU2/channel [0]),
    .DI(\BU2/U0/acc_phase [0]),
    .S(\BU2/U0/i_accum/acc_phase_b [0]),
    .O(\BU2/U0/i_accum/i_fabric.i_one_channel.i_accum/Madd_temp_cy [0])
  );
  LUT2 #(
    .INIT ( 4'h6 ))
  \BU2/U0/i_accum/i_fabric.i_one_channel.i_accum/Madd_temp_lut<1>  (
    .I0(\BU2/U0/i_accum/phase_inc[10] ),
    .I1(\BU2/U0/acc_phase [1]),
    .O(\BU2/U0/i_accum/i_fabric.i_one_channel.i_accum/Madd_temp_lut [1])
  );
  MUXCY   \BU2/U0/i_accum/i_fabric.i_one_channel.i_accum/Madd_temp_cy<1>  (
    .CI(\BU2/U0/i_accum/i_fabric.i_one_channel.i_accum/Madd_temp_cy [0]),
    .DI(\BU2/U0/acc_phase [1]),
    .S(\BU2/U0/i_accum/i_fabric.i_one_channel.i_accum/Madd_temp_lut [1]),
    .O(\BU2/U0/i_accum/i_fabric.i_one_channel.i_accum/Madd_temp_cy [1])
  );
  XORCY   \BU2/U0/i_accum/i_fabric.i_one_channel.i_accum/Madd_temp_xor<1>  (
    .CI(\BU2/U0/i_accum/i_fabric.i_one_channel.i_accum/Madd_temp_cy [0]),
    .LI(\BU2/U0/i_accum/i_fabric.i_one_channel.i_accum/Madd_temp_lut [1]),
    .O(\BU2/U0/i_accum/acc_phase_b [1])
  );
  LUT2 #(
    .INIT ( 4'h6 ))
  \BU2/U0/i_accum/i_fabric.i_one_channel.i_accum/Madd_temp_lut<2>  (
    .I0(\BU2/U0/i_accum/phase_inc[10] ),
    .I1(\BU2/U0/acc_phase [2]),
    .O(\BU2/U0/i_accum/i_fabric.i_one_channel.i_accum/Madd_temp_lut [2])
  );
  MUXCY   \BU2/U0/i_accum/i_fabric.i_one_channel.i_accum/Madd_temp_cy<2>  (
    .CI(\BU2/U0/i_accum/i_fabric.i_one_channel.i_accum/Madd_temp_cy [1]),
    .DI(\BU2/U0/acc_phase [2]),
    .S(\BU2/U0/i_accum/i_fabric.i_one_channel.i_accum/Madd_temp_lut [2]),
    .O(\BU2/U0/i_accum/i_fabric.i_one_channel.i_accum/Madd_temp_cy [2])
  );
  XORCY   \BU2/U0/i_accum/i_fabric.i_one_channel.i_accum/Madd_temp_xor<2>  (
    .CI(\BU2/U0/i_accum/i_fabric.i_one_channel.i_accum/Madd_temp_cy [1]),
    .LI(\BU2/U0/i_accum/i_fabric.i_one_channel.i_accum/Madd_temp_lut [2]),
    .O(\BU2/U0/i_accum/acc_phase_b [2])
  );
  LUT2 #(
    .INIT ( 4'h6 ))
  \BU2/U0/i_accum/i_fabric.i_one_channel.i_accum/Madd_temp_lut<3>  (
    .I0(\BU2/U0/i_accum/phase_inc[0] ),
    .I1(\BU2/U0/acc_phase [3]),
    .O(\BU2/U0/i_accum/i_fabric.i_one_channel.i_accum/Madd_temp_lut [3])
  );
  MUXCY   \BU2/U0/i_accum/i_fabric.i_one_channel.i_accum/Madd_temp_cy<3>  (
    .CI(\BU2/U0/i_accum/i_fabric.i_one_channel.i_accum/Madd_temp_cy [2]),
    .DI(\BU2/U0/acc_phase [3]),
    .S(\BU2/U0/i_accum/i_fabric.i_one_channel.i_accum/Madd_temp_lut [3]),
    .O(\BU2/U0/i_accum/i_fabric.i_one_channel.i_accum/Madd_temp_cy [3])
  );
  XORCY   \BU2/U0/i_accum/i_fabric.i_one_channel.i_accum/Madd_temp_xor<3>  (
    .CI(\BU2/U0/i_accum/i_fabric.i_one_channel.i_accum/Madd_temp_cy [2]),
    .LI(\BU2/U0/i_accum/i_fabric.i_one_channel.i_accum/Madd_temp_lut [3]),
    .O(\BU2/U0/i_accum/acc_phase_b [3])
  );
  LUT2 #(
    .INIT ( 4'h6 ))
  \BU2/U0/i_accum/i_fabric.i_one_channel.i_accum/Madd_temp_lut<4>  (
    .I0(\BU2/U0/i_accum/phase_inc[0] ),
    .I1(\BU2/U0/acc_phase [4]),
    .O(\BU2/U0/i_accum/i_fabric.i_one_channel.i_accum/Madd_temp_lut [4])
  );
  MUXCY   \BU2/U0/i_accum/i_fabric.i_one_channel.i_accum/Madd_temp_cy<4>  (
    .CI(\BU2/U0/i_accum/i_fabric.i_one_channel.i_accum/Madd_temp_cy [3]),
    .DI(\BU2/U0/acc_phase [4]),
    .S(\BU2/U0/i_accum/i_fabric.i_one_channel.i_accum/Madd_temp_lut [4]),
    .O(\BU2/U0/i_accum/i_fabric.i_one_channel.i_accum/Madd_temp_cy [4])
  );
  XORCY   \BU2/U0/i_accum/i_fabric.i_one_channel.i_accum/Madd_temp_xor<4>  (
    .CI(\BU2/U0/i_accum/i_fabric.i_one_channel.i_accum/Madd_temp_cy [3]),
    .LI(\BU2/U0/i_accum/i_fabric.i_one_channel.i_accum/Madd_temp_lut [4]),
    .O(\BU2/U0/i_accum/acc_phase_b [4])
  );
  LUT2 #(
    .INIT ( 4'h6 ))
  \BU2/U0/i_accum/i_fabric.i_one_channel.i_accum/Madd_temp_lut<5>  (
    .I0(\BU2/U0/i_accum/phase_inc[10] ),
    .I1(\BU2/U0/acc_phase [5]),
    .O(\BU2/U0/i_accum/i_fabric.i_one_channel.i_accum/Madd_temp_lut [5])
  );
  MUXCY   \BU2/U0/i_accum/i_fabric.i_one_channel.i_accum/Madd_temp_cy<5>  (
    .CI(\BU2/U0/i_accum/i_fabric.i_one_channel.i_accum/Madd_temp_cy [4]),
    .DI(\BU2/U0/acc_phase [5]),
    .S(\BU2/U0/i_accum/i_fabric.i_one_channel.i_accum/Madd_temp_lut [5]),
    .O(\BU2/U0/i_accum/i_fabric.i_one_channel.i_accum/Madd_temp_cy [5])
  );
  XORCY   \BU2/U0/i_accum/i_fabric.i_one_channel.i_accum/Madd_temp_xor<5>  (
    .CI(\BU2/U0/i_accum/i_fabric.i_one_channel.i_accum/Madd_temp_cy [4]),
    .LI(\BU2/U0/i_accum/i_fabric.i_one_channel.i_accum/Madd_temp_lut [5]),
    .O(\BU2/U0/i_accum/acc_phase_b [5])
  );
  LUT2 #(
    .INIT ( 4'h6 ))
  \BU2/U0/i_accum/i_fabric.i_one_channel.i_accum/Madd_temp_lut<6>  (
    .I0(\BU2/U0/i_accum/phase_inc[10] ),
    .I1(\BU2/U0/acc_phase [6]),
    .O(\BU2/U0/i_accum/i_fabric.i_one_channel.i_accum/Madd_temp_lut [6])
  );
  MUXCY   \BU2/U0/i_accum/i_fabric.i_one_channel.i_accum/Madd_temp_cy<6>  (
    .CI(\BU2/U0/i_accum/i_fabric.i_one_channel.i_accum/Madd_temp_cy [5]),
    .DI(\BU2/U0/acc_phase [6]),
    .S(\BU2/U0/i_accum/i_fabric.i_one_channel.i_accum/Madd_temp_lut [6]),
    .O(\BU2/U0/i_accum/i_fabric.i_one_channel.i_accum/Madd_temp_cy [6])
  );
  XORCY   \BU2/U0/i_accum/i_fabric.i_one_channel.i_accum/Madd_temp_xor<6>  (
    .CI(\BU2/U0/i_accum/i_fabric.i_one_channel.i_accum/Madd_temp_cy [5]),
    .LI(\BU2/U0/i_accum/i_fabric.i_one_channel.i_accum/Madd_temp_lut [6]),
    .O(\BU2/U0/i_accum/acc_phase_b [6])
  );
  LUT2 #(
    .INIT ( 4'h6 ))
  \BU2/U0/i_accum/i_fabric.i_one_channel.i_accum/Madd_temp_lut<7>  (
    .I0(\BU2/U0/i_accum/phase_inc[0] ),
    .I1(\BU2/U0/acc_phase [7]),
    .O(\BU2/U0/i_accum/i_fabric.i_one_channel.i_accum/Madd_temp_lut [7])
  );
  MUXCY   \BU2/U0/i_accum/i_fabric.i_one_channel.i_accum/Madd_temp_cy<7>  (
    .CI(\BU2/U0/i_accum/i_fabric.i_one_channel.i_accum/Madd_temp_cy [6]),
    .DI(\BU2/U0/acc_phase [7]),
    .S(\BU2/U0/i_accum/i_fabric.i_one_channel.i_accum/Madd_temp_lut [7]),
    .O(\BU2/U0/i_accum/i_fabric.i_one_channel.i_accum/Madd_temp_cy [7])
  );
  XORCY   \BU2/U0/i_accum/i_fabric.i_one_channel.i_accum/Madd_temp_xor<7>  (
    .CI(\BU2/U0/i_accum/i_fabric.i_one_channel.i_accum/Madd_temp_cy [6]),
    .LI(\BU2/U0/i_accum/i_fabric.i_one_channel.i_accum/Madd_temp_lut [7]),
    .O(\BU2/U0/i_accum/acc_phase_b [7])
  );
  LUT2 #(
    .INIT ( 4'h6 ))
  \BU2/U0/i_accum/i_fabric.i_one_channel.i_accum/Madd_temp_lut<8>  (
    .I0(\BU2/U0/i_accum/phase_inc[0] ),
    .I1(\BU2/U0/acc_phase [8]),
    .O(\BU2/U0/i_accum/i_fabric.i_one_channel.i_accum/Madd_temp_lut [8])
  );
  MUXCY   \BU2/U0/i_accum/i_fabric.i_one_channel.i_accum/Madd_temp_cy<8>  (
    .CI(\BU2/U0/i_accum/i_fabric.i_one_channel.i_accum/Madd_temp_cy [7]),
    .DI(\BU2/U0/acc_phase [8]),
    .S(\BU2/U0/i_accum/i_fabric.i_one_channel.i_accum/Madd_temp_lut [8]),
    .O(\BU2/U0/i_accum/i_fabric.i_one_channel.i_accum/Madd_temp_cy [8])
  );
  XORCY   \BU2/U0/i_accum/i_fabric.i_one_channel.i_accum/Madd_temp_xor<8>  (
    .CI(\BU2/U0/i_accum/i_fabric.i_one_channel.i_accum/Madd_temp_cy [7]),
    .LI(\BU2/U0/i_accum/i_fabric.i_one_channel.i_accum/Madd_temp_lut [8]),
    .O(\BU2/U0/i_accum/acc_phase_b [8])
  );
  LUT2 #(
    .INIT ( 4'h6 ))
  \BU2/U0/i_accum/i_fabric.i_one_channel.i_accum/Madd_temp_lut<9>  (
    .I0(\BU2/U0/i_accum/phase_inc[10] ),
    .I1(\BU2/U0/acc_phase [9]),
    .O(\BU2/U0/i_accum/i_fabric.i_one_channel.i_accum/Madd_temp_lut [9])
  );
  MUXCY   \BU2/U0/i_accum/i_fabric.i_one_channel.i_accum/Madd_temp_cy<9>  (
    .CI(\BU2/U0/i_accum/i_fabric.i_one_channel.i_accum/Madd_temp_cy [8]),
    .DI(\BU2/U0/acc_phase [9]),
    .S(\BU2/U0/i_accum/i_fabric.i_one_channel.i_accum/Madd_temp_lut [9]),
    .O(\BU2/U0/i_accum/i_fabric.i_one_channel.i_accum/Madd_temp_cy [9])
  );
  XORCY   \BU2/U0/i_accum/i_fabric.i_one_channel.i_accum/Madd_temp_xor<9>  (
    .CI(\BU2/U0/i_accum/i_fabric.i_one_channel.i_accum/Madd_temp_cy [8]),
    .LI(\BU2/U0/i_accum/i_fabric.i_one_channel.i_accum/Madd_temp_lut [9]),
    .O(\BU2/U0/i_accum/acc_phase_b [9])
  );
  LUT2 #(
    .INIT ( 4'h6 ))
  \BU2/U0/i_accum/i_fabric.i_one_channel.i_accum/Madd_temp_lut<10>  (
    .I0(\BU2/U0/i_accum/phase_inc[10] ),
    .I1(\BU2/U0/acc_phase [10]),
    .O(\BU2/U0/i_accum/i_fabric.i_one_channel.i_accum/Madd_temp_lut [10])
  );
  MUXCY   \BU2/U0/i_accum/i_fabric.i_one_channel.i_accum/Madd_temp_cy<10>  (
    .CI(\BU2/U0/i_accum/i_fabric.i_one_channel.i_accum/Madd_temp_cy [9]),
    .DI(\BU2/U0/acc_phase [10]),
    .S(\BU2/U0/i_accum/i_fabric.i_one_channel.i_accum/Madd_temp_lut [10]),
    .O(\BU2/U0/i_accum/i_fabric.i_one_channel.i_accum/Madd_temp_cy [10])
  );
  XORCY   \BU2/U0/i_accum/i_fabric.i_one_channel.i_accum/Madd_temp_xor<10>  (
    .CI(\BU2/U0/i_accum/i_fabric.i_one_channel.i_accum/Madd_temp_cy [9]),
    .LI(\BU2/U0/i_accum/i_fabric.i_one_channel.i_accum/Madd_temp_lut [10]),
    .O(\BU2/U0/i_accum/acc_phase_b [10])
  );
  LUT2 #(
    .INIT ( 4'h6 ))
  \BU2/U0/i_accum/i_fabric.i_one_channel.i_accum/Madd_temp_lut<11>  (
    .I0(\BU2/U0/i_accum/phase_inc[0] ),
    .I1(\BU2/U0/acc_phase [11]),
    .O(\BU2/U0/i_accum/i_fabric.i_one_channel.i_accum/Madd_temp_lut [11])
  );
  MUXCY   \BU2/U0/i_accum/i_fabric.i_one_channel.i_accum/Madd_temp_cy<11>  (
    .CI(\BU2/U0/i_accum/i_fabric.i_one_channel.i_accum/Madd_temp_cy [10]),
    .DI(\BU2/U0/acc_phase [11]),
    .S(\BU2/U0/i_accum/i_fabric.i_one_channel.i_accum/Madd_temp_lut [11]),
    .O(\BU2/U0/i_accum/i_fabric.i_one_channel.i_accum/Madd_temp_cy [11])
  );
  XORCY   \BU2/U0/i_accum/i_fabric.i_one_channel.i_accum/Madd_temp_xor<11>  (
    .CI(\BU2/U0/i_accum/i_fabric.i_one_channel.i_accum/Madd_temp_cy [10]),
    .LI(\BU2/U0/i_accum/i_fabric.i_one_channel.i_accum/Madd_temp_lut [11]),
    .O(\BU2/U0/i_accum/acc_phase_b [11])
  );
  LUT2 #(
    .INIT ( 4'h6 ))
  \BU2/U0/i_accum/i_fabric.i_one_channel.i_accum/Madd_temp_lut<12>  (
    .I0(\BU2/U0/i_accum/phase_inc[0] ),
    .I1(\BU2/U0/acc_phase [12]),
    .O(\BU2/U0/i_accum/i_fabric.i_one_channel.i_accum/Madd_temp_lut [12])
  );
  MUXCY   \BU2/U0/i_accum/i_fabric.i_one_channel.i_accum/Madd_temp_cy<12>  (
    .CI(\BU2/U0/i_accum/i_fabric.i_one_channel.i_accum/Madd_temp_cy [11]),
    .DI(\BU2/U0/acc_phase [12]),
    .S(\BU2/U0/i_accum/i_fabric.i_one_channel.i_accum/Madd_temp_lut [12]),
    .O(\BU2/U0/i_accum/i_fabric.i_one_channel.i_accum/Madd_temp_cy [12])
  );
  XORCY   \BU2/U0/i_accum/i_fabric.i_one_channel.i_accum/Madd_temp_xor<12>  (
    .CI(\BU2/U0/i_accum/i_fabric.i_one_channel.i_accum/Madd_temp_cy [11]),
    .LI(\BU2/U0/i_accum/i_fabric.i_one_channel.i_accum/Madd_temp_lut [12]),
    .O(\BU2/U0/i_accum/acc_phase_b [12])
  );
  LUT2 #(
    .INIT ( 4'h6 ))
  \BU2/U0/i_accum/i_fabric.i_one_channel.i_accum/Madd_temp_lut<13>  (
    .I0(\BU2/U0/i_accum/phase_inc[10] ),
    .I1(\BU2/U0/acc_phase [13]),
    .O(\BU2/U0/i_accum/i_fabric.i_one_channel.i_accum/Madd_temp_lut [13])
  );
  MUXCY   \BU2/U0/i_accum/i_fabric.i_one_channel.i_accum/Madd_temp_cy<13>  (
    .CI(\BU2/U0/i_accum/i_fabric.i_one_channel.i_accum/Madd_temp_cy [12]),
    .DI(\BU2/U0/acc_phase [13]),
    .S(\BU2/U0/i_accum/i_fabric.i_one_channel.i_accum/Madd_temp_lut [13]),
    .O(\BU2/U0/i_accum/i_fabric.i_one_channel.i_accum/Madd_temp_cy [13])
  );
  XORCY   \BU2/U0/i_accum/i_fabric.i_one_channel.i_accum/Madd_temp_xor<13>  (
    .CI(\BU2/U0/i_accum/i_fabric.i_one_channel.i_accum/Madd_temp_cy [12]),
    .LI(\BU2/U0/i_accum/i_fabric.i_one_channel.i_accum/Madd_temp_lut [13]),
    .O(\BU2/U0/i_accum/acc_phase_b [13])
  );
  LUT2 #(
    .INIT ( 4'h6 ))
  \BU2/U0/i_accum/i_fabric.i_one_channel.i_accum/Madd_temp_lut<14>  (
    .I0(\BU2/U0/i_accum/phase_inc[10] ),
    .I1(\BU2/U0/acc_phase [14]),
    .O(\BU2/U0/i_accum/i_fabric.i_one_channel.i_accum/Madd_temp_lut [14])
  );
  MUXCY   \BU2/U0/i_accum/i_fabric.i_one_channel.i_accum/Madd_temp_cy<14>  (
    .CI(\BU2/U0/i_accum/i_fabric.i_one_channel.i_accum/Madd_temp_cy [13]),
    .DI(\BU2/U0/acc_phase [14]),
    .S(\BU2/U0/i_accum/i_fabric.i_one_channel.i_accum/Madd_temp_lut [14]),
    .O(\BU2/U0/i_accum/i_fabric.i_one_channel.i_accum/Madd_temp_cy [14])
  );
  XORCY   \BU2/U0/i_accum/i_fabric.i_one_channel.i_accum/Madd_temp_xor<14>  (
    .CI(\BU2/U0/i_accum/i_fabric.i_one_channel.i_accum/Madd_temp_cy [13]),
    .LI(\BU2/U0/i_accum/i_fabric.i_one_channel.i_accum/Madd_temp_lut [14]),
    .O(\BU2/U0/i_accum/acc_phase_b [14])
  );
  LUT2 #(
    .INIT ( 4'h6 ))
  \BU2/U0/i_accum/i_fabric.i_one_channel.i_accum/Madd_temp_lut<15>  (
    .I0(\BU2/U0/i_accum/phase_inc[0] ),
    .I1(\BU2/U0/acc_phase [15]),
    .O(\BU2/U0/i_accum/i_fabric.i_one_channel.i_accum/Madd_temp_lut [15])
  );
  MUXCY   \BU2/U0/i_accum/i_fabric.i_one_channel.i_accum/Madd_temp_cy<15>  (
    .CI(\BU2/U0/i_accum/i_fabric.i_one_channel.i_accum/Madd_temp_cy [14]),
    .DI(\BU2/U0/acc_phase [15]),
    .S(\BU2/U0/i_accum/i_fabric.i_one_channel.i_accum/Madd_temp_lut [15]),
    .O(\BU2/U0/i_accum/i_fabric.i_one_channel.i_accum/Madd_temp_cy [15])
  );
  XORCY   \BU2/U0/i_accum/i_fabric.i_one_channel.i_accum/Madd_temp_xor<15>  (
    .CI(\BU2/U0/i_accum/i_fabric.i_one_channel.i_accum/Madd_temp_cy [14]),
    .LI(\BU2/U0/i_accum/i_fabric.i_one_channel.i_accum/Madd_temp_lut [15]),
    .O(\BU2/U0/i_accum/acc_phase_b [15])
  );
  LUT2 #(
    .INIT ( 4'h6 ))
  \BU2/U0/i_accum/i_fabric.i_one_channel.i_accum/Madd_temp_lut<16>  (
    .I0(\BU2/U0/i_accum/phase_inc[0] ),
    .I1(\BU2/U0/acc_phase [16]),
    .O(\BU2/U0/i_accum/i_fabric.i_one_channel.i_accum/Madd_temp_lut [16])
  );
  MUXCY   \BU2/U0/i_accum/i_fabric.i_one_channel.i_accum/Madd_temp_cy<16>  (
    .CI(\BU2/U0/i_accum/i_fabric.i_one_channel.i_accum/Madd_temp_cy [15]),
    .DI(\BU2/U0/acc_phase [16]),
    .S(\BU2/U0/i_accum/i_fabric.i_one_channel.i_accum/Madd_temp_lut [16]),
    .O(\BU2/U0/i_accum/i_fabric.i_one_channel.i_accum/Madd_temp_cy [16])
  );
  XORCY   \BU2/U0/i_accum/i_fabric.i_one_channel.i_accum/Madd_temp_xor<16>  (
    .CI(\BU2/U0/i_accum/i_fabric.i_one_channel.i_accum/Madd_temp_cy [15]),
    .LI(\BU2/U0/i_accum/i_fabric.i_one_channel.i_accum/Madd_temp_lut [16]),
    .O(\BU2/U0/i_accum/acc_phase_b [16])
  );
  LUT2 #(
    .INIT ( 4'h6 ))
  \BU2/U0/i_accum/i_fabric.i_one_channel.i_accum/Madd_temp_lut<17>  (
    .I0(\BU2/U0/i_accum/phase_inc[10] ),
    .I1(\BU2/U0/acc_phase [17]),
    .O(\BU2/U0/i_accum/i_fabric.i_one_channel.i_accum/Madd_temp_lut [17])
  );
  MUXCY   \BU2/U0/i_accum/i_fabric.i_one_channel.i_accum/Madd_temp_cy<17>  (
    .CI(\BU2/U0/i_accum/i_fabric.i_one_channel.i_accum/Madd_temp_cy [16]),
    .DI(\BU2/U0/acc_phase [17]),
    .S(\BU2/U0/i_accum/i_fabric.i_one_channel.i_accum/Madd_temp_lut [17]),
    .O(\BU2/U0/i_accum/i_fabric.i_one_channel.i_accum/Madd_temp_cy [17])
  );
  XORCY   \BU2/U0/i_accum/i_fabric.i_one_channel.i_accum/Madd_temp_xor<17>  (
    .CI(\BU2/U0/i_accum/i_fabric.i_one_channel.i_accum/Madd_temp_cy [16]),
    .LI(\BU2/U0/i_accum/i_fabric.i_one_channel.i_accum/Madd_temp_lut [17]),
    .O(\BU2/U0/i_accum/acc_phase_b [17])
  );
  LUT2 #(
    .INIT ( 4'h6 ))
  \BU2/U0/i_accum/i_fabric.i_one_channel.i_accum/Madd_temp_lut<18>  (
    .I0(\BU2/U0/i_accum/phase_inc[10] ),
    .I1(\BU2/U0/acc_phase [18]),
    .O(\BU2/U0/i_accum/i_fabric.i_one_channel.i_accum/Madd_temp_lut [18])
  );
  MUXCY   \BU2/U0/i_accum/i_fabric.i_one_channel.i_accum/Madd_temp_cy<18>  (
    .CI(\BU2/U0/i_accum/i_fabric.i_one_channel.i_accum/Madd_temp_cy [17]),
    .DI(\BU2/U0/acc_phase [18]),
    .S(\BU2/U0/i_accum/i_fabric.i_one_channel.i_accum/Madd_temp_lut [18]),
    .O(\BU2/U0/i_accum/i_fabric.i_one_channel.i_accum/Madd_temp_cy [18])
  );
  XORCY   \BU2/U0/i_accum/i_fabric.i_one_channel.i_accum/Madd_temp_xor<18>  (
    .CI(\BU2/U0/i_accum/i_fabric.i_one_channel.i_accum/Madd_temp_cy [17]),
    .LI(\BU2/U0/i_accum/i_fabric.i_one_channel.i_accum/Madd_temp_lut [18]),
    .O(\BU2/U0/i_accum/acc_phase_b [18])
  );
  LUT2 #(
    .INIT ( 4'h6 ))
  \BU2/U0/i_accum/i_fabric.i_one_channel.i_accum/Madd_temp_lut<19>  (
    .I0(\BU2/U0/i_accum/phase_inc[0] ),
    .I1(\BU2/U0/acc_phase [19]),
    .O(\BU2/U0/i_accum/i_fabric.i_one_channel.i_accum/Madd_temp_lut [19])
  );
  MUXCY   \BU2/U0/i_accum/i_fabric.i_one_channel.i_accum/Madd_temp_cy<19>  (
    .CI(\BU2/U0/i_accum/i_fabric.i_one_channel.i_accum/Madd_temp_cy [18]),
    .DI(\BU2/U0/acc_phase [19]),
    .S(\BU2/U0/i_accum/i_fabric.i_one_channel.i_accum/Madd_temp_lut [19]),
    .O(\BU2/U0/i_accum/i_fabric.i_one_channel.i_accum/Madd_temp_cy [19])
  );
  XORCY   \BU2/U0/i_accum/i_fabric.i_one_channel.i_accum/Madd_temp_xor<19>  (
    .CI(\BU2/U0/i_accum/i_fabric.i_one_channel.i_accum/Madd_temp_cy [18]),
    .LI(\BU2/U0/i_accum/i_fabric.i_one_channel.i_accum/Madd_temp_lut [19]),
    .O(\BU2/U0/i_accum/acc_phase_b [19])
  );
  LUT2 #(
    .INIT ( 4'h6 ))
  \BU2/U0/i_accum/i_fabric.i_one_channel.i_accum/Madd_temp_lut<20>  (
    .I0(\BU2/U0/i_accum/phase_inc[0] ),
    .I1(\BU2/U0/acc_phase [20]),
    .O(\BU2/U0/i_accum/i_fabric.i_one_channel.i_accum/Madd_temp_lut [20])
  );
  MUXCY   \BU2/U0/i_accum/i_fabric.i_one_channel.i_accum/Madd_temp_cy<20>  (
    .CI(\BU2/U0/i_accum/i_fabric.i_one_channel.i_accum/Madd_temp_cy [19]),
    .DI(\BU2/U0/acc_phase [20]),
    .S(\BU2/U0/i_accum/i_fabric.i_one_channel.i_accum/Madd_temp_lut [20]),
    .O(\BU2/U0/i_accum/i_fabric.i_one_channel.i_accum/Madd_temp_cy [20])
  );
  XORCY   \BU2/U0/i_accum/i_fabric.i_one_channel.i_accum/Madd_temp_xor<20>  (
    .CI(\BU2/U0/i_accum/i_fabric.i_one_channel.i_accum/Madd_temp_cy [19]),
    .LI(\BU2/U0/i_accum/i_fabric.i_one_channel.i_accum/Madd_temp_lut [20]),
    .O(\BU2/U0/i_accum/acc_phase_b [20])
  );
  LUT2 #(
    .INIT ( 4'h6 ))
  \BU2/U0/i_accum/i_fabric.i_one_channel.i_accum/Madd_temp_lut<21>  (
    .I0(\BU2/U0/i_accum/phase_inc[10] ),
    .I1(\BU2/U0/acc_phase [21]),
    .O(\BU2/U0/i_accum/i_fabric.i_one_channel.i_accum/Madd_temp_lut [21])
  );
  MUXCY   \BU2/U0/i_accum/i_fabric.i_one_channel.i_accum/Madd_temp_cy<21>  (
    .CI(\BU2/U0/i_accum/i_fabric.i_one_channel.i_accum/Madd_temp_cy [20]),
    .DI(\BU2/U0/acc_phase [21]),
    .S(\BU2/U0/i_accum/i_fabric.i_one_channel.i_accum/Madd_temp_lut [21]),
    .O(\BU2/U0/i_accum/i_fabric.i_one_channel.i_accum/Madd_temp_cy [21])
  );
  XORCY   \BU2/U0/i_accum/i_fabric.i_one_channel.i_accum/Madd_temp_xor<21>  (
    .CI(\BU2/U0/i_accum/i_fabric.i_one_channel.i_accum/Madd_temp_cy [20]),
    .LI(\BU2/U0/i_accum/i_fabric.i_one_channel.i_accum/Madd_temp_lut [21]),
    .O(\BU2/U0/i_accum/acc_phase_b [21])
  );
  LUT2 #(
    .INIT ( 4'h6 ))
  \BU2/U0/i_accum/i_fabric.i_one_channel.i_accum/Madd_temp_lut<22>  (
    .I0(\BU2/U0/i_accum/phase_inc[10] ),
    .I1(\BU2/U0/acc_phase [22]),
    .O(\BU2/U0/i_accum/i_fabric.i_one_channel.i_accum/Madd_temp_lut [22])
  );
  MUXCY   \BU2/U0/i_accum/i_fabric.i_one_channel.i_accum/Madd_temp_cy<22>  (
    .CI(\BU2/U0/i_accum/i_fabric.i_one_channel.i_accum/Madd_temp_cy [21]),
    .DI(\BU2/U0/acc_phase [22]),
    .S(\BU2/U0/i_accum/i_fabric.i_one_channel.i_accum/Madd_temp_lut [22]),
    .O(\BU2/U0/i_accum/i_fabric.i_one_channel.i_accum/Madd_temp_cy [22])
  );
  XORCY   \BU2/U0/i_accum/i_fabric.i_one_channel.i_accum/Madd_temp_xor<22>  (
    .CI(\BU2/U0/i_accum/i_fabric.i_one_channel.i_accum/Madd_temp_cy [21]),
    .LI(\BU2/U0/i_accum/i_fabric.i_one_channel.i_accum/Madd_temp_lut [22]),
    .O(\BU2/U0/i_accum/acc_phase_b [22])
  );
  LUT2 #(
    .INIT ( 4'h6 ))
  \BU2/U0/i_accum/i_fabric.i_one_channel.i_accum/Madd_temp_lut<23>  (
    .I0(\BU2/U0/acc_phase [23]),
    .I1(\BU2/U0/i_accum/phase_inc[0] ),
    .O(\BU2/U0/i_accum/i_fabric.i_one_channel.i_accum/Madd_temp_lut [23])
  );
  MUXCY   \BU2/U0/i_accum/i_fabric.i_one_channel.i_accum/Madd_temp_cy<23>  (
    .CI(\BU2/U0/i_accum/i_fabric.i_one_channel.i_accum/Madd_temp_cy [22]),
    .DI(\BU2/U0/acc_phase [23]),
    .S(\BU2/U0/i_accum/i_fabric.i_one_channel.i_accum/Madd_temp_lut [23]),
    .O(\BU2/U0/i_accum/i_fabric.i_one_channel.i_accum/Madd_temp_cy [23])
  );
  XORCY   \BU2/U0/i_accum/i_fabric.i_one_channel.i_accum/Madd_temp_xor<23>  (
    .CI(\BU2/U0/i_accum/i_fabric.i_one_channel.i_accum/Madd_temp_cy [22]),
    .LI(\BU2/U0/i_accum/i_fabric.i_one_channel.i_accum/Madd_temp_lut [23]),
    .O(\BU2/U0/i_accum/acc_phase_b [23])
  );
  LUT2 #(
    .INIT ( 4'h6 ))
  \BU2/U0/i_accum/i_fabric.i_one_channel.i_accum/Madd_temp_lut<24>  (
    .I0(\BU2/U0/acc_phase [24]),
    .I1(\BU2/U0/i_accum/phase_inc[0] ),
    .O(\BU2/U0/i_accum/i_fabric.i_one_channel.i_accum/Madd_temp_lut [24])
  );
  MUXCY   \BU2/U0/i_accum/i_fabric.i_one_channel.i_accum/Madd_temp_cy<24>  (
    .CI(\BU2/U0/i_accum/i_fabric.i_one_channel.i_accum/Madd_temp_cy [23]),
    .DI(\BU2/U0/acc_phase [24]),
    .S(\BU2/U0/i_accum/i_fabric.i_one_channel.i_accum/Madd_temp_lut [24]),
    .O(\BU2/U0/i_accum/i_fabric.i_one_channel.i_accum/Madd_temp_cy [24])
  );
  XORCY   \BU2/U0/i_accum/i_fabric.i_one_channel.i_accum/Madd_temp_xor<24>  (
    .CI(\BU2/U0/i_accum/i_fabric.i_one_channel.i_accum/Madd_temp_cy [23]),
    .LI(\BU2/U0/i_accum/i_fabric.i_one_channel.i_accum/Madd_temp_lut [24]),
    .O(\BU2/U0/i_accum/acc_phase_b [24])
  );
  LUT2 #(
    .INIT ( 4'h6 ))
  \BU2/U0/i_accum/i_fabric.i_one_channel.i_accum/Madd_temp_lut<25>  (
    .I0(\BU2/U0/acc_phase [25]),
    .I1(\BU2/U0/i_accum/phase_inc[10] ),
    .O(\BU2/U0/i_accum/i_fabric.i_one_channel.i_accum/Madd_temp_lut [25])
  );
  MUXCY   \BU2/U0/i_accum/i_fabric.i_one_channel.i_accum/Madd_temp_cy<25>  (
    .CI(\BU2/U0/i_accum/i_fabric.i_one_channel.i_accum/Madd_temp_cy [24]),
    .DI(\BU2/U0/acc_phase [25]),
    .S(\BU2/U0/i_accum/i_fabric.i_one_channel.i_accum/Madd_temp_lut [25]),
    .O(\BU2/U0/i_accum/i_fabric.i_one_channel.i_accum/Madd_temp_cy [25])
  );
  XORCY   \BU2/U0/i_accum/i_fabric.i_one_channel.i_accum/Madd_temp_xor<25>  (
    .CI(\BU2/U0/i_accum/i_fabric.i_one_channel.i_accum/Madd_temp_cy [24]),
    .LI(\BU2/U0/i_accum/i_fabric.i_one_channel.i_accum/Madd_temp_lut [25]),
    .O(\BU2/U0/i_accum/acc_phase_b [25])
  );
  LUT2 #(
    .INIT ( 4'h6 ))
  \BU2/U0/i_accum/i_fabric.i_one_channel.i_accum/Madd_temp_lut<26>  (
    .I0(\BU2/U0/acc_phase [26]),
    .I1(\BU2/U0/i_accum/phase_inc[10] ),
    .O(\BU2/U0/i_accum/i_fabric.i_one_channel.i_accum/Madd_temp_lut [26])
  );
  MUXCY   \BU2/U0/i_accum/i_fabric.i_one_channel.i_accum/Madd_temp_cy<26>  (
    .CI(\BU2/U0/i_accum/i_fabric.i_one_channel.i_accum/Madd_temp_cy [25]),
    .DI(\BU2/U0/acc_phase [26]),
    .S(\BU2/U0/i_accum/i_fabric.i_one_channel.i_accum/Madd_temp_lut [26]),
    .O(\BU2/U0/i_accum/i_fabric.i_one_channel.i_accum/Madd_temp_cy [26])
  );
  XORCY   \BU2/U0/i_accum/i_fabric.i_one_channel.i_accum/Madd_temp_xor<26>  (
    .CI(\BU2/U0/i_accum/i_fabric.i_one_channel.i_accum/Madd_temp_cy [25]),
    .LI(\BU2/U0/i_accum/i_fabric.i_one_channel.i_accum/Madd_temp_lut [26]),
    .O(\BU2/U0/i_accum/acc_phase_b [26])
  );
  LUT2 #(
    .INIT ( 4'h6 ))
  \BU2/U0/i_accum/i_fabric.i_one_channel.i_accum/Madd_temp_lut<27>  (
    .I0(\BU2/U0/acc_phase [27]),
    .I1(\BU2/U0/i_accum/phase_inc[0] ),
    .O(\BU2/U0/i_accum/i_fabric.i_one_channel.i_accum/Madd_temp_lut [27])
  );
  MUXCY   \BU2/U0/i_accum/i_fabric.i_one_channel.i_accum/Madd_temp_cy<27>  (
    .CI(\BU2/U0/i_accum/i_fabric.i_one_channel.i_accum/Madd_temp_cy [26]),
    .DI(\BU2/U0/acc_phase [27]),
    .S(\BU2/U0/i_accum/i_fabric.i_one_channel.i_accum/Madd_temp_lut [27]),
    .O(\BU2/U0/i_accum/i_fabric.i_one_channel.i_accum/Madd_temp_cy [27])
  );
  XORCY   \BU2/U0/i_accum/i_fabric.i_one_channel.i_accum/Madd_temp_xor<27>  (
    .CI(\BU2/U0/i_accum/i_fabric.i_one_channel.i_accum/Madd_temp_cy [26]),
    .LI(\BU2/U0/i_accum/i_fabric.i_one_channel.i_accum/Madd_temp_lut [27]),
    .O(\BU2/U0/i_accum/acc_phase_b [27])
  );
  LUT2 #(
    .INIT ( 4'h6 ))
  \BU2/U0/i_accum/i_fabric.i_one_channel.i_accum/Madd_temp_lut<28>  (
    .I0(\BU2/U0/acc_phase [28]),
    .I1(\BU2/U0/i_accum/phase_inc[0] ),
    .O(\BU2/U0/i_accum/i_fabric.i_one_channel.i_accum/Madd_temp_lut [28])
  );
  MUXCY   \BU2/U0/i_accum/i_fabric.i_one_channel.i_accum/Madd_temp_cy<28>  (
    .CI(\BU2/U0/i_accum/i_fabric.i_one_channel.i_accum/Madd_temp_cy [27]),
    .DI(\BU2/U0/acc_phase [28]),
    .S(\BU2/U0/i_accum/i_fabric.i_one_channel.i_accum/Madd_temp_lut [28]),
    .O(\BU2/U0/i_accum/i_fabric.i_one_channel.i_accum/Madd_temp_cy [28])
  );
  XORCY   \BU2/U0/i_accum/i_fabric.i_one_channel.i_accum/Madd_temp_xor<28>  (
    .CI(\BU2/U0/i_accum/i_fabric.i_one_channel.i_accum/Madd_temp_cy [27]),
    .LI(\BU2/U0/i_accum/i_fabric.i_one_channel.i_accum/Madd_temp_lut [28]),
    .O(\BU2/U0/i_accum/acc_phase_b [28])
  );
  LUT2 #(
    .INIT ( 4'h6 ))
  \BU2/U0/i_accum/i_fabric.i_one_channel.i_accum/Madd_temp_lut<29>  (
    .I0(\BU2/U0/acc_phase [29]),
    .I1(\BU2/U0/i_accum/phase_inc[10] ),
    .O(\BU2/U0/i_accum/i_fabric.i_one_channel.i_accum/Madd_temp_lut [29])
  );
  MUXCY   \BU2/U0/i_accum/i_fabric.i_one_channel.i_accum/Madd_temp_cy<29>  (
    .CI(\BU2/U0/i_accum/i_fabric.i_one_channel.i_accum/Madd_temp_cy [28]),
    .DI(\BU2/U0/acc_phase [29]),
    .S(\BU2/U0/i_accum/i_fabric.i_one_channel.i_accum/Madd_temp_lut [29]),
    .O(\BU2/U0/i_accum/i_fabric.i_one_channel.i_accum/Madd_temp_cy [29])
  );
  XORCY   \BU2/U0/i_accum/i_fabric.i_one_channel.i_accum/Madd_temp_xor<29>  (
    .CI(\BU2/U0/i_accum/i_fabric.i_one_channel.i_accum/Madd_temp_cy [28]),
    .LI(\BU2/U0/i_accum/i_fabric.i_one_channel.i_accum/Madd_temp_lut [29]),
    .O(\BU2/U0/i_accum/acc_phase_b [29])
  );
  LUT2 #(
    .INIT ( 4'h6 ))
  \BU2/U0/i_accum/i_fabric.i_one_channel.i_accum/Madd_temp_lut<30>  (
    .I0(\BU2/U0/acc_phase [30]),
    .I1(\BU2/U0/i_accum/phase_inc[10] ),
    .O(\BU2/U0/i_accum/i_fabric.i_one_channel.i_accum/Madd_temp_lut [30])
  );
  MUXCY   \BU2/U0/i_accum/i_fabric.i_one_channel.i_accum/Madd_temp_cy<30>  (
    .CI(\BU2/U0/i_accum/i_fabric.i_one_channel.i_accum/Madd_temp_cy [29]),
    .DI(\BU2/U0/acc_phase [30]),
    .S(\BU2/U0/i_accum/i_fabric.i_one_channel.i_accum/Madd_temp_lut [30]),
    .O(\BU2/U0/i_accum/i_fabric.i_one_channel.i_accum/Madd_temp_cy [30])
  );
  XORCY   \BU2/U0/i_accum/i_fabric.i_one_channel.i_accum/Madd_temp_xor<30>  (
    .CI(\BU2/U0/i_accum/i_fabric.i_one_channel.i_accum/Madd_temp_cy [29]),
    .LI(\BU2/U0/i_accum/i_fabric.i_one_channel.i_accum/Madd_temp_lut [30]),
    .O(\BU2/U0/i_accum/acc_phase_b [30])
  );
  LUT2 #(
    .INIT ( 4'h6 ))
  \BU2/U0/i_accum/i_fabric.i_one_channel.i_accum/Madd_temp_lut<31>  (
    .I0(\BU2/U0/acc_phase [31]),
    .I1(\BU2/U0/i_accum/phase_inc[10] ),
    .O(\BU2/U0/i_accum/i_fabric.i_one_channel.i_accum/Madd_temp_lut [31])
  );
  XORCY   \BU2/U0/i_accum/i_fabric.i_one_channel.i_accum/Madd_temp_xor<31>  (
    .CI(\BU2/U0/i_accum/i_fabric.i_one_channel.i_accum/Madd_temp_cy [30]),
    .LI(\BU2/U0/i_accum/i_fabric.i_one_channel.i_accum/Madd_temp_lut [31]),
    .O(\BU2/U0/i_accum/acc_phase_b [31])
  );
  LUT2 #(
    .INIT ( 4'h6 ))
  \BU2/U0/Madd_precombine3_lut<0>  (
    .I0(\BU2/U0/combine1 [0]),
    .I1(\BU2/U0/combine2 [0]),
    .O(\BU2/U0/Madd_precombine3_lut [0])
  );
  MUXCY   \BU2/U0/Madd_precombine3_cy<0>  (
    .CI(\BU2/channel [0]),
    .DI(\BU2/U0/combine1 [0]),
    .S(\BU2/U0/Madd_precombine3_lut [0]),
    .O(\BU2/U0/Madd_precombine3_cy [0])
  );
  LUT2 #(
    .INIT ( 4'h6 ))
  \BU2/U0/Madd_precombine3_lut<1>  (
    .I0(\BU2/U0/combine1 [1]),
    .I1(\BU2/U0/combine2 [1]),
    .O(\BU2/U0/Madd_precombine3_lut [1])
  );
  MUXCY   \BU2/U0/Madd_precombine3_cy<1>  (
    .CI(\BU2/U0/Madd_precombine3_cy [0]),
    .DI(\BU2/U0/combine1 [1]),
    .S(\BU2/U0/Madd_precombine3_lut [1]),
    .O(\BU2/U0/Madd_precombine3_cy [1])
  );
  LUT2 #(
    .INIT ( 4'h6 ))
  \BU2/U0/Madd_precombine3_lut<2>  (
    .I0(\BU2/U0/combine1 [2]),
    .I1(\BU2/U0/combine2 [2]),
    .O(\BU2/U0/Madd_precombine3_lut [2])
  );
  MUXCY   \BU2/U0/Madd_precombine3_cy<2>  (
    .CI(\BU2/U0/Madd_precombine3_cy [1]),
    .DI(\BU2/U0/combine1 [2]),
    .S(\BU2/U0/Madd_precombine3_lut [2]),
    .O(\BU2/U0/Madd_precombine3_cy [2])
  );
  XORCY   \BU2/U0/Madd_precombine3_xor<2>  (
    .CI(\BU2/U0/Madd_precombine3_cy [1]),
    .LI(\BU2/U0/Madd_precombine3_lut [2]),
    .O(\BU2/U0/precombine3 [2])
  );
  LUT2 #(
    .INIT ( 4'h6 ))
  \BU2/U0/Madd_precombine3_lut<3>  (
    .I0(\BU2/U0/combine1 [3]),
    .I1(\BU2/U0/combine2 [3]),
    .O(\BU2/U0/Madd_precombine3_lut [3])
  );
  MUXCY   \BU2/U0/Madd_precombine3_cy<3>  (
    .CI(\BU2/U0/Madd_precombine3_cy [2]),
    .DI(\BU2/U0/combine1 [3]),
    .S(\BU2/U0/Madd_precombine3_lut [3]),
    .O(\BU2/U0/Madd_precombine3_cy [3])
  );
  XORCY   \BU2/U0/Madd_precombine3_xor<3>  (
    .CI(\BU2/U0/Madd_precombine3_cy [2]),
    .LI(\BU2/U0/Madd_precombine3_lut [3]),
    .O(\BU2/U0/precombine3 [3])
  );
  LUT2 #(
    .INIT ( 4'h6 ))
  \BU2/U0/Madd_precombine3_lut<4>  (
    .I0(\BU2/U0/combine1 [4]),
    .I1(\BU2/U0/combine2 [4]),
    .O(\BU2/U0/Madd_precombine3_lut [4])
  );
  MUXCY   \BU2/U0/Madd_precombine3_cy<4>  (
    .CI(\BU2/U0/Madd_precombine3_cy [3]),
    .DI(\BU2/U0/combine1 [4]),
    .S(\BU2/U0/Madd_precombine3_lut [4]),
    .O(\BU2/U0/Madd_precombine3_cy [4])
  );
  XORCY   \BU2/U0/Madd_precombine3_xor<4>  (
    .CI(\BU2/U0/Madd_precombine3_cy [3]),
    .LI(\BU2/U0/Madd_precombine3_lut [4]),
    .O(\BU2/U0/precombine3 [4])
  );
  LUT2 #(
    .INIT ( 4'h6 ))
  \BU2/U0/Madd_precombine3_lut<5>  (
    .I0(\BU2/U0/combine1 [5]),
    .I1(\BU2/U0/combine2 [5]),
    .O(\BU2/U0/Madd_precombine3_lut [5])
  );
  MUXCY   \BU2/U0/Madd_precombine3_cy<5>  (
    .CI(\BU2/U0/Madd_precombine3_cy [4]),
    .DI(\BU2/U0/combine1 [5]),
    .S(\BU2/U0/Madd_precombine3_lut [5]),
    .O(\BU2/U0/Madd_precombine3_cy [5])
  );
  XORCY   \BU2/U0/Madd_precombine3_xor<5>  (
    .CI(\BU2/U0/Madd_precombine3_cy [4]),
    .LI(\BU2/U0/Madd_precombine3_lut [5]),
    .O(\BU2/U0/precombine3 [5])
  );
  LUT2 #(
    .INIT ( 4'h6 ))
  \BU2/U0/Madd_precombine3_lut<6>  (
    .I0(\BU2/U0/combine1 [6]),
    .I1(\BU2/U0/combine2 [6]),
    .O(\BU2/U0/Madd_precombine3_lut [6])
  );
  MUXCY   \BU2/U0/Madd_precombine3_cy<6>  (
    .CI(\BU2/U0/Madd_precombine3_cy [5]),
    .DI(\BU2/U0/combine1 [6]),
    .S(\BU2/U0/Madd_precombine3_lut [6]),
    .O(\BU2/U0/Madd_precombine3_cy [6])
  );
  XORCY   \BU2/U0/Madd_precombine3_xor<6>  (
    .CI(\BU2/U0/Madd_precombine3_cy [5]),
    .LI(\BU2/U0/Madd_precombine3_lut [6]),
    .O(\BU2/U0/precombine3 [6])
  );
  LUT2 #(
    .INIT ( 4'h6 ))
  \BU2/U0/Madd_precombine3_lut<7>  (
    .I0(\BU2/U0/combine1 [7]),
    .I1(\BU2/U0/combine2 [7]),
    .O(\BU2/U0/Madd_precombine3_lut [7])
  );
  MUXCY   \BU2/U0/Madd_precombine3_cy<7>  (
    .CI(\BU2/U0/Madd_precombine3_cy [6]),
    .DI(\BU2/U0/combine1 [7]),
    .S(\BU2/U0/Madd_precombine3_lut [7]),
    .O(\BU2/U0/Madd_precombine3_cy [7])
  );
  XORCY   \BU2/U0/Madd_precombine3_xor<7>  (
    .CI(\BU2/U0/Madd_precombine3_cy [6]),
    .LI(\BU2/U0/Madd_precombine3_lut [7]),
    .O(\BU2/U0/precombine3 [7])
  );
  LUT2 #(
    .INIT ( 4'h6 ))
  \BU2/U0/Madd_precombine3_lut<8>  (
    .I0(\BU2/U0/combine1 [8]),
    .I1(\BU2/U0/combine2 [8]),
    .O(\BU2/U0/Madd_precombine3_lut [8])
  );
  MUXCY   \BU2/U0/Madd_precombine3_cy<8>  (
    .CI(\BU2/U0/Madd_precombine3_cy [7]),
    .DI(\BU2/U0/combine1 [8]),
    .S(\BU2/U0/Madd_precombine3_lut [8]),
    .O(\BU2/U0/Madd_precombine3_cy [8])
  );
  XORCY   \BU2/U0/Madd_precombine3_xor<8>  (
    .CI(\BU2/U0/Madd_precombine3_cy [7]),
    .LI(\BU2/U0/Madd_precombine3_lut [8]),
    .O(\BU2/U0/precombine3 [8])
  );
  LUT2 #(
    .INIT ( 4'h6 ))
  \BU2/U0/Madd_precombine3_lut<9>  (
    .I0(\BU2/U0/combine1 [9]),
    .I1(\BU2/U0/combine2 [9]),
    .O(\BU2/U0/Madd_precombine3_lut [9])
  );
  MUXCY   \BU2/U0/Madd_precombine3_cy<9>  (
    .CI(\BU2/U0/Madd_precombine3_cy [8]),
    .DI(\BU2/U0/combine1 [9]),
    .S(\BU2/U0/Madd_precombine3_lut [9]),
    .O(\BU2/U0/Madd_precombine3_cy [9])
  );
  XORCY   \BU2/U0/Madd_precombine3_xor<9>  (
    .CI(\BU2/U0/Madd_precombine3_cy [8]),
    .LI(\BU2/U0/Madd_precombine3_lut [9]),
    .O(\BU2/U0/precombine3 [9])
  );
  LUT2 #(
    .INIT ( 4'h6 ))
  \BU2/U0/Madd_precombine3_lut<10>  (
    .I0(\BU2/U0/combine1 [10]),
    .I1(\BU2/U0/combine2 [10]),
    .O(\BU2/U0/Madd_precombine3_lut [10])
  );
  MUXCY   \BU2/U0/Madd_precombine3_cy<10>  (
    .CI(\BU2/U0/Madd_precombine3_cy [9]),
    .DI(\BU2/U0/combine1 [10]),
    .S(\BU2/U0/Madd_precombine3_lut [10]),
    .O(\BU2/U0/Madd_precombine3_cy [10])
  );
  XORCY   \BU2/U0/Madd_precombine3_xor<10>  (
    .CI(\BU2/U0/Madd_precombine3_cy [9]),
    .LI(\BU2/U0/Madd_precombine3_lut [10]),
    .O(\BU2/U0/precombine3 [10])
  );
  LUT2 #(
    .INIT ( 4'h6 ))
  \BU2/U0/Madd_precombine3_lut<11>  (
    .I0(\BU2/U0/combine1 [10]),
    .I1(\BU2/U0/combine2 [10]),
    .O(\BU2/U0/Madd_precombine3_lut [11])
  );
  XORCY   \BU2/U0/Madd_precombine3_xor<11>  (
    .CI(\BU2/U0/Madd_precombine3_cy [10]),
    .LI(\BU2/U0/Madd_precombine3_lut [11]),
    .O(\BU2/U0/precombine3 [11])
  );
  LUT2 #(
    .INIT ( 4'h6 ))
  \BU2/U0/i_fabric.i_dither_add.i_dither_add/Madd_temp_lut<12>  (
    .I0(\BU2/U0/acc_phase_adjusted [12]),
    .I1(\BU2/U0/combine3 [2]),
    .O(\BU2/U0/i_fabric.i_dither_add.i_dither_add/Madd_temp_lut [12])
  );
  MUXCY   \BU2/U0/i_fabric.i_dither_add.i_dither_add/Madd_temp_cy<12>  (
    .CI(\BU2/channel [0]),
    .DI(\BU2/U0/acc_phase_adjusted [12]),
    .S(\BU2/U0/i_fabric.i_dither_add.i_dither_add/Madd_temp_lut [12]),
    .O(\BU2/U0/i_fabric.i_dither_add.i_dither_add/Madd_temp_cy [12])
  );
  LUT2 #(
    .INIT ( 4'h6 ))
  \BU2/U0/i_fabric.i_dither_add.i_dither_add/Madd_temp_lut<13>  (
    .I0(\BU2/U0/acc_phase_adjusted [13]),
    .I1(\BU2/U0/combine3 [3]),
    .O(\BU2/U0/i_fabric.i_dither_add.i_dither_add/Madd_temp_lut [13])
  );
  MUXCY   \BU2/U0/i_fabric.i_dither_add.i_dither_add/Madd_temp_cy<13>  (
    .CI(\BU2/U0/i_fabric.i_dither_add.i_dither_add/Madd_temp_cy [12]),
    .DI(\BU2/U0/acc_phase_adjusted [13]),
    .S(\BU2/U0/i_fabric.i_dither_add.i_dither_add/Madd_temp_lut [13]),
    .O(\BU2/U0/i_fabric.i_dither_add.i_dither_add/Madd_temp_cy [13])
  );
  LUT2 #(
    .INIT ( 4'h6 ))
  \BU2/U0/i_fabric.i_dither_add.i_dither_add/Madd_temp_lut<14>  (
    .I0(\BU2/U0/acc_phase_adjusted [14]),
    .I1(\BU2/U0/combine3 [4]),
    .O(\BU2/U0/i_fabric.i_dither_add.i_dither_add/Madd_temp_lut [14])
  );
  MUXCY   \BU2/U0/i_fabric.i_dither_add.i_dither_add/Madd_temp_cy<14>  (
    .CI(\BU2/U0/i_fabric.i_dither_add.i_dither_add/Madd_temp_cy [13]),
    .DI(\BU2/U0/acc_phase_adjusted [14]),
    .S(\BU2/U0/i_fabric.i_dither_add.i_dither_add/Madd_temp_lut [14]),
    .O(\BU2/U0/i_fabric.i_dither_add.i_dither_add/Madd_temp_cy [14])
  );
  LUT2 #(
    .INIT ( 4'h6 ))
  \BU2/U0/i_fabric.i_dither_add.i_dither_add/Madd_temp_lut<15>  (
    .I0(\BU2/U0/acc_phase_adjusted [15]),
    .I1(\BU2/U0/combine3 [5]),
    .O(\BU2/U0/i_fabric.i_dither_add.i_dither_add/Madd_temp_lut [15])
  );
  MUXCY   \BU2/U0/i_fabric.i_dither_add.i_dither_add/Madd_temp_cy<15>  (
    .CI(\BU2/U0/i_fabric.i_dither_add.i_dither_add/Madd_temp_cy [14]),
    .DI(\BU2/U0/acc_phase_adjusted [15]),
    .S(\BU2/U0/i_fabric.i_dither_add.i_dither_add/Madd_temp_lut [15]),
    .O(\BU2/U0/i_fabric.i_dither_add.i_dither_add/Madd_temp_cy [15])
  );
  LUT2 #(
    .INIT ( 4'h6 ))
  \BU2/U0/i_fabric.i_dither_add.i_dither_add/Madd_temp_lut<16>  (
    .I0(\BU2/U0/acc_phase_adjusted [16]),
    .I1(\BU2/U0/combine3 [6]),
    .O(\BU2/U0/i_fabric.i_dither_add.i_dither_add/Madd_temp_lut [16])
  );
  MUXCY   \BU2/U0/i_fabric.i_dither_add.i_dither_add/Madd_temp_cy<16>  (
    .CI(\BU2/U0/i_fabric.i_dither_add.i_dither_add/Madd_temp_cy [15]),
    .DI(\BU2/U0/acc_phase_adjusted [16]),
    .S(\BU2/U0/i_fabric.i_dither_add.i_dither_add/Madd_temp_lut [16]),
    .O(\BU2/U0/i_fabric.i_dither_add.i_dither_add/Madd_temp_cy [16])
  );
  LUT2 #(
    .INIT ( 4'h6 ))
  \BU2/U0/i_fabric.i_dither_add.i_dither_add/Madd_temp_lut<17>  (
    .I0(\BU2/U0/acc_phase_adjusted [17]),
    .I1(\BU2/U0/combine3 [7]),
    .O(\BU2/U0/i_fabric.i_dither_add.i_dither_add/Madd_temp_lut [17])
  );
  MUXCY   \BU2/U0/i_fabric.i_dither_add.i_dither_add/Madd_temp_cy<17>  (
    .CI(\BU2/U0/i_fabric.i_dither_add.i_dither_add/Madd_temp_cy [16]),
    .DI(\BU2/U0/acc_phase_adjusted [17]),
    .S(\BU2/U0/i_fabric.i_dither_add.i_dither_add/Madd_temp_lut [17]),
    .O(\BU2/U0/i_fabric.i_dither_add.i_dither_add/Madd_temp_cy [17])
  );
  LUT2 #(
    .INIT ( 4'h6 ))
  \BU2/U0/i_fabric.i_dither_add.i_dither_add/Madd_temp_lut<18>  (
    .I0(\BU2/U0/acc_phase_adjusted [18]),
    .I1(\BU2/U0/combine3 [8]),
    .O(\BU2/U0/i_fabric.i_dither_add.i_dither_add/Madd_temp_lut [18])
  );
  MUXCY   \BU2/U0/i_fabric.i_dither_add.i_dither_add/Madd_temp_cy<18>  (
    .CI(\BU2/U0/i_fabric.i_dither_add.i_dither_add/Madd_temp_cy [17]),
    .DI(\BU2/U0/acc_phase_adjusted [18]),
    .S(\BU2/U0/i_fabric.i_dither_add.i_dither_add/Madd_temp_lut [18]),
    .O(\BU2/U0/i_fabric.i_dither_add.i_dither_add/Madd_temp_cy [18])
  );
  LUT2 #(
    .INIT ( 4'h6 ))
  \BU2/U0/i_fabric.i_dither_add.i_dither_add/Madd_temp_lut<19>  (
    .I0(\BU2/U0/acc_phase_adjusted [19]),
    .I1(\BU2/U0/combine3 [9]),
    .O(\BU2/U0/i_fabric.i_dither_add.i_dither_add/Madd_temp_lut [19])
  );
  MUXCY   \BU2/U0/i_fabric.i_dither_add.i_dither_add/Madd_temp_cy<19>  (
    .CI(\BU2/U0/i_fabric.i_dither_add.i_dither_add/Madd_temp_cy [18]),
    .DI(\BU2/U0/acc_phase_adjusted [19]),
    .S(\BU2/U0/i_fabric.i_dither_add.i_dither_add/Madd_temp_lut [19]),
    .O(\BU2/U0/i_fabric.i_dither_add.i_dither_add/Madd_temp_cy [19])
  );
  LUT2 #(
    .INIT ( 4'h6 ))
  \BU2/U0/i_fabric.i_dither_add.i_dither_add/Madd_temp_lut<20>  (
    .I0(\BU2/U0/acc_phase_adjusted [20]),
    .I1(\BU2/U0/combine3 [10]),
    .O(\BU2/U0/i_fabric.i_dither_add.i_dither_add/Madd_temp_lut [20])
  );
  MUXCY   \BU2/U0/i_fabric.i_dither_add.i_dither_add/Madd_temp_cy<20>  (
    .CI(\BU2/U0/i_fabric.i_dither_add.i_dither_add/Madd_temp_cy [19]),
    .DI(\BU2/U0/acc_phase_adjusted [20]),
    .S(\BU2/U0/i_fabric.i_dither_add.i_dither_add/Madd_temp_lut [20]),
    .O(\BU2/U0/i_fabric.i_dither_add.i_dither_add/Madd_temp_cy [20])
  );
  LUT2 #(
    .INIT ( 4'h6 ))
  \BU2/U0/i_fabric.i_dither_add.i_dither_add/Madd_temp_lut<21>  (
    .I0(\BU2/U0/acc_phase_adjusted [21]),
    .I1(\BU2/U0/combine3 [11]),
    .O(\BU2/U0/i_fabric.i_dither_add.i_dither_add/Madd_temp_lut [21])
  );
  MUXCY   \BU2/U0/i_fabric.i_dither_add.i_dither_add/Madd_temp_cy<21>  (
    .CI(\BU2/U0/i_fabric.i_dither_add.i_dither_add/Madd_temp_cy [20]),
    .DI(\BU2/U0/acc_phase_adjusted [21]),
    .S(\BU2/U0/i_fabric.i_dither_add.i_dither_add/Madd_temp_lut [21]),
    .O(\BU2/U0/i_fabric.i_dither_add.i_dither_add/Madd_temp_cy [21])
  );
  XORCY   \BU2/U0/i_fabric.i_dither_add.i_dither_add/Madd_temp_xor<21>  (
    .CI(\BU2/U0/i_fabric.i_dither_add.i_dither_add/Madd_temp_cy [20]),
    .LI(\BU2/U0/i_fabric.i_dither_add.i_dither_add/Madd_temp_lut [21]),
    .O(\BU2/U0/acc_phase_shaped_pre [21])
  );
  LUT2 #(
    .INIT ( 4'h6 ))
  \BU2/U0/i_fabric.i_dither_add.i_dither_add/Madd_temp_lut<22>  (
    .I0(\BU2/U0/acc_phase_adjusted [22]),
    .I1(\BU2/U0/combine3 [11]),
    .O(\BU2/U0/i_fabric.i_dither_add.i_dither_add/Madd_temp_lut [22])
  );
  MUXCY   \BU2/U0/i_fabric.i_dither_add.i_dither_add/Madd_temp_cy<22>  (
    .CI(\BU2/U0/i_fabric.i_dither_add.i_dither_add/Madd_temp_cy [21]),
    .DI(\BU2/U0/acc_phase_adjusted [22]),
    .S(\BU2/U0/i_fabric.i_dither_add.i_dither_add/Madd_temp_lut [22]),
    .O(\BU2/U0/i_fabric.i_dither_add.i_dither_add/Madd_temp_cy [22])
  );
  XORCY   \BU2/U0/i_fabric.i_dither_add.i_dither_add/Madd_temp_xor<22>  (
    .CI(\BU2/U0/i_fabric.i_dither_add.i_dither_add/Madd_temp_cy [21]),
    .LI(\BU2/U0/i_fabric.i_dither_add.i_dither_add/Madd_temp_lut [22]),
    .O(\BU2/U0/acc_phase_shaped_pre [22])
  );
  LUT2 #(
    .INIT ( 4'h6 ))
  \BU2/U0/i_fabric.i_dither_add.i_dither_add/Madd_temp_lut<23>  (
    .I0(\BU2/U0/acc_phase_adjusted [23]),
    .I1(\BU2/U0/combine3 [11]),
    .O(\BU2/U0/i_fabric.i_dither_add.i_dither_add/Madd_temp_lut [23])
  );
  MUXCY   \BU2/U0/i_fabric.i_dither_add.i_dither_add/Madd_temp_cy<23>  (
    .CI(\BU2/U0/i_fabric.i_dither_add.i_dither_add/Madd_temp_cy [22]),
    .DI(\BU2/U0/acc_phase_adjusted [23]),
    .S(\BU2/U0/i_fabric.i_dither_add.i_dither_add/Madd_temp_lut [23]),
    .O(\BU2/U0/i_fabric.i_dither_add.i_dither_add/Madd_temp_cy [23])
  );
  XORCY   \BU2/U0/i_fabric.i_dither_add.i_dither_add/Madd_temp_xor<23>  (
    .CI(\BU2/U0/i_fabric.i_dither_add.i_dither_add/Madd_temp_cy [22]),
    .LI(\BU2/U0/i_fabric.i_dither_add.i_dither_add/Madd_temp_lut [23]),
    .O(\BU2/U0/acc_phase_shaped_pre [23])
  );
  LUT2 #(
    .INIT ( 4'h6 ))
  \BU2/U0/i_fabric.i_dither_add.i_dither_add/Madd_temp_lut<24>  (
    .I0(\BU2/U0/acc_phase_adjusted [24]),
    .I1(\BU2/U0/combine3 [11]),
    .O(\BU2/U0/i_fabric.i_dither_add.i_dither_add/Madd_temp_lut [24])
  );
  MUXCY   \BU2/U0/i_fabric.i_dither_add.i_dither_add/Madd_temp_cy<24>  (
    .CI(\BU2/U0/i_fabric.i_dither_add.i_dither_add/Madd_temp_cy [23]),
    .DI(\BU2/U0/acc_phase_adjusted [24]),
    .S(\BU2/U0/i_fabric.i_dither_add.i_dither_add/Madd_temp_lut [24]),
    .O(\BU2/U0/i_fabric.i_dither_add.i_dither_add/Madd_temp_cy [24])
  );
  XORCY   \BU2/U0/i_fabric.i_dither_add.i_dither_add/Madd_temp_xor<24>  (
    .CI(\BU2/U0/i_fabric.i_dither_add.i_dither_add/Madd_temp_cy [23]),
    .LI(\BU2/U0/i_fabric.i_dither_add.i_dither_add/Madd_temp_lut [24]),
    .O(\BU2/U0/acc_phase_shaped_pre [24])
  );
  LUT2 #(
    .INIT ( 4'h6 ))
  \BU2/U0/i_fabric.i_dither_add.i_dither_add/Madd_temp_lut<25>  (
    .I0(\BU2/U0/acc_phase_adjusted [25]),
    .I1(\BU2/U0/combine3 [11]),
    .O(\BU2/U0/i_fabric.i_dither_add.i_dither_add/Madd_temp_lut [25])
  );
  MUXCY   \BU2/U0/i_fabric.i_dither_add.i_dither_add/Madd_temp_cy<25>  (
    .CI(\BU2/U0/i_fabric.i_dither_add.i_dither_add/Madd_temp_cy [24]),
    .DI(\BU2/U0/acc_phase_adjusted [25]),
    .S(\BU2/U0/i_fabric.i_dither_add.i_dither_add/Madd_temp_lut [25]),
    .O(\BU2/U0/i_fabric.i_dither_add.i_dither_add/Madd_temp_cy [25])
  );
  XORCY   \BU2/U0/i_fabric.i_dither_add.i_dither_add/Madd_temp_xor<25>  (
    .CI(\BU2/U0/i_fabric.i_dither_add.i_dither_add/Madd_temp_cy [24]),
    .LI(\BU2/U0/i_fabric.i_dither_add.i_dither_add/Madd_temp_lut [25]),
    .O(\BU2/U0/acc_phase_shaped_pre [25])
  );
  LUT2 #(
    .INIT ( 4'h6 ))
  \BU2/U0/i_fabric.i_dither_add.i_dither_add/Madd_temp_lut<26>  (
    .I0(\BU2/U0/acc_phase_adjusted [26]),
    .I1(\BU2/U0/combine3 [11]),
    .O(\BU2/U0/i_fabric.i_dither_add.i_dither_add/Madd_temp_lut [26])
  );
  MUXCY   \BU2/U0/i_fabric.i_dither_add.i_dither_add/Madd_temp_cy<26>  (
    .CI(\BU2/U0/i_fabric.i_dither_add.i_dither_add/Madd_temp_cy [25]),
    .DI(\BU2/U0/acc_phase_adjusted [26]),
    .S(\BU2/U0/i_fabric.i_dither_add.i_dither_add/Madd_temp_lut [26]),
    .O(\BU2/U0/i_fabric.i_dither_add.i_dither_add/Madd_temp_cy [26])
  );
  XORCY   \BU2/U0/i_fabric.i_dither_add.i_dither_add/Madd_temp_xor<26>  (
    .CI(\BU2/U0/i_fabric.i_dither_add.i_dither_add/Madd_temp_cy [25]),
    .LI(\BU2/U0/i_fabric.i_dither_add.i_dither_add/Madd_temp_lut [26]),
    .O(\BU2/U0/acc_phase_shaped_pre [26])
  );
  LUT2 #(
    .INIT ( 4'h6 ))
  \BU2/U0/i_fabric.i_dither_add.i_dither_add/Madd_temp_lut<27>  (
    .I0(\BU2/U0/acc_phase_adjusted [27]),
    .I1(\BU2/U0/combine3 [11]),
    .O(\BU2/U0/i_fabric.i_dither_add.i_dither_add/Madd_temp_lut [27])
  );
  MUXCY   \BU2/U0/i_fabric.i_dither_add.i_dither_add/Madd_temp_cy<27>  (
    .CI(\BU2/U0/i_fabric.i_dither_add.i_dither_add/Madd_temp_cy [26]),
    .DI(\BU2/U0/acc_phase_adjusted [27]),
    .S(\BU2/U0/i_fabric.i_dither_add.i_dither_add/Madd_temp_lut [27]),
    .O(\BU2/U0/i_fabric.i_dither_add.i_dither_add/Madd_temp_cy [27])
  );
  XORCY   \BU2/U0/i_fabric.i_dither_add.i_dither_add/Madd_temp_xor<27>  (
    .CI(\BU2/U0/i_fabric.i_dither_add.i_dither_add/Madd_temp_cy [26]),
    .LI(\BU2/U0/i_fabric.i_dither_add.i_dither_add/Madd_temp_lut [27]),
    .O(\BU2/U0/acc_phase_shaped_pre [27])
  );
  LUT2 #(
    .INIT ( 4'h6 ))
  \BU2/U0/i_fabric.i_dither_add.i_dither_add/Madd_temp_lut<28>  (
    .I0(\BU2/U0/acc_phase_adjusted [28]),
    .I1(\BU2/U0/combine3 [11]),
    .O(\BU2/U0/i_fabric.i_dither_add.i_dither_add/Madd_temp_lut [28])
  );
  MUXCY   \BU2/U0/i_fabric.i_dither_add.i_dither_add/Madd_temp_cy<28>  (
    .CI(\BU2/U0/i_fabric.i_dither_add.i_dither_add/Madd_temp_cy [27]),
    .DI(\BU2/U0/acc_phase_adjusted [28]),
    .S(\BU2/U0/i_fabric.i_dither_add.i_dither_add/Madd_temp_lut [28]),
    .O(\BU2/U0/i_fabric.i_dither_add.i_dither_add/Madd_temp_cy [28])
  );
  XORCY   \BU2/U0/i_fabric.i_dither_add.i_dither_add/Madd_temp_xor<28>  (
    .CI(\BU2/U0/i_fabric.i_dither_add.i_dither_add/Madd_temp_cy [27]),
    .LI(\BU2/U0/i_fabric.i_dither_add.i_dither_add/Madd_temp_lut [28]),
    .O(\BU2/U0/acc_phase_shaped_pre [28])
  );
  LUT2 #(
    .INIT ( 4'h6 ))
  \BU2/U0/i_fabric.i_dither_add.i_dither_add/Madd_temp_lut<29>  (
    .I0(\BU2/U0/acc_phase_adjusted [29]),
    .I1(\BU2/U0/combine3 [11]),
    .O(\BU2/U0/i_fabric.i_dither_add.i_dither_add/Madd_temp_lut [29])
  );
  MUXCY   \BU2/U0/i_fabric.i_dither_add.i_dither_add/Madd_temp_cy<29>  (
    .CI(\BU2/U0/i_fabric.i_dither_add.i_dither_add/Madd_temp_cy [28]),
    .DI(\BU2/U0/acc_phase_adjusted [29]),
    .S(\BU2/U0/i_fabric.i_dither_add.i_dither_add/Madd_temp_lut [29]),
    .O(\BU2/U0/i_fabric.i_dither_add.i_dither_add/Madd_temp_cy [29])
  );
  XORCY   \BU2/U0/i_fabric.i_dither_add.i_dither_add/Madd_temp_xor<29>  (
    .CI(\BU2/U0/i_fabric.i_dither_add.i_dither_add/Madd_temp_cy [28]),
    .LI(\BU2/U0/i_fabric.i_dither_add.i_dither_add/Madd_temp_lut [29]),
    .O(\BU2/U0/acc_phase_shaped_pre [29])
  );
  LUT2 #(
    .INIT ( 4'h6 ))
  \BU2/U0/i_fabric.i_dither_add.i_dither_add/Madd_temp_lut<30>  (
    .I0(\BU2/U0/acc_phase_adjusted [30]),
    .I1(\BU2/U0/combine3 [11]),
    .O(\BU2/U0/i_fabric.i_dither_add.i_dither_add/Madd_temp_lut [30])
  );
  MUXCY   \BU2/U0/i_fabric.i_dither_add.i_dither_add/Madd_temp_cy<30>  (
    .CI(\BU2/U0/i_fabric.i_dither_add.i_dither_add/Madd_temp_cy [29]),
    .DI(\BU2/U0/acc_phase_adjusted [30]),
    .S(\BU2/U0/i_fabric.i_dither_add.i_dither_add/Madd_temp_lut [30]),
    .O(\BU2/U0/i_fabric.i_dither_add.i_dither_add/Madd_temp_cy [30])
  );
  XORCY   \BU2/U0/i_fabric.i_dither_add.i_dither_add/Madd_temp_xor<30>  (
    .CI(\BU2/U0/i_fabric.i_dither_add.i_dither_add/Madd_temp_cy [29]),
    .LI(\BU2/U0/i_fabric.i_dither_add.i_dither_add/Madd_temp_lut [30]),
    .O(\BU2/U0/acc_phase_shaped_pre [30])
  );
  LUT2 #(
    .INIT ( 4'h6 ))
  \BU2/U0/i_fabric.i_dither_add.i_dither_add/Madd_temp_lut<31>  (
    .I0(\BU2/U0/acc_phase_adjusted [31]),
    .I1(\BU2/U0/combine3 [11]),
    .O(\BU2/U0/i_fabric.i_dither_add.i_dither_add/Madd_temp_lut [31])
  );
  XORCY   \BU2/U0/i_fabric.i_dither_add.i_dither_add/Madd_temp_xor<31>  (
    .CI(\BU2/U0/i_fabric.i_dither_add.i_dither_add/Madd_temp_cy [30]),
    .LI(\BU2/U0/i_fabric.i_dither_add.i_dither_add/Madd_temp_lut [31]),
    .O(\BU2/U0/acc_phase_shaped_pre [31])
  );
  VCC   \BU2/XST_VCC  (
    .P(\BU2/N1 )
  );
  GND   \BU2/XST_GND  (
    .G(\BU2/channel [0])
  );
  FD #(
    .INIT ( 1'b0 ))
  \BU2/U0/i_rom/i_rtl.i_quarter_table.i_addr_reg_c/pipe_2_1  (
    .C(clk),
    .D(\BU2/U0/i_rom/i_rtl.i_quarter_table.i_addr_reg_c/first_q [1]),
    .Q(\BU2/U0/i_rom/asyn_sin_ms1 [6])
  );
  FD #(
    .INIT ( 1'b0 ))
  \BU2/U0/i_rom/i_rtl.i_quarter_table.i_addr_reg_c/first_q_1  (
    .C(clk),
    .D(\BU2/U0/acc_phase_shaped [31]),
    .Q(\BU2/U0/i_rom/i_rtl.i_quarter_table.i_addr_reg_c/first_q [1])
  );
  FD #(
    .INIT ( 1'b0 ))
  \BU2/U0/i_rom/i_rtl.i_quarter_table.i_addr_reg_c/first_q_0  (
    .C(clk),
    .D(\BU2/U0/acc_phase_shaped [30]),
    .Q(\BU2/U0/i_rom/i_rtl.i_quarter_table.i_addr_reg_c/first_q [0])
  );
  FD #(
    .INIT ( 1'b0 ))
  \BU2/U0/i_rom/i_rtl.i_quarter_table.i_rom_reg_a/opt_has_reg.i_reg/fd/output_13  (
    .C(clk),
    .D(\BU2/U0/i_rom/pre_asyn_sin_RAM_op [12]),
    .Q(\BU2/U0/i_rom/sin_RAM_op [12])
  );
  FD #(
    .INIT ( 1'b0 ))
  \BU2/U0/i_rom/i_rtl.i_quarter_table.i_rom_reg_a/opt_has_reg.i_reg/fd/output_12  (
    .C(clk),
    .D(\BU2/U0/i_rom/pre_asyn_sin_RAM_op [11]),
    .Q(\BU2/U0/i_rom/sin_RAM_op [11])
  );
  FD #(
    .INIT ( 1'b0 ))
  \BU2/U0/i_rom/i_rtl.i_quarter_table.i_rom_reg_a/opt_has_reg.i_reg/fd/output_11  (
    .C(clk),
    .D(\BU2/U0/i_rom/pre_asyn_sin_RAM_op [10]),
    .Q(\BU2/U0/i_rom/sin_RAM_op [10])
  );
  FD #(
    .INIT ( 1'b0 ))
  \BU2/U0/i_rom/i_rtl.i_quarter_table.i_rom_reg_a/opt_has_reg.i_reg/fd/output_10  (
    .C(clk),
    .D(\BU2/U0/i_rom/pre_asyn_sin_RAM_op [9]),
    .Q(\BU2/U0/i_rom/sin_RAM_op [9])
  );
  FD #(
    .INIT ( 1'b0 ))
  \BU2/U0/i_rom/i_rtl.i_quarter_table.i_rom_reg_a/opt_has_reg.i_reg/fd/output_9  (
    .C(clk),
    .D(\BU2/U0/i_rom/pre_asyn_sin_RAM_op [8]),
    .Q(\BU2/U0/i_rom/sin_RAM_op [8])
  );
  FD #(
    .INIT ( 1'b0 ))
  \BU2/U0/i_rom/i_rtl.i_quarter_table.i_rom_reg_a/opt_has_reg.i_reg/fd/output_8  (
    .C(clk),
    .D(\BU2/U0/i_rom/pre_asyn_sin_RAM_op [7]),
    .Q(\BU2/U0/i_rom/sin_RAM_op [7])
  );
  FD #(
    .INIT ( 1'b0 ))
  \BU2/U0/i_rom/i_rtl.i_quarter_table.i_rom_reg_a/opt_has_reg.i_reg/fd/output_7  (
    .C(clk),
    .D(\BU2/U0/i_rom/pre_asyn_sin_RAM_op [6]),
    .Q(\BU2/U0/i_rom/sin_RAM_op [6])
  );
  FD #(
    .INIT ( 1'b0 ))
  \BU2/U0/i_rom/i_rtl.i_quarter_table.i_rom_reg_a/opt_has_reg.i_reg/fd/output_6  (
    .C(clk),
    .D(\BU2/U0/i_rom/pre_asyn_sin_RAM_op [5]),
    .Q(\BU2/U0/i_rom/sin_RAM_op [5])
  );
  FD #(
    .INIT ( 1'b0 ))
  \BU2/U0/i_rom/i_rtl.i_quarter_table.i_rom_reg_a/opt_has_reg.i_reg/fd/output_5  (
    .C(clk),
    .D(\BU2/U0/i_rom/pre_asyn_sin_RAM_op [4]),
    .Q(\BU2/U0/i_rom/sin_RAM_op [4])
  );
  FD #(
    .INIT ( 1'b0 ))
  \BU2/U0/i_rom/i_rtl.i_quarter_table.i_rom_reg_a/opt_has_reg.i_reg/fd/output_4  (
    .C(clk),
    .D(\BU2/U0/i_rom/pre_asyn_sin_RAM_op [3]),
    .Q(\BU2/U0/i_rom/sin_RAM_op [3])
  );
  FD #(
    .INIT ( 1'b0 ))
  \BU2/U0/i_rom/i_rtl.i_quarter_table.i_rom_reg_a/opt_has_reg.i_reg/fd/output_3  (
    .C(clk),
    .D(\BU2/U0/i_rom/pre_asyn_sin_RAM_op [2]),
    .Q(\BU2/U0/i_rom/sin_RAM_op [2])
  );
  FD #(
    .INIT ( 1'b0 ))
  \BU2/U0/i_rom/i_rtl.i_quarter_table.i_rom_reg_a/opt_has_reg.i_reg/fd/output_2  (
    .C(clk),
    .D(\BU2/U0/i_rom/pre_asyn_sin_RAM_op [1]),
    .Q(\BU2/U0/i_rom/sin_RAM_op [1])
  );
  FD #(
    .INIT ( 1'b0 ))
  \BU2/U0/i_rom/i_rtl.i_quarter_table.i_rom_reg_a/opt_has_reg.i_reg/fd/output_1  (
    .C(clk),
    .D(\BU2/U0/i_rom/pre_asyn_sin_RAM_op [0]),
    .Q(\BU2/U0/i_rom/Madd_asyn_sin_ls1 )
  );
  FD #(
    .INIT ( 1'b0 ))
  \BU2/U0/i_rom/i_rtl.i_quarter_table.i_piped_map.i_cardinal_sin_ls/opt_has_reg.i_reg/fd/output_7  (
    .C(clk),
    .D(\BU2/U0/i_rom/sin_ls1 [6]),
    .Q(\BU2/U0/final_sin [37])
  );
  FD #(
    .INIT ( 1'b0 ))
  \BU2/U0/i_rom/i_rtl.i_quarter_table.i_piped_map.i_cardinal_sin_ls/opt_has_reg.i_reg/fd/output_6  (
    .C(clk),
    .D(\BU2/U0/i_rom/sin_ls1 [5]),
    .Q(\BU2/U0/final_sin [36])
  );
  FD #(
    .INIT ( 1'b0 ))
  \BU2/U0/i_rom/i_rtl.i_quarter_table.i_piped_map.i_cardinal_sin_ls/opt_has_reg.i_reg/fd/output_5  (
    .C(clk),
    .D(\BU2/U0/i_rom/sin_ls1 [4]),
    .Q(\BU2/U0/final_sin [35])
  );
  FD #(
    .INIT ( 1'b0 ))
  \BU2/U0/i_rom/i_rtl.i_quarter_table.i_piped_map.i_cardinal_sin_ls/opt_has_reg.i_reg/fd/output_4  (
    .C(clk),
    .D(\BU2/U0/i_rom/sin_ls1 [3]),
    .Q(\BU2/U0/final_sin [34])
  );
  FD #(
    .INIT ( 1'b0 ))
  \BU2/U0/i_rom/i_rtl.i_quarter_table.i_piped_map.i_cardinal_sin_ls/opt_has_reg.i_reg/fd/output_3  (
    .C(clk),
    .D(\BU2/U0/i_rom/sin_ls1 [2]),
    .Q(\BU2/U0/final_sin [33])
  );
  FD #(
    .INIT ( 1'b0 ))
  \BU2/U0/i_rom/i_rtl.i_quarter_table.i_piped_map.i_cardinal_sin_ls/opt_has_reg.i_reg/fd/output_2  (
    .C(clk),
    .D(\BU2/U0/i_rom/sin_ls1 [1]),
    .Q(\BU2/U0/final_sin [32])
  );
  FD #(
    .INIT ( 1'b0 ))
  \BU2/U0/i_rom/i_rtl.i_quarter_table.i_piped_map.i_cardinal_sin_ls/opt_has_reg.i_reg/fd/output_1  (
    .C(clk),
    .D(\BU2/U0/i_rom/sin_ls1 [0]),
    .Q(\BU2/U0/final_sin [31])
  );
  FD #(
    .INIT ( 1'b0 ))
  \BU2/U0/i_rom/i_rtl.i_quarter_table.i_piped_map.i_cardinal_sin_ms/opt_has_reg.i_reg/fd/output_7  (
    .C(clk),
    .D(\BU2/U0/i_rom/asyn_sin_ms2 [6]),
    .Q(\BU2/U0/final_sin [44])
  );
  FD #(
    .INIT ( 1'b0 ))
  \BU2/U0/i_rom/i_rtl.i_quarter_table.i_piped_map.i_cardinal_sin_ms/opt_has_reg.i_reg/fd/output_6  (
    .C(clk),
    .D(\BU2/U0/i_rom/asyn_sin_ms2 [5]),
    .Q(\BU2/U0/final_sin [43])
  );
  FD #(
    .INIT ( 1'b0 ))
  \BU2/U0/i_rom/i_rtl.i_quarter_table.i_piped_map.i_cardinal_sin_ms/opt_has_reg.i_reg/fd/output_5  (
    .C(clk),
    .D(\BU2/U0/i_rom/asyn_sin_ms2 [4]),
    .Q(\BU2/U0/final_sin [42])
  );
  FD #(
    .INIT ( 1'b0 ))
  \BU2/U0/i_rom/i_rtl.i_quarter_table.i_piped_map.i_cardinal_sin_ms/opt_has_reg.i_reg/fd/output_4  (
    .C(clk),
    .D(\BU2/U0/i_rom/asyn_sin_ms2 [3]),
    .Q(\BU2/U0/final_sin [41])
  );
  FD #(
    .INIT ( 1'b0 ))
  \BU2/U0/i_rom/i_rtl.i_quarter_table.i_piped_map.i_cardinal_sin_ms/opt_has_reg.i_reg/fd/output_3  (
    .C(clk),
    .D(\BU2/U0/i_rom/asyn_sin_ms2 [2]),
    .Q(\BU2/U0/final_sin [40])
  );
  FD #(
    .INIT ( 1'b0 ))
  \BU2/U0/i_rom/i_rtl.i_quarter_table.i_piped_map.i_cardinal_sin_ms/opt_has_reg.i_reg/fd/output_2  (
    .C(clk),
    .D(\BU2/U0/i_rom/asyn_sin_ms2 [1]),
    .Q(\BU2/U0/final_sin [39])
  );
  FD #(
    .INIT ( 1'b0 ))
  \BU2/U0/i_rom/i_rtl.i_quarter_table.i_piped_map.i_cardinal_sin_ms/opt_has_reg.i_reg/fd/output_1  (
    .C(clk),
    .D(\BU2/U0/i_rom/Madd_asyn_sin_ms2 ),
    .Q(\BU2/U0/final_sin [38])
  );
  FD #(
    .INIT ( 1'b0 ))
  \BU2/U0/i_rom/i_rtl.i_quarter_table.i_piped_map.i_original_sin_ms/opt_has_reg.i_reg/fd/output_7  (
    .C(clk),
    .D(\BU2/U0/i_rom/asyn_sin_ms1 [6]),
    .Q(\BU2/U0/i_rom/Madd_asyn_sin_ms212 )
  );
  FD #(
    .INIT ( 1'b0 ))
  \BU2/U0/i_rom/i_rtl.i_quarter_table.i_piped_map.i_original_sin_ms/opt_has_reg.i_reg/fd/output_6  (
    .C(clk),
    .D(\BU2/U0/i_rom/asyn_sin_ms1 [5]),
    .Q(\BU2/U0/i_rom/Madd_asyn_sin_ms210 )
  );
  FD #(
    .INIT ( 1'b0 ))
  \BU2/U0/i_rom/i_rtl.i_quarter_table.i_piped_map.i_original_sin_ms/opt_has_reg.i_reg/fd/output_5  (
    .C(clk),
    .D(\BU2/U0/i_rom/asyn_sin_ms1 [4]),
    .Q(\BU2/U0/i_rom/Madd_asyn_sin_ms28 )
  );
  FD #(
    .INIT ( 1'b0 ))
  \BU2/U0/i_rom/i_rtl.i_quarter_table.i_piped_map.i_original_sin_ms/opt_has_reg.i_reg/fd/output_4  (
    .C(clk),
    .D(\BU2/U0/i_rom/asyn_sin_ms1 [3]),
    .Q(\BU2/U0/i_rom/Madd_asyn_sin_ms26 )
  );
  FD #(
    .INIT ( 1'b0 ))
  \BU2/U0/i_rom/i_rtl.i_quarter_table.i_piped_map.i_original_sin_ms/opt_has_reg.i_reg/fd/output_3  (
    .C(clk),
    .D(\BU2/U0/i_rom/asyn_sin_ms1 [2]),
    .Q(\BU2/U0/i_rom/Madd_asyn_sin_ms24 )
  );
  FD #(
    .INIT ( 1'b0 ))
  \BU2/U0/i_rom/i_rtl.i_quarter_table.i_piped_map.i_original_sin_ms/opt_has_reg.i_reg/fd/output_2  (
    .C(clk),
    .D(\BU2/U0/i_rom/asyn_sin_ms1 [1]),
    .Q(\BU2/U0/i_rom/Madd_asyn_sin_ms22 )
  );
  FD #(
    .INIT ( 1'b0 ))
  \BU2/U0/i_rom/i_rtl.i_quarter_table.i_piped_map.i_original_sin_ms/opt_has_reg.i_reg/fd/output_1  (
    .C(clk),
    .D(\BU2/U0/i_rom/asyn_sin_ms1 [0]),
    .Q(\BU2/U0/i_rom/sin_ms1 [0])
  );
  FD #(
    .INIT ( 1'b0 ))
  \BU2/U0/i_rom/i_rtl.i_quarter_table.i_piped_map.i_original_sin_ls/opt_has_reg.i_reg/fd/output_8  (
    .C(clk),
    .D(\BU2/U0/i_rom/Madd_asyn_sin_ls1_cy [6]),
    .Q(\BU2/U0/i_rom/sin_ls1 [7])
  );
  FD #(
    .INIT ( 1'b0 ))
  \BU2/U0/i_rom/i_rtl.i_quarter_table.i_piped_map.i_original_sin_ls/opt_has_reg.i_reg/fd/output_7  (
    .C(clk),
    .D(\BU2/U0/i_rom/asyn_sin_ls1 [6]),
    .Q(\BU2/U0/i_rom/sin_ls1 [6])
  );
  FD #(
    .INIT ( 1'b0 ))
  \BU2/U0/i_rom/i_rtl.i_quarter_table.i_piped_map.i_original_sin_ls/opt_has_reg.i_reg/fd/output_6  (
    .C(clk),
    .D(\BU2/U0/i_rom/asyn_sin_ls1 [5]),
    .Q(\BU2/U0/i_rom/sin_ls1 [5])
  );
  FD #(
    .INIT ( 1'b0 ))
  \BU2/U0/i_rom/i_rtl.i_quarter_table.i_piped_map.i_original_sin_ls/opt_has_reg.i_reg/fd/output_5  (
    .C(clk),
    .D(\BU2/U0/i_rom/asyn_sin_ls1 [4]),
    .Q(\BU2/U0/i_rom/sin_ls1 [4])
  );
  FD #(
    .INIT ( 1'b0 ))
  \BU2/U0/i_rom/i_rtl.i_quarter_table.i_piped_map.i_original_sin_ls/opt_has_reg.i_reg/fd/output_4  (
    .C(clk),
    .D(\BU2/U0/i_rom/asyn_sin_ls1 [3]),
    .Q(\BU2/U0/i_rom/sin_ls1 [3])
  );
  FD #(
    .INIT ( 1'b0 ))
  \BU2/U0/i_rom/i_rtl.i_quarter_table.i_piped_map.i_original_sin_ls/opt_has_reg.i_reg/fd/output_3  (
    .C(clk),
    .D(\BU2/U0/i_rom/asyn_sin_ls1 [2]),
    .Q(\BU2/U0/i_rom/sin_ls1 [2])
  );
  FD #(
    .INIT ( 1'b0 ))
  \BU2/U0/i_rom/i_rtl.i_quarter_table.i_piped_map.i_original_sin_ls/opt_has_reg.i_reg/fd/output_2  (
    .C(clk),
    .D(\BU2/U0/i_rom/asyn_sin_ls1 [1]),
    .Q(\BU2/U0/i_rom/sin_ls1 [1])
  );
  FD #(
    .INIT ( 1'b0 ))
  \BU2/U0/i_rom/i_rtl.i_quarter_table.i_piped_map.i_original_sin_ls/opt_has_reg.i_reg/fd/output_1  (
    .C(clk),
    .D(\BU2/U0/i_rom/Madd_asyn_sin_ls1 ),
    .Q(\BU2/U0/i_rom/sin_ls1 [0])
  );
  FD #(
    .INIT ( 1'b0 ))
  \BU2/U0/i_accum/i_fabric.i_common.i_phase_acc/opt_has_reg.i_reg/fd/output_32  (
    .C(clk),
    .D(\BU2/U0/i_accum/acc_phase_b [31]),
    .Q(\BU2/U0/acc_phase [31])
  );
  FD #(
    .INIT ( 1'b0 ))
  \BU2/U0/i_accum/i_fabric.i_common.i_phase_acc/opt_has_reg.i_reg/fd/output_31  (
    .C(clk),
    .D(\BU2/U0/i_accum/acc_phase_b [30]),
    .Q(\BU2/U0/acc_phase [30])
  );
  FD #(
    .INIT ( 1'b0 ))
  \BU2/U0/i_accum/i_fabric.i_common.i_phase_acc/opt_has_reg.i_reg/fd/output_30  (
    .C(clk),
    .D(\BU2/U0/i_accum/acc_phase_b [29]),
    .Q(\BU2/U0/acc_phase [29])
  );
  FD #(
    .INIT ( 1'b0 ))
  \BU2/U0/i_accum/i_fabric.i_common.i_phase_acc/opt_has_reg.i_reg/fd/output_29  (
    .C(clk),
    .D(\BU2/U0/i_accum/acc_phase_b [28]),
    .Q(\BU2/U0/acc_phase [28])
  );
  FD #(
    .INIT ( 1'b0 ))
  \BU2/U0/i_accum/i_fabric.i_common.i_phase_acc/opt_has_reg.i_reg/fd/output_28  (
    .C(clk),
    .D(\BU2/U0/i_accum/acc_phase_b [27]),
    .Q(\BU2/U0/acc_phase [27])
  );
  FD #(
    .INIT ( 1'b0 ))
  \BU2/U0/i_accum/i_fabric.i_common.i_phase_acc/opt_has_reg.i_reg/fd/output_27  (
    .C(clk),
    .D(\BU2/U0/i_accum/acc_phase_b [26]),
    .Q(\BU2/U0/acc_phase [26])
  );
  FD #(
    .INIT ( 1'b0 ))
  \BU2/U0/i_accum/i_fabric.i_common.i_phase_acc/opt_has_reg.i_reg/fd/output_26  (
    .C(clk),
    .D(\BU2/U0/i_accum/acc_phase_b [25]),
    .Q(\BU2/U0/acc_phase [25])
  );
  FD #(
    .INIT ( 1'b0 ))
  \BU2/U0/i_accum/i_fabric.i_common.i_phase_acc/opt_has_reg.i_reg/fd/output_25  (
    .C(clk),
    .D(\BU2/U0/i_accum/acc_phase_b [24]),
    .Q(\BU2/U0/acc_phase [24])
  );
  FD #(
    .INIT ( 1'b0 ))
  \BU2/U0/i_accum/i_fabric.i_common.i_phase_acc/opt_has_reg.i_reg/fd/output_24  (
    .C(clk),
    .D(\BU2/U0/i_accum/acc_phase_b [23]),
    .Q(\BU2/U0/acc_phase [23])
  );
  FD #(
    .INIT ( 1'b0 ))
  \BU2/U0/i_accum/i_fabric.i_common.i_phase_acc/opt_has_reg.i_reg/fd/output_23  (
    .C(clk),
    .D(\BU2/U0/i_accum/acc_phase_b [22]),
    .Q(\BU2/U0/acc_phase [22])
  );
  FD #(
    .INIT ( 1'b0 ))
  \BU2/U0/i_accum/i_fabric.i_common.i_phase_acc/opt_has_reg.i_reg/fd/output_22  (
    .C(clk),
    .D(\BU2/U0/i_accum/acc_phase_b [21]),
    .Q(\BU2/U0/acc_phase [21])
  );
  FD #(
    .INIT ( 1'b0 ))
  \BU2/U0/i_accum/i_fabric.i_common.i_phase_acc/opt_has_reg.i_reg/fd/output_21  (
    .C(clk),
    .D(\BU2/U0/i_accum/acc_phase_b [20]),
    .Q(\BU2/U0/acc_phase [20])
  );
  FD #(
    .INIT ( 1'b0 ))
  \BU2/U0/i_accum/i_fabric.i_common.i_phase_acc/opt_has_reg.i_reg/fd/output_20  (
    .C(clk),
    .D(\BU2/U0/i_accum/acc_phase_b [19]),
    .Q(\BU2/U0/acc_phase [19])
  );
  FD #(
    .INIT ( 1'b0 ))
  \BU2/U0/i_accum/i_fabric.i_common.i_phase_acc/opt_has_reg.i_reg/fd/output_19  (
    .C(clk),
    .D(\BU2/U0/i_accum/acc_phase_b [18]),
    .Q(\BU2/U0/acc_phase [18])
  );
  FD #(
    .INIT ( 1'b0 ))
  \BU2/U0/i_accum/i_fabric.i_common.i_phase_acc/opt_has_reg.i_reg/fd/output_18  (
    .C(clk),
    .D(\BU2/U0/i_accum/acc_phase_b [17]),
    .Q(\BU2/U0/acc_phase [17])
  );
  FD #(
    .INIT ( 1'b0 ))
  \BU2/U0/i_accum/i_fabric.i_common.i_phase_acc/opt_has_reg.i_reg/fd/output_17  (
    .C(clk),
    .D(\BU2/U0/i_accum/acc_phase_b [16]),
    .Q(\BU2/U0/acc_phase [16])
  );
  FD #(
    .INIT ( 1'b0 ))
  \BU2/U0/i_accum/i_fabric.i_common.i_phase_acc/opt_has_reg.i_reg/fd/output_16  (
    .C(clk),
    .D(\BU2/U0/i_accum/acc_phase_b [15]),
    .Q(\BU2/U0/acc_phase [15])
  );
  FD #(
    .INIT ( 1'b0 ))
  \BU2/U0/i_accum/i_fabric.i_common.i_phase_acc/opt_has_reg.i_reg/fd/output_15  (
    .C(clk),
    .D(\BU2/U0/i_accum/acc_phase_b [14]),
    .Q(\BU2/U0/acc_phase [14])
  );
  FD #(
    .INIT ( 1'b0 ))
  \BU2/U0/i_accum/i_fabric.i_common.i_phase_acc/opt_has_reg.i_reg/fd/output_14  (
    .C(clk),
    .D(\BU2/U0/i_accum/acc_phase_b [13]),
    .Q(\BU2/U0/acc_phase [13])
  );
  FD #(
    .INIT ( 1'b0 ))
  \BU2/U0/i_accum/i_fabric.i_common.i_phase_acc/opt_has_reg.i_reg/fd/output_13  (
    .C(clk),
    .D(\BU2/U0/i_accum/acc_phase_b [12]),
    .Q(\BU2/U0/acc_phase [12])
  );
  FD #(
    .INIT ( 1'b0 ))
  \BU2/U0/i_accum/i_fabric.i_common.i_phase_acc/opt_has_reg.i_reg/fd/output_12  (
    .C(clk),
    .D(\BU2/U0/i_accum/acc_phase_b [11]),
    .Q(\BU2/U0/acc_phase [11])
  );
  FD #(
    .INIT ( 1'b0 ))
  \BU2/U0/i_accum/i_fabric.i_common.i_phase_acc/opt_has_reg.i_reg/fd/output_11  (
    .C(clk),
    .D(\BU2/U0/i_accum/acc_phase_b [10]),
    .Q(\BU2/U0/acc_phase [10])
  );
  FD #(
    .INIT ( 1'b0 ))
  \BU2/U0/i_accum/i_fabric.i_common.i_phase_acc/opt_has_reg.i_reg/fd/output_10  (
    .C(clk),
    .D(\BU2/U0/i_accum/acc_phase_b [9]),
    .Q(\BU2/U0/acc_phase [9])
  );
  FD #(
    .INIT ( 1'b0 ))
  \BU2/U0/i_accum/i_fabric.i_common.i_phase_acc/opt_has_reg.i_reg/fd/output_9  (
    .C(clk),
    .D(\BU2/U0/i_accum/acc_phase_b [8]),
    .Q(\BU2/U0/acc_phase [8])
  );
  FD #(
    .INIT ( 1'b0 ))
  \BU2/U0/i_accum/i_fabric.i_common.i_phase_acc/opt_has_reg.i_reg/fd/output_8  (
    .C(clk),
    .D(\BU2/U0/i_accum/acc_phase_b [7]),
    .Q(\BU2/U0/acc_phase [7])
  );
  FD #(
    .INIT ( 1'b0 ))
  \BU2/U0/i_accum/i_fabric.i_common.i_phase_acc/opt_has_reg.i_reg/fd/output_7  (
    .C(clk),
    .D(\BU2/U0/i_accum/acc_phase_b [6]),
    .Q(\BU2/U0/acc_phase [6])
  );
  FD #(
    .INIT ( 1'b0 ))
  \BU2/U0/i_accum/i_fabric.i_common.i_phase_acc/opt_has_reg.i_reg/fd/output_6  (
    .C(clk),
    .D(\BU2/U0/i_accum/acc_phase_b [5]),
    .Q(\BU2/U0/acc_phase [5])
  );
  FD #(
    .INIT ( 1'b0 ))
  \BU2/U0/i_accum/i_fabric.i_common.i_phase_acc/opt_has_reg.i_reg/fd/output_5  (
    .C(clk),
    .D(\BU2/U0/i_accum/acc_phase_b [4]),
    .Q(\BU2/U0/acc_phase [4])
  );
  FD #(
    .INIT ( 1'b0 ))
  \BU2/U0/i_accum/i_fabric.i_common.i_phase_acc/opt_has_reg.i_reg/fd/output_4  (
    .C(clk),
    .D(\BU2/U0/i_accum/acc_phase_b [3]),
    .Q(\BU2/U0/acc_phase [3])
  );
  FD #(
    .INIT ( 1'b0 ))
  \BU2/U0/i_accum/i_fabric.i_common.i_phase_acc/opt_has_reg.i_reg/fd/output_3  (
    .C(clk),
    .D(\BU2/U0/i_accum/acc_phase_b [2]),
    .Q(\BU2/U0/acc_phase [2])
  );
  FD #(
    .INIT ( 1'b0 ))
  \BU2/U0/i_accum/i_fabric.i_common.i_phase_acc/opt_has_reg.i_reg/fd/output_2  (
    .C(clk),
    .D(\BU2/U0/i_accum/acc_phase_b [1]),
    .Q(\BU2/U0/acc_phase [1])
  );
  FD #(
    .INIT ( 1'b0 ))
  \BU2/U0/i_accum/i_fabric.i_common.i_phase_acc/opt_has_reg.i_reg/fd/output_1  (
    .C(clk),
    .D(\BU2/U0/i_accum/acc_phase_b [0]),
    .Q(\BU2/U0/acc_phase [0])
  );
  FDR #(
    .INIT ( 1'b0 ))
  \BU2/U0/i_has_sine.i_sin_op/opt_has_reg.i_reg/fd/output_14  (
    .C(clk),
    .D(\BU2/U0/final_sin [44]),
    .R(\BU2/channel [0]),
    .Q(sine_2[13])
  );
  FDR #(
    .INIT ( 1'b0 ))
  \BU2/U0/i_has_sine.i_sin_op/opt_has_reg.i_reg/fd/output_13  (
    .C(clk),
    .D(\BU2/U0/final_sin [43]),
    .R(\BU2/channel [0]),
    .Q(sine_2[12])
  );
  FDR #(
    .INIT ( 1'b0 ))
  \BU2/U0/i_has_sine.i_sin_op/opt_has_reg.i_reg/fd/output_12  (
    .C(clk),
    .D(\BU2/U0/final_sin [42]),
    .R(\BU2/channel [0]),
    .Q(sine_2[11])
  );
  FDR #(
    .INIT ( 1'b0 ))
  \BU2/U0/i_has_sine.i_sin_op/opt_has_reg.i_reg/fd/output_11  (
    .C(clk),
    .D(\BU2/U0/final_sin [41]),
    .R(\BU2/channel [0]),
    .Q(sine_2[10])
  );
  FDR #(
    .INIT ( 1'b0 ))
  \BU2/U0/i_has_sine.i_sin_op/opt_has_reg.i_reg/fd/output_10  (
    .C(clk),
    .D(\BU2/U0/final_sin [40]),
    .R(\BU2/channel [0]),
    .Q(sine_2[9])
  );
  FDR #(
    .INIT ( 1'b0 ))
  \BU2/U0/i_has_sine.i_sin_op/opt_has_reg.i_reg/fd/output_9  (
    .C(clk),
    .D(\BU2/U0/final_sin [39]),
    .R(\BU2/channel [0]),
    .Q(sine_2[8])
  );
  FDR #(
    .INIT ( 1'b0 ))
  \BU2/U0/i_has_sine.i_sin_op/opt_has_reg.i_reg/fd/output_8  (
    .C(clk),
    .D(\BU2/U0/final_sin [38]),
    .R(\BU2/channel [0]),
    .Q(sine_2[7])
  );
  FDR #(
    .INIT ( 1'b0 ))
  \BU2/U0/i_has_sine.i_sin_op/opt_has_reg.i_reg/fd/output_7  (
    .C(clk),
    .D(\BU2/U0/final_sin [37]),
    .R(\BU2/channel [0]),
    .Q(sine_2[6])
  );
  FDR #(
    .INIT ( 1'b0 ))
  \BU2/U0/i_has_sine.i_sin_op/opt_has_reg.i_reg/fd/output_6  (
    .C(clk),
    .D(\BU2/U0/final_sin [36]),
    .R(\BU2/channel [0]),
    .Q(sine_2[5])
  );
  FDR #(
    .INIT ( 1'b0 ))
  \BU2/U0/i_has_sine.i_sin_op/opt_has_reg.i_reg/fd/output_5  (
    .C(clk),
    .D(\BU2/U0/final_sin [35]),
    .R(\BU2/channel [0]),
    .Q(sine_2[4])
  );
  FDR #(
    .INIT ( 1'b0 ))
  \BU2/U0/i_has_sine.i_sin_op/opt_has_reg.i_reg/fd/output_4  (
    .C(clk),
    .D(\BU2/U0/final_sin [34]),
    .R(\BU2/channel [0]),
    .Q(sine_2[3])
  );
  FDR #(
    .INIT ( 1'b0 ))
  \BU2/U0/i_has_sine.i_sin_op/opt_has_reg.i_reg/fd/output_3  (
    .C(clk),
    .D(\BU2/U0/final_sin [33]),
    .R(\BU2/channel [0]),
    .Q(sine_2[2])
  );
  FDR #(
    .INIT ( 1'b0 ))
  \BU2/U0/i_has_sine.i_sin_op/opt_has_reg.i_reg/fd/output_2  (
    .C(clk),
    .D(\BU2/U0/final_sin [32]),
    .R(\BU2/channel [0]),
    .Q(sine_2[1])
  );
  FDR #(
    .INIT ( 1'b0 ))
  \BU2/U0/i_has_sine.i_sin_op/opt_has_reg.i_reg/fd/output_1  (
    .C(clk),
    .D(\BU2/U0/final_sin [31]),
    .R(\BU2/channel [0]),
    .Q(sine_2[0])
  );
  FD #(
    .INIT ( 1'b0 ))
  \BU2/U0/i_fabric.i_ph_adj_pipe/opt_has_reg.i_reg/fd/output_32  (
    .C(clk),
    .D(\BU2/U0/acc_phase [31]),
    .Q(\BU2/U0/acc_phase_adjusted [31])
  );
  FD #(
    .INIT ( 1'b0 ))
  \BU2/U0/i_fabric.i_ph_adj_pipe/opt_has_reg.i_reg/fd/output_31  (
    .C(clk),
    .D(\BU2/U0/acc_phase [30]),
    .Q(\BU2/U0/acc_phase_adjusted [30])
  );
  FD #(
    .INIT ( 1'b0 ))
  \BU2/U0/i_fabric.i_ph_adj_pipe/opt_has_reg.i_reg/fd/output_30  (
    .C(clk),
    .D(\BU2/U0/acc_phase [29]),
    .Q(\BU2/U0/acc_phase_adjusted [29])
  );
  FD #(
    .INIT ( 1'b0 ))
  \BU2/U0/i_fabric.i_ph_adj_pipe/opt_has_reg.i_reg/fd/output_29  (
    .C(clk),
    .D(\BU2/U0/acc_phase [28]),
    .Q(\BU2/U0/acc_phase_adjusted [28])
  );
  FD #(
    .INIT ( 1'b0 ))
  \BU2/U0/i_fabric.i_ph_adj_pipe/opt_has_reg.i_reg/fd/output_28  (
    .C(clk),
    .D(\BU2/U0/acc_phase [27]),
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
  \BU2/U0/i_fabric.i_dither_pipe/opt_has_reg.i_reg/fd/output_32  (
    .C(clk),
    .D(\BU2/U0/acc_phase_shaped_pre [31]),
    .Q(\BU2/U0/acc_phase_shaped [31])
  );
  FD #(
    .INIT ( 1'b0 ))
  \BU2/U0/i_fabric.i_dither_pipe/opt_has_reg.i_reg/fd/output_31  (
    .C(clk),
    .D(\BU2/U0/acc_phase_shaped_pre [30]),
    .Q(\BU2/U0/acc_phase_shaped [30])
  );
  FD #(
    .INIT ( 1'b0 ))
  \BU2/U0/i_fabric.i_dither_pipe/opt_has_reg.i_reg/fd/output_30  (
    .C(clk),
    .D(\BU2/U0/acc_phase_shaped_pre [29]),
    .Q(\BU2/U0/acc_phase_shaped [29])
  );
  FD #(
    .INIT ( 1'b0 ))
  \BU2/U0/i_fabric.i_dither_pipe/opt_has_reg.i_reg/fd/output_29  (
    .C(clk),
    .D(\BU2/U0/acc_phase_shaped_pre [28]),
    .Q(\BU2/U0/acc_phase_shaped [28])
  );
  FD #(
    .INIT ( 1'b0 ))
  \BU2/U0/i_fabric.i_dither_pipe/opt_has_reg.i_reg/fd/output_28  (
    .C(clk),
    .D(\BU2/U0/acc_phase_shaped_pre [27]),
    .Q(\BU2/U0/acc_phase_shaped [27])
  );
  FD #(
    .INIT ( 1'b0 ))
  \BU2/U0/i_fabric.i_dither_pipe/opt_has_reg.i_reg/fd/output_27  (
    .C(clk),
    .D(\BU2/U0/acc_phase_shaped_pre [26]),
    .Q(\BU2/U0/acc_phase_shaped [26])
  );
  FD #(
    .INIT ( 1'b0 ))
  \BU2/U0/i_fabric.i_dither_pipe/opt_has_reg.i_reg/fd/output_26  (
    .C(clk),
    .D(\BU2/U0/acc_phase_shaped_pre [25]),
    .Q(\BU2/U0/acc_phase_shaped [25])
  );
  FD #(
    .INIT ( 1'b0 ))
  \BU2/U0/i_fabric.i_dither_pipe/opt_has_reg.i_reg/fd/output_25  (
    .C(clk),
    .D(\BU2/U0/acc_phase_shaped_pre [24]),
    .Q(\BU2/U0/acc_phase_shaped [24])
  );
  FD #(
    .INIT ( 1'b0 ))
  \BU2/U0/i_fabric.i_dither_pipe/opt_has_reg.i_reg/fd/output_24  (
    .C(clk),
    .D(\BU2/U0/acc_phase_shaped_pre [23]),
    .Q(\BU2/U0/acc_phase_shaped [23])
  );
  FD #(
    .INIT ( 1'b0 ))
  \BU2/U0/i_fabric.i_dither_pipe/opt_has_reg.i_reg/fd/output_23  (
    .C(clk),
    .D(\BU2/U0/acc_phase_shaped_pre [22]),
    .Q(\BU2/U0/acc_phase_shaped [22])
  );
  FD #(
    .INIT ( 1'b0 ))
  \BU2/U0/i_fabric.i_dither_pipe/opt_has_reg.i_reg/fd/output_22  (
    .C(clk),
    .D(\BU2/U0/acc_phase_shaped_pre [21]),
    .Q(\BU2/U0/acc_phase_shaped [21])
  );
  FD #(
    .INIT ( 1'b0 ))
  \BU2/U0/i_dither.i_comb3_del/opt_has_reg.i_reg/fd/output_12  (
    .C(clk),
    .D(\BU2/U0/precombine3 [11]),
    .Q(\BU2/U0/combine3 [11])
  );
  FD #(
    .INIT ( 1'b0 ))
  \BU2/U0/i_dither.i_comb3_del/opt_has_reg.i_reg/fd/output_11  (
    .C(clk),
    .D(\BU2/U0/precombine3 [10]),
    .Q(\BU2/U0/combine3 [10])
  );
  FD #(
    .INIT ( 1'b0 ))
  \BU2/U0/i_dither.i_comb3_del/opt_has_reg.i_reg/fd/output_10  (
    .C(clk),
    .D(\BU2/U0/precombine3 [9]),
    .Q(\BU2/U0/combine3 [9])
  );
  FD #(
    .INIT ( 1'b0 ))
  \BU2/U0/i_dither.i_comb3_del/opt_has_reg.i_reg/fd/output_9  (
    .C(clk),
    .D(\BU2/U0/precombine3 [8]),
    .Q(\BU2/U0/combine3 [8])
  );
  FD #(
    .INIT ( 1'b0 ))
  \BU2/U0/i_dither.i_comb3_del/opt_has_reg.i_reg/fd/output_8  (
    .C(clk),
    .D(\BU2/U0/precombine3 [7]),
    .Q(\BU2/U0/combine3 [7])
  );
  FD #(
    .INIT ( 1'b0 ))
  \BU2/U0/i_dither.i_comb3_del/opt_has_reg.i_reg/fd/output_7  (
    .C(clk),
    .D(\BU2/U0/precombine3 [6]),
    .Q(\BU2/U0/combine3 [6])
  );
  FD #(
    .INIT ( 1'b0 ))
  \BU2/U0/i_dither.i_comb3_del/opt_has_reg.i_reg/fd/output_6  (
    .C(clk),
    .D(\BU2/U0/precombine3 [5]),
    .Q(\BU2/U0/combine3 [5])
  );
  FD #(
    .INIT ( 1'b0 ))
  \BU2/U0/i_dither.i_comb3_del/opt_has_reg.i_reg/fd/output_5  (
    .C(clk),
    .D(\BU2/U0/precombine3 [4]),
    .Q(\BU2/U0/combine3 [4])
  );
  FD #(
    .INIT ( 1'b0 ))
  \BU2/U0/i_dither.i_comb3_del/opt_has_reg.i_reg/fd/output_4  (
    .C(clk),
    .D(\BU2/U0/precombine3 [3]),
    .Q(\BU2/U0/combine3 [3])
  );
  FD #(
    .INIT ( 1'b0 ))
  \BU2/U0/i_dither.i_comb3_del/opt_has_reg.i_reg/fd/output_3  (
    .C(clk),
    .D(\BU2/U0/precombine3 [2]),
    .Q(\BU2/U0/combine3 [2])
  );
  FD #(
    .INIT ( 1'b0 ))
  \BU2/U0/i_dither.i_comb1_del/opt_has_reg.i_reg/fd/output_11  (
    .C(clk),
    .D(\BU2/U0/precombine1 [10]),
    .Q(\BU2/U0/combine1 [10])
  );
  FD #(
    .INIT ( 1'b0 ))
  \BU2/U0/i_dither.i_comb1_del/opt_has_reg.i_reg/fd/output_10  (
    .C(clk),
    .D(\BU2/U0/precombine1 [9]),
    .Q(\BU2/U0/combine1 [9])
  );
  FD #(
    .INIT ( 1'b0 ))
  \BU2/U0/i_dither.i_comb1_del/opt_has_reg.i_reg/fd/output_9  (
    .C(clk),
    .D(\BU2/U0/precombine1 [8]),
    .Q(\BU2/U0/combine1 [8])
  );
  FD #(
    .INIT ( 1'b0 ))
  \BU2/U0/i_dither.i_comb1_del/opt_has_reg.i_reg/fd/output_8  (
    .C(clk),
    .D(\BU2/U0/precombine1 [7]),
    .Q(\BU2/U0/combine1 [7])
  );
  FD #(
    .INIT ( 1'b0 ))
  \BU2/U0/i_dither.i_comb1_del/opt_has_reg.i_reg/fd/output_7  (
    .C(clk),
    .D(\BU2/U0/precombine1 [6]),
    .Q(\BU2/U0/combine1 [6])
  );
  FD #(
    .INIT ( 1'b0 ))
  \BU2/U0/i_dither.i_comb1_del/opt_has_reg.i_reg/fd/output_6  (
    .C(clk),
    .D(\BU2/U0/precombine1 [5]),
    .Q(\BU2/U0/combine1 [5])
  );
  FD #(
    .INIT ( 1'b0 ))
  \BU2/U0/i_dither.i_comb1_del/opt_has_reg.i_reg/fd/output_5  (
    .C(clk),
    .D(\BU2/U0/precombine1 [4]),
    .Q(\BU2/U0/combine1 [4])
  );
  FD #(
    .INIT ( 1'b0 ))
  \BU2/U0/i_dither.i_comb1_del/opt_has_reg.i_reg/fd/output_4  (
    .C(clk),
    .D(\BU2/U0/precombine1 [3]),
    .Q(\BU2/U0/combine1 [3])
  );
  FD #(
    .INIT ( 1'b0 ))
  \BU2/U0/i_dither.i_comb1_del/opt_has_reg.i_reg/fd/output_3  (
    .C(clk),
    .D(\BU2/U0/precombine1 [2]),
    .Q(\BU2/U0/combine1 [2])
  );
  FD #(
    .INIT ( 1'b0 ))
  \BU2/U0/i_dither.i_comb1_del/opt_has_reg.i_reg/fd/output_2  (
    .C(clk),
    .D(\BU2/U0/precombine1 [1]),
    .Q(\BU2/U0/combine1 [1])
  );
  FD #(
    .INIT ( 1'b0 ))
  \BU2/U0/i_dither.i_comb1_del/opt_has_reg.i_reg/fd/output_1  (
    .C(clk),
    .D(\BU2/U0/Madd_precombine1_lut [0]),
    .Q(\BU2/U0/combine1 [0])
  );
  FD #(
    .INIT ( 1'b0 ))
  \BU2/U0/i_dither.i_comb2_del/opt_has_reg.i_reg/fd/output_11  (
    .C(clk),
    .D(\BU2/U0/precombine2 [10]),
    .Q(\BU2/U0/combine2 [10])
  );
  FD #(
    .INIT ( 1'b0 ))
  \BU2/U0/i_dither.i_comb2_del/opt_has_reg.i_reg/fd/output_10  (
    .C(clk),
    .D(\BU2/U0/precombine2 [9]),
    .Q(\BU2/U0/combine2 [9])
  );
  FD #(
    .INIT ( 1'b0 ))
  \BU2/U0/i_dither.i_comb2_del/opt_has_reg.i_reg/fd/output_9  (
    .C(clk),
    .D(\BU2/U0/precombine2 [8]),
    .Q(\BU2/U0/combine2 [8])
  );
  FD #(
    .INIT ( 1'b0 ))
  \BU2/U0/i_dither.i_comb2_del/opt_has_reg.i_reg/fd/output_8  (
    .C(clk),
    .D(\BU2/U0/precombine2 [7]),
    .Q(\BU2/U0/combine2 [7])
  );
  FD #(
    .INIT ( 1'b0 ))
  \BU2/U0/i_dither.i_comb2_del/opt_has_reg.i_reg/fd/output_7  (
    .C(clk),
    .D(\BU2/U0/precombine2 [6]),
    .Q(\BU2/U0/combine2 [6])
  );
  FD #(
    .INIT ( 1'b0 ))
  \BU2/U0/i_dither.i_comb2_del/opt_has_reg.i_reg/fd/output_6  (
    .C(clk),
    .D(\BU2/U0/precombine2 [5]),
    .Q(\BU2/U0/combine2 [5])
  );
  FD #(
    .INIT ( 1'b0 ))
  \BU2/U0/i_dither.i_comb2_del/opt_has_reg.i_reg/fd/output_5  (
    .C(clk),
    .D(\BU2/U0/precombine2 [4]),
    .Q(\BU2/U0/combine2 [4])
  );
  FD #(
    .INIT ( 1'b0 ))
  \BU2/U0/i_dither.i_comb2_del/opt_has_reg.i_reg/fd/output_4  (
    .C(clk),
    .D(\BU2/U0/precombine2 [3]),
    .Q(\BU2/U0/combine2 [3])
  );
  FD #(
    .INIT ( 1'b0 ))
  \BU2/U0/i_dither.i_comb2_del/opt_has_reg.i_reg/fd/output_3  (
    .C(clk),
    .D(\BU2/U0/precombine2 [2]),
    .Q(\BU2/U0/combine2 [2])
  );
  FD #(
    .INIT ( 1'b0 ))
  \BU2/U0/i_dither.i_comb2_del/opt_has_reg.i_reg/fd/output_2  (
    .C(clk),
    .D(\BU2/U0/precombine2 [1]),
    .Q(\BU2/U0/combine2 [1])
  );
  FD #(
    .INIT ( 1'b0 ))
  \BU2/U0/i_dither.i_comb2_del/opt_has_reg.i_reg/fd/output_1  (
    .C(clk),
    .D(\BU2/U0/Madd_precombine2_lut [0]),
    .Q(\BU2/U0/combine2 [0])
  );
  FD #(
    .INIT ( 1'b0 ))
  \BU2/U0/i_rdy.i_single_channel.i_non_trivial_lat.i_rdy/opt_has_reg.i_reg/fd/output_1  (
    .C(clk),
    .D(\BU2/U0/pre_rdy ),
    .Q(rdy)
  );
  VCC   \BU2/U0/i_accum/i_fabric.i_common.i_ph_inc_ctrl2dsp_speedup/XST_VCC  (
    .P(\BU2/U0/i_accum/phase_inc[0] )
  );
  GND   \BU2/U0/i_accum/i_fabric.i_common.i_ph_inc_ctrl2dsp_speedup/XST_GND  (
    .G(\BU2/U0/i_accum/phase_inc[10] )
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
