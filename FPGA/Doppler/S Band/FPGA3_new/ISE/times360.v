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
// The synthesis directives "translate_off/translate_on" specified below are
// supported by Xilinx, Mentor Graphics and Synplicity synthesis
// tools. Ensure they are correct for your synthesis tool(s).

// You must compile the wrapper file times360.v when simulating
// the core, times360. When compiling the wrapper file, be sure to
// reference the XilinxCoreLib Verilog simulation library. For detailed
// instructions, please refer to the "CORE Generator Help".

`timescale 1ns/1ps

module times360(
	clk,
	a,
	q);


input clk;
input [13 : 0] a;
output [22 : 0] q;

// synthesis translate_off

      MULT_GEN_V7_0 #(
		.BRAM_ADDR_WIDTH(9),
		.C_A_TYPE(1),
		.C_A_WIDTH(14),
		.C_BAAT(14),
		.C_B_CONSTANT(1),
		.C_B_TYPE(1),
		.C_B_VALUE("101101000"),
		.C_B_WIDTH(9),
		.C_ENABLE_RLOCS(1),
		.C_HAS_ACLR(0),
		.C_HAS_A_SIGNED(0),
		.C_HAS_B(0),
		.C_HAS_CE(0),
		.C_HAS_LOADB(0),
		.C_HAS_LOAD_DONE(0),
		.C_HAS_ND(0),
		.C_HAS_O(0),
		.C_HAS_Q(1),
		.C_HAS_RDY(0),
		.C_HAS_RFD(0),
		.C_HAS_SCLR(0),
		.C_HAS_SWAPB(0),
		.C_MEM_INIT_PREFIX("mem"),
		.C_MEM_TYPE(0),
		.C_MULT_TYPE(2),
		.C_OUTPUT_HOLD(0),
		.C_OUT_WIDTH(23),
		.C_PIPELINE(0),
		.C_REG_A_B_INPUTS(1),
		.C_SQM_TYPE(0),
		.C_STACK_ADDERS(1),
		.C_STANDALONE(1),
		.C_SYNC_ENABLE(1),
		.C_USE_LUTS(1),
		.C_V2_SPEED(0))
	inst (
		.CLK(clk),
		.A(a),
		.Q(q),
		.B(),
		.O(),
		.A_SIGNED(),
		.LOADB(),
		.LOAD_DONE(),
		.SWAPB(),
		.CE(),
		.ACLR(),
		.SCLR(),
		.RFD(),
		.ND(),
		.RDY());


// synthesis translate_on

// XST black box declaration
// box_type "black_box"
// synthesis attribute box_type of times360 is "black_box"

endmodule

