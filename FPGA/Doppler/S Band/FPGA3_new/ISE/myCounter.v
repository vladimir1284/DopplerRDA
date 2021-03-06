////////////////////////////////////////////////////////////////////////////////
// Copyright (c) 1995-2008 Xilinx, Inc.  All rights reserved.
////////////////////////////////////////////////////////////////////////////////
//   ____  ____
//  /   /\/   /
// /___/  \  /    Vendor: Xilinx
// \   \   \/     Version: K.31
//  \   \         Application: netgen
//  /   /         Filename: myCounter.v
// /___/   /\     Timestamp: Thu Mar 05 14:19:20 2020
// \   \  /  \ 
//  \___\/\___\
//             
// Command	: -intstyle ise -w -sim -ofmt verilog "D:\Proyecto Radar CSB\Doppler RDA\FPGA\Doppler\S Band\FPGA3_new\ISE\tmp\_cg\myCounter.ngc" "D:\Proyecto Radar CSB\Doppler RDA\FPGA\Doppler\S Band\FPGA3_new\ISE\tmp\_cg\myCounter.v" 
// Device	: 2v1000fg456-4
// Input file	: D:/Proyecto Radar CSB/Doppler RDA/FPGA/Doppler/S Band/FPGA3_new/ISE/tmp/_cg/myCounter.ngc
// Output file	: D:/Proyecto Radar CSB/Doppler RDA/FPGA/Doppler/S Band/FPGA3_new/ISE/tmp/_cg/myCounter.v
// # of Modules	: 1
// Design Name	: myCounter
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

module myCounter (
  clk, q
);
  input clk;
  output [13 : 0] q;
  
  // synthesis translate_off
  
  wire \BU2/U0/the_addsub/no_pipelining.the_addsub/i_simple_model.carryxortop_rt_56 ;
  wire \BU2/U0/the_addsub/no_pipelining.the_addsub/i_simple_model.carrychaingen[1].carrymux_rt_55 ;
  wire \BU2/U0/the_addsub/no_pipelining.the_addsub/i_simple_model.carrychaingen[2].carrymux_rt_53 ;
  wire \BU2/U0/the_addsub/no_pipelining.the_addsub/i_simple_model.carrychaingen[3].carrymux_rt_51 ;
  wire \BU2/U0/the_addsub/no_pipelining.the_addsub/i_simple_model.carrychaingen[4].carrymux_rt_49 ;
  wire \BU2/U0/the_addsub/no_pipelining.the_addsub/i_simple_model.carrychaingen[5].carrymux_rt_47 ;
  wire \BU2/U0/the_addsub/no_pipelining.the_addsub/i_simple_model.carrychaingen[6].carrymux_rt_45 ;
  wire \BU2/U0/the_addsub/no_pipelining.the_addsub/i_simple_model.carrychaingen[7].carrymux_rt_43 ;
  wire \BU2/U0/the_addsub/no_pipelining.the_addsub/i_simple_model.carrychaingen[8].carrymux_rt_41 ;
  wire \BU2/U0/the_addsub/no_pipelining.the_addsub/i_simple_model.carrychaingen[9].carrymux_rt_39 ;
  wire \BU2/U0/the_addsub/no_pipelining.the_addsub/i_simple_model.carrychaingen[10].carrymux_rt_37 ;
  wire \BU2/U0/the_addsub/no_pipelining.the_addsub/i_simple_model.carrychaingen[11].carrymux_rt_35 ;
  wire \BU2/U0/the_addsub/no_pipelining.the_addsub/i_simple_model.carrychaingen[12].carrymux_rt_32 ;
  wire \BU2/N0 ;
  wire \BU2/q_thresh1 ;
  wire NLW_VCC_P_UNCONNECTED;
  wire NLW_GND_G_UNCONNECTED;
  wire [13 : 0] NlwRenamedSig_OI_q;
  wire [0 : 0] \BU2/U0/the_addsub/no_pipelining.the_addsub/halfsum ;
  wire [12 : 0] \BU2/U0/the_addsub/no_pipelining.the_addsub/carry_simple ;
  wire [13 : 0] \BU2/U0/q_next ;
  assign
    q[13] = NlwRenamedSig_OI_q[13],
    q[12] = NlwRenamedSig_OI_q[12],
    q[11] = NlwRenamedSig_OI_q[11],
    q[10] = NlwRenamedSig_OI_q[10],
    q[9] = NlwRenamedSig_OI_q[9],
    q[8] = NlwRenamedSig_OI_q[8],
    q[7] = NlwRenamedSig_OI_q[7],
    q[6] = NlwRenamedSig_OI_q[6],
    q[5] = NlwRenamedSig_OI_q[5],
    q[4] = NlwRenamedSig_OI_q[4],
    q[3] = NlwRenamedSig_OI_q[3],
    q[2] = NlwRenamedSig_OI_q[2],
    q[1] = NlwRenamedSig_OI_q[1],
    q[0] = NlwRenamedSig_OI_q[0];
  VCC   VCC_0 (
    .P(NLW_VCC_P_UNCONNECTED)
  );
  GND   GND_1 (
    .G(NLW_GND_G_UNCONNECTED)
  );
  INV   \BU2/U0/the_addsub/no_pipelining.the_addsub/halfsum_not00001_INV_0  (
    .I(NlwRenamedSig_OI_q[0]),
    .O(\BU2/U0/the_addsub/no_pipelining.the_addsub/halfsum [0])
  );
  LUT1 #(
    .INIT ( 2'h2 ))
  \BU2/U0/the_addsub/no_pipelining.the_addsub/i_simple_model.carryxortop_rt  (
    .I0(NlwRenamedSig_OI_q[13]),
    .O(\BU2/U0/the_addsub/no_pipelining.the_addsub/i_simple_model.carryxortop_rt_56 )
  );
  LUT1 #(
    .INIT ( 2'h2 ))
  \BU2/U0/the_addsub/no_pipelining.the_addsub/i_simple_model.carrychaingen[1].carrymux_rt  (
    .I0(NlwRenamedSig_OI_q[1]),
    .O(\BU2/U0/the_addsub/no_pipelining.the_addsub/i_simple_model.carrychaingen[1].carrymux_rt_55 )
  );
  LUT1 #(
    .INIT ( 2'h2 ))
  \BU2/U0/the_addsub/no_pipelining.the_addsub/i_simple_model.carrychaingen[2].carrymux_rt  (
    .I0(NlwRenamedSig_OI_q[2]),
    .O(\BU2/U0/the_addsub/no_pipelining.the_addsub/i_simple_model.carrychaingen[2].carrymux_rt_53 )
  );
  LUT1 #(
    .INIT ( 2'h2 ))
  \BU2/U0/the_addsub/no_pipelining.the_addsub/i_simple_model.carrychaingen[3].carrymux_rt  (
    .I0(NlwRenamedSig_OI_q[3]),
    .O(\BU2/U0/the_addsub/no_pipelining.the_addsub/i_simple_model.carrychaingen[3].carrymux_rt_51 )
  );
  LUT1 #(
    .INIT ( 2'h2 ))
  \BU2/U0/the_addsub/no_pipelining.the_addsub/i_simple_model.carrychaingen[4].carrymux_rt  (
    .I0(NlwRenamedSig_OI_q[4]),
    .O(\BU2/U0/the_addsub/no_pipelining.the_addsub/i_simple_model.carrychaingen[4].carrymux_rt_49 )
  );
  LUT1 #(
    .INIT ( 2'h2 ))
  \BU2/U0/the_addsub/no_pipelining.the_addsub/i_simple_model.carrychaingen[5].carrymux_rt  (
    .I0(NlwRenamedSig_OI_q[5]),
    .O(\BU2/U0/the_addsub/no_pipelining.the_addsub/i_simple_model.carrychaingen[5].carrymux_rt_47 )
  );
  LUT1 #(
    .INIT ( 2'h2 ))
  \BU2/U0/the_addsub/no_pipelining.the_addsub/i_simple_model.carrychaingen[6].carrymux_rt  (
    .I0(NlwRenamedSig_OI_q[6]),
    .O(\BU2/U0/the_addsub/no_pipelining.the_addsub/i_simple_model.carrychaingen[6].carrymux_rt_45 )
  );
  LUT1 #(
    .INIT ( 2'h2 ))
  \BU2/U0/the_addsub/no_pipelining.the_addsub/i_simple_model.carrychaingen[7].carrymux_rt  (
    .I0(NlwRenamedSig_OI_q[7]),
    .O(\BU2/U0/the_addsub/no_pipelining.the_addsub/i_simple_model.carrychaingen[7].carrymux_rt_43 )
  );
  LUT1 #(
    .INIT ( 2'h2 ))
  \BU2/U0/the_addsub/no_pipelining.the_addsub/i_simple_model.carrychaingen[8].carrymux_rt  (
    .I0(NlwRenamedSig_OI_q[8]),
    .O(\BU2/U0/the_addsub/no_pipelining.the_addsub/i_simple_model.carrychaingen[8].carrymux_rt_41 )
  );
  LUT1 #(
    .INIT ( 2'h2 ))
  \BU2/U0/the_addsub/no_pipelining.the_addsub/i_simple_model.carrychaingen[9].carrymux_rt  (
    .I0(NlwRenamedSig_OI_q[9]),
    .O(\BU2/U0/the_addsub/no_pipelining.the_addsub/i_simple_model.carrychaingen[9].carrymux_rt_39 )
  );
  LUT1 #(
    .INIT ( 2'h2 ))
  \BU2/U0/the_addsub/no_pipelining.the_addsub/i_simple_model.carrychaingen[10].carrymux_rt  (
    .I0(NlwRenamedSig_OI_q[10]),
    .O(\BU2/U0/the_addsub/no_pipelining.the_addsub/i_simple_model.carrychaingen[10].carrymux_rt_37 )
  );
  LUT1 #(
    .INIT ( 2'h2 ))
  \BU2/U0/the_addsub/no_pipelining.the_addsub/i_simple_model.carrychaingen[11].carrymux_rt  (
    .I0(NlwRenamedSig_OI_q[11]),
    .O(\BU2/U0/the_addsub/no_pipelining.the_addsub/i_simple_model.carrychaingen[11].carrymux_rt_35 )
  );
  LUT1 #(
    .INIT ( 2'h2 ))
  \BU2/U0/the_addsub/no_pipelining.the_addsub/i_simple_model.carrychaingen[12].carrymux_rt  (
    .I0(NlwRenamedSig_OI_q[12]),
    .O(\BU2/U0/the_addsub/no_pipelining.the_addsub/i_simple_model.carrychaingen[12].carrymux_rt_32 )
  );
  MUXCY   \BU2/U0/the_addsub/no_pipelining.the_addsub/i_simple_model.carrymux0  (
    .CI(\BU2/N0 ),
    .DI(\BU2/q_thresh1 ),
    .S(\BU2/U0/the_addsub/no_pipelining.the_addsub/halfsum [0]),
    .O(\BU2/U0/the_addsub/no_pipelining.the_addsub/carry_simple [0])
  );
  XORCY   \BU2/U0/the_addsub/no_pipelining.the_addsub/i_simple_model.carryxor0  (
    .CI(\BU2/N0 ),
    .LI(\BU2/U0/the_addsub/no_pipelining.the_addsub/halfsum [0]),
    .O(\BU2/U0/q_next [0])
  );
  XORCY   \BU2/U0/the_addsub/no_pipelining.the_addsub/i_simple_model.carryxortop  (
    .CI(\BU2/U0/the_addsub/no_pipelining.the_addsub/carry_simple [12]),
    .LI(\BU2/U0/the_addsub/no_pipelining.the_addsub/i_simple_model.carryxortop_rt_56 ),
    .O(\BU2/U0/q_next [13])
  );
  MUXCY   \BU2/U0/the_addsub/no_pipelining.the_addsub/i_simple_model.carrychaingen[1].carrymux  (
    .CI(\BU2/U0/the_addsub/no_pipelining.the_addsub/carry_simple [0]),
    .DI(\BU2/N0 ),
    .S(\BU2/U0/the_addsub/no_pipelining.the_addsub/i_simple_model.carrychaingen[1].carrymux_rt_55 ),
    .O(\BU2/U0/the_addsub/no_pipelining.the_addsub/carry_simple [1])
  );
  XORCY   \BU2/U0/the_addsub/no_pipelining.the_addsub/i_simple_model.carrychaingen[1].carryxor  (
    .CI(\BU2/U0/the_addsub/no_pipelining.the_addsub/carry_simple [0]),
    .LI(\BU2/U0/the_addsub/no_pipelining.the_addsub/i_simple_model.carrychaingen[1].carrymux_rt_55 ),
    .O(\BU2/U0/q_next [1])
  );
  MUXCY   \BU2/U0/the_addsub/no_pipelining.the_addsub/i_simple_model.carrychaingen[2].carrymux  (
    .CI(\BU2/U0/the_addsub/no_pipelining.the_addsub/carry_simple [1]),
    .DI(\BU2/N0 ),
    .S(\BU2/U0/the_addsub/no_pipelining.the_addsub/i_simple_model.carrychaingen[2].carrymux_rt_53 ),
    .O(\BU2/U0/the_addsub/no_pipelining.the_addsub/carry_simple [2])
  );
  XORCY   \BU2/U0/the_addsub/no_pipelining.the_addsub/i_simple_model.carrychaingen[2].carryxor  (
    .CI(\BU2/U0/the_addsub/no_pipelining.the_addsub/carry_simple [1]),
    .LI(\BU2/U0/the_addsub/no_pipelining.the_addsub/i_simple_model.carrychaingen[2].carrymux_rt_53 ),
    .O(\BU2/U0/q_next [2])
  );
  MUXCY   \BU2/U0/the_addsub/no_pipelining.the_addsub/i_simple_model.carrychaingen[3].carrymux  (
    .CI(\BU2/U0/the_addsub/no_pipelining.the_addsub/carry_simple [2]),
    .DI(\BU2/N0 ),
    .S(\BU2/U0/the_addsub/no_pipelining.the_addsub/i_simple_model.carrychaingen[3].carrymux_rt_51 ),
    .O(\BU2/U0/the_addsub/no_pipelining.the_addsub/carry_simple [3])
  );
  XORCY   \BU2/U0/the_addsub/no_pipelining.the_addsub/i_simple_model.carrychaingen[3].carryxor  (
    .CI(\BU2/U0/the_addsub/no_pipelining.the_addsub/carry_simple [2]),
    .LI(\BU2/U0/the_addsub/no_pipelining.the_addsub/i_simple_model.carrychaingen[3].carrymux_rt_51 ),
    .O(\BU2/U0/q_next [3])
  );
  MUXCY   \BU2/U0/the_addsub/no_pipelining.the_addsub/i_simple_model.carrychaingen[4].carrymux  (
    .CI(\BU2/U0/the_addsub/no_pipelining.the_addsub/carry_simple [3]),
    .DI(\BU2/N0 ),
    .S(\BU2/U0/the_addsub/no_pipelining.the_addsub/i_simple_model.carrychaingen[4].carrymux_rt_49 ),
    .O(\BU2/U0/the_addsub/no_pipelining.the_addsub/carry_simple [4])
  );
  XORCY   \BU2/U0/the_addsub/no_pipelining.the_addsub/i_simple_model.carrychaingen[4].carryxor  (
    .CI(\BU2/U0/the_addsub/no_pipelining.the_addsub/carry_simple [3]),
    .LI(\BU2/U0/the_addsub/no_pipelining.the_addsub/i_simple_model.carrychaingen[4].carrymux_rt_49 ),
    .O(\BU2/U0/q_next [4])
  );
  MUXCY   \BU2/U0/the_addsub/no_pipelining.the_addsub/i_simple_model.carrychaingen[5].carrymux  (
    .CI(\BU2/U0/the_addsub/no_pipelining.the_addsub/carry_simple [4]),
    .DI(\BU2/N0 ),
    .S(\BU2/U0/the_addsub/no_pipelining.the_addsub/i_simple_model.carrychaingen[5].carrymux_rt_47 ),
    .O(\BU2/U0/the_addsub/no_pipelining.the_addsub/carry_simple [5])
  );
  XORCY   \BU2/U0/the_addsub/no_pipelining.the_addsub/i_simple_model.carrychaingen[5].carryxor  (
    .CI(\BU2/U0/the_addsub/no_pipelining.the_addsub/carry_simple [4]),
    .LI(\BU2/U0/the_addsub/no_pipelining.the_addsub/i_simple_model.carrychaingen[5].carrymux_rt_47 ),
    .O(\BU2/U0/q_next [5])
  );
  MUXCY   \BU2/U0/the_addsub/no_pipelining.the_addsub/i_simple_model.carrychaingen[6].carrymux  (
    .CI(\BU2/U0/the_addsub/no_pipelining.the_addsub/carry_simple [5]),
    .DI(\BU2/N0 ),
    .S(\BU2/U0/the_addsub/no_pipelining.the_addsub/i_simple_model.carrychaingen[6].carrymux_rt_45 ),
    .O(\BU2/U0/the_addsub/no_pipelining.the_addsub/carry_simple [6])
  );
  XORCY   \BU2/U0/the_addsub/no_pipelining.the_addsub/i_simple_model.carrychaingen[6].carryxor  (
    .CI(\BU2/U0/the_addsub/no_pipelining.the_addsub/carry_simple [5]),
    .LI(\BU2/U0/the_addsub/no_pipelining.the_addsub/i_simple_model.carrychaingen[6].carrymux_rt_45 ),
    .O(\BU2/U0/q_next [6])
  );
  MUXCY   \BU2/U0/the_addsub/no_pipelining.the_addsub/i_simple_model.carrychaingen[7].carrymux  (
    .CI(\BU2/U0/the_addsub/no_pipelining.the_addsub/carry_simple [6]),
    .DI(\BU2/N0 ),
    .S(\BU2/U0/the_addsub/no_pipelining.the_addsub/i_simple_model.carrychaingen[7].carrymux_rt_43 ),
    .O(\BU2/U0/the_addsub/no_pipelining.the_addsub/carry_simple [7])
  );
  XORCY   \BU2/U0/the_addsub/no_pipelining.the_addsub/i_simple_model.carrychaingen[7].carryxor  (
    .CI(\BU2/U0/the_addsub/no_pipelining.the_addsub/carry_simple [6]),
    .LI(\BU2/U0/the_addsub/no_pipelining.the_addsub/i_simple_model.carrychaingen[7].carrymux_rt_43 ),
    .O(\BU2/U0/q_next [7])
  );
  MUXCY   \BU2/U0/the_addsub/no_pipelining.the_addsub/i_simple_model.carrychaingen[8].carrymux  (
    .CI(\BU2/U0/the_addsub/no_pipelining.the_addsub/carry_simple [7]),
    .DI(\BU2/N0 ),
    .S(\BU2/U0/the_addsub/no_pipelining.the_addsub/i_simple_model.carrychaingen[8].carrymux_rt_41 ),
    .O(\BU2/U0/the_addsub/no_pipelining.the_addsub/carry_simple [8])
  );
  XORCY   \BU2/U0/the_addsub/no_pipelining.the_addsub/i_simple_model.carrychaingen[8].carryxor  (
    .CI(\BU2/U0/the_addsub/no_pipelining.the_addsub/carry_simple [7]),
    .LI(\BU2/U0/the_addsub/no_pipelining.the_addsub/i_simple_model.carrychaingen[8].carrymux_rt_41 ),
    .O(\BU2/U0/q_next [8])
  );
  MUXCY   \BU2/U0/the_addsub/no_pipelining.the_addsub/i_simple_model.carrychaingen[9].carrymux  (
    .CI(\BU2/U0/the_addsub/no_pipelining.the_addsub/carry_simple [8]),
    .DI(\BU2/N0 ),
    .S(\BU2/U0/the_addsub/no_pipelining.the_addsub/i_simple_model.carrychaingen[9].carrymux_rt_39 ),
    .O(\BU2/U0/the_addsub/no_pipelining.the_addsub/carry_simple [9])
  );
  XORCY   \BU2/U0/the_addsub/no_pipelining.the_addsub/i_simple_model.carrychaingen[9].carryxor  (
    .CI(\BU2/U0/the_addsub/no_pipelining.the_addsub/carry_simple [8]),
    .LI(\BU2/U0/the_addsub/no_pipelining.the_addsub/i_simple_model.carrychaingen[9].carrymux_rt_39 ),
    .O(\BU2/U0/q_next [9])
  );
  MUXCY   \BU2/U0/the_addsub/no_pipelining.the_addsub/i_simple_model.carrychaingen[10].carrymux  (
    .CI(\BU2/U0/the_addsub/no_pipelining.the_addsub/carry_simple [9]),
    .DI(\BU2/N0 ),
    .S(\BU2/U0/the_addsub/no_pipelining.the_addsub/i_simple_model.carrychaingen[10].carrymux_rt_37 ),
    .O(\BU2/U0/the_addsub/no_pipelining.the_addsub/carry_simple [10])
  );
  XORCY   \BU2/U0/the_addsub/no_pipelining.the_addsub/i_simple_model.carrychaingen[10].carryxor  (
    .CI(\BU2/U0/the_addsub/no_pipelining.the_addsub/carry_simple [9]),
    .LI(\BU2/U0/the_addsub/no_pipelining.the_addsub/i_simple_model.carrychaingen[10].carrymux_rt_37 ),
    .O(\BU2/U0/q_next [10])
  );
  MUXCY   \BU2/U0/the_addsub/no_pipelining.the_addsub/i_simple_model.carrychaingen[11].carrymux  (
    .CI(\BU2/U0/the_addsub/no_pipelining.the_addsub/carry_simple [10]),
    .DI(\BU2/N0 ),
    .S(\BU2/U0/the_addsub/no_pipelining.the_addsub/i_simple_model.carrychaingen[11].carrymux_rt_35 ),
    .O(\BU2/U0/the_addsub/no_pipelining.the_addsub/carry_simple [11])
  );
  XORCY   \BU2/U0/the_addsub/no_pipelining.the_addsub/i_simple_model.carrychaingen[11].carryxor  (
    .CI(\BU2/U0/the_addsub/no_pipelining.the_addsub/carry_simple [10]),
    .LI(\BU2/U0/the_addsub/no_pipelining.the_addsub/i_simple_model.carrychaingen[11].carrymux_rt_35 ),
    .O(\BU2/U0/q_next [11])
  );
  MUXCY   \BU2/U0/the_addsub/no_pipelining.the_addsub/i_simple_model.carrychaingen[12].carrymux  (
    .CI(\BU2/U0/the_addsub/no_pipelining.the_addsub/carry_simple [11]),
    .DI(\BU2/N0 ),
    .S(\BU2/U0/the_addsub/no_pipelining.the_addsub/i_simple_model.carrychaingen[12].carrymux_rt_32 ),
    .O(\BU2/U0/the_addsub/no_pipelining.the_addsub/carry_simple [12])
  );
  XORCY   \BU2/U0/the_addsub/no_pipelining.the_addsub/i_simple_model.carrychaingen[12].carryxor  (
    .CI(\BU2/U0/the_addsub/no_pipelining.the_addsub/carry_simple [11]),
    .LI(\BU2/U0/the_addsub/no_pipelining.the_addsub/i_simple_model.carrychaingen[12].carrymux_rt_32 ),
    .O(\BU2/U0/q_next [12])
  );
  FDE #(
    .INIT ( 1'b0 ))
  \BU2/U0/q_i_0  (
    .C(clk),
    .CE(\BU2/q_thresh1 ),
    .D(\BU2/U0/q_next [0]),
    .Q(NlwRenamedSig_OI_q[0])
  );
  FDE #(
    .INIT ( 1'b0 ))
  \BU2/U0/q_i_1  (
    .C(clk),
    .CE(\BU2/q_thresh1 ),
    .D(\BU2/U0/q_next [1]),
    .Q(NlwRenamedSig_OI_q[1])
  );
  FDE #(
    .INIT ( 1'b0 ))
  \BU2/U0/q_i_2  (
    .C(clk),
    .CE(\BU2/q_thresh1 ),
    .D(\BU2/U0/q_next [2]),
    .Q(NlwRenamedSig_OI_q[2])
  );
  FDE #(
    .INIT ( 1'b0 ))
  \BU2/U0/q_i_3  (
    .C(clk),
    .CE(\BU2/q_thresh1 ),
    .D(\BU2/U0/q_next [3]),
    .Q(NlwRenamedSig_OI_q[3])
  );
  FDE #(
    .INIT ( 1'b0 ))
  \BU2/U0/q_i_4  (
    .C(clk),
    .CE(\BU2/q_thresh1 ),
    .D(\BU2/U0/q_next [4]),
    .Q(NlwRenamedSig_OI_q[4])
  );
  FDE #(
    .INIT ( 1'b0 ))
  \BU2/U0/q_i_5  (
    .C(clk),
    .CE(\BU2/q_thresh1 ),
    .D(\BU2/U0/q_next [5]),
    .Q(NlwRenamedSig_OI_q[5])
  );
  FDE #(
    .INIT ( 1'b0 ))
  \BU2/U0/q_i_6  (
    .C(clk),
    .CE(\BU2/q_thresh1 ),
    .D(\BU2/U0/q_next [6]),
    .Q(NlwRenamedSig_OI_q[6])
  );
  FDE #(
    .INIT ( 1'b0 ))
  \BU2/U0/q_i_7  (
    .C(clk),
    .CE(\BU2/q_thresh1 ),
    .D(\BU2/U0/q_next [7]),
    .Q(NlwRenamedSig_OI_q[7])
  );
  FDE #(
    .INIT ( 1'b0 ))
  \BU2/U0/q_i_8  (
    .C(clk),
    .CE(\BU2/q_thresh1 ),
    .D(\BU2/U0/q_next [8]),
    .Q(NlwRenamedSig_OI_q[8])
  );
  FDE #(
    .INIT ( 1'b0 ))
  \BU2/U0/q_i_9  (
    .C(clk),
    .CE(\BU2/q_thresh1 ),
    .D(\BU2/U0/q_next [9]),
    .Q(NlwRenamedSig_OI_q[9])
  );
  FDE #(
    .INIT ( 1'b0 ))
  \BU2/U0/q_i_10  (
    .C(clk),
    .CE(\BU2/q_thresh1 ),
    .D(\BU2/U0/q_next [10]),
    .Q(NlwRenamedSig_OI_q[10])
  );
  FDE #(
    .INIT ( 1'b0 ))
  \BU2/U0/q_i_11  (
    .C(clk),
    .CE(\BU2/q_thresh1 ),
    .D(\BU2/U0/q_next [11]),
    .Q(NlwRenamedSig_OI_q[11])
  );
  FDE #(
    .INIT ( 1'b0 ))
  \BU2/U0/q_i_12  (
    .C(clk),
    .CE(\BU2/q_thresh1 ),
    .D(\BU2/U0/q_next [12]),
    .Q(NlwRenamedSig_OI_q[12])
  );
  FDE #(
    .INIT ( 1'b0 ))
  \BU2/U0/q_i_13  (
    .C(clk),
    .CE(\BU2/q_thresh1 ),
    .D(\BU2/U0/q_next [13]),
    .Q(NlwRenamedSig_OI_q[13])
  );
  VCC   \BU2/XST_VCC  (
    .P(\BU2/q_thresh1 )
  );
  GND   \BU2/XST_GND  (
    .G(\BU2/N0 )
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
