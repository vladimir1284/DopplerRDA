-- ==============================================================
-- FILE : CONN_A.VHD  -  for modification by the USER
-- ==============================================================
--
-- This file is part of Example 2, for the HERON-FPGA3 module.
--
-- This file should be modified by the users to implement their
-- own logic.
--
-- ==============================================================
--
--  Module      : CONN_A
--  Date        : 03/12/2002
--  Author      : R. Williams - HUNT ENGINEERING
--  Description : Connector A Inputs
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


entity CONN_A_INPUT is
  port (
    RESET     : in  std_logic;
    CLOCK     : in  std_logic;
    FF_A      : in  std_logic;
    CONN_A_IN : in  std_logic_vector(14 downto 0);
    WR_EN_A   : out std_logic;
    DIN_A     : out std_logic_vector(15 downto 0)
  );
end CONN_A_INPUT;


architecture RTL of CONN_A_INPUT is

  component FDC
    port(
      Q   : out std_logic;
      D   : in  std_logic;
      C   : in  std_logic;
      CLR : in  std_logic );
  end component;

  attribute IOB : string;

  attribute IOB of iDIA0  : label is "TRUE";
  attribute IOB of iDIA1  : label is "TRUE";
  attribute IOB of iDIA2  : label is "TRUE";
  attribute IOB of iDIA3  : label is "TRUE";
  attribute IOB of iDIA4  : label is "TRUE";
  attribute IOB of iDIA5  : label is "TRUE";
  attribute IOB of iDIA6  : label is "TRUE";
  attribute IOB of iDIA7  : label is "TRUE";
  attribute IOB of iDIA8  : label is "TRUE";
  attribute IOB of iDIA9  : label is "TRUE";
  attribute IOB of iDIA10 : label is "TRUE";
  attribute IOB of iDIA11 : label is "TRUE";
  attribute IOB of iDIA12 : label is "TRUE";
  attribute IOB of iDIA13 : label is "TRUE";

  signal CLK_A   : std_logic;
  signal RESET_A : std_logic;
  signal DVAL_A  : std_logic;
  signal DV_A_DL : std_logic;
  signal WR_EN   : std_logic;
  signal OF_A    : std_logic;

begin

  -- Bit 14 is used to clock the data
  CLK_A <= CONN_A_IN(14);

 -- Instanciate these flip-flops to ensure they will always be IFDs
  iDIA0  : FDC port map (DIN_A(0),  D=>CONN_A_IN(0),  C=>CLK_A, CLR=>'0');  -- IOB
  iDIA1  : FDC port map (DIN_A(1),  D=>CONN_A_IN(1),  C=>CLK_A, CLR=>'0');  -- IOB
  iDIA2  : FDC port map (DIN_A(2),  D=>CONN_A_IN(2),  C=>CLK_A, CLR=>'0');  -- IOB
  iDIA3  : FDC port map (DIN_A(3),  D=>CONN_A_IN(3),  C=>CLK_A, CLR=>'0');  -- IOB
  iDIA4  : FDC port map (DIN_A(4),  D=>CONN_A_IN(4),  C=>CLK_A, CLR=>'0');  -- IOB
  iDIA5  : FDC port map (DIN_A(5),  D=>CONN_A_IN(5),  C=>CLK_A, CLR=>'0');  -- IOB
  iDIA6  : FDC port map (DIN_A(6),  D=>CONN_A_IN(6),  C=>CLK_A, CLR=>'0');  -- IOB
  iDIA7  : FDC port map (DIN_A(7),  D=>CONN_A_IN(7),  C=>CLK_A, CLR=>'0');  -- IOB
  iDIA8  : FDC port map (DIN_A(8),  D=>CONN_A_IN(8),  C=>CLK_A, CLR=>'0');  -- IOB
  iDIA9  : FDC port map (DIN_A(9),  D=>CONN_A_IN(9),  C=>CLK_A, CLR=>'0');  -- IOB
  iDIA10 : FDC port map (DIN_A(10), D=>CONN_A_IN(10), C=>CLK_A, CLR=>'0');  -- IOB
  iDIA11 : FDC port map (DIN_A(11), D=>CONN_A_IN(11), C=>CLK_A, CLR=>'0');  -- IOB
  iDIA12 : FDC port map (DIN_A(12), D=>CONN_A_IN(12), C=>CLK_A, CLR=>'0');  -- IOB
  iDIA13 : FDC port map (DIN_A(13), D=>CONN_A_IN(13), C=>CLK_A, CLR=>'0');  -- IOB

  DIN_A(14) <= OF_A;
  DIN_A(15) <= '0';

  -- Data valid
  process(RESET_A, CLK_A)
  begin
    if RESET_A='1' then
      DVAL_A <= '0';
    elsif rising_edge(CLK_A) then
      DVAL_A <= '1';
    end if;
  end process;

  -- Register the data valid with the system clock
  process(CLOCK)
  begin
    if rising_edge(CLOCK) then
      DV_A_DL <= DVAL_A;
    end if;
  end process;

  RESET_A <= RESET OR DV_A_DL;

  WR_EN   <= DV_A_DL AND (NOT FF_A);

  WR_EN_A <= WR_EN;

  -- Latch the overflow signal until first write when FIFO is not full
  process(RESET, CLOCK)
  begin
    if RESET='1' then
      OF_A <= '0';
    elsif rising_edge(CLOCK) then
      OF_A <= '0';
      if ((DV_A_DL='1' and FF_A='1') or (OF_A='1' and WR_EN='0')) then
        OF_A <= '1';
      end if;
    end if;
  end process;

end RTL;
