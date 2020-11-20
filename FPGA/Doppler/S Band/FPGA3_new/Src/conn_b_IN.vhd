-- ==============================================================
-- FILE : CONN_B.VHD  -  for modification by the USER
-- ==============================================================
--
-- This file is part of Example 2, for the HERON-FPGA3 module.
--
-- This file should be modified by the users to implement their
-- own logic.
--
-- ==============================================================
--
--  Module      : CONN_B
--  Date        : 03/12/2002
--  Author      : R. Williams - HUNT ENGINEERING
--  Description : Connector B Inputs
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


entity CONN_B_INPUT is
  port (
    RESET     : in  std_logic;
    CLOCK     : in  std_logic;
    FF_B      : in  std_logic;
    CONN_B_IN : in  std_logic_vector(14 downto 0);
    WR_EN_B   : out std_logic;
    DIN_B     : out std_logic_vector(15 downto 0)
  );
end CONN_B_INPUT;


architecture RTL of CONN_B_INPUT is

  component FDC
    port(
      Q   : out std_logic;
      D   : in  std_logic;
      C   : in  std_logic;
      CLR : in  std_logic );
  end component;

  attribute IOB : string;

  attribute IOB of iDIB0  : label is "TRUE";
  attribute IOB of iDIB1  : label is "TRUE";
  attribute IOB of iDIB2  : label is "TRUE";
  attribute IOB of iDIB3  : label is "TRUE";
  attribute IOB of iDIB4  : label is "TRUE";
  attribute IOB of iDIB5  : label is "TRUE";
  attribute IOB of iDIB6  : label is "TRUE";
  attribute IOB of iDIB7  : label is "TRUE";
  attribute IOB of iDIB8  : label is "TRUE";
  attribute IOB of iDIB9  : label is "TRUE";
  attribute IOB of iDIB10 : label is "TRUE";
  attribute IOB of iDIB11 : label is "TRUE";
  attribute IOB of iDIB12 : label is "TRUE";
  attribute IOB of iDIB13 : label is "TRUE";

  signal CLK_B   : std_logic;
  signal RESET_B : std_logic;
  signal DVAL_B  : std_logic;
  signal DV_B_DL : std_logic;
  signal WR_EN   : std_logic;
  signal OF_B    : std_logic;

begin

  -- Bit 14 is used to clock the data
  CLK_B <= CONN_B_IN(14);

 -- Instanciate these flip-flops to ensure they will always be IFDs
  iDIB0  : FDC port map (DIN_B(0),  D=>CONN_B_IN(0),  C=>CLK_B, CLR=>'0');  -- IOB
  iDIB1  : FDC port map (DIN_B(1),  D=>CONN_B_IN(1),  C=>CLK_B, CLR=>'0');  -- IOB
  iDIB2  : FDC port map (DIN_B(2),  D=>CONN_B_IN(2),  C=>CLK_B, CLR=>'0');  -- IOB
  iDIB3  : FDC port map (DIN_B(3),  D=>CONN_B_IN(3),  C=>CLK_B, CLR=>'0');  -- IOB
  iDIB4  : FDC port map (DIN_B(4),  D=>CONN_B_IN(4),  C=>CLK_B, CLR=>'0');  -- IOB
  iDIB5  : FDC port map (DIN_B(5),  D=>CONN_B_IN(5),  C=>CLK_B, CLR=>'0');  -- IOB
  iDIB6  : FDC port map (DIN_B(6),  D=>CONN_B_IN(6),  C=>CLK_B, CLR=>'0');  -- IOB
  iDIB7  : FDC port map (DIN_B(7),  D=>CONN_B_IN(7),  C=>CLK_B, CLR=>'0');  -- IOB
  iDIB8  : FDC port map (DIN_B(8),  D=>CONN_B_IN(8),  C=>CLK_B, CLR=>'0');  -- IOB
  iDIB9  : FDC port map (DIN_B(9),  D=>CONN_B_IN(9),  C=>CLK_B, CLR=>'0');  -- IOB
  iDIB10 : FDC port map (DIN_B(10), D=>CONN_B_IN(10), C=>CLK_B, CLR=>'0');  -- IOB
  iDIB11 : FDC port map (DIN_B(11), D=>CONN_B_IN(11), C=>CLK_B, CLR=>'0');  -- IOB
  iDIB12 : FDC port map (DIN_B(12), D=>CONN_B_IN(12), C=>CLK_B, CLR=>'0');  -- IOB
  iDIB13 : FDC port map (DIN_B(13), D=>CONN_B_IN(13), C=>CLK_B, CLR=>'0');  -- IOB

  DIN_B(14) <= OF_B;
  DIN_B(15) <= '1';

  -- Data valid
  process(RESET_B, CLK_B)
  begin
    if RESET_B='1' then
      DVAL_B <= '0';
    elsif rising_edge(CLK_B) then
      DVAL_B <= '1';
    end if;
  end process;

  -- Register the data valid with the system clock
  process(CLOCK)
  begin
    if rising_edge(CLOCK) then
      DV_B_DL <= DVAL_B;
    end if;
  end process;

  RESET_B <= RESET OR DV_B_DL;

  WR_EN   <= DV_B_DL AND (NOT FF_B);

  WR_EN_B <= WR_EN;

  -- Latch the overflow signal until first write when FIFO is not full
  process(RESET, CLOCK)
  begin
    if RESET='1' then
      OF_B <= '0';
    elsif rising_edge(CLOCK) then
      OF_B <= '0';
      if ((DV_B_DL='1' and FF_B='1') or (OF_B='1' and WR_EN='0')) then
        OF_B <= '1';
      end if;
    end if;
  end process;

end RTL;
