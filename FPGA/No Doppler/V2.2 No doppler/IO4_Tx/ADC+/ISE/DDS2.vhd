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
-- You must compile the wrapper file DDS2.vhd when simulating
-- the core, DDS2. When compiling the wrapper file, be sure to
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
ENTITY DDS2 IS
	port (
	clk: IN std_logic;
	sclr: IN std_logic;
	rdy: OUT std_logic;
	sine: OUT std_logic_VECTOR(19 downto 0));
END DDS2;

ARCHITECTURE DDS2_a OF DDS2 IS
-- synthesis translate_off
component wrapped_DDS2
	port (
	clk: IN std_logic;
	sclr: IN std_logic;
	rdy: OUT std_logic;
	sine: OUT std_logic_VECTOR(19 downto 0));
end component;

-- Configuration specification 
	for all : wrapped_DDS2 use entity XilinxCoreLib.dds_compiler_v2_1(behavioral)
		generic map(
			c_use_dsp48 => 0,
			c_phase_offset_value => "1000000000000000000000000000,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0",
			c_channels => 1,
			c_phase_increment_value => "1010001111010111000010,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0",
			c_has_rdy => 1,
			c_has_sclr => 1,
			c_phase_offset => 2,
			c_data_width => 28,
			c_accumulator_latency => 1,
			c_phase_angle_width => 11,
			c_enable_rlocs => 0,
			c_phase_increment => 2,
			c_has_rfd => 0,
			c_negative_sine => 0,
			c_has_channel_index => 0,
			c_latency => -1,
			c_por_mode => 0,
			c_has_ce => 0,
			c_family => "virtex2",
			c_outputs_required => 0,
			c_pipelined => 0,
			c_accumulator_width => 28,
			c_mem_type => 1,
			c_optimise_goal => 0,
			c_negative_cosine => 0,
			c_noise_shaping => 2,
			c_xdevicefamily => "virtex2",
			c_output_width => 20);
-- synthesis translate_on
BEGIN
-- synthesis translate_off
U0 : wrapped_DDS2
		port map (
			clk => clk,
			sclr => sclr,
			rdy => rdy,
			sine => sine);
-- synthesis translate_on

END DDS2_a;

