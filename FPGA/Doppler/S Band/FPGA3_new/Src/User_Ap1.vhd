
 -- ==============================================================
-- FILE : USER_AP1.VHD  -  MUST be modified by the USER
-- ==============================================================
--
-- This file is part of Example 1, for the HERON-FPGA3 module.
--
-- This file must be modified by the user.
--
-- ==============================================================
--
--  Date        : 01/03/2002
--  Author      : R. Williams - HUNT ENGINEERING
--  Description : User code section
--
-- ==============================================================
--
--  Ver     Modified By      Date      Changes
--  
--                                    
--  1.0     R. Naranjo     14-05-09    For S Band    
--  2.1     R. Naranjo     23-9-2019   Encoder Pos. Tx by Serial RS 232  
--  2.3     R. Naranjo     9-10-2019  PRF,Delay,Width setting programmable.   
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
--   Module : USER_AP
-- ==============================================================

library IEEE;
  use IEEE.std_logic_1164.ALL;
  use IEEE.numeric_std.all;
  use IEEE.std_logic_signed.all;
  use WORK.CONFIG.all;

--pragma translate_off
library sim_lib;
  use sim_lib.all;

library UNISIM;
  use UNISIM.VCOMPONENTS.all;
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
    OUTFIFO_WRITE   : out std_logic_vector(5 downto 0);  -- FIFO_OUT Write Command
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


architecture EXAMPLE1 of USER_AP is
------------------------------------
signal MCLK : std_logic;  -- main clock 
signal RST  : std_logic;  

signal DVALID_FIFO_0 : std_logic;

signal DATA_IN        :   std_logic_vector(31 downto 0); 
signal DATA_Az_gray   :   std_logic_vector(14 downto 0);
signal DATA_EL_gray   :   std_logic_vector(14 downto 0);    
signal DATA_Az        :   std_logic_vector(14 downto 0);
signal DATA_EL        :   std_logic_vector(14 downto 0); 
signal DataAng        :   std_logic_vector(14 downto 0); 
signal DATA_Az_actual        :   std_logic_vector(14 downto 0);
signal DATA_Test      :   std_logic_vector(13 downto 0); 
signal DATA_Test_gray      :   std_logic_vector(14 downto 0); 

signal DATA_Az_old           :   std_logic_vector(14 downto 0);
signal DATA_Az_valid        :   std_logic_vector(14 downto 0);
signal DATA_Az_temp        :   std_logic_vector(14 downto 0);
signal load_pos             : std_logic;
signal Az_temp         :  integer;
signal control         : std_logic;
signal pos_count            :   unsigned(19 downto 0);
signal error_pos            :   unsigned(19 downto 0);

signal AZ_actual :   integer;
signal AZ_old    :   integer;

signal DATA_AZ_temp0  :   std_logic_vector(22 downto 0);
signal DATA_AZ_temp1  :   std_logic_vector(22 downto 0);
signal DATA           :   std_logic_vector(22 downto 0);

signal CE_E    : std_logic;
signal CE_F    : std_logic;
signal CE_C    : std_logic;
signal CE_D    : std_logic;
signal WRITEAnnt : std_logic;

--sync
signal SELECT_PULSE_MODE : std_logic;
signal SELECT_PRF_MODE   : std_logic;
signal PRF_MARK          : std_logic;
signal Q1, Q2, Q3        : std_logic;
signal Q1k, Q2k, Q3k        : std_logic;
signal PULSE_LENGTH      : std_logic;
signal PRF_RATE          : std_logic_vector(1 downto 0); 
signal PRF_RATE_LABEL    : std_logic_vector(1 downto 0); 
signal PRF_MODE          : std_logic;
signal PRFin             : std_logic; 
signal PRFSetting        : std_logic_vector(5 downto 0);
signal N_Pulse           : std_logic_vector(7 downto 0); 

signal N                 : unsigned(7 downto 0);
signal Count_pulse       : unsigned(7 downto 0);
signal pulsecounter      : unsigned(7 downto 0);
signal Pulse_Mark        : std_logic;
--Anntena
signal AzEl_IN           : std_logic_vector(31 downto 0); 
signal AzEl_OUT          : std_logic_vector(31 downto 0); 
signal WRITE_EN          : std_logic;
signal READ_EN           : std_logic;
signal FIFO_FULL         : std_logic;
signal FIFO_EMPTY        : std_logic;
signal COUNT_1           : unsigned(2 downto 0); -- counter 
signal Antenna_Mov       : std_logic;
signal AngMarkSelect     : std_logic;

---
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

signal SimAz            :      unsigned(13 downto 0);
signal AzimuthIn        :      std_logic_vector(13 downto 0);
signal DUAL_PRF_MODE    : 	  std_logic;
signal  AzimTimes360    :    std_logic_VECTOR(22 downto 0);
signal DataAngTime360   :    std_logic_VECTOR(22 downto 0);
--
--test
signal KK               : std_logic;
signal PRFreset : std_logic; -- Reset to PRF clock
signal PRFlimit : unsigned(19 downto 0); -- PRF Count limit
signal PRFcount : unsigned(19 downto 0); -- PRF period counter value
signal PRFout : std_logic; -- Output of prf generator

signal SetPRF           : std_logic;
signal control_1    : std_logic;
signal control_2    : std_logic;
signal flag1        : std_logic;
signal cable        : std_logic;

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
signal notload      : std_logic;
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
signal Azlow : std_logic;

--CLK

 signal MhzCount    : unsigned(19 downto 0);
 signal MHzCount1  : unsigned(19 downto 0);
 signal clk_20Mhz   : std_logic;
 signal clk_10Mhz   : std_logic;
 
 signal count1    : unsigned(19 downto 0);
 signal count2    : unsigned(19 downto 0);
 signal count3    : unsigned(19 downto 0);
 signal tx_start  : std_logic;
 signal ini_DT    : std_logic;
 signal DT        : std_logic;
 signal clkcounter : std_logic;
 
 signal counterk  : unsigned(19 downto 0);
 signal EnablePRFin: std_logic;
 signal PRF1   : std_logic;
 signal PRF2   : std_logic;
-----------------------------------------
--state machine declaration --------------
type sampling_sequence_type is (
    TagAzEl, 
    DoSP, 
    DoLP
    ); 
	 

type output_sequence_type is (
  output_PRFSetting,
  output_data);
  
  
type sampling_angular_pos_type is (
  load_old_pos,
  load_new_pos,
  check_pos
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
  
signal OUTPUTsequence: output_sequence_type;	 
signal SAMPLINGsequence : sampling_sequence_type; 
signal SAMPLINGpos  : sampling_angular_pos_type;
signal SSI_sequence  : SSI_sequence_type;
signal Serial_Tx_sequence     : Serial_Tx_type; 


--End state machine declaration-----------------------
	 
--Component------------------------------------
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
  
  component times360
    port (
    clk: IN std_logic;
    a: IN std_logic_VECTOR(13 downto 0);
    q: OUT std_logic_VECTOR(22 downto 0));
  end component;
  
--  component FDC
--    port(
--      Q                   : out std_logic; 
--      D                   : in  std_logic; 
--      C                   : in  std_logic; 
--      CLR                 : in  std_logic ); 
--  end component; 
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
  
  
  component myCounter 
    port (
	   clk: IN std_logic;
	   q: OUT std_logic_VECTOR(13 downto 0));
  end component;



  
--End Component---------------------------------------

begin


  -- ==========================================================
  -- ==========================================================
  --       <<<<<<<   INSERT YOUR CODE HERE    >>>>>>>>>
  -- ==========================================================
  -- ==========================================================
-- port map

--iCONN_E_OUT : CONN_E
--    port map (
--      CLOCK => FCLK_G, 
--      CE => CE_E, 
--      DATA_OUT => DATA_IN(14 downto 0),
--		CONN_E_OUT => CONN_E_OUT, 
--      CONN_E_EN => CONN_E_EN ); 
--
--iCONN_F_OUT : CONN_F
--    port map (
--	   CLOCK => FCLK_G, 
--      CE => CE_F, 
--      DATA_OUT => DATA_IN(14 downto 0), 
--		CONN_F_OUT => CONN_F_OUT, 
--      CONN_F_EN => CONN_F_EN ); 

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
		
--  AzimBy360: times360
--     port map (
--       clk => FCLK_G,
--       a => DATA_Az(13 downto 0),
--       q => AzimTimes360);

     AngPosBy360 : times360
	    port map(
		   clk => FCLK_G,
			a => DataAng(13 downto 0),
			q => DataAngTime360);



--  MyD: FDC
--    port map(
--	   Q =>  Pulse_Mark,                
--      D =>  not(Pulse_Mark),                
--      C => FCLK_G,                
--      CLR => RESET); 


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

 iMyCounter :MyCounter
   port map(
	   clk => clkcounter,
	   q  =>  DATA_test
		);
  
  		

-- end port map

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
  
  process(RESET,MCLK)
  begin
    if RESET = '1' then
      UART_clk      <= '0'; 
    elsif rising_edge(MCLK) then
	   UART_clk <= not(UART_clk );
	end if;
  end process;
  
  -------------------------------------------------------------
  -- Drive the UDP-RESET high (inactive)

  UDPRES <= '1';

  -------------------------------------------------------------
  -- Drive the BOOT ENABLE signal high (inactive)

  BOOTEN <= '1';

  -------------------------------------------------------------
  

  CLKOUT  <= '0';
  DTTL    <= '0';

  --T1IN_A      <= '0';
  T2IN_A      <= '0';
  RS485_232_A <= '0';
  HDPLX_A     <= '0';
  FAST_A      <= '1';

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

--  CONN_A_OUT <= (others=>'0');
--  CONN_A_EN  <= (others=>'1');
  CONN_A_EN <= "111111111111110";

  CONN_B_OUT <= (others=>'0');
  CONN_B_EN  <= (others=>'1');

  --CONN_C_OUT <= (others=>'0');
  CONN_C_EN  <= (others=>'0');

  --CONN_D_OUT <= (others=>'0');
  CONN_D_EN  <= (others=>'0');

 -- CONN_E_OUT <= (others=>'0');
  CONN_E_EN  <= (others=>'0');

 --CONN_F_OUT <= (others=>'0');
  CONN_F_EN  <= (others=>'0');

  -------------------------------------------------------------
  -- Robert Code-----------------------------------------
  
  --UMI Configuration
  UMI_EN(0)  <= '1'; 
  UMI_EN(1)  <= '0';
  UMI_EN(2)  <= '0';
  UMI_EN(3)  <= '0';
  
  -----------------------
  
  
  
   INFIFO_READ_REQ(2) <='1';          --Data required from fifo 0 and 1
	INFIFO_READ_REQ(1) <= '1';
   --DVALID_FIFO_0   <= INFIFO_DVALID(0);  -- If FIFO 0 has an update for the outputs
	
	
  
--Reading from PC--------------
  process(INFIFO_DVALID,FCLK_G)
    begin
	  if (rising_edge(FCLK_G)) then
        if(INFIFO_DVALID(2) = '1') then
          DATA_IN   <= INFIFO2_D;         -- IF valid data on fifo 0 (PC) then assign to data_in 	
			 --SetPRF <= INFIFO2_D(28);
          if INFIFO2_D(28) = '1' then
			   N_Pulse(7 downto 0) <= INFIFO2_D(15 downto 8);
			    -- N_Pulse <= x"0A";
			   PRFSetting(5 downto 0) <= INFIFO2_D(5 downto 0);	  
				AngMarkSelect <= INFIFO2_D(16);
          end if;		 
		  end if;
	  end if;
  end process; 
-- CE_E    <= DVALID_FIFO_0 and DATA_IN(20);	 
--	CE_F    <= DVALID_FIFO_0 and DATA_IN(21);		
  
  
  
  process(PRFSetting)
  begin
  --  PRF_RATE_LABEL <=PRFSetting(3 downto 2);
	 PULSE_LENGTH <= PRFSetting(0);
    PRF_RATE <= PRFSetting(3 downto 2);
  end process;  
  
  
  process(PRFSetting,PRF_RATE)
  begin
    if
	   PRFSetting(1) = '0' then
		PRF_RATE_LABEL <= "11";
	 else
	   PRF_RATE_LABEL <= PRF_RATE;
	 end if;	 
  end process;
  
  
-- END Reading from PC--------------
 

    --CONN_D_OUT(3 downto 0) <= PRFSetting(3 downto 0);
	 --CONN_D_OUT(4) <= PULSE_LENGTH;
	 --CONN_D_OUT(5) <= '1';
	 --CONN_D_OUT(14 downto 6) <= (others => '0');
	 
	 --CONN_D_OUT(14 downto 6) <= (others => '0');
	 
	 --CONN_D_OUT(7 downto 4) <= DATA_IN( 28 downto 25);
	 
	 --CONN_D_OUT(1 downto 0) <= PRFSetting(1 downto 0);
	 --CONN_D_OUT(3 downto 2) <= PRF_RATE_LABEL(1 downto 0);
	 --CONN_D_OUT(0) <= Pulse_Mark ;
	 --CONN_D_OUT(1) <= Antenna_Mov;
	 --CONN_D_OUT(3) <= PRF_RATE_LABEL;
	 --CONN_D_OUT(4) <= PRFSetting(4);	
	 
-------------------------------  
 
------------------------------- 
  
  
  process(FCLK_G,CONN_A_IN,PULSE_LENGTH,PRF_MARK,PRF_RATE_LABEL)
  begin
    if( rising_edge(FCLK_G) ) then 
      
      if(PRFin = '1') then 
        OUTFIFO_DIN                     <= '0' & "1111111111111111111111111111111"; 
        OUTFIFO_WR_EN                   <= PRFin and (not OUTFIFO_FULL); 
        SAMPLINGsequence                <= TagAzEl; 
        I_ND <='0';
        Q_ND <='0';
        control_1 <= '0';
      else
        
        case SamplingSequence is 
          
          when TagAzEl => 
            
            
				
            OUTFIFO_DIN(31)             <= PULSE_LENGTH ; 
				--OUTFIFO_DIN(31)             <= '0';
            OUTFIFO_DIN(30)             <= PRF_MARK; 
				--OUTFIFO_DIN(30)             <= '0'; 
				--OUTFIFO_DIN(29 downto 16)   <= DATA_AZ(13 downto 0);
				 --OUTFIFO_DIN(29 downto 16)   <= DATA_Az_valid(13 downto 0);
				 OUTFIFO_DIN(29 downto 16)   <= DATA_Az(13 downto 0);
				--OUTFIFO_DIN(29 downto 16)   <= CONN_A_IN(13 downto 0);
            OUTFIFO_DIN(15 downto 14)   <= PRF_RATE_LABEL(1 downto 0); 
				--OUTFIFO_DIN(15 downto 14)   <= "00"; 
				OUTFIFO_DIN(13 downto 0)    <= DATA_EL(13 downto 0); 
				--OUTFIFO_DIN(13 downto 0)    <= "00000000000000"; 
            OUTFIFO_WR_EN <= '1';
            
  			   
				if(PULSE_LENGTH = '0' ) then   -- Long pulse mode
              SAMPLINGsequence          <= DoLP; 
            elsif (PULSE_LENGTH = '1') then  -- Short pulse mode
              SAMPLINGsequence          <= DoSP; 
            end if; 
            
				I_ND <='0';
            Q_ND <='0';
            
          when DoSP => 
            
            OUTFIFO_DIN                 <= INFIFO1_D; 
				--OUTFIFO_DIN                 <= "00000000000001110000000000000101";
            OUTFIFO_WR_EN               <= INFIFO_DVALID(1) and (not OUTFIFO_FULL); 
            I_ND <='0';
            Q_ND <='0';
            control_1 <= '1';
          when DoLP => 
            -- Route data to and from filters 
            -- Rounding output of filters on the way            
            
            I_DIN                       <= INFIFO1_D(31 downto 16) ; 
            I_ND                        <= INFIFO_DVALID(1) AND I_RFD; 
            Q_DIN                       <= INFIFO1_D(15 downto 0); 
            Q_ND                        <= INFIFO_DVALID(1) AND Q_RFD; 
            control_1 <= '1';
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
      --      OUTFIFO_DIN                 <= "00000000000001110000000000000101";
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
  
 

  

 ---  code for ssi-----------------------------
 
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
  ---------------------------------------------
  process(SSI_clk,RESET)
  begin
    if RESET = '1' then
	  clkcounter <= '0';
	  counterk <= (others => '0');
	 elsif rising_edge( SSI_clk) then 
	     if Counterk > x"6B" then
		    counterk <= (others => '0');
		    clkcounter <= '1';
		  else
		    counterk <= counterk + 1;
		    clkcounter <= '0';
		  end if;
	  end if;  
	 
  end process;
  
  ---------------------------------------------
  
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
			  
	       if counter1 > x"28" then --28 original
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
	   
	 --end if;
	
	
	end if;
  
  end process;
  
  SSI_clk_ext <=(not(not(SSI_clk) and SSI_clk_En));
  SSI_clk_int <=(not(not (SSI_clk2) and SSI_clk_En));
  load   <= not(SSI_clk_En);
  --SSI_data <= CONN_C_IN(0); 
  SSI_data_Az <= CONN_A_IN(1);
  SSI_data_El <= CONN_A_IN(2);
  CONN_A_OUT(0) <= SSI_clk_ext;
  
  --para probar
  CONN_F_OUT(0) <= PRFin;
  CONN_F_OUT(1) <= PRF_MARK;
  CONN_F_OUT(2) <= load;
  CONN_F_OUT(3) <= control_1;
 -- CONN_F_OUT(3) <= DATA_test(13);
  CONN_F_OUT(4) <= SSI_data_Az;
  CONN_F_OUT(5) <= SSI_data_EL;
  
 
  
  
	
--------end code for SSI--------------------------------  
 
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
  
    T1IN_A <= tx;  
-- notload <= load;
-- process(notload)
--  begin
--    if rising_edge(notload) then
--	    DATA_AZ_gray <= DATA_AZ_temp;
--   		
--	 end if;
--  end process;
--    
    EnablePRFin <= not(DATA_test(10) and DATA_test(9) and DATA_test(6)) ;
  
  process(DATA_Az_gray)
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
  
  process(FCLK_G)
  begin
  if (rising_edge(FCLK_G)) then
    if (pos_count > x"1388") then
	   load_pos <= '1';
		pos_count <= (others => '0');
	 else
	   load_pos <= '0' after 100 ns;
		pos_count <= pos_count +1;
	 end if;
	 
  end if;
  end process;
  
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
   -- PRF_MARK <= DataAngTime360(13);
  
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
  
  process( PRFin,Count_Pulse)
   begin
     if (rising_edge(PRFin)) then
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
  


 process(FCLK_G, RESET)
  begin
    if (RESET = '1') then
      Q1                                <= '0';
      Q2                                <= '0';
      Q3                                <= '0';
  --  elsif (FCLK_G'event and FCLK_G = '1') then
    elsif(rising_edge(FCLK_G)) then
      Q1                                <= UMI_IN(0);
      Q2                                <= Q1;
      Q3                                <= Q2;
    end if;
  end process;
  
--   process(FCLK_G, RESET)
--  begin
--    if (RESET = '1') then
--      Q1k                                <= '0';
--      Q2k                                <= '0';
--      Q3k                                <= '0';
--  --  elsif (FCLK_G'event and FCLK_G = '1') then
--    elsif(rising_edge(FCLK_G)) then
--      Q1k                                <= UMI_IN(1);
--      Q2k                                <= Q1k;
--      Q3k                                <= Q2k;
--    end if;
--  end process;
  
  
   
	 --PRFin   <= (Q1 and Q2 and (not Q3));
  PRFin   <= Q1 and Q2 and (not Q3);
 -- PRF2   <= Q1k and Q2k and (not Q3k);
  
  --PRFin   <=  PRF1 or PRF2; 
  --PRFin <= FCLK_G and UMI_IN(0);
 --UMI_OUT(2) <= PRFin;

 -------------------------------------
--UMI OUTPUT 
    UMI_OUT(1) <= PRF_MARK;
  --UMI_OUT(0) <= CONN_B_IN(0);
 -- UMI_OUT(3) <= PRFout;
 -- UMI_OUT(2) <= CONN_B_IN(2);
 -- UMI_OUT(3) <= CONN_B_IN(3);
-- UMI_OUT(3) <= '0';
   --UMI_OUT(2) <= OUTFIFO_EMPTY;
  ---------------------------
  --process
  --begin
  --  if UMI_IN(2) = '0' then
	--   PULSE_MODE(1 downto 0) <= "11";
	-- elsif UMI_IN(2) = '0' then
	--   PULSE_MODE(1 downto 0) <= "00";
	-- end if;	 
 -- end process;
 
  
  

  

  
  --End Robert Code------------------------------------

end EXAMPLE1;

