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
--     (c) Copyright 1995-2002 Xilinx, Inc.                                   --
--     All rights reserved.                                                   --
--------------------------------------------------------------------------------
-- You must compile the wrapper file fifo15x17.vhd when simulating
-- the core, fifo15x17. When compiling the wrapper file, be sure to
-- reference the XilinxCoreLib VHDL simulation library. For detailed
-- instructions, please refer to the "Coregen Users Guide".

-- The synopsys directives "translate_off/translate_on" specified
-- below are supported by XST, FPGA Express, Exemplar and Synplicity
-- synthesis tools. Ensure they are correct for your synthesis tool(s).

LIBRARY ieee;
USE ieee.std_logic_1164.ALL;

-- pragma translate_off
Library XilinxCoreLib;
-- pragma translate_on

ENTITY fifo15x17 IS
	port (
	din: IN std_logic_VECTOR(16 downto 0);
	wr_en: IN std_logic;
	wr_clk: IN std_logic;
	rd_en: IN std_logic;
	rd_clk: IN std_logic;
	ainit: IN std_logic;
	dout: OUT std_logic_VECTOR(16 downto 0);
	full: OUT std_logic;
	empty: OUT std_logic;
	almost_full: OUT std_logic;
	almost_empty: OUT std_logic);
END fifo15x17;


-- pragma translate_off

ARCHITECTURE fifo15x17_a OF fifo15x17 IS

component wrapped_fifo15x17
	port (
	din: IN std_logic_VECTOR(16 downto 0);
	wr_en: IN std_logic;
	wr_clk: IN std_logic;
	rd_en: IN std_logic;
	rd_clk: IN std_logic;
	ainit: IN std_logic;
	dout: OUT std_logic_VECTOR(16 downto 0);
	full: OUT std_logic;
	empty: OUT std_logic;
	almost_full: OUT std_logic;
	almost_empty: OUT std_logic);
end component;

-- Configuration specification 
	for all : wrapped_fifo15x17 use entity XilinxCoreLib.async_fifo_v4_0(behavioral)
		generic map(
			c_use_blockmem => 0,
			c_rd_count_width => 2,
			c_has_wr_ack => 0,
			c_has_almost_full => 1,
			c_has_wr_err => 0,
			c_wr_err_low => 0,
			c_wr_ack_low => 0,
			c_data_width => 17,
			c_enable_rlocs => 0,
			c_rd_err_low => 0,
			c_wr_count_width => 2,
			c_rd_ack_low => 0,
			c_has_rd_count => 0,
			c_has_almost_empty => 1,
			c_has_rd_ack => 0,
			c_has_wr_count => 0,
			c_fifo_depth => 15,
			c_has_rd_err => 0);
BEGIN

U0 : wrapped_fifo15x17
		port map (
			din => din,
			wr_en => wr_en,
			wr_clk => wr_clk,
			rd_en => rd_en,
			rd_clk => rd_clk,
			ainit => ainit,
			dout => dout,
			full => full,
			empty => empty,
			almost_full => almost_full,
			almost_empty => almost_empty);
END fifo15x17_a;

-- pragma translate_on

