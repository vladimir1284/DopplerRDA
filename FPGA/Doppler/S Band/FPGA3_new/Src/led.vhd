-- ==============================================================
-- FILE : LED_CNTR.VHD  -  for modification by the USER
-- ==============================================================
--
-- This file is part of Example 3, for the HERON-FPGA3 module.
--
-- This file should be modified by the users to implement their
-- own logic.
--
-- ==============================================================
--
--  Module      : LED_CNTR
--  Date        : 04/12/2002
--  Author      : R. Williams - HUNT ENGINEERING
--  Description : LED Counter
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
  use IEEE.std_logic_1164.all;
  use IEEE.numeric_std.all;

--pragma translate_off
library UNISIM;
  use UNISIM.vcomponents.all;
--pragma translate_on


entity LED_CNTR is
  port (
    FCLK_G : in  std_logic;
    FF     : in  std_logic;
    LED_ON : out std_logic
  );
end LED_CNTR;


architecture RTL of LED_CNTR is

  signal LEDcount : unsigned(23 downto 0);

  signal FF_REG   : std_logic;
  signal CLEAR    : std_logic;
  signal COUNT    : std_logic;

begin

  process(FCLK_G)
  begin
    if rising_edge(FCLK_G) then
      FF_REG <= '0';
      if FF='1' or (FF_REG='1' and CLEAR='0') then
        FF_REG <= '1';
      end if;
    end if;
  end process;

  process(FCLK_G)
  begin
    if rising_edge(FCLK_G) then
      CLEAR <= FF_REG;
    end if;
  end process;

  process(FCLK_G)
  begin
    if rising_edge(FCLK_G) then
      COUNT <= '0';
      if LEDcount(23)='0' then
        COUNT <= '1';
      end if;
    end if;
  end process;

  process(CLEAR, FCLK_G)
  begin
    if CLEAR='1' then
      LEDcount <= (others=>'0');
    elsif rising_edge(FCLK_G) then
      if COUNT='1' then
        LEDcount <= LEDcount + 1;
      end if;
    end if;
  end process;

  LED_ON <= LEDcount(23);

end RTL;
