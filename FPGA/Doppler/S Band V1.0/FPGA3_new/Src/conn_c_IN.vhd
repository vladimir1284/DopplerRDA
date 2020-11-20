-- ==============================================================
-- FILE : CONN_C.VHD  -  for modification by the USER
-- ==============================================================
--
-- This file is part of Example 2, for the HERON-FPGA3 module.
--
-- This file should be modified by the users to implement their
-- own logic.
--
-- ==============================================================
--
--  Module      : CONN_C
--  Date        : 03/12/2002
--  Author      : R. Williams - HUNT ENGINEERING
--  Description : Connector C Inputs
--
-- ==============================================================
--
--  Ver     Modified By      Date      Changes
--  ---     -----------      ----      -------
--  1.0     R. Williams    03-12-02    First Written
--  2.0     R. Williams    03-12-02    New components added for
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


entity CONN_C_INPUT is
  port (
    RESET     : in  std_logic;
    CLOCK     : in  std_logic;
    FF_C      : in  std_logic;
    CONN_C_IN : in  std_logic_vector(14 downto 0);
    WR_EN_C   : out std_logic;
    DIN_C     : out std_logic_vector(15 downto 0)
  );
end CONN_C_INPUT;


architecture RTL of CONN_C_INPUT is

  component FDC
    port(
      Q   : out std_logic;
      D   : in  std_logic;
      C   : in  std_logic;
      CLR : in  std_logic );
  end component;

  attribute IOB : string;

  attribute IOB of iDIC0  : label is "TRUE";
  attribute IOB of iDIC1  : label is "TRUE";
  attribute IOB of iDIC2  : label is "TRUE";
  attribute IOB of iDIC3  : label is "TRUE";
  attribute IOB of iDIC4  : label is "TRUE";
  attribute IOB of iDIC5  : label is "TRUE";
  attribute IOB of iDIC6  : label is "TRUE";
  attribute IOB of iDIC7  : label is "TRUE";
  attribute IOB of iDIC8  : label is "TRUE";
  attribute IOB of iDIC9  : label is "TRUE";
  attribute IOB of iDIC10 : label is "TRUE";
  attribute IOB of iDIC11 : label is "TRUE";
  attribute IOB of iDIC12 : label is "TRUE";
  attribute IOB of iDIC13 : label is "TRUE";

  signal CLK_C   : std_logic;
  signal RESET_C : std_logic;
  signal DVAL_C  : std_logic;
  signal DV_C_DL : std_logic;
  signal WR_EN   : std_logic;
  signal OF_C    : std_logic;

begin

  -- Bit 14 is used to clock the data
  CLK_C <= CONN_C_IN(14);

 -- Instanciate these flip-flops to ensure they will always be IFDs
  iDIC0  : FDC port map (DIN_C(0),  D=>CONN_C_IN(0),  C=>CLK_C, CLR=>'0');  -- IOB
  iDIC1  : FDC port map (DIN_C(1),  D=>CONN_C_IN(1),  C=>CLK_C, CLR=>'0');  -- IOB
  iDIC2  : FDC port map (DIN_C(2),  D=>CONN_C_IN(2),  C=>CLK_C, CLR=>'0');  -- IOB
  iDIC3  : FDC port map (DIN_C(3),  D=>CONN_C_IN(3),  C=>CLK_C, CLR=>'0');  -- IOB
  iDIC4  : FDC port map (DIN_C(4),  D=>CONN_C_IN(4),  C=>CLK_C, CLR=>'0');  -- IOB
  iDIC5  : FDC port map (DIN_C(5),  D=>CONN_C_IN(5),  C=>CLK_C, CLR=>'0');  -- IOB
  iDIC6  : FDC port map (DIN_C(6),  D=>CONN_C_IN(6),  C=>CLK_C, CLR=>'0');  -- IOB
  iDIC7  : FDC port map (DIN_C(7),  D=>CONN_C_IN(7),  C=>CLK_C, CLR=>'0');  -- IOB
  iDIC8  : FDC port map (DIN_C(8),  D=>CONN_C_IN(8),  C=>CLK_C, CLR=>'0');  -- IOB
  iDIC9  : FDC port map (DIN_C(9),  D=>CONN_C_IN(9),  C=>CLK_C, CLR=>'0');  -- IOB
  iDIC10 : FDC port map (DIN_C(10), D=>CONN_C_IN(10), C=>CLK_C, CLR=>'0');  -- IOB
  iDIC11 : FDC port map (DIN_C(11), D=>CONN_C_IN(11), C=>CLK_C, CLR=>'0');  -- IOB
  iDIC12 : FDC port map (DIN_C(12), D=>CONN_C_IN(12), C=>CLK_C, CLR=>'0');  -- IOB
  iDIC13 : FDC port map (DIN_C(13), D=>CONN_C_IN(13), C=>CLK_C, CLR=>'0');  -- IOB

  DIN_C(14) <= OF_C;
  DIN_C(15) <= '0';

  -- Data valid
  process(RESET_C, CLK_C)
  begin
    if RESET_C='1' then
      DVAL_C <= '0';
    elsif rising_edge(CLK_C) then
      DVAL_C <= '1';
    end if;
  end process;

  -- Register the data valid with the system clock
  process(CLOCK)
  begin
    if rising_edge(CLOCK) then
      DV_C_DL <= DVAL_C;
    end if;
  end process;

  RESET_C <= RESET OR DV_C_DL;

  WR_EN   <= DV_C_DL AND (NOT FF_C);

  WR_EN_C <= WR_EN;

  -- Latch the overflow signal until first write when FIFO is not full
  process(RESET, CLOCK)
  begin
    if RESET='1' then
      OF_C <= '0';
    elsif rising_edge(CLOCK) then
      OF_C <= '0';
      if ((DV_C_DL='1' and FF_C='1') or (OF_C='1' and WR_EN='0')) then
        OF_C <= '1';
      end if;
    end if;
  end process;

end RTL;
