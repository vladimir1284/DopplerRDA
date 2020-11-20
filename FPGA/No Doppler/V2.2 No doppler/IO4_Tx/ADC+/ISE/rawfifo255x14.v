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

// You must compile the wrapper file rawfifo255x14.v when simulating
// the core, rawfifo255x14. When compiling the wrapper file, be sure to
// reference the XilinxCoreLib Verilog simulation library. For detailed
// instructions, please refer to the "CORE Generator Help".

`timescale 1ns/1ps

module rawfifo255x14(
	din,
	wr_en,
	wr_clk,
	rd_en,
	rd_clk,
	ainit,
	dout,
	full,
	empty);


input [13 : 0] din;
input wr_en;
input wr_clk;
input rd_en;
input rd_clk;
input ainit;
output [13 : 0] dout;
output full;
output empty;

// synthesis translate_off

      ASYNC_FIFO_V5_1 #(
		.C_DATA_WIDTH(14),
		.C_ENABLE_RLOCS(0),
		.C_FIFO_DEPTH(511),
		.C_HAS_ALMOST_EMPTY(0),
		.C_HAS_ALMOST_FULL(0),
		.C_HAS_RD_ACK(0),
		.C_HAS_RD_COUNT(0),
		.C_HAS_RD_ERR(0),
		.C_HAS_WR_ACK(0),
		.C_HAS_WR_COUNT(0),
		.C_HAS_WR_ERR(0),
		.C_RD_ACK_LOW(0),
		.C_RD_COUNT_WIDTH(2),
		.C_RD_ERR_LOW(0),
		.C_USE_BLOCKMEM(1),
		.C_WR_ACK_LOW(0),
		.C_WR_COUNT_WIDTH(2),
		.C_WR_ERR_LOW(0))
	inst (
		.DIN(din),
		.WR_EN(wr_en),
		.WR_CLK(wr_clk),
		.RD_EN(rd_en),
		.RD_CLK(rd_clk),
		.AINIT(ainit),
		.DOUT(dout),
		.FULL(full),
		.EMPTY(empty),
		.ALMOST_FULL(),
		.ALMOST_EMPTY(),
		.WR_COUNT(),
		.RD_COUNT(),
		.RD_ACK(),
		.RD_ERR(),
		.WR_ACK(),
		.WR_ERR());


// synthesis translate_on

// XST black box declaration
// box_type "black_box"
// synthesis attribute box_type of rawfifo255x14 is "black_box"

endmodule

