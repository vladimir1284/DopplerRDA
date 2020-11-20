-- ==============================================================
-- FILE : RS232TX.VHD  -  may be modified by the USER
-- ==============================================================
--
-- This file is part of Example 3, for the HERON-FPGA3 module.
--
-- This file may be modified by the users to implement their
-- own logic.
--
-- ==============================================================
--
--  Module      : RS232TX
--  Date        : 04/12/2002
--  Author      : R. Williams - HUNT ENGINEERING
--  Description : RS232 Transmitter
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


entity RS232TX is
  port (
    RESET     : in  std_logic;
    CLOCK     : in  std_logic;
    BAUD_X_16 : in  std_logic;
    STOP_BITS : in  std_logic_vector(1 downto 0);
    DIN       : in  std_logic_vector(7 downto 0);
    WRITE     : in  std_logic;
    TX        : out std_logic;
    TX_FULL   : out std_logic;
    TX_COUNT  : out std_logic_vector(4 downto 0)
  );
end RS232TX;


architecture Behavioral of RS232TX is

  component RAM16X8
    port (
      CLOCK : in  std_logic;
      WE    : in  std_logic;
      A     : in  std_logic_vector(3 downto 0);
      DPRA  : in  std_logic_vector(3 downto 0);
      D     : in  std_logic_vector(7 downto 0);
      DPO   : out std_logic_vector(7 downto 0)
    );
  end component;

  signal TXcount   : std_logic_vector(3 downto 0);
  signal TXsreg    : std_logic_vector(9 downto 0);
  signal TXidle    : std_logic;
  signal TXout     : std_logic;

  signal BITcount  : std_logic_vector(3 downto 0);
  signal STOPcount : std_logic_vector(3 downto 0);

  signal REN       : std_logic;
  signal WEN       : std_logic;
  signal CE        : std_logic;
  signal UP        : std_logic;

  signal DATA      : std_logic_vector(7 downto 0);

  signal FIFOempty : std_logic;
  signal FIFOfull  : std_logic;
  signal FIFOstate : std_logic_vector(4 downto 0);

  signal RD_ADDR   : std_logic_vector(3 downto 0);
  signal WR_ADDR   : std_logic_vector(3 downto 0);

begin

  TX <= TXout;

  process(RESET, CLOCK)
  begin
    if RESET='1' then
      TXcount <= (others=>'0');
    elsif rising_edge(CLOCK) then
      if BAUD_X_16='1' then
        TXcount <= TXcount + 1;
      end if;
    end if;
  end process;

  process(RESET, CLOCK)
  begin
    if RESET='1' then
      REN      <= '0';
      TXidle   <= '1';
      TXout    <= '1';
      TXsreg   <= (others=>'1');
      BITcount <= (others=>'0');
    elsif rising_edge(CLOCK) then
      REN <= '0';
      if TXidle='1' and FIFOempty='0' then
        REN    <= '1';
        TXidle <= '0';
        TXsreg <= '1' & DATA & '0';
      end if;
      if BAUD_X_16='1' and TXcount="1111" then
        TXout  <= TXsreg(0);
        TXsreg <= '1' & TXsreg(9 downto 1);
        if TXidle='0' then
          BITcount <= BITcount + 1;
          if BITcount=STOPcount then
            TXidle <= '1';
            BITcount <= (others=>'0');
          end if;
        end if;
      end if;
    end if;
  end process;

  -- If Stop_Bits="01", 1 stop bit is used
  -- If Stop_Bits="10", 2 stop bits are used
  STOPcount <= "10" & STOP_BITS;

  process(RESET, CLOCK)
  begin
    if RESET='1' then
      WR_ADDR <= (others=>'0');
    elsif rising_edge(CLOCK) then
      if WEN='1' then
        WR_ADDR <= WR_ADDR + 1;
      end if;
    end if;
  end process;

  process(RESET, CLOCK)
  begin
    if RESET='1' then
      RD_ADDR <= (others=>'0');
    elsif rising_edge(CLOCK) then
      if REN='1' then
        RD_ADDR <= RD_ADDR + 1;
      end if;
    end if;
  end process;

  WEN <= WRITE AND (NOT FIFOfull);

  CE <= REN XOR WEN;
  UP <= REN;

  process(RESET, CLOCK)
  begin
    if RESET='1' then
      FIFOstate <= "10000";
    elsif rising_edge(CLOCK) then
      if CE='1' then
        if UP='1' then
          FIFOstate <= FIFOstate + 1;
        else
          FIFOstate <= FIFOstate - 1;
        end if;
      end if;
    end if;
  end process;

  FIFOempty <= FIFOstate(4);

  FIFOfull <= (NOT FIFOstate(4)) AND (NOT FIFOstate(3)) AND (NOT FIFOstate(2)) AND
              (NOT FIFOstate(1)) AND (NOT FIFOstate(0));

  TX_FULL  <= FIFOfull;

  TX_COUNT <= FIFOstate;

  iRAM16X8 : RAM16X8
    port map (
      CLOCK => CLOCK,
      WE    => WEN,
      A     => WR_ADDR,
      DPRA  => RD_ADDR,
      D     => DIN,
      DPO   => DATA );

end Behavioral;
