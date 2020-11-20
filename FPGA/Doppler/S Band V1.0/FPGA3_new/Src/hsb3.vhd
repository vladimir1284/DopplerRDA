-- ==============================================================
-- FILE : HSB3.VHD  -  for modification by the USER
-- ==============================================================
--
-- This file is part of Example 3, for the HERON-FPGA3 module.
--
-- This file should be modified by the users to implement their
-- own logic.
--
-- ==============================================================
--
--  Module      : HSB3
--  Date        : 04/12/2002
--  Author      : R. Williams - HUNT ENGINEERING
--  Description : Using HUNT Message Interface
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


LIBRARY ieee;
  USE ieee.std_logic_1164.ALL;

entity HSB3 is
  port (
    RST         : in  std_logic;
    CLK         : in  std_logic;
    DIN         : in  std_logic_vector(7 downto 0);
    ADDR        : in  std_logic_vector(7 downto 0);
    WEN         : in  std_logic;
    REN         : in  std_logic;
    DONE        : in  std_logic;
    COUNT       : in  std_logic;
    CLEAR       : in  std_logic;
    READY       : out std_logic;
    SEND_MSG    : out std_logic;
    CE          : out std_logic;
    DOUT        : out std_logic_vector(7 downto 0);
    SEND_ID     : out std_logic;
    LAST_BYTE   : out std_logic;
    -- FIFO Select Registers
    INFIFO_SEL  : out std_logic_vector(5 downto 0);
    OUTFIFO_SEL : out std_logic_vector(5 downto 0);
    -- RS232
    RX          : in  std_logic;
    TX          : out std_logic
  );
end HSB3;


architecture RTL of HSB3 is

  component RS232_UART
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
      TX_COUNT  : out std_logic_vector(7 downto 0) );
  end component;

  signal REG_0      : std_logic_vector(7 downto 0) := (others=>'0');
  signal REG_1      : std_logic_vector(7 downto 0) := (others=>'0');

  signal READYc     : std_logic;
  signal REN_DELAY  : std_logic;
  signal WEN_DELAY  : std_logic;
  signal SINGLE_REN : std_logic;
  signal SINGLE_WEN : std_logic;

  signal EN         : std_logic_vector(5 downto 0);
  signal LOAD_IN    : std_logic;
  signal LOAD_OUT   : std_logic;
  signal LOAD_BAUD  : std_logic;
  signal LOAD_STOP  : std_logic;
  signal READ_RX    : std_logic;
  signal WRITE_TX   : std_logic;

  signal BAUD_SEL   : std_logic_vector(3 downto 0) := "0001";
  signal STOP_BITS  : std_logic_vector(1 downto 0) := "01";
  signal RS232_DATA : std_logic_vector(7 downto 0);
  signal TX_FULL    : std_logic;
  signal RX_EMPTY   : std_logic;
  signal TX_COUNT   : std_logic_vector(7 downto 0);
  signal RX_COUNT   : std_logic_vector(7 downto 0);

begin

  SEND_MSG  <= '0';
  CE        <= '0';
  SEND_ID   <= '0';
  LAST_BYTE <= '0';

  INFIFO_SEL  <= REG_0(5 downto 0);
  OUTFIFO_SEL <= REG_1(5 downto 0);

  -- Decode address
  process(ADDR)
  begin
    EN <= (others=>'0');
    case ADDR is
      when "00000000" => EN(0)<='1';
      when "00000001" => EN(1)<='1';
      when "00000010" => EN(2)<='1';
      when "00000011" => EN(3)<='1';
      when "00000100" => EN(4)<='1';
      when "00000101" => EN(5)<='1';
      when others     => null;
    end case;
  end process;

  process (RST, CLK)
  begin
    if RST='1' then
      REN_DELAY  <= '0';
      WEN_DELAY  <= '0';
      SINGLE_REN <= '0';
      SINGLE_WEN <= '0';
    elsif rising_edge(CLK) then
      REN_DELAY  <= REN;
      WEN_DELAY  <= WEN;
      SINGLE_REN <= '0';
      SINGLE_WEN <= '0';
      if REN_DELAY='1' and REN='0' then
        SINGLE_REN <= '1';
      end if;
      if WEN_DELAY='1' and WEN='0' then
        SINGLE_WEN <= '1';
      end if;
    end if;
  end process;

  LOAD_IN   <= EN(0) AND SINGLE_WEN;
  LOAD_OUT  <= EN(1) AND SINGLE_WEN;
  LOAD_BAUD <= EN(2) AND SINGLE_WEN;
  LOAD_STOP <= EN(3) AND SINGLE_WEN;

  WRITE_TX  <= EN(4) AND SINGLE_WEN;

  READ_RX   <= EN(5) AND SINGLE_REN;

  -- Data Registers
  process (CLK)
  begin
    if rising_edge(CLK) then
      if LOAD_IN='1' then
        REG_0 <= DIN;
      end if;
      if LOAD_OUT='1' then
        REG_1 <= DIN;
      end if;
      if LOAD_BAUD='1' then
        BAUD_SEL <= DIN(3 downto 0);
      end if;
      if LOAD_STOP='1' then
        STOP_BITS <= DIN(1 downto 0);
      end if;
    end if;
  end process;

  -- READY
  READYc <= (WEN AND (NOT (EN(4) AND TX_FULL ))) OR
            (REN AND (NOT (EN(5) AND RX_EMPTY)));

  process (RST, CLK)
  begin
    if RST='1' then
      READY <= '1';
    elsif rising_edge(CLK) then
      READY <= READYc;
    end if;
  end process;

  -- Decode address & output mux
  process(ADDR(2 downto 0), REG_0, REG_1, BAUD_SEL, STOP_BITS, RS232_DATA, TX_COUNT, RX_COUNT)
  begin
    case ADDR(2 downto 0) is
      when "000"  => DOUT <= REG_0;
      when "001"  => DOUT <= REG_1;
      when "010"  => DOUT <= "0000" & BAUD_SEL;
      when "011"  => DOUT <= "000000" & STOP_BITS;
      when "100"  => DOUT <= "00000000";
      when "101"  => DOUT <= RS232_DATA;
      when "110"  => DOUT <= TX_COUNT;
      when "111"  => DOUT <= RX_COUNT;
      when others => DOUT <= (others=>'-');
    end case;
  end process;

  -------------------------------------------------------------
  --
  --  RS232 UART
  --
  --  Baud Rate    Register Setting (BAUD_SEL)
  --
  --     4800                0000
  --     9600                0001
  --    19200                0010
  --    38400                0011
  --   115200                0100
  --

  iRS232_UART : RS232_UART
    port map (
      RESET     => RST,
      CLOCK     => CLK,
      DIN       => DIN,
      BAUD_SEL  => BAUD_SEL,
      STOP_BITS => STOP_BITS,
      RX        => RX,
      READ      => READ_RX,
      WRITE     => WRITE_TX,
      DOUT      => RS232_DATA,
      TX        => TX,
      RX_EMPTY  => RX_EMPTY,
      TX_FULL   => TX_FULL,
      RX_COUNT  => RX_COUNT,
      TX_COUNT  => TX_COUNT );

end RTL;
