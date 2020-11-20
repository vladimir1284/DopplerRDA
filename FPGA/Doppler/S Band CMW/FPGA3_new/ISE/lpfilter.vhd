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
-- You must compile the wrapper file lpfilter.vhd when simulating
-- the core, lpfilter. When compiling the wrapper file, be sure to
-- reference the XilinxCoreLib VHDL simulation library. For detailed
-- instructions, please refer to the "CORE Generator Help".

-- The synthesis directives "translate_off/translate_on" specified
-- below are supported by Xilinx, Mentor Graphics and Synplicity
-- synthesis tools. Ensure they are correct for your synthesis tool(s).

LIBRARY ieee;
USE ieee.std_logic_1164.ALL;
-- synthesis translate_off
Library XilinxCoreLib;
-- synthesis translate_on
ENTITY lpfilter IS
	port (
	ND: IN std_logic;
	RDY: OUT std_logic;
	CLK: IN std_logic;
	RST: IN std_logic;
	RFD: OUT std_logic;
	DIN: IN std_logic_VECTOR(15 downto 0);
	DOUT: OUT std_logic_VECTOR(32 downto 0));
END lpfilter;

ARCHITECTURE lpfilter_a OF lpfilter IS
-- synthesis translate_off
component wrapped_lpfilter
	port (
	ND: IN std_logic;
	RDY: OUT std_logic;
	CLK: IN std_logic;
	RST: IN std_logic;
	RFD: OUT std_logic;
	DIN: IN std_logic_VECTOR(15 downto 0);
	DOUT: OUT std_logic_VECTOR(32 downto 0));
end component;

-- Configuration specification 
	for all : wrapped_lpfilter use entity XilinxCoreLib.C_DA_FIR_V8_0(behavioral)
		generic map(
			c_has_sout_r => 0,
			c_result_width => 33,
			c_reload_delay => 274,
			c_data_type => 0,
			c_channels => 1,
			c_filter_type => 2,
			c_response => 0,
			c_has_sout_f => 0,
			c_reg_output => 1,
			c_taps => 29,
			c_data_width => 16,
			c_enable_rlocs => 0,
			c_coeff_type => 0,
			c_has_sin_r => 0,
			c_reload_mem_type => 1,
			c_reload => 0,
			c_baat => 1,
			c_latency => 25,
			c_coeff_width => 16,
			c_optimize => 1,
			c_use_model_func => 0,
			c_zpf => 1,
			c_has_sin_f => 0,
			c_shape => 0,
			c_has_sel_o => 0,
			c_saturate => 0,
			c_mem_init_file => "lpfilter.mif",
			c_polyphase_factor => 4,
			c_has_sel_i => 0,
			c_has_reset => 1);
-- synthesis translate_on
BEGIN
-- synthesis translate_off
U0 : wrapped_lpfilter
		port map (
			ND => ND,
			RDY => RDY,
			CLK => CLK,
			RST => RST,
			RFD => RFD,
			DIN => DIN,
			DOUT => DOUT);
-- synthesis translate_on

END lpfilter_a;

