-- ==============================================================
-- FILE : CONN_E.VHD  -  for modification by the USER
-- ==============================================================
--
-- This file is part of Example 4, for the HERON-FPGA3 module.
--
-- This file should be modified by the users to implement their
-- own logic.
--
-- ==============================================================
--
--  Module      : CONN_E
--  Date        : 05/12/2002
--  Author      : R. Williams - HUNT ENGINEERING
--  Description : Connector E Outputs
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


entity CONN_E is
  port (
    CLOCK      : in  std_logic;
    CE         : in  std_logic;
    DATA_OUT   : in  std_logic_vector(14 downto 0);
    CONN_E_OUT : out std_logic_vector(14 downto 0);
    CONN_E_EN  : out std_logic_vector(14 downto 0)
  );
end CONN_E;


architecture RTL of CONN_E is

  component FDCE
    port (
      Q   : out std_logic;
      D   : in  std_logic;
      C   : in  std_logic;
      CE  : in  std_logic;
      CLR : in  std_logic );
  end component;

  attribute IOB : string;

  attribute IOB of iDOE0  : label is "TRUE";
  attribute IOB of iDOE1  : label is "TRUE";
  attribute IOB of iDOE2  : label is "TRUE";
  attribute IOB of iDOE3  : label is "TRUE";
  attribute IOB of iDOE4  : label is "TRUE";
  attribute IOB of iDOE5  : label is "TRUE";
  attribute IOB of iDOE6  : label is "TRUE";
  attribute IOB of iDOE7  : label is "TRUE";
  attribute IOB of iDOE8  : label is "TRUE";
  attribute IOB of iDOE9  : label is "TRUE";
  attribute IOB of iDOE10 : label is "TRUE";
  attribute IOB of iDOE11 : label is "TRUE";
  attribute IOB of iDOE12 : label is "TRUE";
  attribute IOB of iDOE13 : label is "TRUE";

begin

 -- Instanciate these flip-flops to ensure they will always be IFDs
  iDOE0  : FDCE port map (CONN_E_OUT(0),  D=>DATA_OUT(0),  C=>CLOCK, CE=>CE, CLR=>'0');  -- IOB
  iDOE1  : FDCE port map (CONN_E_OUT(1),  D=>DATA_OUT(1),  C=>CLOCK, CE=>CE, CLR=>'0');  -- IOB
  iDOE2  : FDCE port map (CONN_E_OUT(2),  D=>DATA_OUT(2),  C=>CLOCK, CE=>CE, CLR=>'0');  -- IOB
  iDOE3  : FDCE port map (CONN_E_OUT(3),  D=>DATA_OUT(3),  C=>CLOCK, CE=>CE, CLR=>'0');  -- IOB
  iDOE4  : FDCE port map (CONN_E_OUT(4),  D=>DATA_OUT(4),  C=>CLOCK, CE=>CE, CLR=>'0');  -- IOB
  iDOE5  : FDCE port map (CONN_E_OUT(5),  D=>DATA_OUT(5),  C=>CLOCK, CE=>CE, CLR=>'0');  -- IOB
  iDOE6  : FDCE port map (CONN_E_OUT(6),  D=>DATA_OUT(6),  C=>CLOCK, CE=>CE, CLR=>'0');  -- IOB
  iDOE7  : FDCE port map (CONN_E_OUT(7),  D=>DATA_OUT(7),  C=>CLOCK, CE=>CE, CLR=>'0');  -- IOB
  iDOE8  : FDCE port map (CONN_E_OUT(8),  D=>DATA_OUT(8),  C=>CLOCK, CE=>CE, CLR=>'0');  -- IOB
  iDOE9  : FDCE port map (CONN_E_OUT(9),  D=>DATA_OUT(9),  C=>CLOCK, CE=>CE, CLR=>'0');  -- IOB
  iDOE10 : FDCE port map (CONN_E_OUT(10), D=>DATA_OUT(10), C=>CLOCK, CE=>CE, CLR=>'0');  -- IOB
  iDOE11 : FDCE port map (CONN_E_OUT(11), D=>DATA_OUT(11), C=>CLOCK, CE=>CE, CLR=>'0');  -- IOB
  iDOE12 : FDCE port map (CONN_E_OUT(12), D=>DATA_OUT(12), C=>CLOCK, CE=>CE, CLR=>'0');  -- IOB
  iDOE13 : FDCE port map (CONN_E_OUT(13), D=>DATA_OUT(13), C=>CLOCK, CE=>CE, CLR=>'0');  -- IOB
  iDOE14 : FDCE port map (CONN_E_OUT(14), D=>DATA_OUT(14), C=>CLOCK, CE=>CE, CLR=>'0');  -- IOB

  -- Enable outputs
  CONN_E_EN <= (others=>'0');

end RTL;
