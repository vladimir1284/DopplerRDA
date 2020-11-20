-- ==============================================================
-- FILE : RS232_UART.VHD  -  may be modified by the USER
-- ==============================================================
--
-- This file is part of Example 3, for the HERON-FPGA3 module.
--
-- This file may be modified by the users to implement their
-- own logic.
--
-- ==============================================================
--
--  Module      : RS232_UART
--  Date        : 04/12/2002
--  Author      : R. Williams - HUNT ENGINEERING
--  Description : RS232 UART
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
  use IEEE.std_logic_1164.ALL;
  use IEEE.std_logic_arith.ALL;
  use IEEE.std_logic_unsigned.ALL;


entity RS232_UART is
  port (
    RESET     : in  std_logic;
    CLOCK     : in  std_logic;
    DIN       : in  std_logic_vector(7 downto 0);
    BAUD_SEL  : in  std_logic_vector(3 downto 0);
    STOP_BITS : in  std_logic_vector(1 downto 0);
    RX        : in  std_logic;
    READ      : in  std_logic;
    WRITE     : in  std_logic;
    DOUT      : out std_logic_vector(7 downto 0);
    TX        : out std_logic;
    RX_EMPTY  : out std_logic;
    TX_FULL   : out std_logic;
    RX_COUNT  : out std_logic_vector(7 downto 0);
    TX_COUNT  : out std_logic_vector(7 downto 0)
  );
end RS232_UART;


architecture RTL of RS232_UART is

  component RS232TX
    port (
      RESET     : in  std_logic;
      CLOCK     : in  std_logic;
      BAUD_X_16 : in  std_logic;
      STOP_BITS : in  std_logic_vector(1 downto 0);
      DIN       : in  std_logic_vector(7 downto 0);
      WRITE     : in  std_logic;
      TX        : out std_logic;
      TX_FULL   : out std_logic;
      TX_COUNT  : out std_logic_vector(4 downto 0) );
  end component;

  component RS232RX
    port (
      RESET     : in  std_logic;
      CLOCK     : in  std_logic;
      BAUD_X_16 : in  std_logic;
      READ      : in  std_logic;
      RX        : in  std_logic;
      DOUT      : out std_logic_vector(7 downto 0);
      RX_EMPTY  : out std_logic;
      RX_COUNT  : out std_logic_vector(4 downto 0) );
  end component;

  signal UARTcount : std_logic_vector(9 downto 0);
  signal UARTtc    : std_logic_vector(9 downto 0);
  signal UARTen    : std_logic;

begin

  -------------------------------------------------------------
  --
  --  Baud Rate    BAUD_SEL
  --
  --     4800        0000
  --     9600        0001
  --    19200        0010
  --    38400        0011
  --   115200        0100
  --

  -- UARTtc is used to create a pulse at the rate of 16x the Baud Rate.
  -- The following values are valid when CLOCK is running at 50MHz.
  process(BAUD_SEL)
  begin
    case BAUD_SEL is
      when "0000" => UARTtc <= "1010001010";
      when "0001" => UARTtc <= "0101000101";
      when "0010" => UARTtc <= "0010100010";
      when "0011" => UARTtc <= "0001010000";
      when "0100" => UARTtc <= "0000011010";
      when others => UARTtc <= "0101000101";
    end case;
  end process;

  -- Count from 0 to UARTtc. Assert UARTen for one
  -- CLOCK cycle during this time.
  process(RESET, CLOCK)
  begin
    if RESET='1' then
      UARTcount <= (others=>'0');
    elsif rising_edge(CLOCK) then
      if (UARTcount = UARTtc) then
        UARTcount <= "0000000000";
      else
        UARTcount <= UARTcount + 1;
      end if;
    end if;
  end process;

  UARTen <= '1' when UARTcount = "0000000000" else '0';

  -- RS232 Transmitter
  iTX : RS232TX
    port map (
      RESET     => RESET,
      CLOCK     => CLOCK,
      BAUD_X_16 => UARTen,
      STOP_BITS => STOP_BITS,
      DIN       => DIN,
      WRITE     => WRITE,
      TX        => TX,
      TX_FULL   => TX_FULL,
      TX_COUNT  => TX_COUNT(4 downto 0) );

  -- RS232 Receiver
  iRX : RS232RX
    port map (
      RESET     => RESET,
      CLOCK     => CLOCK,
      BAUD_X_16 => UARTen,
      READ      => READ,
      RX        => RX,
      DOUT      => DOUT,
      RX_EMPTY  => RX_EMPTY,
      RX_COUNT  => RX_COUNT(4 downto 0) );

  TX_COUNT(7 downto 5) <= (others=>'0');
  RX_COUNT(7 downto 5) <= (others=>'0');

end RTL;
