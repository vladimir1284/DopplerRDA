-- ==============================================================
-- FILE : EN_ABC.VHD  -  for modification by the USER
-- ==============================================================
--
-- This file is part of Example 2, for the HERON-FPGA3 module.
--
-- This file should be modified by the users to implement their
-- own logic.
--
-- ==============================================================
--
--  Module      : EN_ABC
--  Date        : 03/12/2002
--  Author      : R. Williams - HUNT ENGINEERING
--  Description : FIFO read and write control for connectors A, B & C
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


entity EN_ABC is
  port (
    RESET     : in  std_logic;
    CLOCK     : in  std_logic;
    EF_A      : in  std_logic;
    EF_B      : in  std_logic;
    EF_C      : in  std_logic;
    AF_ABC    : in  std_logic;
    RD_EN_A   : out std_logic;
    RD_EN_B   : out std_logic;
    RD_EN_C   : out std_logic;
    WR_EN_ABC : out std_logic;
    S         : out std_logic_vector(1 downto 0)
  );
end EN_ABC;


architecture RTL of EN_ABC is

  signal RD_EN_A_int : std_logic;
  signal RD_EN_B_int : std_logic;
  signal RD_EN_C_int : std_logic;
  signal LAST        : std_logic_vector(1 downto 0);

begin

  RD_EN_A <= RD_EN_A_int;
  RD_EN_B <= RD_EN_B_int;
  RD_EN_C <= RD_EN_C_int;

  RD_EN_A_int <= ((NOT AF_ABC) AND (NOT EF_A) AND EF_B AND EF_C            ) OR
                 ((NOT AF_ABC) AND (NOT EF_A)          AND EF_C AND LAST(0)) OR
                 ((NOT AF_ABC) AND (NOT EF_A)                   AND LAST(1));

  RD_EN_B_int <= ((NOT AF_ABC) AND (NOT EF_B) AND EF_A AND EF_C                                    ) OR
                 ((NOT AF_ABC) AND (NOT EF_B) AND EF_A          AND (NOT LAST(0))                  ) OR
                 ((NOT AF_ABC) AND (NOT EF_B)                   AND (NOT LAST(0)) AND (NOT LAST(1)));

  RD_EN_C_int <= ((NOT AF_ABC) AND (NOT EF_C) AND EF_A AND EF_B                                    ) OR
                 ((NOT AF_ABC) AND (NOT EF_C)          AND EF_B AND (NOT LAST(1))                  ) OR
                 ((NOT AF_ABC) AND (NOT EF_C)                   AND      LAST(0)  AND (NOT LAST(1)));

  process(CLOCK)
  begin
    if rising_edge(CLOCK) then
      S(0) <= RD_EN_B_int;
      S(1) <= RD_EN_C_int;
    end if;
  end process;

  process(CLOCK)
  begin
    if rising_edge(CLOCK) then
      WR_EN_ABC <= '0';
      if (EF_A='0' or EF_B='0' or EF_C='0') and AF_ABC='0' then
        WR_EN_ABC <= '1';
      end if;
    end if;
  end process;

  process(RESET, CLOCK)
  begin
    if RESET='1' then
      LAST <= "10";
    elsif rising_edge(CLOCK) then
      if    RD_EN_A_int='1' then
        LAST <= "00";
      elsif RD_EN_B_int='1' then
        LAST <= "01";
      elsif RD_EN_C_int='1' then
        LAST <= "10";
      end if;
    end if;
  end process;

end RTL;
