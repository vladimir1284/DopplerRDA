-- ==============================================================
-- FILE : USER_AP_TPL.VHD  -  MUST be modified by the USER
-- ==============================================================
--
-- This file is a TEMPLATE for the USER_AP entity for any example
-- for the HERON-FPGA3 module.
--
-- This file should be copied into a new project by the user.
--
-- ==============================================================
--
--  Date        : 01/03/2002
--  Author      : R. Williams - HUNT ENGINEERING
--  description : User code section
--
-- ==============================================================
--
--  Ver     Modified By      Date      Changes
--  ---     -----------      ----      -------
--  1.0     R. Williams    01-03-02    First Written
--  2.0     R. Williams    10-10-02    New components added for
--                                     interfacing to all six HERON
--                                     input FIFOs and all six HERON
--                                     output FIFOs at the same time.
--                                     Added component HE_RD_6F in
--                                     place of component HE_RD_1F.
--                                     Added component HE_WR_6F in
--                                     place of component HE_WR_1F.
--  2.2     R. Williams    08-06-06    Merged ES and non-ES support.
--                                     Removed HEPC8 support.
--                                     Removed Spartan-2 support.
--                                     Minor fix to HE_RD_6F logic.
--
-- ==============================================================



-- ==============================================================
--   Package : CONFIG
-- ==============================================================
--
-- This package allow users to set up the different clock domains
-- of the application (FIFO interfaces) in the top level.
-- Please refer to the HUNT documentation for more details.
--
-- ==============================================================

package CONFIG is

  -- FIFO CLOCK
  -- ==========

  -- To use a single common FIFO clock, set FCLK_G_DOMAIN = TRUE
  constant FCLK_G_DOMAIN : boolean := TRUE;

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
-- SERIAL IO
    R1OUT_A         : in  std_logic;
    R2OUT_A         : in  std_logic;
    T1IN_A          : out std_logic;
    T2IN_A          : out std_logic;
    RS485_232_A     : out std_logic;
    HDPLX_A         : out std_logic;
    FAST_A          : out std_logic;
    R1OUT_B         : in  std_logic;
    R2OUT_B         : in  std_logic;
    T1IN_B          : out std_logic;
    T2IN_B          : out std_logic;
    RS485_232_B     : out std_logic;
    HDPLX_B         : out std_logic;
    FAST_B          : out std_logic;
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
    INFIFO_READ_REQ : out std_logic_vector(5 downto 0);  -- FIFO_IN Read Request
    INFIFO_DVALID   : in  std_logic_vector(5 downto 0);  -- FIFO_IN Data Valid
    INFIFO_SINGLE   : in  std_logic_vector(5 downto 0);  -- FIFO_IN Single data item available
    INFIFO_BURST    : in  std_logic_vector(5 downto 0);  -- FIFO_IN Block of data available
    INFIFO0_D       : in  std_logic_vector(31 downto 0); -- FIFO_IN Data for FIFO 0
    INFIFO1_D       : in  std_logic_vector(31 downto 0); -- FIFO_IN Data for FIFO 1
    INFIFO2_D       : in  std_logic_vector(31 downto 0); -- FIFO_IN Data for FIFO 2
    INFIFO3_D       : in  std_logic_vector(31 downto 0); -- FIFO_IN Data for FIFO 3
    INFIFO4_D       : in  std_logic_vector(31 downto 0); -- FIFO_IN Data for FIFO 4
    INFIFO5_D       : in  std_logic_vector(31 downto 0); -- FIFO_IN Data for FIFO 5
-- FIFO OUT / HE_WR_6F interface
    OUTFIFO_READY   : in  std_logic_vector(5 downto 0);  -- FIFO_OUT Ready Flag
    OUTFIFO_WRITE   : out std_logic_vector(5 downto 0);  -- FIFO_OUT Write command
    OUTFIFO_D       : out std_logic_vector(31 downto 0); -- FIFO_OUT Data
-- SERIAL BUS / HE_USER Message interface
    MSG_CLK         : out std_logic;                     -- HSB clock source for the top level
    MSG_DIN         : in  std_logic_vector(7 downto 0);  -- data received from HSB
    MSG_ADDR        : in  std_logic_vector(7 downto 0);  -- HSB address
    MSG_AEN         : in  std_logic;                     -- address enable
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
  -- CONNECTOR DIGITAL IO
    CONN_A_IN       : in  std_logic_vector(14 downto 0); -- Data input on Connector A
    CONN_A_OUT      : out std_logic_vector(14 downto 0); -- Data output on Connector A
    CONN_A_EN       : out std_logic_vector(14 downto 0); -- Output enables for Connector A
    CONN_B_IN       : in  std_logic_vector(14 downto 0); -- Data input on Connector B
    CONN_B_OUT      : out std_logic_vector(14 downto 0); -- Data output on Connector B
    CONN_B_EN       : out std_logic_vector(14 downto 0); -- Output enables for Connector B
    CONN_C_IN       : in  std_logic_vector(14 downto 0); -- Data input on Connector C
    CONN_C_OUT      : out std_logic_vector(14 downto 0); -- Data output on Connector C
    CONN_C_EN       : out std_logic_vector(14 downto 0); -- Output enables for Connector C
    CONN_D_IN       : in  std_logic_vector(14 downto 0); -- Data input on Connector D
    CONN_D_OUT      : out std_logic_vector(14 downto 0); -- Data output on Connector D
    CONN_D_EN       : out std_logic_vector(14 downto 0); -- Output enables for Connector D
    CONN_E_IN       : in  std_logic_vector(14 downto 0); -- Data input on Connector E
    CONN_E_OUT      : out std_logic_vector(14 downto 0); -- Data output on Connector E
    CONN_E_EN       : out std_logic_vector(14 downto 0); -- Output enables for Connector E
    CONN_F_IN       : in  std_logic_vector(14 downto 0); -- Data input on Connector F
    CONN_F_OUT      : out std_logic_vector(14 downto 0); -- Data output on Connector F
    CONN_F_EN       : out std_logic_vector(14 downto 0)  -- Output enables for Connector F
  );
end USER_AP;


architecture TEMPLATE of USER_AP is

  signal MCLK : std_logic;  -- main clock

begin


  -- ==========================================================
  -- ==========================================================
  --       <<<<<<<   INSERT YOUR CODE HERE    >>>>>>>>>
  -- ==========================================================
  -- ==========================================================


  -------------------------------------------------------------
  -- OSC3 clock

  MCLK <= OSC3;

  -------------------------------------------------------------
  -- Drive the UDP-RESET high (inactive)

  UDPRES <= '1';

  -------------------------------------------------------------
  -- Drive the BOOT ENABLE signal high (inactive)

  BOOTEN <= '1';

  -------------------------------------------------------------
  -- Drive unused signals

  UMI_OUT <= (others=>'0');
  UMI_EN  <= (others=>'1');

  CLKOUT  <= '0';
  DTTL    <= '0';

  T1IN_A      <= '0';
  T2IN_A      <= '0';
  RS485_232_A <= '0';
  HDPLX_A     <= '0';
  FAST_A      <= '0';

  T1IN_B      <= '0';
  T2IN_B      <= '0';
  RS485_232_B <= '0';
  HDPLX_B     <= '0';
  FAST_B      <= '0';

  -------------------------------------------------------------
  -- FIFOs

  SRC_FCLK_RD <= '0';   -- clock source for READ FIFO
  SRC_FCLK_WR <= '0';   -- clock source for WRITE FIFO
  SRC_FCLK_G  <= MCLK;  -- global clock source for both FIFOs

  -------------------------------------------------------------
  -- Serial Bus

  MSG_CLK <= OSC3;  -- clock for Message Interface

  -------------------------------------------------------------
  -- Connector Digital IO

  CONN_A_OUT <= (others=>'0');
  CONN_A_EN  <= (others=>'1');

  CONN_B_OUT <= (others=>'0');
  CONN_B_EN  <= (others=>'1');

  CONN_C_OUT <= (others=>'0');
  CONN_C_EN  <= (others=>'1');

  CONN_D_OUT <= (others=>'0');
  CONN_D_EN  <= (others=>'1');

  CONN_E_OUT <= (others=>'0');
  CONN_E_EN  <= (others=>'1');

  CONN_F_OUT <= (others=>'0');
  CONN_F_EN  <= (others=>'1');

end TEMPLATE;
