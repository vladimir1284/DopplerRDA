-- ==============================================================
-- FILE : CTR_DAC.VHD  -  for modification by the USER
-- ==============================================================
--
-- This file is part of Example 2, for the HERON-IO4 module.
--
-- This file should be modified by the users to implement their
-- own logic.
--
-- ==============================================================
--
--  Module      : CTR_DAC
--  Date        : 05/03/2002
--  Author      : R. Williams - HUNT ENGINEERING
--  Description : DAC data flow Control
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
  use IEEE.numeric_std.all;

entity CTR_DAC is
  port (
    RST       : in  std_logic;
    FCLK      : in  std_logic;
    SCLK      : in  std_logic;
    HE_EMPTY  : in  std_logic;
    WRITE_A   : in  std_logic;
    RESET_A   : in  std_logic;
    WRITE_B   : in  std_logic;
    RESET_B   : in  std_logic;
    FREAD     : out std_logic;
    WEN_A     : out std_logic;
    WR_ADDR_A : out std_logic_vector(8 downto 0);
    WEN_B     : out std_logic;
    WR_ADDR_B : out std_logic_vector(8 downto 0);
    RD_ADDR   : out std_logic_vector(8 downto 0)
  );
end CTR_DAC;


architecture RTL of CTR_DAC is

  signal WRITE      : std_logic;
  signal WR_A       : std_logic;
  signal WR_B       : std_logic;
  signal CLEAR_A    : std_logic;
  signal CLEAR_B    : std_logic;
  signal RDcounter  : unsigned(8 downto 0);
  signal WRAcounter : unsigned(8 downto 0);
  signal WRBcounter : unsigned(8 downto 0);

begin

FREAD <= '1';

-- WRITE commands
process(RST, FCLK)
begin
  if RST='1' then
    WRITE <= '0';
  elsif rising_edge(FCLK) then
    WRITE <= NOT HE_EMPTY;
  end if;
end process;

WR_A <= WRITE AND WRITE_A;
WR_B <= WRITE AND WRITE_B;

WEN_A <= WR_A;
WEN_B <= WR_B;

-- READ address
process(RST, SCLK)
begin
  if RST='1' then
    RDcounter <= (others=>'0');
  elsif rising_edge(SCLK) then
    RDcounter <= RDcounter + 1;
  end if;
end process;

RD_ADDR <= std_logic_vector(RDcounter);

-- WRITE address for channel A
CLEAR_A <= (WRITE AND RESET_A) OR RST;

process(CLEAR_A, FCLK)
begin
  if CLEAR_A='1' then
    WRAcounter <= (others=>'0');
  elsif rising_edge(FCLK) then
    if WR_A='1' then
      WRAcounter <= WRAcounter + 1;
    end if;
  end if;
end process;

WR_ADDR_A <= std_logic_vector(WRAcounter);

-- WRITE address for channel B
CLEAR_B <= (WRITE AND RESET_B) OR RST;

process(CLEAR_B, FCLK)
begin
  if CLEAR_B='1' then
    WRBcounter <= (others=>'0');
  elsif rising_edge(FCLK) then
    if WR_B='1' then
      WRBcounter <= WRBcounter + 1;
    end if;
  end if;
end process;

WR_ADDR_B <= std_logic_vector(WRBcounter);

end RTL;
