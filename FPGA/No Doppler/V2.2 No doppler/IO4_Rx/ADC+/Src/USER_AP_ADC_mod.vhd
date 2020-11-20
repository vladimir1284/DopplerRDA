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
--	 2.0		R. Naranjo       19/05/09	Cuba version for S Band  ( Master )	   
--  2.1     R. Naranjo       06/05/14  Write NCO Word x Trigger
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
  constant                                                                                                                                         VIRTEX2_ES                                                                                                                            :     boolean := false; 
  
  -- OSCILLATOR CLOCK DIVISION
  -- To divide oscillator clock by 2, set DIV2_FCLK = TRUE
  constant                                                                                                                                       DIV2_FCLK                                                                                                                             :     boolean := false; 
  
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
  constant                                                                                             FCLK_G_DOMAIN                                                                                                                         :     boolean := true; 
  
                                        -- When read/write FIFO clock frequency > 60 MHz, set HIGH_FCLK_G = TRUE
                                        -- This constant is used only when FCLK_G_DOMAIN = TRUE
  constant                                                                                            HIGH_FCLK_G                                                                                                                           :     boolean := true; 
  
                                        -- When read FIFO clock frequency > 60 MHz, set HIGH_FCLK_RD = TRUE
                                        -- This constant is used only when FCLK_G_DOMAIN = FALSE
  constant                                               HIGH_FCLK_RD                                                                                                                          :     boolean := false; 
  
                                        -- When write FIFO clock frequency > 60 MHz, set HIGH_FCLK_WR = TRUE
                                        -- This constant is used only when FCLK_G_DOMAIN = FALSE
  constant                                                HIGH_FCLK_WR                                                                                                                          :     boolean := false; 
  
                                        -- ADC CLOCK
                                        -- =========
  
                                        -- To drive the ADC sample clock from a signal inside the FPGA set INTERNAL_SCLK = TRUE
                                        -- to use an external sample clock, set INTERNAL_SCLK = FALSE
  constant INTERNAL_SCLK                                                                                                                         :     boolean := true; 
  
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
  signal MhzCount    : unsigned(19 downto 0); -- 2 Mhz period counter value
  signal LogClk        : std_logic;
  signal clk_D       : std_logic;
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
  signal PULSE_LENGTH  : std_logic; -- Select Long or Short pulse
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
  signal SAMPLEcount : unsigned(9 downto 0); 
  signal SAMPLEint : signed(13 downto 0); 
  signal RAWsamples : std_logic_vector(13 downto 0); 
  signal EN_RAWsamples : std_logic := '0'; 
  signal EN_WriteRAW : std_logic; 
  signal EN_ReadRAW : std_logic; 
  signal RawDataToFIFO : std_logic_vector(13 downto 0); 
  signal RawFIFO_empty : std_logic; 
  signal RawFIFO_full : std_logic; 
  signal RawSampleOut : std_logic_vector(13 downto 0); 
  signal CurrentAzEL : std_logic_vector(31 downto 0); 
  
  signal DDC_RDY : std_logic; 
  signal DDC_RFD : std_logic; 
  signal DDC_ND : std_logic; 
  signal DDC_I_OUT : std_logic_vector(29 downto 0); 
  signal DDC_Q_OUT : std_logic_vector(29 downto 0); 
  
  signal DDCcount : unsigned(12 downto 0); 
  
  signal DDC_DATA_IN : std_logic_vector(13 downto 0); 
  signal DDC_WE : std_logic; 
  signal DDC_SEL : std_logic; 
  signal NCO_Word :std_logic_vector(31 downto 0); 
  signal  write_NCO_enable :std_logic;
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
  
  
  ----------------------------------------
  
  
  type sampling_sequence_type is (
    WaitForPulse, 
    SampleData, 
	 DontSamplePulse,
    WaitForEnd
    ); 
  
  type output_sequence_type is (
    output_iq, 
    output_raw,
    output_noise
    ); 
    	 
   type write_NCO_type is(
	 write_from_PC,
	 wait_for_PRF,
	 finish
	 );
	 
  signal SAMPLINGsequence : sampling_sequence_type; 
  signal OUTPUTsequence : output_sequence_type; 
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
  
  component rawfifo255x14
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
    -- Drive unused signals
  
--  DIO_OUT(7 downto 3) <= (others => '0'); 
--  DIO_EN(7 downto 3) <= (others => '1'); 
  DIO_EN(7 downto 0) <= (others => '0');  
  
  -- UMI_OUT(3 downto 2) <= (others => '0'); 
  --UMI_EN(3 downto 2) <= (others => '1'); 
  UMI_EN(0) <= '0'; 
  UMI_EN(1) <= '0'; 
  UMI_EN(2) <= '1';
  UMI_EN(3) <= '0';
   -- UMI_EN(1) <= '0';  
  
  CLKOUT <= SCLK; 
  
  DTTL <= '0'; 
  T1IN <= '0'; 
  T2IN <= '0'; 
  RS485_232 <= '0'; 
  HDPLX <= '0'; 
  FAST <= '0'; 
  
 -- General purpose GCLKs (not used in this example) 
  
  SRC_GCLK_A <= '0'; 
  SRC_GCLK_B <= '0'; 
  
-------------------------------------------------------------
-- FIFOs
  
  SRC_FCLK_RD <= '0';  -- clock source for READ FIFO
  SRC_FCLK_WR <= '0';  -- clock source for WRITE FIFO
  SRC_FCLK_G <= MCLK;  -- global clock source for both FIFOs
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
      CLK => SCLK,
      ADDR => "00110",
	  --LD_DIN => INFIFO0_D ,
		--LD_DIN => NCO_Word,
		LD_DIN => x"4CCCCCCD",
      WE => DDC_WE,
      SEL => DDC_SEL,
      DOUT_I => DDC_I_OUT,
      DOUT_Q => DDC_Q_OUT);
		
	iq_out_fifoI : iq_out_fifo
    port map (
      din => IQ_FIFO_DATA_IN,
      wr_en => IQ_FIFO_WR_EN,
      wr_clk => SCLK,
      rd_en => IQ_FIFO_RD_EN,
      rd_clk => FCLK_G,
      ainit => RESET,
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
		
		iRawFIFO511x14 : rawFIFO511x14
    port map (
      din => RawDataToFIFO,
      wr_en => EN_RAWsamples,
      wr_clk => MCLK,
      rd_en => EN_WriteRaw,
      rd_clk => FCLK_G,
      ainit => RESET,
      dout => RawSampleOut,
      full => RawFIFO_full,
      empty => RawFIFO_empty);
		
		
		
		
	iBUFG  : bufg 
	port map(I => control, O => control_buf); 	
	
	 LED0 : LED_CNTR
    port map (
      FCLK_G => FCLK_G, 
      FF => RawFIFO_full, 
      LED_ON => LED(0)
      ); 
                                        --LED(0)<= NOT RawFIFO_Full;
  
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
--------------------------------------------------------------
--End Port Map
--------------------------------------------------------------  
  
  
------------------------------------------------------------
-- A-D SAMPLING sequence
-------------------------------
  
  SRC_SCLK <= MCLK;  -- internal sample clock source for ADC
 
  process(SCLK,ADC,PRFreset,PRFout)  -- Sampling state machine.
  begin   
    if( rising_edge(SCLK)) then
      if( PRFreset = '1')then
        SAMPLEcount <= (others => '0');  -- Set up 
		  control_1 <= '1';
		  --control_2 <= '0';
		  --control_3 <= '0';
        SAMPLINGsequence <= WaitForPulse; 
        DDC_ND <= '0'; 
        DDC_DATA_IN <= (others => '0'); 
		 -- DDC_DATA_IN <="00000000000001";
        DDCCount <= (others =>'0');
      else  
        case SAMPLINGsequence is
          
          when WaitForPulse => 
            DDCCount <= (others =>'0');
            EN_RawSamples <= '0'; 
            
            DDC_DATA_IN <= (others => '0'); 
              --if( (signed(ADC) > x"50") or ( (-signed(ADC)) > x"50")) then
            --if( (signed(ADC) > x"400") or ( (-signed(ADC)) > x"400")) then --Como los ingleses
				case Acquisitionmode is
              when '0' => 				
				    --if (signed(ADC) > x"200") or ( (-signed(ADC)) > x"200")  then
					 if (PRF= '1') then
				      if( RawFIFO_empty ='1')then 
					     RawDataToFIFO <= (others => '1');
						  SAMPLINGsequence <= SampleData;  -- If detect outgoing pulse start sampling
                    EN_RAWsamples <= '1';  --Clock data tag into raw fifo
						else
						  SAMPLINGsequence <= DontSamplePulse; 
						end if;
				    end if;
				  when '1' =>  
				    if (PRF ='1') then
					  --if ((signed(ADC) > x"200") or ( (-signed(ADC)) > x"200"))  then
				      if( RawFIFO_empty ='1')then  
					     RawDataToFIFO <= (others => '1');
                    SAMPLINGsequence <= SampleData;  -- If detect outgoing pulse start sampling
                    EN_RAWsamples <= '1';  --Clock data tag into raw fifo
                    --RawDataToFIFO <= (others => '1');
					   else
				        SAMPLINGsequence <= DontSamplePulse;  
                	end if;
			  		 end if; 
				  when others => NULL;
				end case;
            
          when SampleData => 
             --control_1 <= '1';
				 --control_2 <= '1';
				 --control_3 <= '0';
--				SAMPLERawData <= '1';
            if(DDC_RDY='1')then
              DDCCount <= DDCcount+1;
            end if;
            
            DDC_DATA_IN <= ADC;
            DDC_ND <= '1' and DDC_RFD;
            
            RawDataToFIFO <= ADC; 
				--RawDataToFIFO <= "00111100001111";
            
            if(SampleCount < x"1FF") then 
				  
              SampleCount <= Samplecount +1; 
              EN_RAWsamples <= '1' and (NOT RawFIFO_full); 
				  
            else
              EN_RAWsamples <= '0'; 
				  --control_1 <= '0';
            end if; 
            
            if(DDCCount >= DDC_SAMPLE_LIMIT )then 
				  --control_2 <= '0';
              SAMPLINGsequence <= WaitForEnd; 
            end if; 
          
			 when DontSamplePulse =>
			   --control_3 <= '1';
			   if(DDC_RDY='1')then
              DDCCount <= DDCcount+1;
            end if;
      
            DDC_DATA_IN <= ADC;
            DDC_ND <= '1' and DDC_RFD;
              
            if(DDCCount >= DDC_SAMPLE_LIMIT )then 
				  --control_3 <= '0';
              SAMPLINGsequence <= WaitForEnd; 
            end if; 
			   
          when WaitForEnd => 
--    			SAMPLERawData <= '0';
            DDC_DATA_in <= (others => '0'); 
            --if(DDCCount >= (DDC_SAMPLE_LIMIT + x"40") ) then 		  -- Or up 0x60 
              DDC_ND <= '0'; 
				  control_1 <= '0';
            --else
              --DDC_ND <= '1';  
            --end if; 
            
--            if(DDC_RDY='1')then
--              DDCCount <= DDCcount+1;
--            end if;
            
          when others => NULL;

        end case; 
      end if; 
    end if; 
  end process; 
  
--------------------------------------------------------------------
--End A-D SAMPLING sequence
-------------------------------------------------------------  
   -------------------------------
  --Reading NCO_Word from PC and write until PRF arrival 
  -------------------------------
--  process(INFIFO_DVALID,FCLK_G)
--  begin
--   if(rising_edge(FCLK_G))then
--	  if (INFIFO_DVALID(0)= '1') then 
--	    NCO_Word <= INFIFO0_D;  
--	  end if;
--	end if;
--  end process;
--  
--  DDC_WE <= PRFreset; 
--  DDC_SEL <= PRFreset;

process(INFIFO_DVALID,FCLK_G,PRFreset, reset)
  begin
    if(rising_edge(FCLK_G))then 
	   if (INFIFO_DVALID(0)= '1') then
		  write_NCO <= write_from_PC;
		  NCO_Word <= INFIFO0_D;
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

   -- DDC_WE  <= write_NCO_Enable and PRFreset;
	-- DDC_SEL <= write_NCO_Enable and PRFreset;
      DDC_WE  <= PRFreset;
		DDC_SEL <= PRFreset;
  -------------------------------
  
--  DDC_WE  <= INFIFO_DVALID(0); 
--  DDC_SEL <= INFIFO_DVALID(0); 
  --INFIFO_READ_REQ <= "000011"; 
  INFIFO_READ_REQ(0) <= '1';
  INFIFO_READ_REQ(3) <= '1';
  OUTFIFO_WRITE(0)<='0';  	
  OUTFIFO_WRITE(3)<='0';  
  OUTFIFO_WRITE(4)<='0';		
  OUTFIFO_WRITE(5)<='0'; 
  
  
  
--  SCLK_DAC_A <= NOT(DDC_RDY); 
--  SCLK_DAC_B <= NOT(DDC_RDY);  
  
  I_TO_INTEGER:process(DDC_I_OUT)--,SCLK)   
  begin                   
--   if(rising_edge(SCLK) )then 
    if DDC_I_OUT(6)='1' then
      IQ_FIFO_DATA_IN(31 downto 16)<=  STD_LOGIC_VECTOR(SIGNED(DDC_I_OUT(22 downto 7))+1);
    else
      IQ_FIFO_DATA_IN(31 downto 16)<=DDC_I_OUT(22 downto 7);  
--   end if;
    end if;             
    
  end process;  
  
  Q_TO_INTEGER:process(DDC_Q_OUT) --,SCLK) --http://groups.google.co.uk/groups?q=rounding+vhdl&hl=en&lr=&selm=3D633E90.F65F9DB6%40comsys.ntu-kpi.kiev.ua&rnum=3
  begin                  
                                        -- if(rising_edge(SCLK) )then
    if DDC_Q_OUT(6)='1' then
      IQ_FIFO_DATA_IN(15 downto 0)<= STD_LOGIC_VECTOR(SIGNED(DDC_Q_OUT(22 downto 7))+1);
    else
      IQ_FIFO_DATA_IN(15 downto 0)<=DDC_Q_OUT(22 downto 7);  
    end if;
                                        --	end if;              
  end process;  

--Para probar------------------------------
--process(PRE_TRIGGER_1_OUT)
--begin
--  if PRE_TRIGGER_1_OUT = '1' then
--    IQ_FIFO_DATA_IN(31 downto 16) <= x"000A";
--    IQ_FIFO_DATA_IN(15 downto 0)<= x"0003";
--  else
--    IQ_FIFO_DATA_IN(31 downto 16) <= x"0000";
--	 IQ_FIFO_DATA_IN(15 downto 0)<= x"0000";
--  end if;
--end process;

----------------------------------------------


  
  IQ_FIFO_WR_EN <= DDC_RDY AND (NOT IQ_OUT_FULL );
  
--  DAC_B(12 downto 0) <= DDC_I_OUT(22 downto 10); 
--  DAC_B(13) <= (not DDC_I_OUT(29)); 
  
  
--  DAC_A(12 downto 0) <= DDC_Q_OUT(22 downto 10); 
--  DAC_A(13) <= (not DDC_Q_OUT(29)); 

-------------------------------------------------------
--OUTPUT state machine.
-------------------------------------------------------	 
	  
  process(FCLK_G,RESET)  -- OUTPUT state machine.
  begin 
    if(rising_edge(FCLK_G))then
      case OUTPUTsequence is
        when output_iq => 
          IQ_FIFO_RD_EN    	<= OUTFIFO_READY(2) AND (NOT IQ_OUT_EMPTY);
          OUTFIFO_D        	<= IQ_FIFO_OUT; 
			 --OUTFIFO_D        	<= x"000A0003";
          OUTFIFO_WRITE(2) 	<=	OUTFIFO_READY(2) AND (NOT IQ_OUT_EMPTY);
			 --control_1 <= '1';
			 --control_2 <= '0';
          OUTPUTsequence   	<= output_raw;	
	       OUTFIFO_WRITE(1) 	<= '0';
		    EN_WriteRaw      	<= '0';	
			 
        when output_raw => 
          IQ_FIFO_RD_EN    	<= '0';
          OUTFIFO_WRITE(2) 	<= '0'; 
          EN_WriteRaw      	<= OUTFIFO_READY(1) AND (NOT RawFIFO_empty);  -- if data and output ready.
          OUTFIFO_WRITE(1) 	<= OUTFIFO_READY(1) AND (NOT RawFIFO_empty);  -- if data and output ready.
          OUTFIFO_D        	<=   RawSampleOut & "000000000000000000" ; 
			 
			 --control_1 <= '0';
			 --control_2 <= '1'; 
			
          OUTPUTsequence   	<= output_IQ;
        when others => NULL;
      end case;
    end if;
  end process; 
------------------------------------------------------------
--End OUTPUT state machine.  
-------------------------------------------------------------
-- DAC
  
-- SCLK_DAC_A <= FCLK_G;  -- clock of DAC_A
-- SCLK_DAC_B <= FCLK_G;  -- clock of DAC_B
  
-------------------------------------------------------------
-- LED flasher 
------------------------------------------------------------- 
  process(RESET, SCLK)
  begin
    if RESET = '1' then
      LEDcount <= (others => '0'); 
    elsif rising_edge(SCLK) then
      LEDcount <= LEDcount + 1; 
    end if; 
  end process; 
  
  LED(4) <= LEDcount(24); 
  
                                        -- Drive LEDs high (inactive)
  LED(1) <= '1'; 
  LED(3) <= (NFTS_trigger); 
  
 
-------------------------------------------------------------
-- End LED flasher 
-------------------------------------------------------------   
---------------------------------------------------------------
-- PRF pulse generator
---------------------------------------------------------------
   CHANGE_PRF <= '0';                   --Change PRF Order
	PRFSetting(0) <= UMI_IN(2);
	PRFSetting(5) <= '1';
	PRFSetting(1) <= '0';
	PRFSetting(3 downto 2) <= "11";
	
--	process(FCLK_G,INFIFO_DVALID(3),INFIFO3_D)
--    begin 
--	   if(rising_edge(SCLK)) then
--		  if (INFIFO_DVALID(3) = '1') then
--		    DATA_IN <= INFIFO3_D;
--		  end if;
--      end if;
--   end process;
	
--	process(SCLK)
--	begin
--	  if(rising_edge(SCLK)) then
--	    PRFSetting <= DATA_IN(5 downto 0);
--	  end if;
--	end process;
  
  -- PRFSetting <= DATA_IN(3 downto 0);
  process
    begin
	   wait until PRFreset = '1';
        PRFlimit <= PRFlimit_value;
		  PreTriggerLimit <= PreTriggerLimit_value;
    end process;
	 
	 PULSE_LENGTH <= PRFSetting(0);
    Acquisitionmode <= PRFSetting(5);
 
   process(PRFSetting, CHANGE_PRF)
    begin
	   if (PRFSetting(0) = '0') then
		  PRFlimit_value <= x"061A80";   --PL 250 Hz
		  PreTriggerLimit_value <= PRFlimit_value - x"2710";
		    --PRFlimit_value <= x"0196E6";
		  --DDC_SAMPLE_LIMIT <= "1100000000000";  -- 6144 samples
		  DDC_SAMPLE_LIMIT  <="1101000001100"; --6668 sample; 500 Km
		 
			
		elsif (PRFSetting(0) = '1' and PRFSetting(1) = '0') then
		  PRFlimit_value <= x"0186A0";    --PC 1000 Hz
		  PreTriggerLimit_value <= PRFlimit_value - x"2710";
		  --DDC_SAMPLE_LIMIT <= "0011000000000";  -- 1536 samples; 115 Km 
		  DDC_SAMPLE_LIMIT <= "0011101001011"; -- 1867 samples; 140 Km
                               
      elsif (PRFSetting(0) = '1' and PRFSetting(1) = '1' ) then
        case PRFSetting(3 downto 2) is
          when "00" =>          -- 5/4  800/1000 Hz
			   DDC_SAMPLE_LIMIT <= "0011101001011"; -- 1867 samples; 140 Km
				--DDC_SAMPLE_LIMIT <= "0011010000010"; --1666 samples; 125 Km 
            if (CHANGE_PRF = '0') then
				  PRFlimit_value <= x"01E848"; --800 Hz
				  PreTriggerLimit_value <= PRFlimit_value - x"2710";
				  
				  
            elsif (CHANGE_PRF ='1') then
				  PRflimit_value <= x"0186A0"; --1000 Hz
				  PreTriggerLimit_value <= PRFlimit_value - x"2710";
				 
            end if;
     		 when "01" =>          --4/3   750/1000 Hz
			   DDC_SAMPLE_LIMIT <= "0011101001011"; -- 1867 samples; 140 Km
				--DDC_SAMPLE_LIMIT <= "0011010000010"; --1666 samples; 125 Km 
            if (CHANGE_PRF = '0') then
              PRFlimit_value <= x"0208D5";  --750 Hz
				  PreTriggerLimit_value <= PRFlimit_value - x"2710";
				 
            elsif (CHANGE_PRF ='1') then
				  PRflimit_value <= x"0186A0";  --1000 Hz
				  PreTriggerLimit_value <= PRFlimit_value - x"2710";
				 
            end if;
          when "10" =>          --3/2   666/1000 Hz
			   DDC_SAMPLE_LIMIT <= "0011101001011"; -- 1867 samples; 140 Km
				DDC_SAMPLE_LIMIT <= "0011010000010"; --1666 samples; 125 Km 
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
 process(PRFCOUNT,PRFOUT)
 begin
   if(PRFCOUNT > x"32" and PRFCOUNT <x"FA") then
	  control_3 <='1';
	else
	  control_3 <='0';
	end if;
	 end process;
	 
------------------------------------------


-----------------------------------------	
--  process(CHANGE_PRF,rst_enable)
--  begin
--    if(rst_enable = '1') then 
--	   enable_Pre_Trigger1 <= '1';
--	 elsif (rising_edge(CHANGE_PRF)) then 
--	   enable_Pre_Trigger1 <= '0';     		  
--	 end if;
--  end process;
--  
--  process(CHANGE_PRF,rst_enable)
--  begin
--    if(rst_enable = '1') then 
--	   enable_Pre_Trigger2 <= '1';
--	 elsif (falling_edge(CHANGE_PRF)) then 
--	   enable_Pre_Trigger2 <= '0';     		  
--	 end if;
--  end process;
  
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
  
	
 
  
 

-----------------------------------------------------
-- 2 Mhz Generator
  process(SCLK)
  begin
    if rising_edge(SCLK) then
	   if ( MhzCount > x"17") then
		  clk_D <= '1';
		  MhzCount <= (others =>'0');
		else
		  clk_D <= '0';
		   MhzCount <=  MhzCount +1;
		end if;
	 end if;
  end process;
  
-----------------------------------------------------
  --process (PRFCOUNT) -- Generate the +ve 6 us Trigger Pulse
 -- begin -- Raise PRFout
 --   if (PRFCOUNT > unsigned(PRE_TRIGGER_1(19 downto 0))) then
 --     PRE_TRIGGER_1_OUT <= '1'; 
 --   else
 --     PRE_TRIGGER_1_OUT <= '0'; 
 --   end if; 
 -- end process; 

 -- process (PRFCOUNT) -- Generate the +ve 6 us Trigger Pulse
 -- begin -- Raise PRFout
 --   if (PRFCOUNT > unsigned(PRE_TRIGGER_2(19 downto 0)) )then
 --     PRE_TRIGGER_2_OUT <= '1'; 
  --  else
  --    PRE_TRIGGER_2_OUT <= '0'; 
  --  end if; 
  --end process; 

  
  NFTS_LIMIT_HIGH <=x"42108";
  NFTS_LIMIT_LOW  <=x"41EB0"; 

  process(PRFCOUNT,NFTS_LIMIT_LOW,NFTS_LIMIT_HIGH,PULSE_LENGTH )
  begin 
	 if (PRFCOUNT > NFTS_LIMIT_LOW AND PRFCOUNT < NFTS_LIMIT_HIGH  AND PULSE_LENGTH ='0')then
         NFTS_trigger <='1';
      else
         NFTS_trigger <='0';
      end if;
  end process;

--  process (SCLK,PRFout) -- When Short Pulse is selected generate a 2s delay
--  begin -- before the application of the SHORT PULSE PRF rate
--    if(rising_edge(SCLK)) then 
--      if (PRFreset ='1' and PULSE_LENGTH = '0') then 
--        PRF_DELAY_COUNT <= (others =>'0');
--        PRF_DELAY <= '0';
--      elsif (PRFreset ='1' and PULSE_LENGTH = '1') then
--        if (PRF_DELAY_COUNT > x"DB" ) then 
--          PRF_DELAY <= '1';		 --counting has stopped so remains high once reached
--        else
--          PRF_DELAY_COUNT <= PRF_DELAY_COUNT + 1;
--        end if;   
--      end if;
--    end if;
--  end process;

--process (SCLK) 
--  begin -- before the application of the SHORT PULSE PRF rate
--    if(rising_edge(SCLK)) then 
--      if (PRFreset ='1' and PULSE_LENGTH = '0') then 
--        PRF_DELAY1_COUNT <= (others =>'0');
--        PRF_DELAY1 <= '0';
--      elsif (PRFreset ='1' and PULSE_LENGTH = '1') then
--        if (PRF_DELAY1_COUNT > x"1D4C" ) then 
--          PRF_DELAY1 <= '1';		 --counting has stopped so remains high once reached
--        else
--          PRF_DELAY1_COUNT <= PRF_DELAY1_COUNT + 1;
--        end if;   
--      end if;
--    end if;
--  end process;
--  
--  process (SCLK) 
--  begin -- before the application of the SHORT PULSE PRF rate
--    if(rising_edge(SCLK)) then 
--      if (PRFreset ='1' and PULSE_LENGTH = '1') then 
--        PRF_DELAY2_COUNT <= (others =>'0');
--        PRF_DELAY2 <= '0';
--      elsif (PRFreset ='1' and PULSE_LENGTH = '0') then
--        if (PRF_DELAY2_COUNT > x"9C4" ) then 
--          PRF_DELAY2 <= '1';		 --counting has stopped so remains high once reached
--        else
--          PRF_DELAY2_COUNT <= PRF_DELAY2_COUNT + 1;
--        end if;   
--      end if;
--    end if;
--  end process;
-- 
  
  EN_TRIGGER <= PRFSetting(4);
  --EN_TRIGGER <= '1';
  
------------------
--Outputs  
------------------
  --control_1 <= UMI_IN(1);
  --control_2 <= UMI_IN(2);
  --control_3 <= UMI_IN(3);
  
  
	  DIO_OUT(0) <= PRFout;
	  --DIO_OUT(0) <= PRFout;
	 -- DIO_OUT(1) <=  not((PRE_TRIGGER_1_OUT or control_3));
	  DIO_OUT(1) <= (PRE_TRIGGER_2_OUT and EN_TRIGGER and enable_Pre_Trigger);
	  DIO_OUT(2) <= not(PULSE_LENGTH);
	  DIO_OUT(3) <= CHANGE_PRF; 
	  
	  PRF <= (PRFout and EN_TRIGGER and enable_Pre_Trigger);
	
   
  
  UMI_OUT(0) <= PRFout ;  -- Connect PRFout to UMI and later to digital I/O
  UMI_OUT(1) <= PRFReset;
  --UMI_OUT(1) <=PULSE_LENGTH;
   
--  DIO_OUT(1) <= NFTS_trigger;  -- Connect PRFout to digital I/O (0) (i.e. RADAR)
  
 -- DIO_OUT(0) <= PRFSetting(0);
  
    
  
--  NoiseDataFifo_OUT &"000000000000000000" ;
 --DIO_OUT(2) <=  PRE_TRIGGER_2_OUT ; 
   --DIO_OUT(2) <=EN_TRIGGER; 
  DIO_OUT(4) <= '0';  --  PRFout; -- Connect NFTS_trigger to Digital out 2  
  DIO_OUT(5) <= '0';  -- NFTS_trigger;  -- Connect PRFout to digital I/O (0) (i.e. RADAR)
  DIO_OUT(6) <= '0';  -- PRFout; -- Connect NFTS_trigger to Digital out 2  
  DIO_OUT(7) <= '0';  --  NFTS_trigger;  -- Connect PRFout to digital I/O (0) (i.e. RADAR)
		 
end ADC; 

