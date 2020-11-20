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
--  Date        : 23/2/04
--  Author      : T Darlington
--  description : IF sampling module
--
-- ==============================================================
--
--  Ver     Modified By      Date      Changes
--  ---     -----------      ----      -------
--  1.0     T Darlington               Inital version
--
--
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
  constant VIRTEX2_ES : boolean := false; 
  
  -- OSCILLATOR CLOCK DIVISION
  -- To divide oscillator clock by 2, set DIV2_FCLK = TRUE
  constant DIV2_FCLK : boolean := false; 
  
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
  constant FCLK_G_DOMAIN : boolean := true; 
  
  -- When read/write FIFO clock frequency > 60 MHz, set HIGH_FCLK_G = TRUE
  -- This constant is used only when FCLK_G_DOMAIN = TRUE
  constant HIGH_FCLK_G : boolean := true; 
  
  -- When read FIFO clock frequency > 60 MHz, set HIGH_FCLK_RD = TRUE
  -- This constant is used only when FCLK_G_DOMAIN = FALSE
  constant HIGH_FCLK_RD : boolean := false; 
  
  -- When write FIFO clock frequency > 60 MHz, set HIGH_FCLK_WR = TRUE
  -- This constant is used only when FCLK_G_DOMAIN = FALSE
  constant HIGH_FCLK_WR : boolean := false; 
  
  -- ADC CLOCK
  -- =========
  
  -- To drive the ADC sample clock from a signal inside the FPGA set INTERNAL_SCLK = TRUE
  -- to use an external sample clock, set INTERNAL_SCLK = FALSE
  constant INTERNAL_SCLK : boolean := true; 
  
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
    RESET : in std_logic;  -- asynchronous reset active high
    CONFIG : in std_logic;  -- System wide Config signal
-- CLOCK IO
    OSC0 : in std_logic;  -- Xtal OSC0
    OSC1 : in std_logic;  -- Xtal OSC1
    OSC2 : in std_logic;  -- Xtal OSC2
    OSC3 : in std_logic;  -- Xtal OSC3 factory default fitted with 100Mhz
    CLKIN0 : in std_logic;  -- User clock input (unbuffered) 
    CLKIN1 : in std_logic;  -- User clock input (unbuffered)
    CLKI2 : in std_logic;  -- User clock input (buffered)
    CLKI3 : in std_logic;  -- User clock input (buffered)
    CLKOUT : out std_logic;  -- User clock output
    QTTL : in std_logic; 
    DTTL : out std_logic; 
-- GENERAL PURPOSE GCLKs
    GCLK_A : in std_logic; 
    SRC_GCLK_A : out std_logic; 
    GCLK_B : in std_logic; 
    SRC_GCLK_B : out std_logic; 
-- SERIAL IO
    R1OUT : in std_logic; 
    R2OUT : in std_logic; 
    T1IN : out std_logic; 
    T2IN : out std_logic; 
    RS485_232 : out std_logic; 
    HDPLX : out std_logic; 
    FAST : out std_logic; 
-- MISCELLANEOUS IO
    UDPRES : out std_logic;  -- reset the carrier (high if NOT used)
    LED : out std_logic_vector(4 downto 0);  -- LEDs
    ADDR_FLAGSEL : in std_logic; 
    BOOTEN : out std_logic; 
    CID : in std_logic_vector(3 downto 0); 
    MID : in std_logic_vector(3 downto 0); 
-- UMIs
    UMI_IN : in std_logic_vector(3 downto 0); 
    UMI_OUT : out std_logic_vector(3 downto 0); 
    UMI_EN : out std_logic_vector(3 downto 0); 
-- DIGITAL IO
    DIO_IN : in std_logic_vector(7 downto 0); 
    DIO_OUT : out std_logic_vector(7 downto 0); 
    DIO_EN : out std_logic_vector(7 downto 0); 
-- READ FIFO CLK
    FCLK_RD : in std_logic;  -- FIFO_IN clock to be used in this module (only when FCLK_G_DOMAIN=FALSE)
    SRC_FCLK_RD : out std_logic;  -- FIFO_IN clock source for the top level  (only when FCLK_G_DOMAIN=FALSE)
-- WRITE FIFO CLK
    FCLK_WR : in std_logic;  -- FIFO_OUT clock to be used in this module (only when FCLK_G_DOMAIN=FALSE)
    SRC_FCLK_WR : out std_logic;  -- FIFO_OUT clock source for the top level  (only when FCLK_G_DOMAIN=FALSE)
-- COMMON FIFO CLK
    FCLK_G : in std_logic;  -- Common FIFO clock to be used in this module (only when FCLK_G_DOMAIN=TRUE)
    SRC_FCLK_G : out std_logic;  -- Common FIFO clock source for the top level  (only when FCLK_G_DOMAIN=TRUE)
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
  
  signal MCLK : std_logic;  -- main clock
  signal LEDcount : unsigned(24 downto 0);  --LED flasher counter
--
-- PRF Gen related stuff
--  
  signal PRFcount : unsigned(19 downto 0); 
  signal PRFreset : std_logic;  --Reset to PRF clock
  signal PRFlimit : unsigned(19 downto 0);  --PRF Count limit
  signal PULSEMode : std_logic;  -- Long or shot pulse
  signal PRFspeed : std_logic;  -- fast or short prf (4:3)
  signal PRFout : std_logic;  -- output of prf gen
  signal DDC_SAMPLE_LIMIT : unsigned(12 downto 0); 
  
--
-- SAMPLING stuff
--
  signal SAMPLEcount : unsigned(19 downto 0); 
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
  
  signal I_FIFO_DATA_IN : std_logic_vector(31 downto 0); 
  signal Q_FIFO_DATA_IN : std_logic_vector(31 downto 0); 
  signal I_OUT_FULL : std_logic; 
  signal Q_OUT_FULL : std_logic; 
  signal I_OUT_EMPTY : std_logic; 
  signal Q_OUT_EMPTY : std_logic; 
  signal I_FIFO_OUT : std_logic_vector(31 downto 0); 
  signal Q_FIFO_OUT : std_logic_vector(31 downto 0); 
  signal I_FIFO_WR_EN : std_logic; 
  signal Q_FIFO_WR_EN : std_logic;
  signal I_FIFO_RD_EN : std_logic; 
  signal Q_FIFO_RD_EN : std_logic; 
  signal IS_Turn : std_logic; 

  
  type sampling_sequence_type is (
    WaitForPulse, 
    SampleData, 
    WaitForEnd
    ); 
  
  type output_sequence_type is (
    output_i, 
    output_q, 
    output_raw
    ); 

  signal SAMPLINGsequence : sampling_sequence_type; 
  signal OUTPUTsequence : output_sequence_type; 
  
  component q_out_fifo
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
  

  component i_out_fifo
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
  
  DIO_OUT(7 downto 2) <= (others => '0'); 
  DIO_EN(7 downto 2) <= (others => '1'); 
  DIO_EN(1 downto 0) <= (others => '0'); 
  
  UMI_OUT(3 downto 1) <= (others => '0'); 
  UMI_EN(3 downto 1) <= (others => '1'); 
  UMI_EN(0) <= '0'; 
 -- UMI_EN(1) <= '0';  

  CLKOUT <= '0'; 
  
  DTTL <= '0'; 
  T1IN <= '0'; 
  T2IN <= '0'; 
  RS485_232 <= '0'; 
  HDPLX <= '0'; 
  FAST <= '0'; 
  
  -------------------------------------------------------------
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
  
------------------------------------------------------------
-- A-D SAMPLING sequence
-------------------------------
  
  SRC_SCLK <= MCLK;  -- internal sample clock source for ADC
  
  process(SCLK,PRFreset)  -- Sampling state machine.
  begin 
    if( rising_edge(SCLK)) then
      
      if( PRFreset = '1')then
        SAMPLEcount <= (others => '0');  -- Set up 
        SAMPLINGsequence <= WaitForPulse; 
        EN_RAWsamples <= '1';  --Clock data tag into raw fifo
        RawDataToFIFO <= (others => '1'); 
        DDCCount <= (others => '0'); 
        DDC_ND <= '0'; 
        DDC_DATA_IN <= (others => '0'); 
		 -- DIO_OUT(1)<= '0';
      else        
        case SAMPLINGsequence is

          when WaitForPulse => 
			--	DIO_OUT(1)<= '1';
            DDCCount <= (others => '0'); 
            EN_RawSamples <= '0'; 
            DDC_DATA_IN <= (others => '0'); 						  
				
            if( (signed(ADC) > x"400" ) or ( -signed(ADC) > x"400" ) )then 
              SAMPLINGsequence <= SampleData;  -- If detect outgoing pulse start sampling
              EN_RawSamples <= '1'; 
            end if; 
            
          when SampleData => 
            
			--	DIO_OUT(1)<= '0';
            DDC_DATA_IN <= ADC; 
            DDC_ND <= '1' and DDC_RFD;
            RawDataToFIFO <= ADC; 
            SampleCount <= Samplecount +1; 
            
            if(SampleCount < x"FF") then 
              EN_RAWsamples <= (NOT RawFIFO_full); 
            else
              EN_RAWsamples <= '0'; 
            end if; 
            
            if(DDC_RDY = '1') then
              DDCCount <= DDCCount +1; 
            end if; 
            
            if(DDCCount >= DDC_SAMPLE_LIMIT )then 
              SAMPLINGsequence <= WaitForEnd; 
            end if; 
            
          when WaitForEnd => 
            
				
            DDC_DATA_in <= (others => '0'); 

             if(DDCCount > (DDC_SAMPLE_LIMIT + x"40") ) then 		  -- Or up 0x60 
               DDC_ND <= '0'; 
             else
               DDC_ND <= '1';  
             end if; 
            
				 if(DDC_RDY = '1' ) then
                DDCCount <= DDCCount +1; 
             end if;


          when others => NULL;

        end case; 
      end if; 
    end if; 
  end process; 
  
  myDDCi : myddc
    port map (
      DIN => DDC_DATA_IN,
      ND => DDC_ND,
      RDY => DDC_RDY,
      RFD => DDC_RFD,
      CLK => MCLK,
      ADDR => "00110",
      LD_DIN => INFIFO0_D,
      WE => DDC_WE,
      SEL => DDC_SEL,
      DOUT_I => DDC_I_OUT,
      DOUT_Q => DDC_Q_OUT); 
  
  DDC_WE  <= INFIFO_DVALID(0); 
  DDC_SEL <= INFIFO_DVALID(0); 
  INFIFO_READ_REQ <= "000001"; 
  
  SCLK_DAC_A <= MCLK; 
  SCLK_DAC_B <= MCLK; 
  
  I_FIFO_DATA_IN(31 downto 30) <= (others => '0'); 
  I_FIFO_DATA_IN(29 downto 0) <= DDC_I_OUT ; 
  Q_FIFO_DATA_IN(31 downto 30) <= (others => '1'); 
  Q_FIFO_DATA_IN(29 downto 0) <= DDC_Q_OUT; 
 
  I_FIFO_WR_EN <= DDC_RDY AND (NOT I_OUT_FULL );
  Q_FIFO_WR_EN <= DDC_RDY AND (NOT Q_OUT_FULL );
 
  DAC_B(12 downto 0) <= DDC_I_OUT(23 downto 11); 
  DAC_B(13) <= (not DDC_I_OUT(29)); 
  
  DAC_A(12 downto 0) <= DDC_Q_OUT(23 downto 11); 
  DAC_A(13) <= (not DDC_Q_OUT(29)); 
  
  i_out_fifoI : i_out_fifo
    port map (
      din => I_FIFO_DATA_IN,
      wr_en => I_FIFO_WR_EN,
      wr_clk => MCLK,
      rd_en => I_FIFO_RD_EN,
      rd_clk => FCLK_G,
      ainit => RESET,
      dout => I_FIFO_OUT,
      full => I_OUT_FULL,
      empty => I_OUT_EMPTY); 
  

  q_out_fifoI : q_out_fifo
    port map (
      din => Q_FIFO_DATA_IN,
      wr_en => Q_FIFO_WR_EN,
      wr_clk => MCLK,
      rd_en => Q_FIFO_RD_EN,
      rd_clk => FCLK_G,
      ainit => RESET,
      dout => Q_FIFO_OUT,
      full => Q_OUT_FULL,
      empty => Q_OUT_EMPTY); 
  
  
  process(FCLK_G,RESET)  -- OUTPUT state machine.
  begin 
    if(RESET = '1') then 
	    OUTPUTsequence <= output_i;
    elsif( rising_edge(FCLK_G)) then
       case OUTPUTsequence is
          when output_i => 
				 I_FIFO_RD_EN     <= OUTFIFO_READY(2) AND (NOT I_OUT_EMPTY);
          	 Q_FIFO_RD_EN     <= '0';
				 OUTFIFO_D        <= I_FIFO_OUT; 
             OUTFIFO_WRITE(2) <=	OUTFIFO_READY(2) AND (NOT I_OUT_EMPTY);
      		 OUTFIFO_WRITE(1) <= '0';
				 EN_WriteRaw      <= '0';

				 OUTPUTsequence   <= output_q;			 -- Should choose state based on fifo_empty
			 when output_q =>
			    OUTFIFO_D        <= Q_FIFO_OUT;
             OUTFIFO_WRITE(2) <= OUTFIFO_READY(2) AND (NOT Q_OUT_EMPTY) ; 
				 OUTFIFO_WRITE(1) <= '0';
				 Q_FIFO_RD_EN     <= OUTFIFO_READY(2) AND (NOT Q_OUT_EMPTY) ;
          	 I_FIFO_RD_EN     <= '0';
      		 EN_WriteRaw      <= '0';
       		 OUTPUTsequence   <= output_raw; -- Should choose state based on fifo_empty
			 when output_raw => 
			    Q_FIFO_RD_EN     <= '0';
          	 I_FIFO_RD_EN     <= '0';
				 OUTFIFO_WRITE(2) <= '0'; 
             EN_WriteRaw      <= OUTFIFO_READY(1) AND (NOT RawFIFO_empty);  -- if data and output ready.
             OUTFIFO_WRITE(1) <= OUTFIFO_READY(1) AND (NOT RawFIFO_empty);  -- if data and output ready.
             OUTFIFO_D        <= "000000000000000000" & RawSampleOut; 
	          OUTPUTsequence   <= output_i;				-- Should choose state based on fifo_empty
			 when others => NULL;
		 end case;
    end if;
  end process; 
 

  iRawFifo255x14 : rawfifo255x14
    port map (
      din => RawDataToFIFO,
      wr_en => EN_RAWsamples,
      wr_clk => SCLK,
      rd_en => EN_WriteRaw,
      rd_clk => FCLK_G,
      ainit => RESET,
      dout => RawSampleOut,
      full => RawFIFO_full,
      empty => RawFIFO_empty); 
  
-------------------------------------------------------------
-- DAC
  
-- SCLK_DAC_A <= FCLK_G;  -- clock of DAC_A
-- SCLK_DAC_B <= FCLK_G;  -- clock of DAC_B
  
-------------------------------------------------------------
-- LED flasher 
------------------------------------------------------------- 
  process(RESET, MCLK)
  begin
    if RESET = '1' then
      LEDcount <= (others => '0'); 
    elsif rising_edge(MCLK) then
      LEDcount <= LEDcount + 1; 
    end if; 
  end process; 
  
  LED(4) <= LEDcount(24); 
  
  -- Drive LEDs high (inactive)
  LED(1) <= '1'; 
  LED(3) <= '1'; 
  
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
  
---------------------------------------------------------------
-- PRF pulse generator
---------------------------------------------------------------
  PULSEmode <= UMI_IN(1);  -- PRF Selection
  PRFspeed <= UMI_IN(2);  -- PRF Selection
  DIO_OUT(1) <= UMI_IN(1);  

  process(PULSEmode, PRFspeed)  -- Select PRF limit
  begin
    if PULSEmode = '0' then
      PRFlimit <= x"51614";  -- Long Pulse Mode 0x51614 PRF = 300 Hz
      DDC_SAMPLE_LIMIT <= "1000000000000"; 	--4096
    elsif PULSEmode = '1' and PRFspeed = '0' then
      PRFlimit <= x"1B207";  --Short Pulse Mode 0x1B207 PRF= 900 Hz
      DDC_SAMPLE_LIMIT <= "0011000000000";  -- 1536 samples 
    elsif PULSEmode = '1' and PRFspeed = '1' then
      PRFlimit <= x"14584";  --Short Pulse Mode 0x14584 PRF= 1200 Hz      
      DDC_SAMPLE_LIMIT <= "0011000000000";  --1536 samples         
    end if; 
  end process; 
  
  process(SCLK)  --if limit reached reset counter
  begin 
    if(rising_edge(SCLK))then
      if( PRFcount > PRFlimit )then
        PRFreset <= '1'; 
        PRFcount <= (others => '0'); 
      else
        PRFreset <= '0'; 
        PRFcount <= PRFcount +1; 
      end if; 
    end if; 
  end process; 
  
  process(PRFCOUNT)  -- if counter less than 0x258
  begin  -- Raise PRFout
    if(PRFCOUNT < x"258") then
      PRFout <= '1'; 
    else
      PRFout <= '0'; 
    end if; 
  end process; 
  
  UMI_OUT(0) <= PRFout;  -- Connect PRF OUT to UMI and later to digital io
  DIO_OUT(0) <= PRFout;  -- Connect PRF out to digital I/O (0)
  
end ADC; 

