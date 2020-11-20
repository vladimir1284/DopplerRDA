-- ==============================================================
-- FILE : DPRAM.VHD  -  for modification by the USER
-- ==============================================================
--
-- This file is part of Example 2, for the HERON-IO4 module.
--
-- This file should be modified by the users to implement their
-- own logic.
--
-- ==============================================================
--
--  Module      : DPRAM
--  Date        : 05/03/2002
--  Author      : R. Williams - HUNT ENGINEERING
--  Description : Dual-Port Memory
--
-- ==============================================================
--
--  Note :
--   using RAMB4_S8_S8 primitives (inspite of RAMB16_S36_S36 with
--   Virtex2) for code compatibilty with Spartan2.
--
-- ==============================================================
--
--  Ver     Modified By      Date      Changes
--  ---     -----------      ----      -------
--  1.0     R. Williams    05-03-02    First Written
--
-- ==============================================================


library IEEE;
  use IEEE.std_logic_1164.all;

-- synopsys translate_off
library UNISIM;
  use UNISIM.vcomponents.all;
-- synopsys translate_on

entity DPRAM is
  port (
    RST     : in  std_logic;
    WRCLK   : in  std_logic;
    WEN     : in  std_logic;
    WR_ADDR : in  std_logic_vector(8 downto 0);
    DIN     : in  std_logic_vector(15 downto 0);
    --
    RDCLK   : in  std_logic;
    REN     : in  std_logic;
    RD_ADDR : in  std_logic_vector(8 downto 0);
    DOUT    : out std_logic_vector(15 downto 0)
  );
end DPRAM;


architecture RTL of DPRAM is



component RAMB4_S8_S8
  port (
    DIA   : in  std_logic_vector (7 downto 0);
    DIB   : in  std_logic_vector (7 downto 0);
    ENA   : in  std_logic;
    ENB   : in  std_logic;
    WEA   : in  std_logic;
    WEB   : in  std_logic;
    RSTA  : in  std_logic;
    RSTB  : in  std_logic;
    CLKA  : in  std_logic;
    CLKB  : in  std_logic;
    ADDRA : in  std_logic_vector (8 downto 0);
    ADDRB : in  std_logic_vector (8 downto 0);
    DOA   : out std_logic_vector (7 downto 0);
    DOB   : out std_logic_vector (7 downto 0)
  );
end component;

signal GND   : std_logic;
signal VCC   : std_logic;
signal GND8  : std_logic_vector(7 downto 0);
signal DUMMY : std_logic_vector(15 downto 0);

begin

GND <= '0';
VCC <= '1';
GND8 <= "00000000";

RAM1 : RAMB4_S8_S8
  port map (
    RSTA  => RST,
    CLKA  => RDCLK,
    ENA   => REN,
    WEA   => GND,
    ADDRA => RD_ADDR,
    DIA   => GND8,
    DOA   => DOUT(7 downto 0),
    --
    RSTB  => GND,
    CLKB  => WRCLK,
    ENB   => VCC,
    WEB   => WEN,
    ADDRB => WR_ADDR,
    DIB   => DIN(7 downto 0),
    DOB   => DUMMY(7 downto 0)
  );

RAM2 : RAMB4_S8_S8
  port map (
    RSTA  => RST,
    CLKA  => RDCLK,
    ENA   => REN,
    WEA   => GND,
    ADDRA => RD_ADDR,
    DIA   => GND8,
    DOA   => DOUT(15 downto 8),
    --
    RSTB  => GND,
    CLKB  => WRCLK,
    ENB   => VCC,
    WEB   => WEN,
    ADDRB => WR_ADDR,
    DIB   => DIN(15 downto 8),
    DOB   => DUMMY(15 downto 8)
  );

end RTL;

