-- ==============================================================
-- FILE : CONN_F.VHD  -  for modification by the USER
-- ==============================================================
--
-- This file is part of Example 4, for the HERON-FPGA3 module.
--
-- This file should be modified by the users to implement their
-- own logic.
--
-- ==============================================================
--
--  Module      : CONN_F
--  Date        : 05/12/2002
--  Author      : R. Williams - HUNT ENGINEERING
--  Description : Connector F Outputs
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


entity CONN_F is
  port (
    CLOCK      : in  std_logic;
    CE         : in  std_logic;
    DATA_OUT   : in  std_logic_vector(14 downto 0);
    CONN_F_OUT : out std_logic_vector(14 downto 0);
    CONN_F_EN  : out std_logic_vector(14 downto 0)
  );
end CONN_F;


architecture RTL of CONN_F is

  component FDCE
    port (
      Q   : out std_logic;
      D   : in  std_logic;
      C   : in  std_logic;
      CE  : in  std_logic;
      CLR : in  std_logic );
  end component;

  attribute IOB : string;

  attribute IOB of iDOF0  : label is "TRUE";
  attribute IOB of iDOF1  : label is "TRUE";
  attribute IOB of iDOF2  : label is "TRUE";
  attribute IOB of iDOF3  : label is "TRUE";
  attribute IOB of iDOF4  : label is "TRUE";
  attribute IOB of iDOF5  : label is "TRUE";
  attribute IOB of iDOF6  : label is "TRUE";
  attribute IOB of iDOF7  : label is "TRUE";
  attribute IOB of iDOF8  : label is "TRUE";
  attribute IOB of iDOF9  : label is "TRUE";
  attribute IOB of iDOF10 : label is "TRUE";
  attribute IOB of iDOF11 : label is "TRUE";
  attribute IOB of iDOF12 : label is "TRUE";
  attribute IOB of iDOF13 : label is "TRUE";

begin

 -- Instanciate these flip-flops to ensure they will always be IFDs
  iDOF0  : FDCE port map (CONN_F_OUT(0),  D=>DATA_OUT(0),  C=>CLOCK, CE=>CE, CLR=>'0');  -- IOB
  iDOF1  : FDCE port map (CONN_F_OUT(1),  D=>DATA_OUT(1),  C=>CLOCK, CE=>CE, CLR=>'0');  -- IOB
  iDOF2  : FDCE port map (CONN_F_OUT(2),  D=>DATA_OUT(2),  C=>CLOCK, CE=>CE, CLR=>'0');  -- IOB
  iDOF3  : FDCE port map (CONN_F_OUT(3),  D=>DATA_OUT(3),  C=>CLOCK, CE=>CE, CLR=>'0');  -- IOB
  iDOF4  : FDCE port map (CONN_F_OUT(4),  D=>DATA_OUT(4),  C=>CLOCK, CE=>CE, CLR=>'0');  -- IOB
  iDOF5  : FDCE port map (CONN_F_OUT(5),  D=>DATA_OUT(5),  C=>CLOCK, CE=>CE, CLR=>'0');  -- IOB
  iDOF6  : FDCE port map (CONN_F_OUT(6),  D=>DATA_OUT(6),  C=>CLOCK, CE=>CE, CLR=>'0');  -- IOB
  iDOF7  : FDCE port map (CONN_F_OUT(7),  D=>DATA_OUT(7),  C=>CLOCK, CE=>CE, CLR=>'0');  -- IOB
  iDOF8  : FDCE port map (CONN_F_OUT(8),  D=>DATA_OUT(8),  C=>CLOCK, CE=>CE, CLR=>'0');  -- IOB
  iDOF9  : FDCE port map (CONN_F_OUT(9),  D=>DATA_OUT(9),  C=>CLOCK, CE=>CE, CLR=>'0');  -- IOB
  iDOF10 : FDCE port map (CONN_F_OUT(10), D=>DATA_OUT(10), C=>CLOCK, CE=>CE, CLR=>'0');  -- IOB
  iDOF11 : FDCE port map (CONN_F_OUT(11), D=>DATA_OUT(11), C=>CLOCK, CE=>CE, CLR=>'0');  -- IOB
  iDOF12 : FDCE port map (CONN_F_OUT(12), D=>DATA_OUT(12), C=>CLOCK, CE=>CE, CLR=>'0');  -- IOB
  iDOF13 : FDCE port map (CONN_F_OUT(13), D=>DATA_OUT(13), C=>CLOCK, CE=>CE, CLR=>'0');  -- IOB
  iDOF14 : FDCE port map (CONN_F_OUT(14), D=>DATA_OUT(14), C=>CLOCK, CE=>CE, CLR=>'0');  -- IOB

  -- Enable outputs
  CONN_F_EN <= (others=>'0');

end RTL;
