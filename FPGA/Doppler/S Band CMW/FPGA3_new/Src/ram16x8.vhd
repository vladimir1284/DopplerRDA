-- ==============================================================
-- FILE : RAM16X8.VHD  -  may be modified by the USER
-- ==============================================================
--
-- This file is part of Example 3, for the HERON-FPGA3 module.
--
-- This file may be modified by the users to implement their
-- own logic.
--
-- ==============================================================
--
--  Module      : RAM16X8
--  Date        : 04/12/2002
--  Author      : R. Williams - HUNT ENGINEERING
--  Description : 16x8 Dual-Port RAM
--
-- ==============================================================
--
--  Ver     Modified By      Date      Changes
--  ---     -----------      ----      -------
--  1.0     R. Williams    04-12-02    First Written
--  2.0     R. Williams    04-12-02    New components added for
--                                     interfacing to all six HERON
--                                     input FIFOs and all six HERON
--                                     output FIFOs at the same time.
--                                     Added component HE_RD_6F in
--                                     place of component HE_RD_1F.
--                                     Added component HE_WR_6F in
--                                     place of component HE_WR_1F.
--
-- ==============================================================


library IEEE;
  use IEEE.std_logic_1164.ALL;

--pragma translate_off
library UNISIM;
  use UNISIM.vcomponents.all;
--pragma translate_on


entity RAM16X8 is
  port (
    CLOCK : in  std_logic;
    WE    : in  std_logic;
    A     : in  std_logic_vector(3 downto 0);
    DPRA  : in  std_logic_vector(3 downto 0);
    D     : in  std_logic_vector(7 downto 0);
    DPO   : out std_logic_vector(7 downto 0)
  );
end RAM16X8;


architecture RTL of RAM16X8 is

  component RAM16X1D 
    -- pragma translate_off
    generic (
      -- RAM initialization for functional simulation:
      INIT : bit_vector := X"0000"
    );
    -- pragma translate_on
    port (
      D     : in  std_logic;
      WE    : in  std_logic;
      WCLK  : in  std_logic;
      A0    : in  std_logic;
      A1    : in  std_logic;
      A2    : in  std_logic;
      A3    : in  std_logic;
      DPRA0 : in  std_logic;
      DPRA1 : in  std_logic;
      DPRA2 : in  std_logic;
      DPRA3 : in  std_logic;
      SPO   : out std_logic;
      DPO   : out std_logic
    ); 
  end component;

  attribute INIT: string;

  attribute INIT of iRAM0 : label is "0000";
  attribute INIT of iRAM1 : label is "0000";
  attribute INIT of iRAM2 : label is "0000";
  attribute INIT of iRAM3 : label is "0000";
  attribute INIT of iRAM4 : label is "0000";
  attribute INIT of iRAM5 : label is "0000";
  attribute INIT of iRAM6 : label is "0000";
  attribute INIT of iRAM7 : label is "0000";

begin

  iRAM0 : RAM16X1D
    port map (
      D     => D(0),
      WE    => WE,
      WCLK  => CLOCK,
      A0    => A(0),
      A1    => A(1),
      A2    => A(2),
      A3    => A(3),
      DPRA0 => DPRA(0),
      DPRA1 => DPRA(1),
      DPRA2 => DPRA(2),
      DPRA3 => DPRA(3),
      SPO   => open,
      DPO   => DPO(0) );

  iRAM1 : RAM16X1D
    port map (
      D     => D(1),
      WE    => WE,
      WCLK  => CLOCK,
      A0    => A(0),
      A1    => A(1),
      A2    => A(2),
      A3    => A(3),
      DPRA0 => DPRA(0),
      DPRA1 => DPRA(1),
      DPRA2 => DPRA(2),
      DPRA3 => DPRA(3),
      SPO   => open,
      DPO   => DPO(1) );

  iRAM2 : RAM16X1D
    port map (
      D     => D(2),
      WE    => WE,
      WCLK  => CLOCK,
      A0    => A(0),
      A1    => A(1),
      A2    => A(2),
      A3    => A(3),
      DPRA0 => DPRA(0),
      DPRA1 => DPRA(1),
      DPRA2 => DPRA(2),
      DPRA3 => DPRA(3),
      SPO   => open,
      DPO   => DPO(2) );

  iRAM3 : RAM16X1D
    port map (
      D     => D(3),
      WE    => WE,
      WCLK  => CLOCK,
      A0    => A(0),
      A1    => A(1),
      A2    => A(2),
      A3    => A(3),
      DPRA0 => DPRA(0),
      DPRA1 => DPRA(1),
      DPRA2 => DPRA(2),
      DPRA3 => DPRA(3),
      SPO   => open,
      DPO   => DPO(3) );

  iRAM4 : RAM16X1D
    port map (
      D     => D(4),
      WE    => WE,
      WCLK  => CLOCK,
      A0    => A(0),
      A1    => A(1),
      A2    => A(2),
      A3    => A(3),
      DPRA0 => DPRA(0),
      DPRA1 => DPRA(1),
      DPRA2 => DPRA(2),
      DPRA3 => DPRA(3),
      SPO   => open,
      DPO   => DPO(4) );

  iRAM5 : RAM16X1D
    port map (
      D     => D(5),
      WE    => WE,
      WCLK  => CLOCK,
      A0    => A(0),
      A1    => A(1),
      A2    => A(2),
      A3    => A(3),
      DPRA0 => DPRA(0),
      DPRA1 => DPRA(1),
      DPRA2 => DPRA(2),
      DPRA3 => DPRA(3),
      SPO   => open,
      DPO   => DPO(5) );

  iRAM6 : RAM16X1D
    port map (
      D     => D(6),
      WE    => WE,
      WCLK  => CLOCK,
      A0    => A(0),
      A1    => A(1),
      A2    => A(2),
      A3    => A(3),
      DPRA0 => DPRA(0),
      DPRA1 => DPRA(1),
      DPRA2 => DPRA(2),
      DPRA3 => DPRA(3),
      SPO   => open,
      DPO   => DPO(6) );

  iRAM7 : RAM16X1D
    port map (
      D     => D(7),
      WE    => WE,
      WCLK  => CLOCK,
      A0    => A(0),
      A1    => A(1),
      A2    => A(2),
      A3    => A(3),
      DPRA0 => DPRA(0),
      DPRA1 => DPRA(1),
      DPRA2 => DPRA(2),
      DPRA3 => DPRA(3),
      SPO   => open,
      DPO   => DPO(7) );

end RTL;
