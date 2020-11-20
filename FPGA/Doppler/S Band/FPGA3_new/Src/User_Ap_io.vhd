-- ==============================================================
-- FILE : USER_AP3.VHD  -  MUST be modified by the USER
-- ==============================================================
--
-- This file is part of Example 3, for the HERON-FPGA3 module.
--
-- This file must be modified by the user.
--
-- ==============================================================
--
--  Date        : 04/12/2002
--  Author      : R. Williams - HUNT ENGINEERING
--  Description : User code section
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



-- ==============================================================
-- Package : CONFIG
-- ==============================================================
--
-- This package allow users to set up the different clock domains
-- of the application (FIFO interfaces) in the top level.
-- Please refer to the HUNT documentation for more details.
--
-- ==============================================================

package CONFIG is
  
  -- VIRTEX2 ENGINEERING SAMPLES
  -- For Spartan2 or production Virtex2 FPGAs, set VIRTEX2_ES = FALSE
  constant VIRTEX2_ES    :     boolean := false; 
  
  -- OSCILLATOR CLOCK DIVISION
  -- To divide oscillator clock by 2, set DIV2_FCLK = TRUE
  constant DIV2_FCLK     :     boolean := false; 
  
  -- FIFO CLOCK
  -- ==========
  
--  -----------------------------------------------------------------
--  | FCLK_G_DOMAIN |  HIGH_FCLK_G  |  HIGH_FCLK_RD  |  HIGH_FCLK_WR  |
--   -----------------------------------------------------------------
--  |     True      | True / False  |     n.a.       |     n.a.       |  single FIFO clock
--   -----------------------------------------------------------------
--  |     False     |     n.a.      |  True / False  |  True / False  |  two FIFO clocks
--   -----------------------------------------------------------------
  
  -- To use a single common FIFO clock, set FCLK_G_DOMAIN = TRUE
  constant FCLK_G_DOMAIN :     boolean := true; 
  
  -- When read/write FIFO clock frequency > 60 MHz, set HIGH_FCLK_G = TRUE
  -- This constant is used only when FCLK_G_DOMAIN = TRUE
  constant HIGH_FCLK_G   :     boolean := true; 
  
  -- When read FIFO clock frequency > 60 MHz, set HIGH_FCLK_RD = TRUE
  -- This constant is used only when FCLK_G_DOMAIN = FALSE
  constant HIGH_FCLK_RD  :     boolean := false; 
  
  -- When write FIFO clock frequency > 60 MHz, set HIGH_FCLK_WR = TRUE
  -- This constant is used only when FCLK_G_DOMAIN = FALSE
  constant HIGH_FCLK_WR  :     boolean := false; 
  
end CONFIG; 


-- ==============================================================
-- Module : USER_AP
-- ==============================================================

library IEEE; 
use IEEE.std_logic_1164.all; 
use IEEE.numeric_std.all; 
use WORK.CONFIG.all; 

--pragma translate_off
library sim_lib; 
use sim_lib.all; 

library UNISIM; 
use UNISIM.vcomponents.all; 
--pragma translate_on

entity USER_AP is
  port (
    RESET                : in  std_logic;  -- asynchronous reset active high
    CONFIG               : in  std_logic;  -- System wide Config signal
-- CLOCK IO
    OSC0                 : in  std_logic;  -- Xtal OSC0
    OSC1                 : in  std_logic;  -- Xtal OSC1
    OSC2                 : in  std_logic;  -- Xtal OSC2
    OSC3                 : in  std_logic;  -- Xtal OSC3 factory default fitted with 100Mhz
    CLKIN0               : in  std_logic;  -- User clock input (unbuffered) 
    CLKIN1               : in  std_logic;  -- User clock input (unbuffered)
    CLKI2                : in  std_logic;  -- User clock input (buffered)
    CLKI3                : in  std_logic;  -- User clock input (buffered)
    CLKOUT               : out std_logic;  -- User clock output
    QTTL                 : in  std_logic; 
    DTTL                 : out std_logic; 
-- SERIAL IO
    R1OUT_A              : in  std_logic; 
    R2OUT_A              : in  std_logic; 
    T1IN_A               : out std_logic; 
    T2IN_A               : out std_logic; 
    RS485_232_A          : out std_logic; 
    HDPLX_A              : out std_logic; 
    FAST_A               : out std_logic; 
    R1OUT_B              : in  std_logic; 
    R2OUT_B              : in  std_logic; 
    T1IN_B               : out std_logic; 
    T2IN_B               : out std_logic; 
    RS485_232_B          : out std_logic; 
    HDPLX_B              : out std_logic; 
    FAST_B               : out std_logic; 
-- MISCELLANEOUS IO
    UDPRES               : out std_logic;  -- reset the carrier (high if NOT used)
    LED                  : out std_logic_vector(4 downto 0);  -- LEDs
    ADDR_FLAGSEL         : in  std_logic; 
    BOOTEN               : out std_logic; 
    CID                  : in  std_logic_vector(3 downto 0); 
    MID                  : in  std_logic_vector(3 downto 0); 
-- UMIs
    UMI_IN               : in  std_logic_vector(3 downto 0); 
    UMI_OUT              : out std_logic_vector(3 downto 0); 
    UMI_EN               : out std_logic_vector(3 downto 0); 
-- READ FIFO CLK
    FCLK_RD              : in  std_logic;  -- FIFO_IN clock to be used in this module (only when FCLK_G_DOMAIN=FALSE)
    SRC_FCLK_RD          : out std_logic;  -- FIFO_IN clock source for the top level  (only when FCLK_G_DOMAIN=FALSE)
-- WRITE FIFO CLK
    FCLK_WR              : in  std_logic;  -- FIFO_OUT clock to be used in this module (only when FCLK_G_DOMAIN=FALSE)
    SRC_FCLK_WR          : out std_logic;  -- FIFO_OUT clock source for the top level  (only when FCLK_G_DOMAIN=FALSE)
-- COMMON FIFO CLK
    FCLK_G               : in  std_logic;  -- Common FIFO clock to be used in this module (only when FCLK_G_DOMAIN=TRUE)
    SRC_FCLK_G           : out std_logic;  -- Common FIFO clock source for the top level  (only when FCLK_G_DOMAIN=TRUE)
-- FIFO IN / HE_RD_6F interface
    INFIFO_READ_REQ      : out std_logic_vector(5 downto 0);  -- FIFO_IN Read Request
    INFIFO_DVALID        : in  std_logic_vector(5 downto 0);  -- FIFO_IN Data Valid
    INFIFO_SINGLE        : in  std_logic_vector(5 downto 0);  -- FIFO_IN Single data item available
    INFIFO_BURST         : in  std_logic_vector(5 downto 0);  -- FIFO_IN Block of data available
    INFIFO0_D            : in  std_logic_vector(31 downto 0);  -- FIFO_IN Data for FIFO 0
    INFIFO1_D            : in  std_logic_vector(31 downto 0);  -- FIFO_IN Data for FIFO 1
    INFIFO2_D            : in  std_logic_vector(31 downto 0);  -- FIFO_IN Data for FIFO 2
    INFIFO3_D            : in  std_logic_vector(31 downto 0);  -- FIFO_IN Data for FIFO 3
    INFIFO4_D            : in  std_logic_vector(31 downto 0);  -- FIFO_IN Data for FIFO 4
    INFIFO5_D            : in  std_logic_vector(31 downto 0);  -- FIFO_IN Data for FIFO 5
-- FIFO OUT / HE_WR_6F interface
    OUTFIFO_READY        : in  std_logic_vector(5 downto 0);  -- FIFO_OUT Ready Flag
    OUTFIFO_WRITE        : out std_logic_vector(5 downto 0);  -- FIFO_OUT Write Command
    OUTFIFO_D            : out std_logic_vector(31 downto 0);  -- FIFO_OUT Data
-- SERIAL BUS / HE_USER Message interface
    MSG_CLK              : out std_logic;  -- HSB clock source for the top level
    MSG_DIN              : in  std_logic_vector(7 downto 0);  -- data received from HSB
    MSG_ADDR             : in  std_logic_vector(7 downto 0);  -- HSB address
    MSG_WEN              : in  std_logic;  -- write access
    MSG_REN              : in  std_logic;  -- read access
    MSG_DONE             : in  std_logic;  -- message successfully transmitted
    MSG_COUNT            : in  std_logic;  -- user's counter enable
    MSG_CLEAR            : in  std_logic;  -- user's counter clear
    MSG_READY            : out std_logic;  -- to acknowledge an access
    MSG_SEND_MSG         : out std_logic;  -- message send command
    MSG_CE               : out std_logic;  -- to control speed operation
    MSG_DOUT             : out std_logic_vector(7 downto 0);  -- data sent to HSB
    MSG_SEND_ID          : out std_logic;  -- ID information send command
    MSG_LAST_BYTE        : out std_logic;  -- to indicate when the last byte is presented
    -- CONNECTOR DIGITAL IO
    CONN_A_IN            : in  std_logic_vector(14 downto 0);  -- Data input on Connector A
    CONN_A_OUT           : out std_logic_vector(14 downto 0);  -- Data output on Connector A
    CONN_A_EN            : out std_logic_vector(14 downto 0);  -- Output enables for Connector A
    CONN_B_IN            : in  std_logic_vector(14 downto 0);  -- Data input on Connector B
    CONN_B_OUT           : out std_logic_vector(14 downto 0);  -- Data output on Connector B
    CONN_B_EN            : out std_logic_vector(14 downto 0);  -- Output enables for Connector B
    CONN_C_IN            : in  std_logic_vector(14 downto 0);  -- Data input on Connector C
    CONN_C_OUT           : out std_logic_vector(14 downto 0);  -- Data output on Connector C
    CONN_C_EN            : out std_logic_vector(14 downto 0);  -- Output enables for Connector C
    CONN_D_IN            : in  std_logic_vector(14 downto 0);  -- Data input on Connector D
    CONN_D_OUT           : out std_logic_vector(14 downto 0);  -- Data output on Connector D
    CONN_D_EN            : out std_logic_vector(14 downto 0);  -- Output enables for Connector D
    CONN_E_IN            : in  std_logic_vector(14 downto 0);  -- Data input on Connector E
    CONN_E_OUT           : out std_logic_vector(14 downto 0);  -- Data output on Connector E
    CONN_E_EN            : out std_logic_vector(14 downto 0);  -- Output enables for Connector E
    CONN_F_IN            : in  std_logic_vector(14 downto 0);  -- Data input on Connector F
    CONN_F_OUT           : out std_logic_vector(14 downto 0);  -- Data output on Connector F
    CONN_F_EN            : out std_logic_vector(14 downto 0)  -- Output enables for Connector F
    ); 
end USER_AP; 


architecture DIO of USER_AP is
  
  component fifo15x32
    port (
      din                : in  std_logic_vector(31 downto 0);
      wr_en              : in  std_logic;
      wr_clk             : in  std_logic;
      rd_en              : in  std_logic;
      rd_clk             : in  std_logic;
      ainit              : in  std_logic;
      dout               : out std_logic_vector(31 downto 0);
      full               : out std_logic;
      empty              : out std_logic);
  end component; 
  
  component CONN_C
    port (
      CLOCK              : in  std_logic; 
      CE                 : in  std_logic; 
      DATA_OUT           : in  std_logic_vector(14 downto 0); 
      CONN_C_OUT         : out std_logic_vector(14 downto 0); 
      CONN_C_EN          : out std_logic_vector(14 downto 0)
      ); 
  end component; 
  
  component CONN_D
    port (
      CLOCK              : in  std_logic; 
      CE                 : in  std_logic; 
      DATA_OUT           : in  std_logic_vector(14 downto 0); 
      CONN_D_OUT         : out std_logic_vector(14 downto 0); 
      CONN_D_EN          : out std_logic_vector(14 downto 0)
      ); 
  end component; 
  
  component CONN_E
    port (
      CLOCK              : in  std_logic; 
      CE                 : in  std_logic; 
      DATA_OUT           : in  std_logic_vector(14 downto 0); 
      CONN_E_OUT         : out std_logic_vector(14 downto 0); 
      CONN_E_EN          : out std_logic_vector(14 downto 0)
      ); 
  end component; 
  
  component CONN_F
    port (
      CLOCK              : in  std_logic; 
      CE                 : in  std_logic; 
      DATA_OUT           : in  std_logic_vector(14 downto 0); 
      CONN_F_OUT         : out std_logic_vector(14 downto 0); 
      CONN_F_EN          : out std_logic_vector(14 downto 0)
      ); 
  end component;

  
  component outputfifo
    port (
      din                 : in  std_logic_vector(31 downto 0);
      wr_en               : in  std_logic;
      wr_clk              : in  std_logic;
      rd_en               : in  std_logic;
      rd_clk              : in  std_logic;
      ainit               : in  std_logic;
      dout                : out std_logic_vector(31 downto 0);
      full                : out std_logic;
      empty               : out std_logic);
  end component;
  
  component lpfilter
    port (
      ND: IN std_logic;
      RDY: OUT std_logic;
      CLK: IN std_logic;
      RST: IN std_logic;
      RFD: OUT std_logic;
      DIN: IN std_logic_VECTOR(15 downto 0);
      DOUT: OUT std_logic_VECTOR(32 downto 0));
  end component;
  
  
  component times360
    port (
    clk: IN std_logic;
    a: IN std_logic_VECTOR(13 downto 0);
    q: OUT std_logic_VECTOR(22 downto 0));
end component;



  component FDC
    port(
      Q                   : out std_logic; 
      D                   : in  std_logic; 
      C                   : in  std_logic; 
      CLR                 : in  std_logic ); 
  end component; 
  
  component LED_CNTR
    port (
      FCLK_G              : in  std_logic; 
      FF                  : in  std_logic; 
      LED_ON              : out std_logic ); 
  end component; 
  
  -- BUFG primitive
  component BUFG
    port(
      I                   : in  std_logic; 
      O                   : out std_logic ); 
  end component; 


  signal MCLK             :     std_logic;  -- Main clock
  signal HSB_CLK          :     std_logic;  -- HSB clock source
  signal HSB_CLOCK        :     std_logic;  -- HSB clock
  signal CLOCK            :     std_logic;  -- Clock signal for digital input logic
  signal CLK_SRC          :     std_logic := '0'; 
  
  signal INFIFO_SEL       :     std_logic_vector(5 downto 0); 
  signal OUTFIFO_SEL      :     std_logic_vector(5 downto 0); 
  signal LEDcount         :     unsigned(25 downto 0); 
  signal Q1, Q2, Q3       :     std_logic; 
  
-- signal PRFreset : std_logic;
  
  
  --
  
  signal TX               :     std_logic; 
  signal RX               :     std_logic; 
  
  signal CE_A             :     std_logic; 
  signal CE_B             :     std_logic; 
  signal CE_C             :     std_logic; 
  signal CE_D             :     std_logic; 
  signal CE_E             :     std_logic; 
  signal CE_F             :     std_logic; 
  
  signal DVALID           :     std_logic; 
  signal MUX_SEL          :     std_logic_vector(2 downto 0); 
  signal DATA_IN          :     std_logic_vector(31 downto 0); 
  --
  signal READY            :     std_logic; 
  signal FFF              :     std_logic; 
  signal FFE              :     std_logic; 
  signal LED_A            :     std_logic; 
  signal LED_B            :     std_logic; 
  
  signal PRFin            :     std_logic; 
  signal FIFO_DATA        :     std_logic_vector(31 downto 0); 
  signal WFIFO_EN         :     std_logic; 
  
  signal I_DIN            :     std_logic_vector(15 downto 0); 
  signal Q_DIN            :     std_logic_vector(15 downto 0); 
  signal I_ND             :     std_logic; 
  signal Q_ND             :     std_logic;
  signal I_RDY            :     std_logic;
  signal Q_RDY            :     std_logic; 
  signal I_RFD            :     std_logic;
  signal Q_RFD            :     std_logic; 
  signal I_DOUT           :     std_logic_vector(32 downto 0); 
  signal Q_DOUT           :     std_logic_vector(32 downto 0); 
  
  signal OUTFIFO_DIN      :     std_logic_vector(31 downto 0);
  signal OUTFIFO_WR_EN    :     std_logic;
  signal OUTFIFO_RD_EN    :     std_logic;
  signal OUTFIFO_DOUT     :     std_logic_vector(31 downto 0);
  signal OUTFIFO_FULL     :     std_logic;
  signal OUTFIFO_EMPTY    :     std_logic; 
  signal SELECT_UMI       :     std_logic;  
  signal COLLISION        :     std_logic; 
  
  signal INPUT_COUNT     :     unsigned(3 downto 0);
  signal INPUT_COUNTS_TO_PULSE : unsigned(3 downto 0);
  signal TX_SAMPLE_STORE :      std_logic;
  signal PulseMode       :      std_logic;
  
  signal SimAz           :      unsigned(13 downto 0);
  signal AzimuthIn       :      std_logic_vector(13 downto 0);
  signal DUAL_PRF_MODE   : 	  std_logic;


  type sampling_sequence_type is (
    TagAzEl, 
    DoSP, 
    DoLP
    ); 
  
  signal SAMPLINGsequence :     sampling_sequence_type; 

   signal  AzimTimes360 : std_logic_VECTOR(22 downto 0);

begin
  
  
  -- ==========================================================
  -- ==========================================================
  --       <<<<<<<   INSERT YOUR CODE HERE    >>>>>>>>>
  -- ==========================================================
  -- ==========================================================
  
  
  -------------------------------------------------------------
  -- OSC3 clock divided by 2
  
  gDIV2                   :     if (DIV2_FCLK) generate
    -- oscillator divided by 2
    process (RESET, OSC3)
    begin
      if RESET = '1' then
        MCLK      <= '0'; 
      elsif rising_edge(OSC3) then
        MCLK      <= not MCLK; 
      end if; 
    end process; 
  end generate; 
  
  gNDIV2                  :     if (not DIV2_FCLK) generate
    -- no division
    MCLK          <= OSC3; 
  end generate; 
  
  -------------------------------------------------------------
  -- Drive the UDP-RESET high (inactive)
  
  UDPRES          <= '1'; 
  
  -------------------------------------------------------------
  -- Drive the BOOT ENABLE signal high (inactive)
  
  BOOTEN          <= '1'; 
  
  -------------------------------------------------------------
  -- Drive unused signals
  
  CLKOUT          <= '0'; 
  DTTL            <= '0'; 
  
  T2IN_A          <= '0'; 
  
  T1IN_B          <= '0'; 
  T2IN_B          <= '0'; 
  RS485_232_B     <= '0'; 
  HDPLX_B         <= '0'; 
  FAST_B          <= '0'; 
  
  -------------------------------------------------------------
  -- RS232
  
  RX              <= R1OUT_A; 
  T1IN_A          <= TX; 
  
  RS485_232_A     <= '0'; 
  HDPLX_A         <= '0'; 
  FAST_A          <= '1'; 
  
  -------------------------------------------------------------
  -- FIFOs
  
  SRC_FCLK_RD     <= '0';               -- clock source for READ FIFO
  SRC_FCLK_WR     <= '0';               -- clock source for WRITE FIFO
  SRC_FCLK_G      <= MCLK;              -- global clock source for both FIFOs
  
---------------------------------------------------------------
-- DIGITAL OUTPUTS 
---------------------------------------------------------------
  
  
  process (MCLK)
  begin
    if rising_edge(MCLK) then
      CLK_SRC     <= not CLK_SRC; 
    end if; 
  end process; 
  
  iBUFG  : bufg port map(i => CLK_SRC, o => CLOCK); 
  
  INFIFO_READ_REQ <= "000011";          --Data required from fifo 0 & 1  
  DVALID          <= INFIFO_DVALID(0);  -- If FIFO 0 has an update for the outputs
  
  process(INFIFO_DVALID, FCLK_G)
  begin
    if(rising_edge(FCLK_G)) then 
      if(INFIFO_DVALID(0) = '1') then
        DATA_IN   <= INFIFO0_D;         -- IF valid data on fifo 0 (PC) then assign to data_in 
      end if; 
    end if; 
  end process; 
  
  -- Toppest most bits of data_in word contain 
  -- Info about which connector to place output on
  -- Note: bit pattern can be put on any combination of connectors simultaniously
  CE_A            <= DVALID and DATA_IN(16);  
  CE_B            <= DVALID and DATA_IN(17);  
  CE_C            <= DVALID and DATA_IN(18); 
  CE_D            <= DVALID and DATA_IN(19); 
  CE_E            <= DVALID and DATA_IN(20); 
  CE_F            <= DVALID and DATA_IN(21);
  
  select_umi      <= DVALID  AND DATA_IN(22);
  
  process(DVALID, DATA_IN)
  begin 
    if( rising_edge(FCLK_G) ) then 
      if( select_umi='1' ) then
        PulseMode  <= DATA_IN(0);
      end if;
    end if;
  end process;
  
  UMI_OUT(1) <= PulseMode;
  UMI_EN(1)  <= '0'; --Enable output by setting low
  UMI_OUT(2)  <= DUAL_PRF_MODE;
  UMI_EN(2) <= '0' ; 	--Enable output by setting low
  
  UMI_OUT(0) <='0'; 
  UMI_EN(0) <= '1'; --Disable as output
  UMI_OUT(3) <='0';
  UMI_EN(3 ) <='1'; --Disable as output as are set high
  
  
  
  
--  CONN_D_EN       <= (others                    => '0'); 
  
  iCONN_C_OUT  : CONN_C
    port map (
      CLOCK => FCLK_G, 
      CE => CE_C, 
      DATA_OUT => DATA_IN(14 downto 0), 
      CONN_C_OUT => CONN_C_OUT, 
      CONN_C_EN  => CONN_C_EN ); 
  
  iCONN_D_OUT : CONN_D
    port map (
      CLOCK => FCLK_G,
      CE => CE_D,
      DATA_OUT => DATA_IN(14 downto 0),
      CONN_D_OUT => CONN_D_OUT,
      CONN_D_EN => CONN_D_EN );
  
  iCONN_E_OUT : CONN_E
    port map (
      CLOCK => FCLK_G, 
      CE => CE_E, 
      DATA_OUT => DATA_IN(14 downto 0), 
      CONN_E_OUT => CONN_E_OUT, 
      CONN_E_EN => CONN_E_EN ); 
  
  iCONN_F_OUT : CONN_F
    port map (
      CLOCK => FCLK_G, 
      CE => CE_F, 
      DATA_OUT => DATA_IN(14 downto 0), 
      CONN_F_OUT  => CONN_F_OUT, 
      CONN_F_EN  => CONN_F_EN ); 
  
-- Instantiate Long pulse filters

  I_LPFILTER: lpfilter
    port map (
      ND => I_ND,
      RDY => I_RDY,
      CLK => FCLK_G,
      RST => PRFin,
      RFD => I_RFD,
      DIN => I_DIN,
      DOUT => I_DOUT);
  
  Q_LPFILTER: lpfilter
    port map (
      ND => Q_ND,
      RDY => Q_RDY,
      CLK => FCLK_G,
      RST => PRFin,
      RFD => Q_RFD,
      DIN => Q_DIN,
      DOUT => Q_DOUT);
  
  
  myOUTFIFO : outputfifo
    port map (							 	
      din                                          => OUTFIFO_DIN,
      wr_en                                        => OUTFIFO_WR_EN,
      wr_clk                                       => FCLK_G,
      rd_en                                        => OUTFIFO_RD_EN,
      rd_clk                                       => FCLK_G,
      ainit                                        => RESET,
      dout                                         => OUTFIFO_DOUT,
      full                                         => OUTFIFO_FULL,
      empty                                        => OUTFIFO_EMPTY); 
  
-- Define state machine for control of sample sequence 
-- Tags start of ray with marker , then tags with Azimuth / Elevation
-- Then depending on mode routes data, via filters or not to output fifo
  
AzimuthIn<=CONN_A_IN(13 downto 0);
  
--  process(FCLK_G)
--  begin
--    if( rising_edge(FCLK_G) ) then
--     SimAz<= SimAz+1;
--    end if;
--	end process;

  AzimBy360: times360
        port map (
            clk => FCLK_G,
            a => CONN_A_IN(13 downto 0),
            q => AzimTimes360);
 

  process(FCLK_G,CONN_A_IN)
  begin
    if( rising_edge(FCLK_G) ) then 
      
      if(PRFin = '1') then 
        OUTFIFO_DIN                     <= '0' & "1111111111111111111111111111111"; 
        OUTFIFO_WR_EN                   <= PRFin and (not OUTFIFO_FULL); 
        SAMPLINGsequence                <= TagAzEl; 
        I_ND <='0';
        Q_ND <='0';
        SimAz <= SimAz+1;
      else
        
        case SamplingSequence is 
          
          when TagAzEl => 
            
            DUAL_PRF_MODE <= AzimTimes360(13);  -- Take what is now the 0.5 degree bit
            OUTFIFO_DIN(31)             <= PulseMode; 
            OUTFIFO_DIN(30)             <= '0'; 
				OUTFIFO_DIN(29 downto 16)   <= CONN_A_IN(13 downto 0);
            OUTFIFO_DIN(15)             <= DUAL_PRF_MODE; 
            OUTFIFO_DIN(14 downto 0)    <= CONN_B_IN; 
            OUTFIFO_WR_EN <= '1';
            
  			   
				if(PulseMode = '0' ) then   -- Long pulse mode
              SAMPLINGsequence          <= DoLP; 
            elsif (PulseMode = '1') then  -- Short pulse mode
              SAMPLINGsequence          <= DoSP; 
            end if; 
            
				I_ND <='0';
            Q_ND <='0';
            
          when DoSP => 
            
            OUTFIFO_DIN                 <= INFIFO1_D; 
            OUTFIFO_WR_EN               <= INFIFO_DVALID(1) and (not OUTFIFO_FULL); 
            I_ND <='0';
            Q_ND <='0';
            
          when DoLP => 
            -- Route data to and from filters 
            -- Rounding output of filters on the way            
            
            I_DIN                       <= INFIFO1_D(31 downto 16) ; 
            I_ND                        <= INFIFO_DVALID(1) AND I_RFD; 
            Q_DIN                       <= INFIFO1_D(15 downto 0); 
            Q_ND                        <= INFIFO_DVALID(1) AND Q_RFD; 
            
            OUTFIFO_WR_EN              <= I_RDY AND Q_RDY;
            
            if I_DOUT(14)='1' then
              OUTFIFO_DIN(31 downto 16)<=  STD_LOGIC_VECTOR(SIGNED(I_DOUT(30 downto 15))+1);
            else
              OUTFIFO_DIN(31 downto 16)<=  I_DOUT(30 downto 15);
            end if;
            
            if Q_DOUT(14)='1' then
              OUTFIFO_DIN(15 downto 0)<=  STD_LOGIC_VECTOR(SIGNED(Q_DOUT(30 downto 15))+1);
            else
              OUTFIFO_DIN(15 downto 0)<=  Q_DOUT(30 downto 15);
            end if;
            
          when others => NULL; 
        end case; 
      end if; 
    end if; 
  end process; 
  
  
  -- If data in outfifo and bus output fifo empty 
  -- write data from outfifo onto output bus to PC
  process(FCLK_G)
  begin
    if( (OUTFIFO_EMPTY = '0') and (OUTFIFO_READY(0) = '1') ) then
      OUTFIFO_RD_EN                     <= '1'; 
      OUTFIFO_WRITE(0)                  <= '1'; 
      OUTFIFO_D                         <= OUTFIFO_DOUT; 
    else 
      OUTFIFO_RD_EN                     <= '0'; 
      OUTFIFO_WRITE(0)                  <= '0'; 
    end if; 
  end process; 
  
  
  -------------------------------------------------------------
  
  -- Serial Bus
  
  HSB_bufg  : bufg port map(i => HSB_CLK, o => HSB_CLOCK); 
  
  MSG_CLK  <= HSB_CLOCK;  -- clock for Message Interface
  
  -- Generate a 50MHz clock for the HSB interface and RS232 logic
  process (MCLK)
  begin
    if rising_edge(MCLK) then
      HSB_CLK                           <= not HSB_CLK; 
    end if; 
  end process; 
  
  -------------------------------------------------------------
  -- Connector Digital IO
  
  -- Disable A and B as outputs as they read azim/elev 
  -- and are used for tagging start of ray
  
  CONN_A_OUT                            <= (others => '0');   
  CONN_A_EN                             <= (others => '1'); 
  
  CONN_B_OUT                            <= (others => '0'); 
  CONN_B_EN                             <= (others => '1'); 
  
  
  
---------------------------------------------------------------
--- UMI connectors 
-- Uncommited module interconnects are used to define current
--	mode / PRF 
  
  
  -- This process "debounces" UMI as prfs are sent by IO4 and
  -- so is unlikely to synced with this module
  -- This syncs UMI signal to our clock allowing it to 
  -- be used in clocked processes
  
  process(FCLK_G, RESET)
  begin
    if (RESET = '1') then
      Q1                                <= '0';
      Q2                                <= '0';
      Q3                                <= '0';
    elsif (FCLK_G'event and FCLK_G = '1') then
      Q1                                <= UMI_IN(0);
      Q2                                <= Q1;
      Q3                                <= Q2;
    end if;
  end process;

  PRFin   <= Q1 and Q2 and (not Q3); 
  
  
-------------------------------------------------
  -- Led Flasher : dividing F_CLKG clock by 2**25
  
  process(RESET, FCLK_G)
  begin
    if RESET='1' then
      LEDcount <= (others=>'0');
    elsif rising_edge(FCLK_G) then
      LEDcount <= LEDcount + 1;
    end if;
  end process;
  
  LED(2) <= LEDcount(24);
  
  --LED_CNTR keeps LED on for a human visible time
  
  --Tell tail LEDs 
  iLED_0 : LED_CNTR
    port map (
      FCLK_G         => FCLK_G, 
      FF             => PRFin, 
      LED_ON         => LED(0)); 
  
  --COLLISION signal no-longer used
  iLED_3 : LED_CNTR
    port map (
      FCLK_G         => FCLK_G, 
      FF             => PulseMode, 
      LED_ON         => LED(3)); 
  
  iLED_4 : LED_CNTR
    port map (
      FCLK_G         => FCLK_G, 
      FF             => OUTFIFO_FULL, 
      LED_ON         => LED(4)); 
  
  -- Drive LED(1) high (inactive)
  LED(1)  <= DUAL_PRF_MODE; 
--  LED(3)  <= '1'; 
--LED(4) <= '1';
  
  
end DIO; 











