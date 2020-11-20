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

--  2.3     R.Naranjo        23/02/18  Vesta/Cyclop IO4 Tx v2.1
--  2.4     R.Naranjo        27/4/18   Vesta/Cyclop IO4 Tx v2.2 No Doppler
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
  constant                 FCLK_G_DOMAIN                                  :     boolean := true; 
  
                                        -- When read/write FIFO clock frequency > 60 MHz, set HIGH_FCLK_G = TRUE
                                        -- This constant is used only when FCLK_G_DOMAIN = TRUE
  constant                 HIGH_FCLK_G                                     :     boolean := true; 
  
                                        -- When read FIFO clock frequency > 60 MHz, set HIGH_FCLK_RD = TRUE
                                        -- This constant is used only when FCLK_G_DOMAIN = FALSE
  constant                 HIGH_FCLK_RD                                    :     boolean := false; 
  
                                        -- When write FIFO clock frequency > 60 MHz, set HIGH_FCLK_WR = TRUE
                                        -- This constant is used only when FCLK_G_DOMAIN = FALSE
  constant                 HIGH_FCLK_WR                                    :     boolean := false; 
  
                                        -- ADC CLOCK
                                        -- =========
  
                                        -- To drive the ADC sample clock from a signal inside the FPGA set INTERNAL_SCLK = TRUE
                                        -- to use an external sample clock, set INTERNAL_SCLK = FALSE
  constant                INTERNAL_SCLK                                    :     boolean := true; 
  
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
  signal PRFout : std_logic; 
  signal Trigger : std_logic; -- Output of prf generator 
  signal PRF : std_logic;
  signal SetPRF :std_logic;
  signal PRFSettingvalue :std_logic_vector(31 downto 0);
  signal PRF_RATE          : std_logic_vector(1 downto 0); 
  signal PRF_RATE_LABEL    : std_logic_vector(1 downto 0); 
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
  
  signal N                 : unsigned(7 downto 0);
  signal Antenna_Mov       : std_logic;
  signal Count_pulse       : unsigned(7 downto 0);
  signal DATA_Az_gray   :   std_logic_vector(14 downto 0);
  signal DATA_EL_gray   :   std_logic_vector(14 downto 0);    
  signal DATA_Az        :   std_logic_vector(14 downto 0);
  signal DATA_EL        :   std_logic_vector(14 downto 0); 
  signal DataAng        :   std_logic_vector(14 downto 0); 
  signal DATA_Test_gray      :   std_logic_vector(14 downto 0); 
  signal pulsecounter      : unsigned(7 downto 0);
  signal Pulse_Mark        : std_logic;
  signal PRF_MARK          : std_logic;
  signal DUAL_PRF_MODE    : 	  std_logic;
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
  signal N_Pulse           : std_logic_vector(7 downto 0); 
  signal AngMarkSelect     : std_logic;
  signal DataAngTime360   :    std_logic_VECTOR(22 downto 0);
  signal  AzimTimes360    :    std_logic_VECTOR(22 downto 0);
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
  
  signal OUTFIFO_DIN      :     std_logic_vector(31 downto 0);
  signal OUTFIFO_WR_EN    :     std_logic;
  signal OUTFIFO_RD_EN    :     std_logic;
  signal OUTFIFO_DOUT     :     std_logic_vector(31 downto 0);
  signal OUTFIFO_FULL     :     std_logic;
  signal OUTFIFO_EMPTY    :     std_logic;
  
  signal Count_TxSample      : unsigned(12 downto 0);
  signal Count_RxSample      : unsigned(13 downto 0);
  signal Stalo_word       :std_logic_vector(13 downto 0);
  
  --ssi
 signal SSI_clk_counter : unsigned(12 downto 0);
 signal SSI_clk :std_logic;
 signal SSI_clk1 :std_logic;
 signal SSI_clk2 :std_logic;
 signal SSI_mclk :std_logic;
 signal counter1    :unsigned(12 downto 0);
 signal counter2    :unsigned(12 downto 0);
 signal counter3    :unsigned(12 downto 0);
 signal SSI_clk_En   :std_logic;
 signal c1           :std_logic;
 signal SSI_data_Az     :std_logic;
 signal SSI_data_El     :std_logic;
 signal SSI_clk_ext  :std_logic;
 signal SSI_clk_int  :std_logic;
 signal load         :std_logic;
 signal shift_reg_Az    : std_logic_vector(13 downto 0);
 signal shift_reg_El    : std_logic_vector(13 downto 0);
 signal data_ang     : std_logic_vector(14 downto 0);

--UART
 signal UART_clk :std_logic;
 signal TxBusy : std_logic;
 signal RxRDY  : std_logic;
 signal RxErr  : std_logic;
 signal LD_Sdata : std_logic;
 signal SData_in : std_logic_vector(7 downto 0);
 signal SData_out : std_logic_vector(7 downto 0);
 signal sTop16 :   STD_LOGIC;
 signal sTopTx :   STD_LOGIC;
 signal sTopRx :   STD_LOGIC;
 signal max_tick : std_logic;
 signal q_tick  : std_logic_vector(3 downto 0);
 signal tx :std_logic;
 signal tx_done : std_logic;
 signal baud_x_en :std_logic;
 signal baud_en : std_logic;
 signal DATA_TX : std_logic_vector(7 downto 0);
 signal tx_start  : std_logic;
  signal ini_DT    : std_logic;
 signal DT        : std_logic;
 signal count1    : unsigned(19 downto 0);
 signal count2    : unsigned(19 downto 0);
 signal count3    : unsigned(19 downto 0);
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
  signal IQ_FIFO_TxDATA_IN : std_logic_vector(31 downto 0); 
  signal IQ_OUT_FULL : std_logic; 
  signal IQ_OUT_EMPTY : std_logic; 
  signal IQ_FIFO_OUT : std_logic_vector(31 downto 0); 
  signal IQ_FIFO_WR_EN : std_logic; 
  signal IQ_FIFO_RD_EN : std_logic; 
  signal IS_Turn : std_logic; 
  signal SAMPLERawData : std_logic;  
  signal Acquisitionmode :std_logic;
  signal IQTX_RDY        : std_logic;
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
  
  -------------------------------para probar
  signal E1 :std_logic;
  signal E2 :std_logic;
  signal E3,E5,E6,E7 :std_logic;
  signal IQ_FIFO_TX_CLKWR :std_logic;
  ----------------------------------------
  
  
  type TXsampling_sequence_type is (
    WaitForPulse, 
    SampleData,
	 WaitForEnd
	
    ); 
	 
  type Packing_sequence_type is (
    TagAzEl, 
    DoSP,
	 DoLP,
	 DoNothing
    ); 
  
  type output_Tx_Burst_sequence_type is (
    output_SetNCO,
    output_TxBurst, 
    output_IQ
    
    ); 
	 
  type write_NCO_type is(
	 write_from_PC,
	 wait_for_PRF,
	 finish
	 );
	 
	type SSI_sequence_type is (
     clk_on,
     clk_off
     );	  


   type Serial_Tx_type is (
    wait_to_Tx,
	 Az_Low,
	 Az_High,
	 El_Low,
	 El_High
	 );
  
  signal TxSAMPLINGsequence : Txsampling_sequence_type; 
  signal Packing_sequence : Packing_sequence_type; 
  signal OUTPUTsequence : output_Tx_Burst_sequence_type; 
  signal write_NCO: write_NCO_type;
  signal SSI_sequence  : SSI_sequence_type;
  signal Serial_Tx_sequence     : Serial_Tx_type; 
  
  
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
  
  component outputfifo
    port (
    din: IN std_logic_VECTOR(31 downto 0);
    wr_en: IN std_logic;
    wr_clk: IN std_logic;
    rd_en: IN std_logic;
    rd_clk: IN std_logic;
    ainit: IN std_logic;
    dout: OUT std_logic_VECTOR(31 downto 0);
    full: OUT std_logic;
    empty: OUT std_logic);
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
  
  component mod_m_cter
	 Port ( clk : in  STD_LOGIC;
           reset : in  STD_LOGIC;
           max_tick : out  STD_LOGIC;
           q : out  STD_LOGIC_VECTOR (3 downto 0)); 
  end component;
  
  component uart_tx
    Port ( clk : in  STD_LOGIC;
           reset : in  STD_LOGIC;
           tx_start : in  STD_LOGIC;
           s_tick : in  STD_LOGIC;
           din : in  STD_LOGIC_VECTOR (7 downto 0);
			-- din : in  STD_LOGIC_VECTOR (15 downto 0);
           tx_done_tick : out  STD_LOGIC;
           tx : out  STD_LOGIC);
  end component;
  
  
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
    
  
--  I/O Enable ---------------------------
 -- DIO_EN(7 downto 0) <= (others => '0');  
 DIO_EN(5 downto 0) <= (others => '0'); --enable as outpout
 DIO_EN(7 downto 6) <= (others => '1'); --enable as input
  
--UMI OUTPUT Enable-------------------------------- 
  UMI_EN(0) <= '0';  --enable as output
  UMI_EN(1) <= '0'; 
  UMI_EN(2) <= '0';
  UMI_EN(3) <= '1';
   -- UMI_EN(1) <= '0';  
  ----Configure CLKOUT------------------------------
  CLKOUT <= '0'; 
  -- Configure RS232---------------------------------
  --Serial Configuartion  
  DTTL <= '0'; 
  --T1IN <= '0'; 
  T2IN <= '0'; 
  RS485_232 <= '0'; 
  HDPLX <= '0'; 
  FAST <= '1'; --RS232
  
 -- General purpose GCLKs (not used in this example) 
  
   SRC_GCLK_B <= MCLK;
   SRC_SCLK <= MCLK;
 
-------------------------------------------------------------
-- FIFOs
  
  SRC_FCLK_RD <= '0';  -- clock source for READ FIFO
  SRC_FCLK_WR <= '0';  -- clock source for WRITE FIFO
  SRC_FCLK_G <= MCLK;  -- global clock source for both FIFOs
  --SRC_FCLK_G <= TESTCLK;
 -------------------------------------------------------------
 -- FIFO Request-----------------------------------------------
  INFIFO_READ_REQ(0) <= '1';
  INFIFO_READ_REQ(1) <= '1';
  INFIFO_READ_REQ(2) <= '1';
  INFIFO_READ_REQ(3) <= '1';
  ---------------------------------------
  --D/A
  SCLK_DAC_A <= SCLK;
 -- SCLK_DAC_A <= INFIFO_DVALID(3);
  SCLK_DAC_B <= PRFout;
  
  
  -- Serial Bus
  
  MSG_CLK <= OSC3;  -- clock for Message Interface
--------------------------------------------------------------  
--Port Map  
--------------------------------------------------------------  
   
  

		
  iRawFIFO511x14_Tx : rawFIFO511x14
    port map (
      din => RawDataToFIFO,
      wr_en => EN_Write_RAWsamples_Tx,
      wr_clk => SCLK,
      rd_en => EN_Read_Raw_Tx,
      rd_clk => FCLK_G,
      ainit => RESET,
      dout => RawSampleOut_Tx,
      full => RawFIFO_Tx_full,
      empty => RawFIFO_Tx_empty);
		
 
		
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
	  
	 AngPosBy360 : times360
	    port map(
		   clk => FCLK_G,
			a => DataAng(13 downto 0),
			q => DataAngTime360);
			
   my_baud_generator: mod_m_cter
    port map (
    clk =>MCLK,
    reset => RESET,
    max_tick => max_tick,
    q => q_tick
           ); 
			  
	my_uart_tx :uart_tx
  port map (
    clk =>MCLK,
    reset =>RESET,
    tx_start => tx_start,
    s_tick => max_tick, 
    din => DATA_TX,
    tx_done_tick =>tx_done,
    tx => tx
	          );		  

	
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
	 

	 
 
   BUFG1 : BUFG
     port map (
      O => Out1,     -- Clock buffer output
      I => CLK0     -- Clock buffer input
   );

		
	BUFG3 : BUFG
     port map (
      O => TESTCLK,     -- Clock buffer output
      I => CLKFX );
	 
--------------------------------------------------------------
--End Port Map
--------------------------------------------------------------  
 

  process(RESET,MCLK)
  begin
    if RESET = '1' then
      UART_clk      <= '0'; 
    elsif rising_edge(MCLK) then
	   UART_clk <= not(UART_clk );
	end if;
  end process;
  

--------------------------------------------------------------
   
  
  
  DDC_WE  <= write_NCO_Enable and PRFreset;
  DDC_SEL <= write_NCO_Enable and PRFreset;
 -- DDC_WE  <= PRFReset;
 -- DDC_SEL <= PRFReset;
 
 
 -------------------------------------------------------------
--Reading from PC Set PRF Setting
-------------------------------------------------------------
 process(INFIFO_DVALID,FCLK_G)
    begin
	  if (rising_edge(FCLK_G)) then
        if(INFIFO_DVALID(3) = '1') then
          DATA_IN   <= INFIFO1_D;        
			 SetPRF <= INFIFO3_D(28);
          if INFIFO1_D(28) = '1' then
			   PRFSettingvalue <=INFIFO3_D;
			   N_Pulse(7 downto 0) <= INFIFO3_D(15 downto 8);
			   PRFSetting(5 downto 0) <= INFIFO3_D(5 downto 0);	  
				AngMarkSelect <= INFIFO3_D(16);
          end if;		
         	 
		  end if;
	  end if;
  end process; 
 
 -------------------------------------------------------
  --Reading NCO_Word from PC and write until PRF arrival 
  -------------------------------------------------------
  process(INFIFO_DVALID,FCLK_G,PRFreset, reset)
  begin
    if(rising_edge(FCLK_G))then 
	   if (INFIFO_DVALID(2)= '1') then
		  write_NCO <= write_from_PC;
		  NCO_Word <= INFIFO2_D;
		end if;
	   
		case write_NCO is
		  when write_from_PC =>
		      write_NCO_Enable <= '1';
			   write_NCO <= wait_for_PRF;
			
			 
        when wait_for_PRF =>	
		    if (PRFreset = '1') then
			   write_NCO <= finish;
			 else
			   write_NCO <= wait_for_PRF;
			 end if;
			 
		  when finish =>
		    write_NCO_Enable <= '0';
       
        when others => null;		 
          		  
		end case;
    end if;
	 
  end process;
  
  --Reading Stalo word-------------------------
  process(FCLK_G)
  begin
    if rising_edge(FCLK_G) then
	   if INFIFO_DVALID(1) = '1' then
	     Stalo_word <= INFIFO1_D(13 downto 0);
		end if;
	 end if;
  end process;
  
  process(SCLK,Stalo_word )
  begin
  --  if rising_edge(SCLK) then
	   --DAC_A <=  Stalo_word;
		DAC_A <= "11101110101111";
		DAC_B <= "11001110101111";
--	 end if;
  end process;
--  
-------------------------------------------------------------
-------------------------------------------------------------

    DDC_WE  <= write_NCO_Enable and PRFreset;
	 DDC_SEL <= write_NCO_Enable and PRFreset;
    --  DDC_WE  <= PRFreset;
		--DDC_SEL <= PRFreset;

  	SRC_SCLK <= MCLK;  -- internal sample clock source for ADC	
	PULSE_LENGTH <= PRFSetting(0);
   Acquisitionmode <= PRFSetting(5);
	
	NFTS_LIMIT_HIGH <=x"42108";
   NFTS_LIMIT_LOW  <=x"41EB0";
	EN_TRIGGER <= PRFSetting(4);
	PRF <= (PRFout and EN_TRIGGER and enable_Pre_Trigger);
-------------------------------------------------------------
-------------------------------------------------------------
----------------------------------------------------------------
--Generating synchronism
----------------------------------------------------------------
  process(PRFSetting, CHANGE_PRF)
    begin
	   if (PRFSetting(0) = '0') then
		  PRFlimit_value <= x"061A80";   --PL 250 Hz
		--  PreTriggerLimit_value <= PRFlimit_value - x"2710";
		--  PreTriggerLimit_value <= PRFlimit_value - x"157C";
		PreTriggerLimit_value <= PRFlimit_value - x"1964";
		    --PRFlimit_value <= x"0196E6";
		
		 
			
		elsif (PRFSetting(0) = '1' and PRFSetting(1) = '0') then
		  PRFlimit_value <= x"0186A0";    --PC 1000 Hz
		  PreTriggerLimit_value <= PRFlimit_value - x"2710";
		  
                               
      elsif (PRFSetting(0) = '1' and PRFSetting(1) = '1' ) then
        case PRFSetting(3 downto 2) is
          when "00" =>          -- 5/4  800/1000 Hz
			  -- DDC_SAMPLE_LIMIT <= "0011101001011"; -- 1867 samples; 140 Km
			   DDC_SAMPLE_LIMIT <= "0001011100101"; -- 1867 Rx samples- 10 TxSamples = 1857 samples;  140 Km
				--DDC_SAMPLE_LIMIT <= "0011010000010"; --1666 samples; 125 Km 
            if (CHANGE_PRF = '0') then
				  PRFlimit_value <= x"01E848"; --800 Hz
				  PreTriggerLimit_value <= PRFlimit_value - x"2710";
				  
				  
            elsif (CHANGE_PRF ='1') then
				  PRflimit_value <= x"0186A0"; --1000 Hz
				  PreTriggerLimit_value <= PRFlimit_value - x"2710";
				 
            end if;
     		 when "01" =>          --4/3   750/1000 Hz
			--   DDC_SAMPLE_LIMIT <= "0011101001011"; -- 1867 samples; 140 Km
			     DDC_SAMPLE_LIMIT <= "0001011100101"; -- 1867 Rx samples- 10 TxSamples = 1857 samples;  140 Km
				--DDC_SAMPLE_LIMIT <= "0011010000010"; --1666 samples; 125 Km 
            if (CHANGE_PRF = '0') then
              PRFlimit_value <= x"0208D5";  --750 Hz
				  PreTriggerLimit_value <= PRFlimit_value - x"2710";
				 
            elsif (CHANGE_PRF ='1') then
				  PRflimit_value <= x"0186A0";  --1000 Hz
				  PreTriggerLimit_value <= PRFlimit_value - x"2710";
				 
            end if;
          when "10" =>          --3/2   666/1000 Hz			  
            if (CHANGE_PRF = '0') then
              PRFlimit_value <= x"0249F0";     --666 Hz
				  PreTriggerLimit_value <= PRFlimit_value - x"2710";
				  
            elsif (CHANGE_PRF ='1') then
				  PRflimit_value <= x"0186A0";     -- 1000 Hz
				  PreTriggerLimit_value <= PRFlimit_value - x"2710";
				  
            end if;				
          when others =>
			     null; 	
        end case;				  
      end if;
      	  
   end process;	 
   
	process (SCLK) -- Generate the required PRF
   begin 
     if (rising_edge(SCLK)) then
       if (PRFcount > PRFlimit) then
         PRFreset <= '1'; 
         PRFcount <= (others => '0'); 
       else
         PRFreset <= '0'; 
         PRFcount <= PRFcount + 1; 
       end if; 
     end if; 
   end process; 
	
	process (PRFCOUNT) -- Generate the +ve 6 us Trigger Pulse
   begin -- Raise PRFout
    
	  if (PRFCOUNT < x"C8") then
       PRFout <= '1'; 
     else
       PRFout <= '0'; 
     end if; 
   end process;
	
	process (PRFCOUNT) -- Generate the +ve 6 us Trigger Pulse
   begin -- Raise PRFout
     if (PRFCOUNT < x"3E8") then
	    Trigger <= '1'; 
     else
       Trigger <= '0'; 
     end if; 
   end process;
	
	
	
	--Pre Triggers
 process (PRFout,PRFCOUNT)
   begin
     if (PRFCOUNT > x"7530" and PRFCOUNT < x"9C40") then
	     PRE_TRIGGER_1_OUT <= '1'; 
      else
        PRE_TRIGGER_1_OUT <= '0'; 
     end if;	
 end process;
 
 process (PRFout,PRFCOUNT)
   begin
     if (PRFCOUNT > PreTriggerLimit and  PRFCOUNT < PreTriggerLimit+ x"C8") then
	     PRE_TRIGGER_2_OUT <= '1'; 
      else
        PRE_TRIGGER_2_OUT <= '0'; 
     end if;	
 end process;
 
 	 
 process(CHANGE_PRF,rst_enable)
 begin
   if(rst_enable = '1') then 
	   enable_Pre_Trigger1 <= '1';
	elsif (rising_edge(CHANGE_PRF)) then 
	   enable_Pre_Trigger1 <= '0';     		  
	end if;
 end process;
  
  process(CHANGE_PRF,rst_enable)
  begin
    if(rst_enable = '1') then 
	   enable_Pre_Trigger2 <= '1';
	 elsif (falling_edge(CHANGE_PRF)) then 
	   enable_Pre_Trigger2 <= '0';     		  
	 end if;
  end process;
  
  process(PRFout)
  begin
    if(rising_edge(PRFout)) then
	   if(enable_Pre_Trigger = '0') then
		 if TRIGGER_COUNT > "00" then
		   rst_enable <= '1';
			TRIGGER_COUNT <= (others => '0');
		 else
		    TRIGGER_COUNT <= TRIGGER_COUNT + 1;
			rst_enable <= '0';
		 end if;
	   else
		  rst_enable <='0'; 
		end if;
	 end if; 
  end process;
 
  process   
  begin
  if(PRFSetting(0) = '1' and PRFSetting(1) = '1' )then
    enable_Pre_Trigger <= enable_Pre_Trigger1 and enable_Pre_Trigger2;
  else
     enable_Pre_Trigger <= '1';
  end if;   
    
  end process;
  
  process
  begin
    wait until PRFreset = '1';
      PRFlimit <= PRFlimit_value;
		PreTriggerLimit <= PreTriggerLimit_value;
  end process;
  ----------------------------------------para pruebas------------
  
  process(PRFCOUNT,PRFOUT)
  begin
   if(PRFCOUNT > x"2710" and PRFCOUNT <x"30D40") then
	  control_3 <='1';
	else
	  control_3 <='0';
	end if; 
  end process;
  
  
  process(PRFCOUNT,PRFOUT,PRFSetting(0))
  begin
    if (PRFSetting(0) = '0') then
	  if(PRFCOUNT > x"1388" and PRFCOUNT <x"1518") then
	    control_2 <='1';
	  else 
	    control_2 <='0';
	  end if; 
	  
	else
	  if(PRFCOUNT > x"1388" and PRFCOUNT <x"13BA") then
	    control_2 <='1';
	  else 
	    control_2 <='0';
	  end if; 
   end if;
    
 end process;
--------------------------------------------------------------------------
--------------------------------------------------------------------------
--Generating Acq mark-----------------------------------------------------

 process(N_Pulse)
  begin
    
	 N <= unsigned(N_Pulse);
	 if N = x"00" then
	   Antenna_Mov  <= '1';
	 else
	   Antenna_Mov  <= '0';
	 end if;
	 if N > x"02" then 
	   Count_pulse <= N;
	 else
	   Count_pulse <= x"02";
	 end if;
  end process;
  
  process(Antenna_Mov)
  begin
   if Antenna_Mov = '1' then
	  PRF_MARK <= DataAngTime360(13);
	    --PRF_MARK <= DATA_AZ(5);
   else
	  PRF_MARK <= Pulse_Mark; 
   end if;	
  end process;
  
  DUAL_PRF_MODE <= ((DATA_AZ(4) and DATA_AZ(3))) ; 
  

 process(AngMarkSelect)
  begin
    if AngMarkSelect = '0' then
	   DataAng <= DATA_Az;
	 else
      if AngMarkSelect = '1' then 
	     DataAng <= DATA_EL;
	   end if;
	 end if;
  end process;
  
  process( PRFReset,Count_Pulse)
   begin
     if (rising_edge(PRFReset)) then
	    pulsecounter <= pulsecounter + 1;
       control <= not(Pulse_Mark);		 
		  if (pulsecounter = (Count_Pulse -1))  then
		    pulsecounter <= (others => '0');
			 Pulse_Mark <= control;
		  else
		    null;
        end if;
	  end if;
  end process;
  
  process(PRFSetting)
  begin
    PULSE_LENGTH <= PRFSetting(0);
    PRF_RATE <= PRFSetting(3 downto 2);
    if
	   PRFSetting(1) = '0' then
		PRF_RATE_LABEL <= "11";
	 else
	   PRF_RATE_LABEL <= PRF_RATE;
	 end if;  
  end process;  
  
--------------------------------------------------------------
--------------------------------------------------------------   


-------------------------------------------------------------
---Acq state machine-----------------------------------------
------------------------------------------------------------
-- A-D SAMPLING sequence
-------------------------------
 process(PRFout,PRFReset,SCLK)
 begin
 	
	if rising_edge(SCLK) then
	  if PRFReset = '1' then
	     SAMPLEcount <= (others => '0');
		  TxSAMPLINGsequence <= WaitForPulse; 
		  
		  
		
		
   else    
        case TxSAMPLINGsequence is
          when WaitForPulse =>
			   if (PRFout = '1') then     
              E2 <= '1';
				  if RawFIFO_Tx_empty = '1' then 
				     RawDataToFIFO <= (others => '1');
				     EN_Write_RAWsamples_Tx <= '1';
					  
				  end if;
				  TxSAMPLINGsequence <= SampleData; 
				else
				  TxSAMPLINGsequence <= WaitForPulse; 				  
			   end if;
				
			 when SampleData => 
             E1 <= '1';
				--RawDataToFIFO <= "00110000000100";
				if(SampleCount < x"01FF") then 
				  RawDataToFIFO <= ADC;            			  			  
				  SampleCount <= Samplecount +1;
				  EN_Write_RAWsamples_Tx <= '1' and (not RawFIFO_Tx_full); 
				  TxSAMPLINGsequence <= SampleData;
				  
         	else
              EN_Write_RAWsamples_Tx <= '0';
				  SAMPLEcount <= (others => '0');
				  
				  TxSAMPLINGsequence <= WaitForEnd;
				end if;
				when WaitForEnd =>
			     E1 <= '0';
				  E2 <= '0';
				  EN_Write_RAWsamples_Tx <= '0';
				  SAMPLEcount <= (others => '0');
		        TxSAMPLINGsequence <= WaitForPulse;
				  --IQ_FIFO_WR_EN <= '0';
			 when others => null;
		  end case;
            		  
		  
	  end if;
	end if;
 end process;
--------------------------------------------------------------------
--End A-D SAMPLING sequence
-------------------------------------------------------------  
 

   
 ---------------------------------------------------------------------------------------------------- 
 --Meta Data Packet 
 ---------------------------------------------------------------------------------------------------
  
  process(FCLK_G,PULSE_LENGTH,PRF_MARK,PRF_RATE_LABEL,DDC_RDY)
  begin
    if( rising_edge(FCLK_G) ) then 
      
      if(PRFReset = '1') then 
        OUTFIFO_DIN                     <= '0' & "1111111111111111111111111111111"; 
        OUTFIFO_WR_EN                   <= '1' and (not OUTFIFO_FULL); 
		  Count_TxSample <= (others => '0');
		  Count_RxSample <= (others => '0');
        Packing_sequence                <= TagAzEl; 
       -- I_ND <='0';
      --  Q_ND <='0';
        E5 <= '0';
		  E6 <= '0';
		  E7 <= '0';
      else
        
        case Packing_sequence is 
           
          when TagAzEl =>  
            
              
				
            OUTFIFO_DIN(31)             <= PULSE_LENGTH ; 
				--OUTFIFO_DIN(31)             <= '0';
            OUTFIFO_DIN(30)             <= PRF_MARK; 
				--OUTFIFO_DIN(30)             <= '0'; 
			   OUTFIFO_DIN(29 downto 16)   <= DATA_AZ(13 downto 0);
			 --   OUTFIFO_DIN(29 downto 16)   <= (others => '0');
				-- OUTFIFO_DIN(29 downto 16)   <= DATA_Az_update(13 downto 0);
				 --OUTFIFO_DIN(29 downto 16)   <= DATA_Az(13 downto 0);
				--OUTFIFO_DIN(29 downto 16)   <= CONN_A_IN(13 downto 0);
            OUTFIFO_DIN(15 downto 14)   <= PRF_RATE_LABEL(1 downto 0); 
				--OUTFIFO_DIN(15 downto 14)   <= "00"; 
			   OUTFIFO_DIN(13 downto 0)    <= (DATA_EL(13 downto 0)); 
				--OUTFIFO_DIN(13 downto 0)    <= "00000000000001"; 
            OUTFIFO_WR_EN <= '1';
            
  			   
				if(PULSE_LENGTH = '0' ) then   -- Long pulse mode
              Packing_sequence          <= DoLP; 
            elsif (PULSE_LENGTH = '1') then  -- Short pulse mode 
              Packing_sequence          <= DoSP; 
            end if; 
            
				--I_ND <='0';
            --Q_ND <='0';
         				     
		 	 
			 when DoSP => 
		     E5 <= '0'; 
           E6 <= '1';
				OUTFIFO_DIN                 <= INFIFO0_D;
				--OUTFIFO_DIN                 <= (others => '0');
				OUTFIFO_WR_EN               <= INFIFO_DVALID(0) and (not OUTFIFO_FULL); 
				if OUTFIFO_WR_EN = '1' then
				   Count_RxSample <= Count_RxSample +1;
					--control_2 <= '1';
				end if;
				if Count_RxSample < x"74C" then
				  Packing_sequence          <=   DoSP;
				else
              OUTFIFO_WR_EN               <= '0';
				  Packing_sequence          <= DoNothing;
  				
				end if;
				 
				
          when DoLP =>  
            E5 <= '0';
          	E6 <= '1';
				OUTFIFO_DIN                 <= INFIFO0_D;
				OUTFIFO_WR_EN               <= INFIFO_DVALID(0) and (not OUTFIFO_FULL); 
				if OUTFIFO_WR_EN = '1' then
				   Count_RxSample <= Count_RxSample +1;
				end if;
				if Count_RxSample < x"684" then
				  Packing_sequence          <=   DoLP;
				else
              OUTFIFO_WR_EN               <= '0';
				  Packing_sequence          <= DoNothing;
  				
				end if;
--				 
			 when   DoNothing =>
             OUTFIFO_WR_EN               <= '0';
				 Count_TxSample <= (others => '0');
		       Count_RxSample <= (others => '0');
              E5  <= '0';
		        E6  <= '0';
				  E7  <= '1';
				 
          when others => NULL; 
        end case; 
      end if; 
    end if; 
  end process;  
  
--------------------------------------------------------------------------------------------------
--SSI
-------------------------------------------------------------------------------------------------- 
   process(MCLK)
	begin
	 if rising_edge(MCLK) then
	   if SSI_clk_counter > x"0FA"  then
		  SSI_clk1 <= '1';
		  SSI_clk_counter <= (others => '0');
		else
		  SSI_clk1 <= '0';
		  SSI_clk_counter <= SSI_clk_counter +1; 
		end if;
	 end if;
	end process;
	
	process(SSI_clk1)
	begin
	  if RESET = '1' then
	    SSI_mclk <= '0';
	  elsif rising_edge(SSI_clk1) then 
	    SSI_mclk <= not(SSI_mclk);
     end if;		 
	end process;
	
	process(SSI_mclk, RESET)
	  begin
	    if RESET = '1' then
         SSI_clk      <= '0'; 
       elsif rising_edge(SSI_mclk) then
        SSI_clk      <= not SSI_clk; 
	    end if;  
	end process;
	
  SSI_clk2 <= (not(SSI_mclk) and SSI_clk); 
  
  
  process(MCLK, RESET,SSI_clk2 )
  begin
    if rising_edge(SSI_clk2 ) then  
      --if RESET = '1' then 
       -- counter1 <= (others =>'0');
	   --  counter2 <= (others =>'0');
		--  SSI_sequence <= clk_off;
	   --  SSI_clk_En <= '0';
		--else
                 --if rising_edge(SSI_clk) then
	   case SSI_sequence is 
		 
	     when  clk_off =>
		    c1 <= '0';
			  
	       if counter1 > x"28" then
		      SSI_clk_En <= '1';
		      counter1 <= (others => '0');
			   SSI_sequence <= clk_on;
								
		    else
		      counter1 <= counter1 +1;
			   SSI_clk_En <= '0';
			   SSI_sequence <= clk_off;
		    end if;
		 
	    
	     when  clk_on =>
		    c1 <='1';
	       if counter2 > x"D" then
		      SSI_clk_En <= '0';
			   counter2 <= (others => '0');
			   SSI_sequence <= clk_off;
		    else
		      SSI_clk_En <= '1';
			   counter2 <= counter2 + 1;
			   SSI_sequence <= clk_on;
		    end if;
	  
	  
	      when others => NULL;
	  
	    end case; 
	   

	end if;
  
  end process; 
  
   SSI_clk_ext <=(not(not(SSI_clk) and SSI_clk_En));
  SSI_clk_int <=(not(not (SSI_clk2) and SSI_clk_En));
  load   <= not(SSI_clk_En);
  -------esto de aqui
  --SSI_data <= CONN_C_IN(0); 
  --SSI_data_Az <= CONN_A_IN(1); Hay qe arreglar esto
  --SSI_data_El <= CONN_A_IN(2);
  ----CONN_A_OUT(0) <= SSI_clk_ext;
  ----------------------------------------
  
  --- Code for tx serial RS 232---------------------------
  process(counter1)
  begin
    if counter1 > x"01" then
	   DT <= '1';		
	 else
	   DT <= '0';
	 end if;
  end process;
  
  ini_DT <= load and(not(DT));
  
  process(MCLK, RESET, ini_DT)
  begin
    if RESET = '1' then
	   count1 <= (others => '0');
	   count2 <= (others => '0');
	   count3 <= (others => '0');
		Serial_Tx_sequence <= wait_to_Tx;
    else
	   if rising_edge( SSI_clk2) then
		  case  Serial_Tx_sequence is
		    when wait_to_Tx =>
			   if ini_DT = '1' then 
				  tx_start <= '0';
				  Serial_Tx_sequence <= Az_Low;
				else
              Serial_Tx_sequence <= wait_to_Tx;				
				end if;
			 when Az_Low  => 
--			   DATA_TX(0) <= '1';
--	         DATA_TX(1) <= '1';
--	         DATA_TX(2) <= '1';
--	         DATA_TX(3) <= '1';
--	         DATA_TX(4) <= '1';
--	         DATA_TX(5) <= '1';
--	         DATA_TX(6) <= '1';
--            DATA_TX(7) <= '1';
            DATA_TX(7) <= '0';
				DATA_TX(6 downto 0) <= (DATA_AZ(6 downto 0));
			   tx_start <= '1';
			   if count1 > x"1" then 
				  tx_start <= '0'; 
				  
				 else
				  count1 <= count1 + 1;
				end if;
				if count2 > 8 then
				  Serial_Tx_sequence <= Az_High;
				  count2 <= (others => '0');
				  count1 <= (others => '0');
				else
				  count2 <= count2 + 1;
				end if;
			 when Az_High =>
			   tx_start <= '1';
--			   DATA_TX(0) <= '1';
--	         DATA_TX(1) <= '1';
--	         DATA_TX(2) <= '1';
--	         DATA_TX(3) <= '1';
--	         DATA_TX(4) <= '1';
--	         DATA_TX(5) <= '1';
--	         DATA_TX(6) <= '1';
            DATA_TX(7) <= '0';
    			DATA_TX(6 downto 0) <= (DATA_AZ(13 downto 7));
            if count1 > x"1" then 
				  tx_start <= '0'; 
				  
				 else
				  count1 <= count1 + 1;
				end if;
				if count2 > 8 then
				  Serial_Tx_sequence <= El_Low;
				  count2 <= (others => '0');
				  count1 <= (others => '0');
				else
				  count2 <= count2 + 1;
				end if;
				  
				
	       when El_Low =>
			   
			   tx_start <= '1';
--			   DATA_TX(0) <= '1';
--	         DATA_TX(1) <= '1';
--	         DATA_TX(2) <= '1';
--	         DATA_TX(3) <= '1';
--	         DATA_TX(4) <= '1';
--	         DATA_TX(5) <= '1';
--	         DATA_TX(6) <= '1';
	         DATA_TX(7) <= '1';
				DATA_TX(6 downto 0) <= not(DATA_EL(6 downto 0));
            if count1 > x"1" then 
				  tx_start <= '0'; 
				  
				 else
				  count1 <= count1 + 1;
				end if;
				if count2 > 8 then
				  Serial_Tx_sequence <= El_High;
				  count2 <= (others => '0');
				  count1 <= (others => '0');
				else
				  count2 <= count2 + 1;
				end if; 
			 
	       when El_High =>
			  
			   tx_start <= '1';
--			   DATA_TX(0) <= '1';
--	         DATA_TX(1) <= '1';
--	         DATA_TX(2) <= '1';
--	         DATA_TX(3) <= '1';
--	         DATA_TX(4) <= '1';
--	         DATA_TX(5) <= '1';
--	         DATA_TX(6) <= '1';
	         DATA_TX(7) <= '1';
				DATA_TX(6 downto 0) <= not(DATA_EL(13 downto 7));
            if count1 > x"1" then 
				  tx_start <= '0'; 
				  
				 else
				  count1 <= count1 + 1;
				end if;
				if count2 > 8 then
				  Serial_Tx_sequence <= wait_to_Tx;
				  count2 <= (others => '0');
				  count1 <= (others => '0');
				else
				  count2 <= count2 + 1;
				end if; 
			    
	 
			 when others => NULL;
		  
		  end case; 
		end if;
	 
	 
	 
	 end if;
  
  end process;
  
  process(SSI_clk_int)
  begin
    if rising_edge(SSI_clk_int) then 
      shift_reg_Az <= shift_reg_Az(12 downto 0) & (SSI_data_Az);
		shift_reg_El <= shift_reg_El(12 downto 0) & (SSI_data_El);
	 end if;
  end process;
  
  process(load)
  begin
    if rising_edge(load) then
	   DATA_Az_gray <= '0'& shift_reg_Az;
		DATA_El_gray <= '0'& shift_reg_El;
	 end if;
  end process;
  
    T1IN <= tx;  
  
------------------------------------------------------------------------
------------------------------------------------------------------------
--Gray to bin

process(DATA_Az_gray,DATA_El_gray)
  begin
    --if (rising_edge(MCLK)) then
	   DATA_AZ(13) <= DATA_Az_gray(13);
		DATA_Az(12) <= DATA_Az(13) XOR  DATA_Az_gray(12);
		DATA_AZ(11) <= DATA_Az(12) XOR  DATA_Az_gray(11);
		DATA_AZ(10) <= DATA_Az(11) XOR  DATA_Az_gray(10);
		DATA_AZ(9)  <= DATA_Az(10) XOR  DATA_Az_gray(9);
		DATA_AZ(8)  <= DATA_Az(9)  XOR  DATA_Az_gray(8);
		DATA_AZ(7)  <= DATA_Az(8)  XOR  DATA_Az_gray(7);
		DATA_AZ(6)  <= DATA_Az(7)  XOR  DATA_Az_gray(6);
		DATA_AZ(5)  <= DATA_Az(6)  XOR  DATA_Az_gray(5);
		DATA_AZ(4)  <= DATA_Az(5)  XOR  DATA_Az_gray(4);
		DATA_AZ(3)  <= DATA_Az(4)  XOR  DATA_Az_gray(3);
		DATA_AZ(2)  <= DATA_Az(3)  XOR  DATA_Az_gray(2);
		DATA_AZ(1)  <= DATA_Az(2)  XOR  DATA_Az_gray(1);
		DATA_AZ(0)  <= DATA_Az(1)  XOR  DATA_Az_gray(0);
		
		DATA_EL(13) <= DATA_EL_gray(13);
		DATA_EL(12) <= DATA_EL(13) XOR  DATA_EL_gray(12);
		DATA_EL(11) <= DATA_EL(12) XOR  DATA_EL_gray(11);
		DATA_EL(10) <= DATA_EL(11) XOR  DATA_EL_gray(10);
		DATA_EL(9)  <= DATA_EL(10) XOR  DATA_EL_gray(9);
		DATA_EL(8)  <= DATA_EL(9)  XOR  DATA_EL_gray(8);
		DATA_EL(7)  <= DATA_EL(8)  XOR  DATA_EL_gray(7);
		DATA_EL(6)  <= DATA_EL(7)  XOR  DATA_EL_gray(6);
		DATA_EL(5)  <= DATA_EL(6)  XOR  DATA_EL_gray(5);
		DATA_EL(4)  <= DATA_EL(5)  XOR  DATA_EL_gray(4);
		DATA_EL(3)  <= DATA_EL(4)  XOR  DATA_EL_gray(3);
		DATA_EL(2)  <= DATA_EL(3)  XOR  DATA_EL_gray(2);
		DATA_EL(1)  <= DATA_EL(2)  XOR  DATA_EL_gray(1);
		DATA_EL(0)  <= DATA_EL(1)  XOR  DATA_EL_gray(0);
	-- end if;	
	   
	
  end process;
  -----------------------------------------------------
---------------------------------------------------------  
 
  -------------------------------------------------------
--OUTPUT state machine.
-------------------------------------------------------	 
  process(FCLK_G,RESET)  -- OUTPUT state machine.
  begin
    if rising_edge(FCLK_G) then
	 
	   if write_NCO_Enable ='1' then 
		  OUTPUTsequence <= output_SetNCO;
		else
		  OUTPUTsequence <= output_TxBurst;
		end if; 
		  
	   case OUTPUTsequence is
		   when output_SetNCO =>
		    OUTFIFO_WRITE(2) <= OUTFIFO_READY(2);
			 OUTFIFO_D  <= NCO_Word;
			 OUTFIFO_WRITE(0) <= '0';
			 OUTFIFO_WRITE(1) <= '0';
		
		   
		  when output_TxBurst =>
		    
		    EN_Read_Raw_Tx <= OUTFIFO_READY(1) and (not RawFIFO_Tx_empty);
		   -- EN_Read_Raw_Tx <= '0';
			 OUTFIFO_WRITE(1) <= OUTFIFO_READY(1) and (not RawFIFO_Tx_empty);
			 OUTFIFO_D      <= RawSampleOut_Tx & "000000000000000000";
			 OUTFIFO_WRITE(0) <= '0'; 
			 OUTFIFO_WRITE(2) <= '0'; 
			 OUTFIFO_RD_EN <= '0';
			
			 
			 OUTPUTsequence <= output_IQ;
			 
			 
		  when output_IQ => 
		    OUTFIFO_RD_EN    	<= OUTFIFO_READY(0) AND (NOT OUTFIFO_EMPTY );
			 OUTFIFO_WRITE(0) 	<=	OUTFIFO_READY(0) AND (NOT OUTFIFO_EMPTY );
			 OUTFIFO_D        	<= OUTFIFO_DOUT; 
			  --OUTFIFO_D        	<= (others => '0');
			  OUTFIFO_WRITE(1) <= '0';
			  EN_Read_Raw_Tx   <= '0';
			  OUTFIFO_WRITE(2) <= '0'; 
			 --OUTPUTsequence <= output_TxBurst;  		    
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

--UMI_OUT---------------------------------------------------
  UMI_OUT(0) <= PRFout;
  UMI_OUT(1) <= PRFReset;
  UMI_OUT(2) <= PULSE_LENGTH;
  
  
	 
 
  
 

-----------------------------------------------------

  
-----------------------------------------------------


 
------------------
--Outputs  
------------------ 

  DIO_OUT(0) <=  Trigger;
  -- DIO_OUT(0) <=  PRFout or control_2 or control_3;
-- DIO_OUT(1) <=  PRFout or control_2 or control_3;
 --DIO_OUT(1) <= '1';
 DIO_OUT(1)  <= (PRE_TRIGGER_2_OUT and EN_TRIGGER and enable_Pre_Trigger);
 DIO_OUT(2) <= (PULSE_LENGTH);
 --  DIO_OUT(1) <= E1;
--	DIO_OUT(2) <= E2;
  -- DIO_OUT(3) <= E2;
	DIO_OUT(5) <=  SSI_clk_ext;
	SSI_data_Az <= ( DIO_IN(6));
	SSI_data_El <= ( DIO_IN(7));
	
	  -----------------------------------------------------
		 
end ADC;  

