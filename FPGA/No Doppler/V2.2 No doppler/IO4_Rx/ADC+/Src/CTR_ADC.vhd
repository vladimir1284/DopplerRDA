-- ==============================================================
-- FILE : CTR_ADC.VHD  -  for modification by the USER
-- ==============================================================
--
-- This file is part of Example 2, for the HERON-IO4 module.
--
-- This file should be modified by the users to implement their
-- own logic.
--
-- ==============================================================
--
--  Module      : CTR_ADC
--  Date        : 05/03/2002
--  Author      : R. Williams - HUNT ENGINEERING
--  Description : ADC data flow Control
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

entity CTR_ADC is
  port (
    RST      : in  std_logic;
    SCLK     : in  std_logic;  -- ADC clock
    FCLK     : in  std_logic;  -- HE_WR_1F clock
    UPDATE   : in  std_logic;
    SAMPLE   : in  std_logic_vector(8 downto 0);
    FF_FULL  : in  std_logic;  -- FIFO full
    FF_EMPTY : in  std_logic;  -- FIFO empty
    HE_FULL  : in  std_logic;  -- HE_WR_1F full
    DVALID   : in  std_logic;
    UPD_DONE : out std_logic;
    FF_WEN   : out std_logic;  -- FIFO write enable
    FF_REN   : out std_logic;  -- FIFO read enable
    HE_WEN   : out std_logic   -- HE_WR_1F write enable
  );
end CTR_ADC;


architecture RTL of CTR_ADC is

  signal UPD_R  : std_logic;
  signal UPD_RR : std_logic;
  signal State  : std_logic;
  signal count  : unsigned(8 downto 0);
  signal GO     : std_logic;
  signal WR     : std_logic;

begin

  -- GO trigger
  -- ==========
  process(RST, SCLK)
  begin
    if RST='1' then
      UPD_R <= '0';
      UPD_RR <= '0';
    elsif rising_edge(SCLK) then
      UPD_R <= UPDATE;
      UPD_RR <= UPD_R;
    end if;
  end process;

  UPD_DONE <= UPD_RR;

  process(RST, SCLK)
  begin
    if RST='1' then
      State <= '0';
      count <= (others=>'0');
      GO <= '0';
    elsif rising_edge(SCLK) then
      if State='0' then
        GO <= '0';

        if UPD_RR='1' then
          State <= '1';
          count <= unsigned(SAMPLE);
        end if;
      else
        GO <= '1';

        if count=1 then
          State <= '0';
        end if;
        count <= count - 1;
      end if;
    end if;
  end process;

  -- control lines
  -- =============
  FF_WEN <= (NOT FF_FULL) AND GO AND DVALID;

  FF_REN <= (NOT FF_EMPTY) AND (NOT HE_FULL);

  process (RST, FCLK)
  begin
     if RST ='1' then
      WR <= '0';
    elsif rising_edge(FCLK) then
      if HE_FULL='0' and FF_EMPTY='0' then  -- enable write
        WR <= '1';
      elsif WR='1' and HE_FULL='1' then     -- hold write
        WR <= '1';
      else
        WR <= '0';
      end if;
     end if;
  end process;
  HE_WEN <= WR;

end RTL;
