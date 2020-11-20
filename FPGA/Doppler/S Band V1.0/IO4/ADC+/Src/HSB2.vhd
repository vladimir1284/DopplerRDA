-- ==============================================================
-- FILE : HSB2.VHD  -  for modification by the USER
-- ==============================================================
--
-- This file is part of Example 2, for the HERON-IO4 module.
--
-- This file should be modified by the users to implement their
-- own logic.
--
-- ==============================================================
--
--  Module      : HSB2
--  Date        : 05/03/2002
--  Author      : R. Williams - HUNT ENGINEERING
--  Description : Using HUNT Message Interface
--
-- ==============================================================
--
--  Ver     Modified By      Date      Changes
--  ---     -----------      ----      -------
--  1.0     R. Williams    05-03-02    First Written
--
-- ==============================================================


LIBRARY ieee;
  USE ieee.std_logic_1164.ALL;

entity HSB2 is
  port (
    RST           : in  std_logic;
    CLK           : in  std_logic;
    DIN           : in  std_logic_vector(7 downto 0);
    ADDR          : in  std_logic_vector(7 downto 0);
    WEN           : in  std_logic;
    REN           : in  std_logic;
    DONE          : in  std_logic;
    COUNT         : in  std_logic;
    CLEAR         : in  std_logic;
    READY         : out std_logic;
    SEND_MSG      : out std_logic;
    CE            : out std_logic;
    DOUT          : out std_logic_vector(7 downto 0);
    SEND_ID       : out std_logic;
    LAST_BYTE     : out std_logic;
    -- registers
    INFIFO_SEL    : out std_logic_vector(5 downto 0);
    OUTFIFO_SEL   : out std_logic_vector(5 downto 0);
    UPD_DONE      : in  std_logic;
    UPDATE        : out std_logic;
    SAMPLE        : out std_logic_vector(8 downto 0)
  );
end HSB2;


architecture RTL of HSB2 is

  signal REG_0 : std_logic_vector(7 downto 0) := (others=>'0');
  signal REG_1 : std_logic_vector(7 downto 0) := (others=>'0');
  signal REG_2 : std_logic_vector(7 downto 0) := (others=>'0');
  signal REG_3 : std_logic_vector(7 downto 0) := (others=>'0');

  signal EN : std_logic_vector(3 downto 0);

begin

  SEND_MSG  <= '0';
  CE        <= '0';
  SEND_ID   <= '0';
  LAST_BYTE <= '0';

  INFIFO_SEL  <= REG_0(5 downto 0);
  OUTFIFO_SEL <= REG_1(5 downto 0);
  SAMPLE      <= REG_3(0) & REG_2;

  -- Decode address & output mux
  process(ADDR, REG_0, REG_1, REG_2, REG_3)
  begin
    EN <= (others=>'0');
    case ADDR is
      when "00000000" => EN(0)<='1'; DOUT <= REG_0;
      when "00000001" => EN(1)<='1'; DOUT <= REG_1;
      when "00000010" => EN(2)<='1'; DOUT <= REG_2;
      when "00000011" => EN(3)<='1'; DOUT <= REG_3;
      when others     => DOUT <= (others=>'-');
    end case;
  end process;

  -- DATA_REGs
  process (CLK)
  begin
    if rising_edge(CLK) then
      if WEN='1' then
        if EN(0)='1' then
          REG_0 <= DIN;
        end if;
        if EN(1)='1' then
          REG_1 <= DIN;
        end if;
        if EN(2)='1' then
          REG_2 <= DIN;
        end if;
        if EN(3)='1' then
          REG_3 <= DIN;
        end if;
      end if;
    end if;
  end process;

  -- READY
  process (RST, CLK)
  begin
    if RST='1' then
      READY <= '0';
    elsif rising_edge(CLK) then
      READY <= WEN OR REN;
    end if;
  end process;

  -- UPDATE samples
  process(RST, CLK)
  begin
    if RST='1' then
      UPDATE <= '0';
    elsif rising_edge(CLK) then
      if EN(3)='1' AND WEN='1' then
        UPDATE <= '1';
      elsif UPD_DONE='1' then
        UPDATE <= '0';
      end if;
    end if;
  end process;

end RTL;

