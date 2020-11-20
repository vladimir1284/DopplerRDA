  
--==============================================================
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
--  Date        : 23/2/04 
--  Author      : T Darlington 
--  description : IF sampling module   
--
-- ==============================================================
--
--  Ver     Modified By      Date      Changes    
--  ---     -----------      ----      -------
--  1.0     T Darlington               Inital version
--	 2.0		R. Naranjo       19/05/09	Cuba version for X Band  ( same S Band )	   
--  2.1     R.Naranjo        13/02/2014 hold  NCO word wrote from PC 
--  2.2     R.Naranjo        24/09/2015 Write NCO word when next trigger arrival 
--
-- ==============================================================

 
-- ==============================================================
-- package : CONFIG
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
  constant                   VIRTEX2_ES                                        :     boolean := false; 
  
  -- OSCILLATOR CLOCK DIVISION
  -- To divide oscillator clock by 2, set DIV2_FCLK = TRUE
  constant      DIV2_FCLK                                                      :     boolean := false; 
  
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
  constant                 FCLK_G_DOMAIN                                       :     boolean := true; 
  
                                        -- When read/write FIFO clock frequency > 60 MHz, set HIGH_FCLK_G = TRUE
                                        -- This constant is used only when FCLK_G_DOMAIN = TRUE
  constant                 HIGH_FCLK_G                                         :     boolean := true; 
  
                                        -- When read FIFO clock frequency > 60 MHz, set HIGH_FCLK_RD = TRUE
                                        -- This constant is used only when FCLK_G_DOMAIN = FALSE
  constant                 HIGH_FCLK_RD                                        :     boolean := false; 
  
                                        -- When write FIFO clock frequency > 60 MHz, set HIGH_FCLK_WR = TRUE
                                        -- This constant is used only when FCLK_G_DOMAIN = FALSE
  constant                 HIGH_FCLK_WR                                        :     boolean := false; 
  
                                        -- ADC CLOCK
                                        -- =========
  
                                        -- To drive the ADC sample clock from a signal inside the FPGA set INTERNAL_SCLK = TRUE
                                        -- to use an external sample clock, set INTERNAL_SCLK = FALSE
  constant                INTERNAL_SCLK                                        :     boolean := true; 
  
end CONFIG; 
        

-- ==============================================================
-- Module : USER_AP
-- ==============================================================

library IEEE; 
Library UNISIM;

use IEEE.std_logic_1164.all; 
use IEEE.numeric_std.all; 
use UNISIM.vcomponents.all;
use WORK.CONFIG.all; 


--pragma translate_off
library sim_lib; 
use sim_lib.all; 
--pragma translate_on

entity USER_AP is
  port (
    RESET        : in  std_logic;  -- asynchronous reset active high
    CONFIG       : in  std_logic;  -- System wide Config signal
-- CLOCK IO
    OSC0         : in  std_logic;  -- Xtal OSC0
    OSC1         : in  std_logic;  -- Xtal OSC1
    OSC2         : in  std_logic;  -- Xtal OSC2
    OSC3         : in  std_logic;  -- Xtal OSC3 factory default fitted with 100Mhz
    CLKIN0       : in  std_logic;  -- User clock input (unbuffered) 
    CLKIN1       : in  std_logic;  -- User clock input (unbuffered)
    CLKI2        : in  std_logic;  -- User clock input (buffered)
    CLKI3        : in  std_logic;  -- User clock input (buffered)
    CLKOUT       : out std_logic;  -- User clock output
    QTTL         : in  std_logic; 
    DTTL         : out std_logic; 
-- GENERAL PURPOSE GCLKs
    GCLK_A       : in  std_logic; 
    SRC_GCLK_A   : out std_logic; 
    GCLK_B       : in  std_logic; 
    SRC_GCLK_B   : out std_logic; 
-- SERIAL IO
    R1OUT        : in  std_logic; 
    R2OUT        : in  std_logic; 
    T1IN         : out std_logic; 
    T2IN         : out std_logic; 
    RS485_232    : out std_logic; 
    HDPLX        : out std_logic; 
    FAST         : out std_logic; 
-- MISCELLANEOUS IO
    UDPRES       : out std_logic;  -- reset the carrier (high if NOT used)
    LED          : out std_logic_vector(4 downto 0);  -- LEDs
    ADDR_FLAGSEL : in  std_logic; 
    BOOTEN       : out std_logic; 
    CID          : in  std_logic_vector(3 downto 0); 
    MID          : in  std_logic_vector(3 downto 0); 
-- UMIs
    UMI_IN       : in  std_logic_vector(3 downto 0); 
    UMI_OUT      : out std_logic_vector(3 downto 0); 
    UMI_EN       : out std_logic_vector(3 downto 0); 
-- DIGITAL IO
    DIO_IN       : in  std_logic_vector(7 downto 0); 
    DIO_OUT      : out std_logic_vector(7 downto 0); 
    DIO_EN       : out std_logic_vector(7 downto 0); 
-- READ FIFO CLK
    FCLK_RD      : in  std_logic;  -- FIFO_IN clock to be used in this module (only when FCLK_G_DOMAIN=FALSE)
    SRC_FCLK_RD  : out std_logic;  -- FIFO_IN clock source for the top level  (only when FCLK_G_DOMAIN=FALSE)
-- WRITE FIFO CLK
    FCLK_WR      : in  std_logic;  -- FIFO_OUT clock to be used in this module (only when FCLK_G_DOMAIN=FALSE)
    SRC_FCLK_WR  : out std_logic;  -- FIFO_OUT clock source for the top level  (only when FCLK_G_DOMAIN=FALSE)
-- COMMON FIFO CLK
    FCLK_G       : in  std_logic;  -- Common FIFO clock to be used in this module (only when FCLK_G_DOMAIN=TRUE)
    SRC_FCLK_G   : out std_logic;  -- Common FIFO clock source for the top level  (only when FCLK_G_DOMAIN=TRUE)
                                       -- FIFO IN / HE_RD_6F interface
    INFIFO_READ_REQ : out std_logic_vector(5 downto 0); 
    INFIFO_DVALID : in std_logic_vector(5 downto 0); 
    INFIFO_SINGLE : in std_logic_vector(5 downto 0); 
    INFIFO_BURST : in std_logic_vector(5 downto 0); 
    INFIFO0_D : in std_logic_vector(31 downto 0); 
    INFIFO1_D : in std_logic_vector(31 downto 0); 
    INFIFO2_D : in std_logic_vector(31 downto 0); 
    INFIFO3_D : in std_logic_vector(31 downto 0); 
    INFIFO4_D : in std_logic_vector(31 downto 0); 
    INFIFO5_D : in std_logic_vector(31 downto 0); 
                                        -- FIFO OUT / HE_WR_6F interface
    OUTFIFO_READY : in std_logic_vector(5 downto 0); 
    OUTFIFO_WRITE : out std_logic_vector(5 downto 0); 
    OUTFIFO_D : out std_logic_vector(31 downto 0); 
-- SERIAL BUS / HE_USER Message interface
    MSG_CLK : out std_logic;  -- HSB clock source for the top level
    MSG_DIN : in std_logic_vector(7 downto 0);  -- data received from HSB
    MSG_ADDR : in std_logic_vector(7 downto 0);  -- HSB address
    MSG_WEN : in std_logic;  -- write access
    MSG_REN : in std_logic;  -- read access
    MSG_DONE : in std_logic;  -- message successfully transmitted
    MSG_COUNT : in std_logic;  -- user's counter enable
    MSG_CLEAR : in std_logic;  -- user's counter clear
    MSG_READY : out std_logic;  -- to acknowledge an access
    MSG_SEND_MSG : out std_logic;  -- message send command
    MSG_CE : out std_logic;  -- to control speed operation
    MSG_DOUT : out std_logic_vector(7 downto 0);  -- data sent to HSB
    MSG_SEND_ID : out std_logic;  -- ID information send command
    MSG_LAST_BYTE : out std_logic;  -- to indicate when the last byte is presented
-- GLOBAL ADC SCLK
    SCLK : in std_logic;  -- ADC clock to be used in this module
    SRC_SCLK : out std_logic;  -- ADC clock source for the top level (only used when INTERNAL_SCLK=TRUE)
-- HE_ADC
    ADC : in std_logic_vector(13 downto 0);  -- ADC data
    OVR : in std_logic;  -- ADC over range flag
-- HE_DAC_A
    SCLK_DAC_A : out std_logic;  -- DAC_A clock source for the top level
    DAC_A : out std_logic_vector(13 downto 0);  -- DAC_A data
-- HE_DAC_B
    SCLK_DAC_B : out std_logic;  -- DAC_B clock source for the top level
    DAC_B : out std_logic_vector(13 downto 0)  -- DAC_B data
    ); 
end USER_AP; 


architecture ADC of USER_AP is
  
-- Standard stuff
  
  signal MCLK        : std_logic;  -- main clock
  signal LEDcount    : unsigned(24 downto 0);  --LED flasher counter
  signal control     : std_logic;  
  signal control_buf : std_logic;
  signal adq         : std_logic;
  signal decontrol   : std_logic;
  signal control_1   : std_logic;
  signal control_2   : std_logic;
  signal control_3   : std_logic;
  signal Sw          : std_logic;
  signal MhzCount    : unsigned(19 downto 0); -- 2 Mhz period counter value
  signal MHzCount1  : unsigned(19 downto 0); -- 20 Mhz period counter value
  signal LogClk        : std_logic;
  signal clk_D       : std_logic;
  signal clk_20Mhz   : std_logic;
  signal clk_10Mhz   : std_logic;
  signal clk_50Mhz : std_logic;
--
-- PRF Gen related stuff   
--  
  signal PRFcount : unsigned(19 downto 0); -- PRF period counter value
  signal countPRETRIGGER : unsigned(19 downto 0); --robert
  signal PRFreset : std_logic; -- Reset to PRF clock
  signal PRFlimit : unsigned(23 downto 0); -- PRF Count limit
  signal PreTriggerLimit : unsigned(23 downto 0); --PreTrigger count limit
  signal PreTriggerLimit_value : unsigned(23 downto 0); 
  signal PRFlimit_value : unsigned(23 downto 0); -- PRF Count limit
  signal PreTriggerCounter : unsigned(19 downto 0);
  signal  PULSE_LENGTH  : std_logic; -- Select Long or Short pulse
  signal SHORT_PULSE_PRF : std_logic; -- 1200 or 900 Hz Short Pulse prf (4:3)
  signal PRFout : std_logic; -- Output of prf generator
  signal PRF : std_logic;
  
  signal DDC_SAMPLE_LIMIT : unsigned(12 downto 0); -- How many range samples
  --signal PRF_DELAY_COUNT : unsigned(11 downto 0); -- Delay counter
  signal  PRF_DELAY1_COUNT :unsigned(12 downto 0);
  signal  PRF_DELAY2_COUNT :unsigned(12 downto 0);
  signal  PRF_DELAY : std_logic; -- Delay status
  signal NFTS_trigger : std_logic; -- Noise factor trigger (ranatec)
  signal NFTS_LIMIT_HIGH : unsigned( 19 downto 0); 
  signal NFTS_LIMIT_LOW : unsigned( 19 downto 0); 
  signal NFTS_AMBIENT_HIGH : unsigned( 19 downto 0);
  signal NFTS_AMBIENT_LOW : unsigned( 19 downto 0);
  signal NFTS_PULSE_HIGH : unsigned( 19 downto 0);
  signal NFTS_PULSE_LOW : unsigned( 19 downto 0);
  signal NFTS_Sampling_pulse : std_logic; -- Noise pulse sampling autorisation 
  signal NFTS_Sampling_ambient : std_logic; -- Ambient noise sampling autorisation 
  signal NFTS_Sampling : std_logic; -- sampling autorisation

  signal PRFSELECT : std_logic_vector(7 downto 0);
  signal LP_PRF : std_logic_vector(22 downto 0);
  signal SP_PRF_LOW : std_logic_vector(22 downto 0);
  signal SP_PRF_HIGH : std_logic_vector(22 downto 0);
  signal PRE_TRIGGER_1 : std_logic_vector(22 downto 0);
  signal PRE_TRIGGER_2 : std_logic_vector(22 downto 0);
  signal DDC_SAMPLE_LIMIT_LP : std_logic_vector(22 downto 0);
  signal DDC_SAMPLE_LIMIT_SP: std_logic_vector(22 downto 0);
  signal DDS_FREQ_IN : std_logic_vector(31 downto 0);
  signal PRE_TRIGGER_1_OUT : std_logic;
  signal PRE_TRIGGER_2_OUT : std_logic;
  signal CHANGE_PRF   : std_logic;
  signal DATA_IN      : std_logic_vector(31 downto 0);
  signal PRFSetting   : std_logic_vector(5 downto 0);
  signal PRF_DELAY1   : std_logic;
  signal PRF_DELAY2   : std_logic;
  signal EN_TRIGGER   : std_logic;
  signal enable_Pre_Trigger1 :std_logic;
  signal enable_Pre_Trigger2 :std_logic;
  signal enable_Pre_Trigger  :std_logic;
  signal rst_enable   : std_logic;
  signal TRIGGER_COUNT        : unsigned(1 downto 0);
--
-- SAMPLING stuff 
--
  signal SAMPLEcount : unsigned(15 downto 0); 
  signal SAMPLEint : signed(13 downto 0); 
  signal RAWsamples : std_logic_vector(13 downto 0); 
  signal EN_Write_RAWsamples_Tx : std_logic := '0';
  signal EN_Write_RAWsamples_Rx : std_logic := '0';  
  signal EN_Read_RAW_Tx : std_logic; 
  signal EN_Read_RAW_Rx : std_logic; 
  signal EN_ReadRAW : std_logic; 
  signal EN_Read :    std_logic;
  signal RawDataToFIFO : std_logic_vector(13 downto 0); 
  signal RawFIFO_Rx_empty : std_logic; 
  signal RawFIFO_Tx_empty : std_logic; 
  signal RawFIFO_Rx_full : std_logic;
  signal RawFIFO_Tx_full : std_logic;  
  signal RawSampleOut_Tx : std_logic_vector(13 downto 0); 
  signal RawSampleOut_Rx : std_logic_vector(13 downto 0); 
  signal CurrentAzEL : std_logic_vector(31 downto 0); 
  
  signal DDC_RDY : std_logic; 
  signal DDC_RFD : std_logic; 
  signal DDC_ND : std_logic; 
  signal DDC_I_OUT : std_logic_vector(29 downto 0); 
  signal DDC_Q_OUT : std_logic_vector(29 downto 0); 
  
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
  
  ----para probar
  signal DDC_I_OUT_NULL : std_logic_vector(29 downto 0); 
  signal DDC_Q_OUT_NULL : std_logic_vector(29 downto 0); 
  
  ---------
  
  signal DDCcount : unsigned(12 downto 0); 
  
  signal DDC_DATA_IN : std_logic_vector(13 downto 0); 
  signal DDC_WE : std_logic; 
  signal DDC_SEL : std_logic; 
  signal NCO_Word :std_logic_vector(31 downto 0); 
  signal  write_NCO_enable :std_logic;
  
  signal I_DATA: std_logic_vector(15 downto 0); 
  signal Q_DATA :std_logic_vector(15 downto 0); 
  signal IQ_FIFO_DATA_IN : std_logic_vector(31 downto 0); 
  signal IQ_OUT_FULL : std_logic; 
  signal IQ_OUT_EMPTY : std_logic; 
  signal IQ_FIFO_OUT : std_logic_vector(31 downto 0); 
  signal IQ_FIFO_WR_EN : std_logic; 
  signal IQ_FIFO_RD_EN : std_logic; 
  signal IS_Turn : std_logic; 
  signal SAMPLERawData : std_logic;  
  signal Acquisitionmode :std_logic;
  --------------------------------para probar---------------------
  
  signal outQ  :std_logic;
  signal s     :std_logic;
  signal D_A_word : std_logic_vector(14 downto 0);
  signal DDS_word :std_logic_vector(19 downto 0);
  signal DDS_word2: std_logic_vector(12 downto 0);
  signal dds_ready : std_logic;
  signal Sum_word : std_logic_vector(12 downto 0);
  signal frec   : std_logic_vector(31 downto 0);
  signal A :    std_logic_vector(4 downto 0);
  signal stage1 : std_logic;
  signal stage2 : std_logic;
  signal stage3 : std_logic;
  signal enablemod :std_logic;
  signal Isimul  :std_logic_vector(15 downto 0);
  signal Qsimul  :std_logic_vector(15 downto 0); 
  signal Q1, Q2, Q3,Q4,Q5       :     std_logic;  
  signal PRFin   : std_logic;  
  signal EN_write_IQ_FIFO : std_logic;
  
  signal CLK0    : std_logic;
  signal CLK180  : std_logic;
  signal CLKDV   : std_logic;
  signal LOCKED  : std_logic;
  signal CLKFB   : std_logic;
  signal CLKIN   : std_logic;
  signal TESTCLK : std_logic;
  signal In1     : std_logic;
  signal Out1    : std_logic;
  signal In2     : std_logic;
  signal Out2    : std_logic;
  
 signal CLK270 : std_logic;
  signal CLK2X  :std_logic;
  signal CLK2X180 : std_logic;
  signal CLK90 : std_logic;
  signal CLKFX : std_logic;
  signal PSDONE : std_logic;
  signal STATUS : std_logic_vector(7 downto 0);
  signal PSCLK : std_logic;
  signal PSINCDEC: std_logic;
  signal PSEN : std_logic;
  signal CLKFX180 : std_logic;  
  
  signal CLKIN_IBUFG :std_logic;
  signal CLK_TEST    :std_logic;
  signal CLK_KK      : std_logic;
  signal CLK_BUFG    : std_logic;
  ----------------------------------------
  
  
  type sampling_sequence_type is (
    WaitForPulse, 
    SampleData,
	 WaitForEnd
	
    ); 
  
  type output_Tx_Burst_sequence_type is (
    output_to_PC, 
    output_to_FPGA3
    
    ); 
	 
  type write_NCO_type is(
	 write_from_PC,
	 wait_for_PRF,
	 finish
	 );
  
  signal SAMPLINGsequence : sampling_sequence_type; 
  signal OUTPUTsequence : output_Tx_Burst_sequence_type; 
  signal write_NCO: write_NCO_type;

  component iq_out_fifo
    port (
      din : in std_logic_vector(31 downto 0);
      wr_en : in std_logic;
      wr_clk : in std_logic;
      rd_en : in std_logic;
      rd_clk : in std_logic;
      ainit : in std_logic;
      dout : out std_logic_vector(31 downto 0);
      full : out std_logic;
      empty : out std_logic);
  end component; 
  
--  component rawfifo255x14
--    port (
--      din : in std_logic_vector(13 downto 0);
--      wr_en : in std_logic;
--      wr_clk : in std_logic;
--      rd_en : in std_logic;
--      rd_clk : in std_logic;
--      ainit : in std_logic;
--      dout : out std_logic_vector(13 downto 0);
--      full : out std_logic;
--      empty : out std_logic);
--  end component; 
  
  component rawFIFO511x14
    port (
      din : in std_logic_vector(13 downto 0);
      wr_en : in std_logic;
      wr_clk : in std_logic;
      rd_en : in std_logic;
      rd_clk : in std_logic;
      ainit : in std_logic;
      dout : out std_logic_vector(13 downto 0);
      full : out std_logic;
      empty : out std_logic);
  end component; 
  
 component DDC_Tx_Burst_FIFO
  port( 
	  din: IN std_logic_VECTOR(13 downto 0);
	  wr_en: IN std_logic;
	  wr_clk: IN std_logic;
	  rd_en: IN std_logic;
	  rd_clk: IN std_logic;
	  ainit: IN std_logic;
	  dout: OUT std_logic_VECTOR(13 downto 0);
	  full: OUT std_logic;
	  empty: OUT std_logic);
   end component;
  component myddc
    port (
      DIN : in std_logic_vector(13 downto 0);
      ND : in std_logic;
      RDY : out std_logic;
      RFD : out std_logic;
      CLK : in std_logic;
      ADDR : in std_logic_vector(4 downto 0);
      LD_DIN : in std_logic_vector(31 downto 0);
      WE : in std_logic;
      SEL : in std_logic;
      DOUT_I : out std_logic_vector(29 downto 0);
      DOUT_Q : out std_logic_vector(29 downto 0));
  end component; 
  
  
  component ddcv_orig
    port (
	   DIN : IN STD_LOGIC_VECTOR(13 DOWNTO 0);
      ND : IN STD_LOGIC;
      CLK : IN STD_LOGIC;
      ADDR : IN STD_LOGIC_VECTOR(4 DOWNTO 0);
      LD_DIN : IN STD_LOGIC_VECTOR(31 DOWNTO 0);
      WE : IN STD_LOGIC;
      SEL : IN STD_LOGIC;
      RDY : OUT STD_LOGIC;
      RFD : OUT STD_LOGIC;
      DOUT_I : OUT STD_LOGIC_VECTOR(29 DOWNTO 0);
      DOUT_Q : OUT STD_LOGIC_VECTOR(29 DOWNTO 0)   
	 );
  end component;
  
  component ddcv1_0
   PORT (
      DIN : IN STD_LOGIC_VECTOR(13 DOWNTO 0);
      ND : IN STD_LOGIC;
      CLK : IN STD_LOGIC;
      ADDR : IN STD_LOGIC_VECTOR(4 DOWNTO 0);
      LD_DIN : IN STD_LOGIC_VECTOR(31 DOWNTO 0);
      WE : IN STD_LOGIC;
      SEL : IN STD_LOGIC;
      RDY : OUT STD_LOGIC;
      RFD : OUT STD_LOGIC;
      DOUT_I : OUT STD_LOGIC_VECTOR(29 DOWNTO 0);
      DOUT_Q : OUT STD_LOGIC_VECTOR(29 DOWNTO 0)     
       );
	end component;
	
	
  component ddcv1_1
   PORT (
      DIN : IN STD_LOGIC_VECTOR(13 DOWNTO 0);
      ND : IN STD_LOGIC;
      CLK : IN STD_LOGIC;
      ADDR : IN STD_LOGIC_VECTOR(4 DOWNTO 0);
      LD_DIN : IN STD_LOGIC_VECTOR(31 DOWNTO 0);
      WE : IN STD_LOGIC;
      SEL : IN STD_LOGIC;
      RDY : OUT STD_LOGIC;
      RFD : OUT STD_LOGIC;
      DOUT_I : OUT STD_LOGIC_VECTOR(29 DOWNTO 0);
      DOUT_Q : OUT STD_LOGIC_VECTOR(29 DOWNTO 0)     
       );
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
  
-- pruebasssssss---------------------------------------------  
 
----------------------------------------------------------------  
  
  component LED_CNTR is
                       port (
                         FCLK_G : in std_logic; 
                         FF : in std_logic; 
                         LED_ON : out std_logic
                         ); 
  end component; 
  
  component BUFG 
    port(
      I                   : in  std_logic; 
      O                   : out std_logic ); 
  end component; 
  
   component FDC
    port(
      Q                   : out std_logic; 
      D                   : in  std_logic; 
      C                   : in  std_logic; 
      CLR                 : in  std_logic ); 
  end component; 
  
  
--  component CLKDLLHF
--    
--  
--  end component;
--  
  
  
begin
  
-- ==========================================================
-- ==========================================================
-- <<<<<<< INSERT YOUR CODE HERE >>>>>>>>>
-- ==========================================================
-- ==========================================================
  
-------------------------------------------------------------
-- OSC3 clock divided by 2
  
  gDIV2 : if (DIV2_FCLK) generate
                                        -- oscillator divided by 2
    process (RESET, OSC3)
    begin
      if RESET = '1' then
        MCLK <= '0'; 
      elsif rising_edge(OSC3) then
        MCLK <= not MCLK; 
      end if; 
    end process; 
  end generate; 
  
  gNDIV2 : if (not DIV2_FCLK) generate
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
  
--  DIO_OUT(7 downto 3) <= (others => '0'); 
--  DIO_EN(7 downto 3) <= (others => '1'); 
  DIO_EN(7 downto 0) <= (others => '0');  
  
  -- UMI_OUT(3 downto 2) <= (others => '0'); 
 -- UMI_EN(3 downto 2) <= (others => '1'); 
  UMI_EN(0) <= '1'; 
  UMI_EN(1) <= '1'; 
  UMI_EN(2) <= '1';
  UMI_EN(3) <= '1';
   -- UMI_EN(1) <= '0';  
  
  --CLKOUT <= '0'; 
  
  DTTL <= '0'; 
  T1IN <= '0'; 
  T2IN <= '0'; 
  RS485_232 <= '0'; 
  HDPLX <= '0'; 
  FAST <= '0'; 
  
 -- General purpose GCLKs (not used in this example) 
  
  SRC_GCLK_A <= '0'; 
  --SRC_GCLK_B <= '0'; 
  
-------------------------------------------------------------
-- FIFOs
  
  SRC_FCLK_RD <= '0';  -- clock source for READ FIFO
  SRC_FCLK_WR <= '0';  -- clock source for WRITE FIFO
  SRC_FCLK_G <= MCLK;  -- global clock source for both FIFOs
  --SRC_FCLK_G <= TESTCLK;
 -------------------------------------------------------------
-- Serial Bus
  
  MSG_CLK <= OSC3;  -- clock for Message Interface
--------------------------------------------------------------  
--Port Map  
--------------------------------------------------------------  
   myDDCi : myddc
    port map (
      DIN => DDC_DATA_IN,
      ND => DDC_ND,
      RDY => DDC_RDY,
      RFD => DDC_RFD,
      CLK => not(SCLK), 
      ADDR => "00110",
		--LD_DIN => NCO_Word,
		--LD_DIN => INFIFO0_D ,
		LD_DIN => x"4CCCCCCD",
      WE => DDC_WE, 
      SEL => DDC_SEL,
      DOUT_I => DDC_I_OUT,
      DOUT_Q => DDC_Q_OUT);
		
	iq_out_fifoI : iq_out_fifo
    port map (
      din => IQ_FIFO_DATA_IN,
	--   din => "00000000000000000000000000000000",
      wr_en => IQ_FIFO_WR_EN,
      wr_clk => not(SCLK),
      rd_en => IQ_FIFO_RD_EN,
      rd_clk => FCLK_G,
      ainit => PRFReset,
      dout => IQ_FIFO_OUT,
      full => IQ_OUT_FULL,
      empty => IQ_OUT_EMPTY); 
  
--  iRawFifo255x14 : rawfifo255x14
--    port map (
--      din => RawDataToFIFO,
--      wr_en => EN_RAWsamples,
--      wr_clk => MCLK,
--      rd_en => EN_WriteRaw,
--      rd_clk => FCLK_G,
--      ainit => RESET,
--      dout => RawSampleOut,
--      full => RawFIFO_full,
--      empty => RawFIFO_empty);
		
		iRawFIFO511x14_Tx : rawFIFO511x14
    port map (
      din => RawDataToFIFO,
      wr_en => EN_Write_RAWsamples_Tx,
      wr_clk => not(SCLK),
      rd_en => EN_Read_Raw_Tx,
      rd_clk => FCLK_G,
      ainit => RESET,
      dout => RawSampleOut_Tx,
      full => RawFIFO_Tx_full,
      empty => RawFIFO_Tx_empty);
		
  I_LPFILTER: lpfilter
    port map (
      ND => I_ND,
      RDY => I_RDY,
      CLK => not(SCLK),
      RST => PRFReset,
      RFD => I_RFD,
      DIN => I_DIN,
      DOUT => I_DOUT);
  
  Q_LPFILTER: lpfilter
    port map (
      ND => Q_ND,
      RDY => Q_RDY,
      CLK => not(SCLK),
      RST => PRFReset,
      RFD => Q_RFD,
      DIN => Q_DIN,
      DOUT => Q_DOUT);   
	

	
	iBUFG  : bufg 
	port map(I => control, O => control_buf); 	
	
--	BUFG1 :BUFG
--	port map(
--	 I => TESTCLK,
--	 O => CLK_BUFG
--	 );
	
--	 LED0 : LED_CNTR
--    port map (
--      FCLK_G => FCLK_G, 
--      FF => RawFIFO_full, 
--      LED_ON => LED(0)
--      ); 
--                                        --LED(0)<= NOT RawFIFO_Full;
  
  LED2 : LED_CNTR
    port map (
      FCLK_G => SCLK, 
      FF => PRFreset, 
      LED_ON => LED(2)
      ); 
		
	iFDC : FDC
     port map(
	   Q   =>  outQ,               
      D   =>  not outQ,              
      C   => PRFout,               
      CLR => RESET
	   );	  
  FDC2 : FDC
    port map(
	   Q => LogClk,
		D => not(LogClk),
		C => clk_D,
		CLR => RESET
	 );
	 
--	FDC3 : FDC
--     port map(
--	    Q => clk_50Mhz,
--		 D => not(clk_50Mhz),
--		 C => MCLK,
--		 CLR => RESET
--     );	  
	 
	frec <= x"4CCCCCCD";
	--frec <= x"19999999"; 
   A <= "00000";

	
	 
	 
 
   BUFG1 : BUFG
     port map (
      O => Out1,     -- Clock buffer output
      I => CLK0     -- Clock buffer input
   );
 
--    BUFG2 : BUFG
--     port map (
--      O => Out2,     -- Clock buffer output
--      I =>  (1)     -- Clock buffer input
--	   );
		
	BUFG3 : BUFG
     port map (
      O => TESTCLK,     -- Clock buffer output
      I => CLKFX );
	 
--------------------------------------------------------------
--End Port Map
--------------------------------------------------------------  

 --CLKIN <= OSC3;
 --TESTCLK <= CLKDV;
  SRC_GCLK_B <= MCLK;
  ---TESTCLK <= CLK0;
  SRC_SCLK <= MCLK;
 
 
--  process(SCLK, RESET)
--  begin
--    if (RESET = '1') then
--      Q1                                <= '0';
--      Q2                                <= '0';
--      Q3                                <= '0';
--    elsif (SCLK'event and SCLK = '1') then
--      Q1                                <= UMI_IN(0);
--      Q2                                <= Q1;
--      Q3                                <= Q2;
--    end if;
--  end process;
--
--  PRFin   <= Q1 and Q2 and (not Q3); 
 -- PRFin <= UMI_IN(0);
  -- PRFReset <= UMI_IN(1);
  --CLK_TEST <= UMI_IN(1);
 -- DDC_SAMPLE_LIMIT  <="0000000001000"; --
 
 process(SCLK, RESET)
  begin
    if (RESET = '1') then
      Q1                                <= '0';
      Q2                                <= '0';
      Q3                                <= '0';
		Q4                                <= '0';
  --  elsif (FCLK_G'event and FCLK_G = '1') then
    elsif(rising_edge(SCLK)) then
      Q1                                <= UMI_IN(0);
      Q2                                <= Q1;
      Q3                                <= Q2;
		Q4                                <= Q3;
		Q5                                <= Q4;
    end if;
  end process;

  PRFin   <= Q2 and Q3 and (not Q4); 
  PRFReset <= Q1 and Q2 and (not Q3);
  DDC_WE  <= PRFReset;
  DDC_SEL <= PRFReset;
--  IQ_FIFO_WR_EN <= DDC_RDY AND (NOT IQ_OUT_FULL );
------------------------------------------------------------
-- A-D SAMPLING sequence
-------------------------------
 process(PRFin,RESET,SCLK)
 begin
   if rising_edge(SCLK) then
	  if PRFReset = '1' then
	     SAMPLEcount <= (others => '0');
		  SAMPLINGsequence <= WaitForPulse; 
		  DDCCount <= (others =>'0');	
     else  
        case SAMPLINGsequence is
          when WaitForPulse =>
			   if PRFin = '1' then
			 --  if (PRFin = '1' and (signed(ADC) > x"300")) or (PRFin = '1' and( (-signed(ADC)) > x"300"))  then
				         
				  DDCCount <= (others =>'0');				  
				  if RawFIFO_Tx_empty = '1' then 
				     RawDataToFIFO <= (others => '1');
				     EN_Write_RAWsamples_Tx <= '1';
					  control <= '0';  
					  
				  end if;
				  SAMPLINGsequence <= SampleData; 
				else
				  SAMPLINGsequence <= WaitForPulse; 				  
			   end if;
				
			 when SampleData => 
              control <= '1'; 			    
				--RawDataToFIFO <= "00110000000100";
				if(SampleCount < x"01FF") then 
				  RawDataToFIFO <= ADC;
				  DDC_DATA_IN   <= ADC;
				  --DDC_DATA_IN   <= (others => '0');
				  DDC_ND <= '1' and DDC_RFD;                			  			  
				  SampleCount <= Samplecount +1;
				  EN_Write_RAWsamples_Tx <= '1' and (not RawFIFO_Tx_full); 
				  
				  SAMPLINGsequence <= SampleData;
				  
         	else
              EN_Write_RAWsamples_Tx <= '0';
				  DDC_ND <= '0';
				  SAMPLEcount <= (others => '0');
				   control <= '0';
				  SAMPLINGsequence <= WaitForEnd;
				end if;
				when WaitForEnd =>
				  EN_Write_RAWsamples_Tx <= '0';
				  DDC_ND <= '0';  
				  SAMPLEcount <= (others => '0');
		        SAMPLINGsequence <= WaitForPulse;
				  control <= '0';
			 when others => null;
		  end case;
            		  
		  
	  end if;
	end if;
 end process;
 
  
  
--------------------------------------------------------------------
--End A-D SAMPLING sequence
-------------------------------------------------------------  

  PULSE_LENGTH <= UMI_IN(2);

  process (SCLK, PULSE_LENGTH)
  begin
  if rising_edge(SCLK) then
    case PULSE_LENGTH is 
      when '0' =>
		   I_ND  <= DDC_RDY and I_RFD;
			Q_ND  <= DDC_RDY and Q_RFD;
			I_DIN <= I_DATA;
			Q_DIN <= Q_DATA;
			if I_DOUT(14)='1' then
           IQ_FIFO_DATA_IN(31 downto 16)<=  STD_LOGIC_VECTOR(SIGNED(I_DOUT(30 downto 15))+1);
         else
          IQ_FIFO_DATA_IN(31 downto 16)<=  I_DOUT(30 downto 15);
         end if;
         if Q_DOUT(14)='1' then
           IQ_FIFO_DATA_IN(15 downto 0)<=  STD_LOGIC_VECTOR(SIGNED(Q_DOUT(30 downto 15))+1);
         else
           IQ_FIFO_DATA_IN(15 downto 0)<=  Q_DOUT(30 downto 15);
         end if;
			IQ_FIFO_WR_EN <=  I_RDY AND Q_RDY AND (NOT IQ_OUT_FULL );
			
      
		when '1' =>
		  IQ_FIFO_DATA_IN(31 downto 16) <= I_DATA;
		  IQ_FIFO_DATA_IN(15 downto 0) <=  Q_DATA;
		  IQ_FIFO_WR_EN <= DDC_RDY AND (NOT IQ_OUT_FULL );
      when others => NULL;
    end case; 
  
  end if;
  
  end process; 


   I_TO_INTEGER:process(DDC_I_OUT)--,SCLK)   
  begin                   
--   if(rising_edge(SCLK) )then 
    if DDC_I_OUT(6)='1' then
      I_DATA <=  STD_LOGIC_VECTOR(SIGNED(DDC_I_OUT(22 downto 7))+1);
    else
      I_DATA <=DDC_I_OUT(22 downto 7);  
--   end if;
    end if;             
    
  end process;  
  
  Q_TO_INTEGER:process(DDC_Q_OUT) --,SCLK) --http://groups.google.co.uk/groups?q=rounding+vhdl&hl=en&lr=&selm=3D633E90.F65F9DB6%40comsys.ntu-kpi.kiev.ua&rnum=3
  begin                  
                                        -- if(rising_edge(SCLK) )then
    if DDC_Q_OUT(6)='1' then
      Q_DATA <= STD_LOGIC_VECTOR(SIGNED(DDC_Q_OUT(22 downto 7))+1);
    else
      Q_DATA <= DDC_Q_OUT(22 downto 7);  
    end if;
                                        --	end if;              
  end process;  



  
  
    
  

----------------------------------------------
PRFlimit <= x"061A80";   --PL 250 Hz


--  process(SCLK)
--  begin
--    if rising_edge (SCLK) then
--	   --if PRFReset ='1' then
--		  control <= '1';
--      else
--	  	  control <= '0';
--		  end if;
--	 ---end if;
--  end process;
--  

  
  -------------------------------------------------------
--OUTPUT state machine.
-------------------------------------------------------	 
  process(FCLK_G,RESET)  -- OUTPUT state machine.
  begin
    if rising_edge(FCLK_G) then
	   case OUTPUTsequence is
		  when output_to_PC =>
		    
		    EN_Read_Raw_Tx <= OUTFIFO_READY(1) and (not RawFIFO_Tx_empty);
		   -- EN_Read_Raw_Tx <= '0';
			 OUTFIFO_WRITE(1) <= OUTFIFO_READY(1) and (not RawFIFO_Tx_empty);
			 OUTFIFO_D      <= RawSampleOut_Tx & "000000000000000000";
			 OUTFIFO_WRITE(3) <= '0'; 
			 IQ_FIFO_RD_EN    <= '0';
			 
			 OUTPUTsequence <= output_to_FPGA3;
			 
			 
		  when output_to_FPGA3 => 
		    IQ_FIFO_RD_EN    	<= OUTFIFO_READY(3) AND (NOT IQ_OUT_EMPTY);
			 OUTFIFO_WRITE(3) 	<=	OUTFIFO_READY(3) AND (NOT IQ_OUT_EMPTY);
			 OUTFIFO_D        	<= IQ_FIFO_OUT; 
			  --OUTFIFO_D        	<= (others => '0');
			  OUTFIFO_WRITE(1) <= '0';
			  EN_Read_Raw_Tx   <= '0';
			 
			 OUTPUTsequence <= output_to_PC;  		    
        when others => null;
		end case;
	 end if;
end process;  
--  
--  
--  
------------------------------------------------------------
--End OUTPUT state machine.  
-------------------------------------------------------------


-- DAC
  
   
-------------------------------------------------------------
-- LED flasher 
------------------------------------------------------------- 
  
  
 
-------------------------------------------------------------
-- End LED flasher 
-------------------------------------------------------------   
---------------------------------------------------------------
-- PRF pulse generator
---------------------------------------------------------------
 
		 
			
		
     		 			  
    
  
  
------------------------------------------


-----------------------------------------	
  
  
	 
 
  
 

-----------------------------------------------------

  
-----------------------------------------------------

 





 
------------------
--Outputs  
------------------ 

  DIO_OUT(0) <=  UMI_IN(0);
  DIO_OUT(1) <=  PRFReset;
  DIO_OUT(2)  <= PRFin;
  DIO_OUT(4) <= Out2;
	  -----------------------------------------------------
		 
end ADC;  

