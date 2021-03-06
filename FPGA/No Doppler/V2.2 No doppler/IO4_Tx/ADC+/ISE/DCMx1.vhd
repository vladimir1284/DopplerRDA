--------------------------------------------------------------------------------
-- Copyright (c) 1995-2008 Xilinx, Inc.  All rights reserved.
--------------------------------------------------------------------------------
--   ____  ____ 
--  /   /\/   / 
-- /___/  \  /    Vendor: Xilinx 
-- \   \   \/     Version : 10.1
--  \   \         Application : xaw2vhdl
--  /   /         Filename : DCMx1.vhd
-- /___/   /\     Timestamp : 02/09/2018 09:23:40
-- \   \  /  \ 
--  \___\/\___\ 
--
--Command: xaw2vhdl-st E:\Robert\Proyecto Radar CSB\NO Doppler\V_2\IO4_Tx\ADC+\ISE\DCMx1.xaw E:\Robert\Proyecto Radar CSB\NO Doppler\V_2\IO4_Tx\ADC+\ISE\DCMx1
--Design Name: DCMx1
--Device: xc2v1000-4fg456
--
-- Module DCMx1
-- Generated by Xilinx Architecture Wizard
-- Written for synthesis tool: XST
-- Period Jitter (unit interval) for block DCM_INST = 0.07 UI
-- Period Jitter (Peak-to-Peak) for block DCM_INST = 0.72 ns

library ieee;
use ieee.std_logic_1164.ALL;
use ieee.numeric_std.ALL;
library UNISIM;
use UNISIM.Vcomponents.ALL;

entity DCMx1 is
   port ( CLKIN_IN        : in    std_logic; 
          RST_IN          : in    std_logic; 
          CLKFX_OUT       : out   std_logic; 
          CLKFX180_OUT    : out   std_logic; 
          CLKIN_IBUFG_OUT : out   std_logic; 
          LOCKED_OUT      : out   std_logic);
end DCMx1;

architecture BEHAVIORAL of DCMx1 is
   signal CLKFX_BUF       : std_logic;
   signal CLKFX180_BUF    : std_logic;
   signal CLKIN_IBUFG     : std_logic;
   signal GND_BIT         : std_logic;
begin
   GND_BIT <= '0';
   CLKIN_IBUFG_OUT <= CLKIN_IBUFG;
   CLKFX_BUFG_INST : BUFG
      port map (I=>CLKFX_BUF,
                O=>CLKFX_OUT);
   
   CLKFX180_BUFG_INST : BUFG
      port map (I=>CLKFX180_BUF,
                O=>CLKFX180_OUT);
   
   CLKIN_IBUFG_INST : BUFG
      port map (I=>CLKIN_IN,
                O=>CLKIN_IBUFG);
   
   DCM_INST : DCM
   generic map( CLK_FEEDBACK => "NONE",
            CLKDV_DIVIDE => 2.0,
            CLKFX_DIVIDE => 2,
            CLKFX_MULTIPLY => 2,
            CLKIN_DIVIDE_BY_2 => FALSE,
            CLKIN_PERIOD => 10.000,
            CLKOUT_PHASE_SHIFT => "FIXED",
            DESKEW_ADJUST => "SYSTEM_SYNCHRONOUS",
            DFS_FREQUENCY_MODE => "LOW",
            DLL_FREQUENCY_MODE => "LOW",
            DUTY_CYCLE_CORRECTION => TRUE,
            FACTORY_JF => x"C080",
            PHASE_SHIFT => 0,
            STARTUP_WAIT => FALSE)
      port map (CLKFB=>GND_BIT,
                CLKIN=>CLKIN_IBUFG,
                DSSEN=>GND_BIT,
                PSCLK=>GND_BIT,
                PSEN=>GND_BIT,
                PSINCDEC=>GND_BIT,
                RST=>RST_IN,
                CLKDV=>open,
                CLKFX=>CLKFX_BUF,
                CLKFX180=>CLKFX180_BUF,
                CLK0=>open,
                CLK2X=>open,
                CLK2X180=>open,
                CLK90=>open,
                CLK180=>open,
                CLK270=>open,
                LOCKED=>LOCKED_OUT,
                PSDONE=>open,
                STATUS=>open);
   
end BEHAVIORAL;


