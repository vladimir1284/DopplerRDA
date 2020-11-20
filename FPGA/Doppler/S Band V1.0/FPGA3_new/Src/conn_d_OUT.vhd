-- ==============================================================
-- FILE : CONN_D.VHD  -  for modification by the USER
-- ==============================================================
--
-- This file is part of Example 4, for the HERON-FPGA3 module.
--
-- This file should be modified by the users to implement their
-- own logic.
--
-- ==============================================================
--
--  Module      : CONN_D
--  Date        : 05/12/2002
--  Author      : R. Williams - HUNT ENGINEERING
--  Description : Connector D Outputs
--
-- ==============================================================
--
--  Ver     Modified By      Date      Changes
--  ---     -----------      ----      -------
--  1.0     R. Williams    05-12-02    First Written
--  2.0     R. Williams    05-12-02    New components added for
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
  use IEEE.std_logic_1164.all;
  use IEEE.numeric_std.all;

--pragma translate_off
library UNISIM;
  use UNISIM.vcomponents.all;
--pragma translate_on


entity CONN_D is
  port (
    CLOCK      : in  std_logic;
    CE         : in  std_logic;
    DATA_OUT   : in  std_logic_vector(14 downto 0);
    CONN_D_OUT : out std_logic_vector(14 downto 0);
    CONN_D_EN  : out std_logic_vector(14 downto 0)
  );
end CONN_D;


architecture RTL of CONN_D is

  component FDCE
    port (
      Q   : out std_logic;
      D   : in  std_logic;
      C   : in  std_logic;
      CE  : in  std_logic;
      CLR : in  std_logic );
  end component;

  attribute IOB : string;

  attribute IOB of iDOD0  : label is "TRUE";
  attribute IOB of iDOD1  : label is "TRUE";
  attribute IOB of iDOD2  : label is "TRUE";
  attribute IOB of iDOD3  : label is "TRUE";
  attribute IOB of iDOD4  : label is "TRUE";
  attribute IOB of iDOD5  : label is "TRUE";
  attribute IOB of iDOD6  : label is "TRUE";
  attribute IOB of iDOD7  : label is "TRUE";
  attribute IOB of iDOD8  : label is "TRUE";
  attribute IOB of iDOD9  : label is "TRUE";
  attribute IOB of iDOD10 : label is "TRUE";
  attribute IOB of iDOD11 : label is "TRUE";
  attribute IOB of iDOD12 : label is "TRUE";
  attribute IOB of iDOD13 : label is "TRUE";

begin

 -- Instanciate these flip-flops to ensure they will always be IFDs
  iDOD0  : FDCE port map (CONN_D_OUT(0),  D=>DATA_OUT(0),  C=>CLOCK, CE=>CE, CLR=>'0');  -- IOB
  iDOD1  : FDCE port map (CONN_D_OUT(1),  D=>DATA_OUT(1),  C=>CLOCK, CE=>CE, CLR=>'0');  -- IOB
  iDOD2  : FDCE port map (CONN_D_OUT(2),  D=>DATA_OUT(2),  C=>CLOCK, CE=>CE, CLR=>'0');  -- IOB
  iDOD3  : FDCE port map (CONN_D_OUT(3),  D=>DATA_OUT(3),  C=>CLOCK, CE=>CE, CLR=>'0');  -- IOB
  iDOD4  : FDCE port map (CONN_D_OUT(4),  D=>DATA_OUT(4),  C=>CLOCK, CE=>CE, CLR=>'0');  -- IOB
  iDOD5  : FDCE port map (CONN_D_OUT(5),  D=>DATA_OUT(5),  C=>CLOCK, CE=>CE, CLR=>'0');  -- IOB
  iDOD6  : FDCE port map (CONN_D_OUT(6),  D=>DATA_OUT(6),  C=>CLOCK, CE=>CE, CLR=>'0');  -- IOB
  iDOD7  : FDCE port map (CONN_D_OUT(7),  D=>DATA_OUT(7),  C=>CLOCK, CE=>CE, CLR=>'0');  -- IOB
  iDOD8  : FDCE port map (CONN_D_OUT(8),  D=>DATA_OUT(8),  C=>CLOCK, CE=>CE, CLR=>'0');  -- IOB
  iDOD9  : FDCE port map (CONN_D_OUT(9),  D=>DATA_OUT(9),  C=>CLOCK, CE=>CE, CLR=>'0');  -- IOB
  iDOD10 : FDCE port map (CONN_D_OUT(10), D=>DATA_OUT(10), C=>CLOCK, CE=>CE, CLR=>'0');  -- IOB
  iDOD11 : FDCE port map (CONN_D_OUT(11), D=>DATA_OUT(11), C=>CLOCK, CE=>CE, CLR=>'0');  -- IOB
  iDOD12 : FDCE port map (CONN_D_OUT(12), D=>DATA_OUT(12), C=>CLOCK, CE=>CE, CLR=>'0');  -- IOB
  iDOD13 : FDCE port map (CONN_D_OUT(13), D=>DATA_OUT(13), C=>CLOCK, CE=>CE, CLR=>'0');  -- IOB
  iDOD14 : FDCE port map (CONN_D_OUT(14), D=>DATA_OUT(14), C=>CLOCK, CE=>CE, CLR=>'0');  -- IOB

  -- Enable outputs
  CONN_D_EN <= (others=>'0');

end RTL;
