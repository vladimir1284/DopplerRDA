-- ==============================================================
-- FILE : USER_AP_TPL.VHD  -  MUST be modified by the USER
-- ==============================================================
--
-- This file is a TEMPLATE for the USER_AP entity for any example
-- for the HERON-IO4 module.
--
-- This file should be copied into a new project by the user.
--
-- ==============================================================
--
--  Date        : 04/03/2002
--  Author      : R. Williams - HUNT ENGINEERING
--  description : User code section
--
-- ==============================================================
--
--  Ver     Modified By      Date      Changes
--  ---     -----------      ----      -------
--  1.0     R. Williams    04-03-02    First Written
--  1.1     R. Williams    08-05-02    Syntax change made to all
--                                     instanciated components,
--                                     (changed '0' to GND)
--                                     for compatibility with
--                                     ModelSim5.5b.
--  2.0     R. Williams    26-11-02    New components added for
--                                     interfacing to all six HERON
--                                     input FIFOs and all six HERON
--                                     output FIFOs at the same time.
--                                     Added component HE_RD_6F in
--                                     place of component HE_RD_1F.
--                                     Added component HE_WR_6F in
--                                     place of component HE_WR_1F.
--
-- ==============================================================



-- ==============================================================
--   package : CONFIG
-- ==============================================================
--
-- This package allow users to set up the different clock domains
-- of the application (FIFO, ADC interfaces) in the top level.
-- Please refer to the HUNT documentation for more details.
--
-- ==============================================================

package CONFIG is

  -- VIRTEX2 ENGINEERING SAMPLES
  -- For production Virtex2 FPGAs, set VIRTEX2_ES = FALSE
  constant VIRTEX2_ES : boolean := FALSE;

  -- OSCILLATOR CLOCK DIVISION
  -- To divide oscillator clock by 2, set DIV2_FCLK = TRUE
  constant DIV2_FCLK  : boolean := FALSE;

  -- FIFO CLOCK
  -- ==========

--   -----------------------------------------------------------------
--  | FCLK_G_DOMAIN |  HIGH_FCLK_G  |  HIGH_FCLK_RD  |  HIGH_FCLK_WR  |
--   -----------------------------------------------------------------
--  |     True      | True / False  |     n.a.       |     n.a.       |  single FIFO clock
--   -----------------------------------------------------------------
--  |     False     |     n.a.      |  True / False  |  True / False  |  two FIFO clocks
--   -----------------------------------------------------------------

  -- To use a single common FIFO clock, set FCLK_G_DOMAIN = TRUE
  constant FCLK_G_DOMAIN : boolean := TRUE;

  -- When read/write FIFO clock frequency > 60 MHz, set HIGH_FCLK_G = TRUE
  -- This constant is used only when FCLK_G_DOMAIN = TRUE
  constant HIGH_FCLK_G   : boolean := TRUE;

  -- When read FIFO clock frequency > 60 MHz, set HIGH_FCLK_RD = TRUE
  -- This constant is used only when FCLK_G_DOMAIN = FALSE
  constant HIGH_FCLK_RD  : boolean := FALSE;

  -- When write FIFO clock frequency > 60 MHz, set HIGH_FCLK_WR = TRUE
  -- This constant is used only when FCLK_G_DOMAIN = FALSE
  constant HIGH_FCLK_WR  : boolean := FALSE;

  -- ADC CLOCK
  -- =========

  -- To drive the ADC sample clock from a signal inside the FPGA set INTERNAL_SCLK = TRUE
  -- to use an external sample clock, set INTERNAL_SCLK = FALSE
  constant INTERNAL_SCLK : boolean := FALSE;

end CONFIG;


-- ==============================================================
--   Module : USER_AP
-- ==============================================================

library IEEE;
  use IEEE.std_logic_1164.ALL;
  use IEEE.numeric_std.all;
  use WORK.CONFIG.all;

--pragma translate_off
library sim_lib;
  use sim_lib.all;
--pragma translate_on

entity USER_AP is
  port (
    RESET           : in  std_logic;                     -- asynchronous reset active high
    CONFIG          : in  std_logic;                     -- System wide Config signal
-- CLOCK IO
    OSC0            : in  std_logic;                     -- Xtal OSC0
    OSC1            : in  std_logic;                     -- Xtal OSC1
    OSC2            : in  std_logic;                     -- Xtal OSC2
    OSC3            : in  std_logic;                     -- Xtal OSC3 factory default fitted with 100Mhz
    CLKIN0          : in  std_logic;                     -- User clock input (unbuffered) 
    CLKIN1          : in  std_logic;                     -- User clock input (unbuffered)
    CLKI2           : in  std_logic;                     -- User clock input (buffered)
    CLKI3           : in  std_logic;                     -- User clock input (buffered)
    CLKOUT          : out std_logic;                     -- User clock output
    QTTL            : in  std_logic;
    DTTL            : out std_logic;
-- GENERAL PURPOSE GCLKs
    GCLK_A          : in  std_logic;
    SRC_GCLK_A      : out std_logic;
    GCLK_B          : in  std_logic;
    SRC_GCLK_B      : out std_logic;
-- SERIAL IO
    R1OUT           : in  std_logic;
    R2OUT           : in  std_logic;
    T1IN            : out std_logic;
    T2IN            : out std_logic;
    RS485_232       : out std_logic;
    HDPLX           : out std_logic;
    FAST            : out std_logic;
-- MISCELLANEOUS IO
    UDPRES          : out std_logic;                     -- reset the carrier (high if NOT used)
    LED             : out std_logic_vector(4 downto 0);  -- LEDs
    ADDR_FLAGSEL    : in  std_logic;
    BOOTEN          : out std_logic;
    CID             : in  std_logic_vector(3 downto 0);
    MID             : in  std_logic_vector(3 downto 0);
-- UMIs
    UMI_IN          : in  std_logic_vector(3 downto 0);
    UMI_OUT         : out std_logic_vector(3 downto 0);
    UMI_EN          : out std_logic_vector(3 downto 0);
-- DIGITAL IO
    DIO_IN          : in  std_logic_vector(7 downto 0);
    DIO_OUT         : out std_logic_vector(7 downto 0);
    DIO_EN          : out std_logic_vector(7 downto 0);
-- READ FIFO CLK
    FCLK_RD         : in  std_logic;                     -- FIFO_IN clock to be used in this module (only when FCLK_G_DOMAIN=FALSE)
    SRC_FCLK_RD     : out std_logic;                     -- FIFO_IN clock source for the top level  (only when FCLK_G_DOMAIN=FALSE)
-- WRITE FIFO CLK
    FCLK_WR         : in  std_logic;                     -- FIFO_OUT clock to be used in this module (only when FCLK_G_DOMAIN=FALSE)
    SRC_FCLK_WR     : out std_logic;                     -- FIFO_OUT clock source for the top level  (only when FCLK_G_DOMAIN=FALSE)
-- COMMON FIFO CLK
    FCLK_G          : in  std_logic;                     -- Common FIFO clock to be used in this module (only when FCLK_G_DOMAIN=TRUE)
    SRC_FCLK_G      : out std_logic;                     -- Common FIFO clock source for the top level  (only when FCLK_G_DOMAIN=TRUE)
  -- FIFO IN / HE_RD_6F interface
    INFIFO_READ_REQ : out std_logic_vector(5 downto 0);
    INFIFO_DVALID   : in  std_logic_vector(5 downto 0);
    INFIFO_SINGLE   : in  std_logic_vector(5 downto 0);
    INFIFO_BURST    : in  std_logic_vector(5 downto 0);
    INFIFO0_D       : in  std_logic_vector(31 downto 0);
    INFIFO1_D       : in  std_logic_vector(31 downto 0);
    INFIFO2_D       : in  std_logic_vector(31 downto 0);
    INFIFO3_D       : in  std_logic_vector(31 downto 0);
    INFIFO4_D       : in  std_logic_vector(31 downto 0);
    INFIFO5_D       : in  std_logic_vector(31 downto 0);
  -- FIFO OUT / HE_WR_6F interface
    OUTFIFO_READY   : in  std_logic_vector(5 downto 0);
    OUTFIFO_WRITE   : out std_logic_vector(5 downto 0);
    OUTFIFO_D       : out std_logic_vector(31 downto 0);
-- SERIAL BUS / HE_USER Message interface
    MSG_CLK         : out std_logic;                     -- HSB clock source for the top level
    MSG_DIN         : in  std_logic_vector(7 downto 0);  -- data received from HSB
    MSG_ADDR        : in  std_logic_vector(7 downto 0);  -- HSB address
    MSG_WEN         : in  std_logic;                     -- write access
    MSG_REN         : in  std_logic;                     -- read access
    MSG_DONE        : in  std_logic;                     -- message successfully transmitted
    MSG_COUNT       : in  std_logic;                     -- user's counter enable
    MSG_CLEAR       : in  std_logic;                     -- user's counter clear
    MSG_READY       : out std_logic;                     -- to acknowledge an access
    MSG_SEND_MSG    : out std_logic;                     -- message send command
    MSG_CE          : out std_logic;                     -- to control speed operation
    MSG_DOUT        : out std_logic_vector(7 downto 0);  -- data sent to HSB
    MSG_SEND_ID     : out std_logic;                     -- ID information send command
    MSG_LAST_BYTE   : out std_logic;                     -- to indicate when the last byte is presented
-- GLOBAL ADC SCLK
    SCLK            : in  std_logic;                     -- ADC clock to be used in this module
    SRC_SCLK        : out std_logic;                     -- ADC clock source for the top level (only used when INTERNAL_SCLK=TRUE)
-- HE_ADC
    ADC             : in  std_logic_vector(13 downto 0); -- ADC data
    OVR             : in  std_logic;                     -- ADC over range flag
-- HE_DAC_A
    SCLK_DAC_A      : out std_logic;                     -- DAC_A clock source for the top level
    DAC_A           : out std_logic_vector(13 downto 0); -- DAC_A data
-- HE_DAC_B
    SCLK_DAC_B      : out std_logic;                     -- DAC_B clock source for the top level
    DAC_B           : out std_logic_vector(13 downto 0)  -- DAC_B data
  );
end USER_AP;


architecture TEMPLATE of USER_AP is

  signal MCLK     : std_logic;  -- main clock

begin


  -- ==========================================================
  -- ==========================================================
  --       <<<<<<<   INSERT YOUR CODE HERE    >>>>>>>>>
  -- ==========================================================
  -- ==========================================================


  -------------------------------------------------------------
  -- OSC3 clock divided by 2

  gDIV2 : if (DIV2_FCLK) generate
    -- oscillator divided by 2
    process (RESET, OSC3)
    begin
       if RESET='1' then
          MCLK <= '0';
       elsif rising_edge(OSC3) then
          MCLK <= NOT MCLK;
       end if;
    end process;
  end generate;

  gNDIV2 : if (NOT DIV2_FCLK) generate
    -- no division
    MCLK <= OSC3;
  end generate;

  -------------------------------------------------------------
  -- Drive the UDP-RESET high (inactive)

  UDPRES <= '1';

  -------------------------------------------------------------
  -- Drive the BOOT ENABLE signal high (inactive)

  BOOTEN <= '1';

  -------------------------------------------------------------
  -- Drive unused signals

  DIO_OUT   <= (others=>'0');
  DIO_EN    <= (others=>'1');

  UMI_OUT   <= (others=>'0');
  UMI_EN    <= (others=>'1');

  CLKOUT    <= '0';

  DTTL      <= '0';
  T1IN      <= '0';
  T2IN      <= '0';
  RS485_232 <= '0';
  HDPLX     <= '0';
  FAST      <= '0';

  -------------------------------------------------------------
  -- General purpose GCLKs (not used in this example) 

  SRC_GCLK_A <= '0';
  SRC_GCLK_B <= '0';

  -------------------------------------------------------------
  -- FIFOs

  SRC_FCLK_RD <= '0';   -- clock source for READ FIFO
  SRC_FCLK_WR <= '0';   -- clock source for WRITE FIFO
  SRC_FCLK_G  <= MCLK;  -- global clock source for both FIFOs

  -------------------------------------------------------------
  -- Serial Bus

  MSG_CLK <= OSC3;  -- clock for Message Interface

  -------------------------------------------------------------
  -- ADC

  SRC_SCLK <= '0';  -- internal sample clock source for ADC

  -------------------------------------------------------------
  -- DAC

  SCLK_DAC_A <= '0';  -- clock of DAC_A
  SCLK_DAC_B <= '0';  -- clock of DAC_B

end TEMPLATE;

