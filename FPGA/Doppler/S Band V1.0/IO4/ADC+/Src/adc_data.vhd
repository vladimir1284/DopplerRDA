-- ==============================================================
-- FILE : ADC_DATA.VHD  -  for modification by the USER
-- ==============================================================
--
-- This file is part of Example 2, for the HERON-IO4 module.
--
-- This file should be modified by the users to implement their
-- own logic.
--
-- ==============================================================
--
--  Module      : ADC_DATA
--  Date        : 05/03/2002
--  Author      : R. Williams - HUNT ENGINEERING
--  Description : ADC data
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

entity ADC_DATA is
    Port ( ADC       : in std_logic_vector(13 downto 0);
           OVR       : in std_logic;
           SCLK      : in std_logic;
           RST       : in std_logic;
           DVALID    : out std_logic;
           ADC_FIFO  : out std_logic_vector(31 downto 0)
           );
end ADC_DATA;

architecture RTL of ADC_DATA is

signal DVALID_A : std_logic;
signal DVALID_B : std_logic;

begin

  DVALID <= DVALID_A;

  process(RST, SCLK)
  begin
    if RST='1' then
      ADC_FIFO <= (others => '0');
      DVALID_A <= '0';
      DVALID_B <= '0';
    elsif rising_edge(SCLK) then
      DVALID_B <= DVALID_A;
      DVALID_A <= '0';
      if (DVALID_B='0') then
        ADC_FIFO(15 downto 0)  <= (ADC(13) XOR ADC(12)) & OVR & ADC(13 downto 0);
      end if;
      if (DVALID_A='0') then
        ADC_FIFO(31 downto 16) <= (ADC(13) XOR ADC(12)) & OVR & ADC(13 downto 0);
        DVALID_A <= '1';
      end if;
    end if;
  end process;

end RTL;

