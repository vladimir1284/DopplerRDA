-- ==============================================================
-- FILE : RS232RX.VHD  -  may be modified by the USER
-- ==============================================================
--
-- This file is part of Example 3, for the HERON-FPGA3 module.
--
-- This file may be modified by the users to implement their
-- own logic.
--
-- ==============================================================
--
--  Module      : RS232RX
--  Date        : 04/12/2002
--  Author      : R. Williams - HUNT ENGINEERING
--  Description : RS232 Receiver
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


entity RS232RX is
  port (
    RESET     : in  std_logic;
    CLOCK     : in  std_logic;
    BAUD_X_16 : in  std_logic;
    RX        : in  std_logic;
    READ      : in  std_logic;
    DOUT      : out std_logic_vector(7 downto 0);
    RX_EMPTY  : out std_logic;
    RX_COUNT  : out std_logic_vector(4 downto 0)
  );
end RS232RX;


architecture Behavioral of RS232RX is

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

  signal RXcount   : std_logic_vector(3 downto 0);
  signal RXsreg    : std_logic_vector(7 downto 0);

  signal RX_DEL    : std_logic_vector(2 downto 0);
  signal RX_IDLE   : std_logic;

  signal BITcount  : std_logic_vector(3 downto 0);

  signal DATAreg   : std_logic_vector(7 downto 0);

  signal CE        : std_logic;
  signal UP        : std_logic;
  signal EN        : std_logic;
  signal WEN       : std_logic;

  signal FIFOfull  : std_logic;
  signal FIFOempty : std_logic;
  signal FIFOstate : std_logic_vector(4 downto 0);

  signal RD_ADDR   : std_logic_vector(3 downto 0);
  signal WR_ADDR   : std_logic_vector(3 downto 0);

begin

  process(RESET, CLOCK)
  begin
    if RESET='1' then
      RX_DEL <= (others=>'1');
    elsif rising_edge(CLOCK) then
      if BAUD_X_16='1' then
        RX_DEL <= RX_DEL(1 downto 0) & RX;
      end if;
    end if;
  end process;

  process(RESET, CLOCK)
  begin
    if RESET='1' then
      BITcount <= (others=>'0');
      RXcount  <= (others=>'0');
      RX_IDLE  <= '1';
    elsif rising_edge(CLOCK) then
      if BAUD_X_16='1' then
        RXcount <= RXcount + 1;
        if RX_IDLE='1' then
          BITcount <= (others=>'0');
          if RX_DEL(2 downto 1)="00" then
            RXcount  <= (others=>'0');
            RX_IDLE  <='0';
          end if;
        else
          if RXcount="0111" then
            BITcount <= BITcount + 1;
            if BITcount="1001" then
              BITcount <= (others=>'0');
              if RX_DEL(2 downto 1)="11" then
                RX_IDLE <= '1';
              end if;
            end if;
          end if;
        end if;
      end if;
    end if;
  end process;

  process(RESET, CLOCK)
  begin
    if RESET='1' then
      EN <= '0';
      RXsreg  <= (others=>'1');
      DATAreg <= (others=>'1');
    elsif rising_edge(CLOCK) then
      EN <= '0';
      if BAUD_X_16='1' and RXcount="0111" then
        RXsreg <= RX_DEL(2) & RXsreg(7 downto 1);
        if BITcount="1001" then
          DATAreg <= RXsreg;
          EN      <= '1';
        end if;
      end if;
    end if;
  end process;

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
      if READ='1' then
        RD_ADDR <= RD_ADDR + 1;
      end if;
    end if;
  end process;

  WEN <= EN AND (NOT FIFOfull);

  CE <= READ XOR WEN;
  UP <= WEN;

  process(RESET, CLOCK)
  begin
    if RESET='1' then
      FIFOstate <= (others=>'0');
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

  FIFOfull <= FIFOstate(4);

  FIFOempty <= (NOT FIFOstate(4)) AND (NOT FIFOstate(3)) AND (NOT FIFOstate(2)) AND
               (NOT FIFOstate(1)) AND (NOT FIFOstate(0));

  RX_EMPTY <= FIFOempty;

  RX_COUNT <= FIFOstate;

  iRAM16X8 : RAM16X8
    port map (
      CLOCK => CLOCK,
      WE    => WEN,
      A     => WR_ADDR,
      DPRA  => RD_ADDR,
      D     => DATAreg,
      DPO   => DOUT );

end Behavioral;
