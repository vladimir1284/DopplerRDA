-- ==============================================================
-- FILE : TOP.VHD - may be modified by the ADVANCED USER
-- ==============================================================
--
-- This file is the top level of your project when using your
-- HERON-IO4 module.
--
-- This file could be modified by ADVANCED users.
--
-- ==============================================================
--
--  Module      : TOP
--  Date        : 04/03/2002
--  Author      : R. Williams - HUNT ENGINEERING
--  Description : TOP level
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
--  2.1     R. Williams    20-01-03    Changes made to the HSB
--                                     mastering functions, and 
--                                     additional registering added
--                                     to the AE flag to ensure
--                                     correct reading from HEPC8s.
--
-- ==============================================================


library ieee;
  use ieee.std_logic_1164.ALL;
  use work.CONFIG.all;

-- synopsys translate_off
library UNISIM;
  use UNISIM.vcomponents.all;
-- synopsys translate_on

entity TOP is
  port (
    -- PADS - HE_WCLK
    doclk        : in  std_logic;                      -- FIFO_OUT clock (use with DLL)
    f0           : out std_logic;                      -- FIFO_OUT clock loop driver
    -- PADS - HE_WR_6F
    dof_ff       : in  std_logic_vector(5 downto 0);   -- FIFO_OUT full flag
    dof_af       : in  std_logic_vector(5 downto 0);   -- FIFO_OUT almost full flag
    dof_wen      : out std_logic_vector(5 downto 0);   -- FIFO_OUT write enable
    do           : out std_logic_vector(31 downto 0);  -- FIFO_OUT data
    -- PADS - HE_RCLK
    diclk        : in  std_logic;                      -- FIFO_IN clock (use with DLL)
    f1           : out std_logic;                      -- FIFO_IN clock loop driver
    -- PADS - HE_RD_6F
    dif_ef       : in  std_logic_vector(5 downto 0);   -- FIFO_IN empty flag
    dif_ae       : in  std_logic_vector(5 downto 0);   -- FIFO_IN almost empty flag
    dif_ren      : out std_logic_vector(5 downto 0);   -- FIFO_IN read enable
    dif_oen      : out std_logic_vector(5 downto 0);   -- FIFO_IN output enable
    di           : in  std_logic_vector(31 downto 0);  -- FIFO_IN data
    -- PADS - HSB
    vpd          : inout std_logic_vector(7 downto 0); -- HSB data
    vinit        : inout std_logic;                    -- HSB address strobe
    vcs          : inout std_logic;                    -- HSB data strobe
    vwrite       : inout std_logic;                    -- HSB read(high)/write(low)
    vbusy        : inout std_logic;                    -- HSB ready
    -- PADS - HE_ADC
    drdy         : in  std_logic;                      -- A/D data ready
    enc_p        : out std_logic;                      -- A/D Encode+
    enc_n        : out std_logic;                      -- A/D Encode-
    adc_data     : in  std_logic_vector(13 downto 0);  -- A/D data
    adc_ovr      : in  std_logic;                      -- A/D over range
    -- PADS - HE_DAA
    wrt0         : out std_logic;                      -- D/A -A- data strobe
    trig0        : out std_logic;                      -- D/A -A- clock
    daa          : out std_logic_vector(13 downto 0);  -- D/A -A- data
    -- PADS - HE_DAB
    wrt1         : out std_logic;                      -- D/A -B- data strobe
    trig1        : out std_logic;                      -- D/A -B- clock
    dab          : out std_logic_vector(13 downto 0);  -- D/A -B- data
    -- CONTROL signals
    config       : in  std_logic;                      -- config from carrier card
    reset_pin    : in  std_logic;                      -- reset from carrier card
    udpres       : out std_logic;                      -- reset the carrier (high if NOT used)
    -- OSC/CLOCKS
    osc0_pin     : in  std_logic;                      -- user oscillator from socketed Xtal Osc
    osc1_pin     : in  std_logic;                      -- user oscillator from surface mount Xtal Osc
    osc2_pin     : in  std_logic;                      -- user oscillator from surface mount Xtal Osc
    osc3_pin     : in  std_logic;                      -- user oscillator from surface mount Xtal Osc
    clkin0       : in  std_logic;                      -- user clock input (unbuffered)
    clkin1       : in  std_logic;                      -- user clock input (unbuffered)
    clki2        : in  std_logic;                      -- user clock input (buffered)
    clki3        : in  std_logic;                      -- user clock input (buffered)
    clkout       : out std_logic;                      -- user clock output (unbuffered)
    -- General purpose GCLKs
    gck2         : in  std_logic;                      -- 'GCLK2' input
    f2           : out std_logic;                      -- Source for external GCLK2 signal
    gck3         : in  std_logic;                      -- 'GCLK3' input
    f3           : out std_logic;                      -- Source for external GCLK3 signal
    -- MISC I/O
    led          : out std_logic_vector(4 downto 0);  -- LEDs
    digital_io   : inout std_logic_vector(7 downto 0);-- Digital I/O
    cid          : in std_logic_vector(3 downto 0);   -- Carrier ID
    mid          : in std_logic_vector(3 downto 0);   -- Module ID
    umi          : inout std_logic_vector(3 downto 0);-- uncommitted UMI interconnects
    addr_flagsel : in  std_logic;                     -- Carrier Addr/Flagsel signal
    booten       : out std_logic;                     -- Carrier Boot Enable signal
    -- SERIAL I/O
    r1out        : in  std_logic;                     -- input serial data (connected to MAX3160)
    r2out        : in  std_logic;                     -- input serial data (connected to MAX3160)
    t1in         : out std_logic;                     -- output serial data (connected to MAX3160)
    t2in         : out std_logic;                     -- output serial data (connected to MAX3160)
    rs485_232    : out std_logic;                     -- control MAX3160
    hdplx        : out std_logic;                     -- control MAX3160
    fast         : out std_logic;                     -- control MAX3160
    qttl         : in  std_logic;                     -- differential ECL receiver
    dttl         : out std_logic                      -- differential ECL driver
  );
end TOP;


architecture RTL of TOP is

  component IBUF
    port(I : in  std_logic;
         O : out std_logic);
  end component;

  component IBUFG
    port(I : in  std_logic;
         O : out std_logic);
  end component;

  component IOBUF
    port(T  : in  std_logic;
         I  : in  std_logic;
         O  : out std_logic;
         IO : inout std_logic);
  end component;

  component OBUFTDS
    port(I  : in  std_logic;
         T  : in  std_logic;
         O  : out std_logic;
         OB : out std_logic);
  end component;

  component OBUF_F_24
    port(I : in  std_logic;
         O : out std_logic);
  end component;

  component OBUF_F_12
    port(I : in  std_logic;
         O : out std_logic);
  end component;

  component OBUF_F_8
    port(I : in  std_logic;
         O : out std_logic);
  end component;

  component ES_RD_LF
    port (
      -- PADS
      DCLK : in  std_logic;
      FCLK : out std_logic;
      -- I/O module
      RST  : in  std_logic;
      CLK  : in  std_logic;
      GCLK : out std_logic
    );
  end component;
  component ES_RD_HF
    port (
      -- PADS
      DCLK : in  std_logic;
      FCLK : out std_logic;
      -- I/O module
      RST  : in  std_logic;
      CLK  : in  std_logic;
      GCLK : out std_logic
    );
  end component;
  component ES_WR_LF
    port (
      -- PADS
      DCLK : in  std_logic;
      FCLK : out std_logic;
      -- I/O module
      RST  : in  std_logic;
      CLK  : in  std_logic;
      GCLK : out std_logic
    );
  end component;
  component ES_WR_HF
    port (
      -- PADS
      DCLK : in  std_logic;
      FCLK : out std_logic;
      -- I/O module
      RST  : in  std_logic;
      CLK  : in  std_logic;
      GCLK : out std_logic
    );
  end component;

  component HE_RWCLK
    generic ( HFreq : boolean := FALSE );
    port (
      -- PADS
      DCLK : in  std_logic;
      FCLK : out std_logic;
      -- I/O module
      RST  : in  std_logic;
      CLK  : in  std_logic;
      GCLK : out std_logic
    );
  end component;

  component HE_RD_6F
    port (
      -- PADS
      DIF_EF          : in  std_logic_vector(5 downto 0);
      DIF_AE          : in  std_logic_vector(5 downto 0);
      DIF_REN         : out std_logic_vector(5 downto 0);
      DIF_OEN         : out std_logic_vector(5 downto 0);
      DI              : in  std_logic_vector(31 downto 0);
      -- I/O module
      RST             : in  std_logic;
      CLK             : in  std_logic;
      INFIFO_READ_REQ : in  std_logic_vector(5 downto 0);
      INFIFO_DVALID   : out std_logic_vector(5 downto 0);
      INFIFO_SINGLE   : out std_logic_vector(5 downto 0);
      INFIFO_BURST    : out std_logic_vector(5 downto 0);
      INFIFO0_D       : out std_logic_vector(31 downto 0);
      INFIFO1_D       : out std_logic_vector(31 downto 0);
      INFIFO2_D       : out std_logic_vector(31 downto 0);
      INFIFO3_D       : out std_logic_vector(31 downto 0);
      INFIFO4_D       : out std_logic_vector(31 downto 0);
      INFIFO5_D       : out std_logic_vector(31 downto 0)
    );
  end component;

  component HE_WR_6F
    port (
      -- PADS
      DOF_FF        : in  std_logic_vector(5 downto 0);
      DOF_AF        : in  std_logic_vector(5 downto 0);
      DOF_WEN       : out std_logic_vector(5 downto 0);
      DO            : out std_logic_vector(31 downto 0);
      -- I/O module
      RST           : in  std_logic;
      CLK           : in  std_logic;
      OUTFIFO_WRITE : in  std_logic_vector(5 downto 0);
      OUTFIFO_D     : in  std_logic_vector(31 downto 0);
      OUTFIFO_READY : out std_logic_vector(5 downto 0)
    );
  end component;

  component HE_USER
    port (
      -- PADS - HE_V/S_CTL
      VPD       : inout std_logic_vector(7 downto 0);
      VINIT     : inout std_logic;
      VCS       : inout std_logic;
      VWRITE    : inout std_logic;
      VBUSY     : inout std_logic;
      -- I/O module
      RST       : in  std_logic;
      CLK       : in  std_logic;
      READY     : in  std_logic;
      SEND_MSG  : in  std_logic;
      CE        : in  std_logic;
      DOUT      : in  std_logic_vector(7 downto 0);
      CID       : in  std_logic_vector(3 downto 0);
      MID       : in  std_logic_vector(2 downto 0);
      SEND_ID   : in  std_logic;
      LAST_BYTE : in  std_logic;
      DIN       : out std_logic_vector(7 downto 0);
      ADDR      : out std_logic_vector(7 downto 0);
      WEN       : out std_logic;
      REN       : out std_logic;
      DONE      : out std_logic;
      COUNT     : out std_logic;
      CLEAR     : out std_logic
    );
  end component;

  component HE_SCLK
    generic ( DriveClock : boolean := FALSE );
    port (
      -- PADS
      DRDY   : in  std_logic;
      -- I/O module
      OEN    : out std_logic;
      SCLK   : out std_logic
    );
  end component;

  component HE_ADC
    port (
      -- PADS
      ADC_DATA : in  std_logic_vector(13 downto 0);
      ADC_OVR  : in  std_logic;
      -- I/O module
      RST      : in  std_logic;
      SCLK     : in  std_logic;
      ADC      : out std_logic_vector(13 downto 0);
      OVR      : out std_logic
    );
  end component;

  component HE_DAC
    port (
      -- PADS
      WRT  : out std_logic;
      CLK  : out std_logic;
      DAC  : out std_logic_vector(13 downto 0);
      -- I/O module
      SCLK : in  std_logic;
      DATA : in  std_logic_vector(13 downto 0)
    );
  end component;

  component USER_AP
    port (
      RESET           : in  std_logic;
      CONFIG          : in  std_logic;
  -- CLOCK SIGNALS
      OSC0            : in  std_logic;
      OSC1            : in  std_logic;
      OSC2            : in  std_logic;
      OSC3            : in  std_logic;
      CLKIN0          : in  std_logic;
      CLKIN1          : in  std_logic;
      CLKI2           : in  std_logic;
      CLKI3           : in  std_logic;
      CLKOUT          : out std_logic;
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
  -- GENERAL IO
      UDPRES          : out std_logic;
      LED             : out std_logic_vector(4 downto 0);
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
      FCLK_RD         : in  std_logic;
      SRC_FCLK_RD     : out std_logic;
  -- WRITE FIFO CLK
      FCLK_WR         : in  std_logic;
      SRC_FCLK_WR     : out std_logic;
  -- GLOBAL FIFO CLK
      FCLK_G          : in  std_logic;
      SRC_FCLK_G      : out std_logic;
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
  -- SERIAL BUS / HE_USER interface
      MSG_CLK         : out std_logic;
      MSG_DIN         : in  std_logic_vector(7 downto 0);
      MSG_ADDR        : in  std_logic_vector(7 downto 0);
      MSG_WEN         : in  std_logic;
      MSG_REN         : in  std_logic;
      MSG_DONE        : in  std_logic;
      MSG_COUNT       : in  std_logic;
      MSG_CLEAR       : in  std_logic;
      MSG_READY       : out std_logic;
      MSG_SEND_MSG    : out std_logic;
      MSG_CE          : out std_logic;
      MSG_DOUT        : out std_logic_vector(7 downto 0);
      MSG_SEND_ID     : out std_logic;
      MSG_LAST_BYTE   : out std_logic;
  -- GLOBAL SCLK
      SCLK            : in  std_logic;
      SRC_SCLK        : out std_logic;
  -- HE_ADC_A
      ADC             : in  std_logic_vector(13 downto 0);
      OVR             : in  std_logic;
  -- HE_DAC_A
      SCLK_DAC_A      : out std_logic;
      DAC_A           : out std_logic_vector(13 downto 0);
  -- HE_DAC_B
      SCLK_DAC_B      : out std_logic;
      DAC_B           : out std_logic_vector(13 downto 0)
    );
  end component;

  attribute IOSTANDARD : string;
  attribute IOSTANDARD of iENC : label is "LVPECL_33";

  signal RESET           : std_logic;

  signal OSC0            : std_logic;
  signal OSC1            : std_logic;
  signal OSC2            : std_logic;
  signal OSC3            : std_logic;

  signal GCLK_A          : std_logic;
  signal GCLK_B          : std_logic;

  signal FCLK_RD         : std_logic;
  signal SRC_FCLK_RD     : std_logic;
  signal FCLK_WR         : std_logic;
  signal SRC_FCLK_WR     : std_logic;
  signal FCLK_G          : std_logic;
  signal xFCLK_G         : std_logic;
  signal SRC_FCLK_G      : std_logic;
  signal xDICLK          : std_logic;
  signal xF1             : std_logic;
  signal xDOCLK          : std_logic;
  signal xF0             : std_logic;

  signal xDIF_REN        : std_logic_vector(5 downto 0);
  signal xDIF_OEN        : std_logic_vector(5 downto 0);
  signal INFIFO_READ_REQ : std_logic_vector(5 downto 0);
  signal INFIFO_DVALID   : std_logic_vector(5 downto 0);
  signal INFIFO_SINGLE   : std_logic_vector(5 downto 0);
  signal INFIFO_BURST    : std_logic_vector(5 downto 0);
  signal INFIFO0_D       : std_logic_vector(31 downto 0);
  signal INFIFO1_D       : std_logic_vector(31 downto 0);
  signal INFIFO2_D       : std_logic_vector(31 downto 0);
  signal INFIFO3_D       : std_logic_vector(31 downto 0);
  signal INFIFO4_D       : std_logic_vector(31 downto 0);
  signal INFIFO5_D       : std_logic_vector(31 downto 0);

  signal xDOF_WEN        : std_logic_vector(5 downto 0);
  signal OUTFIFO_READY   : std_logic_vector(5 downto 0);
  signal OUTFIFO_WRITE   : std_logic_vector(5 downto 0);
  signal OUTFIFO_D       : std_logic_vector(31 downto 0);

  signal MSG_CLK         : std_logic;
  signal MSG_READY       : std_logic;
  signal MSG_SEND_MSG    : std_logic;
  signal MSG_CE          : std_logic;
  signal MSG_DOUT        : std_logic_vector(7 downto 0);
  signal MSG_SEND_ID     : std_logic;
  signal MSG_LAST_BYTE   : std_logic;
  signal MSG_DIN         : std_logic_vector(7 downto 0);
  signal MSG_ADDR        : std_logic_vector(7 downto 0);
  signal MSG_WEN         : std_logic;
  signal MSG_REN         : std_logic;
  signal MSG_DONE        : std_logic;
  signal MSG_COUNT       : std_logic;
  signal MSG_CLEAR       : std_logic;

  signal SCLK            : std_logic;
  signal SRC_SCLK        : std_logic;
  signal SCLK_OEN        : std_logic;

  signal ADC             : std_logic_vector(13 downto 0);
  signal OVR             : std_logic;

  signal xWRT0           : std_logic;
  signal xCLK0           : std_logic;
  signal xWRT1           : std_logic;
  signal xCLK1           : std_logic;
  signal SCLK_DAC_A      : std_logic;
  signal SCLK_DAC_B      : std_logic;

  signal DAC_A           : std_logic_vector(13 downto 0);
  signal DAC_B           : std_logic_vector(13 downto 0);

  signal UMI_IN          : std_logic_vector(3 downto 0);
  signal UMI_OUT         : std_logic_vector(3 downto 0);
  signal UMI_EN          : std_logic_vector(3 downto 0);

  signal DIO_IN          : std_logic_vector(7 downto 0);
  signal DIO_OUT         : std_logic_vector(7 downto 0);
  signal DIO_EN          : std_logic_vector(7 downto 0);

begin

  -- RESET active low
  RESET <= NOT reset_pin;

  -- UMIs
  iUMI0 : iobuf port map (T=>UMI_EN(0), I=>UMI_OUT(0), O=>UMI_IN(0), IO=>umi(0));
  iUMI1 : iobuf port map (T=>UMI_EN(1), I=>UMI_OUT(1), O=>UMI_IN(1), IO=>umi(1));
  iUMI2 : iobuf port map (T=>UMI_EN(2), I=>UMI_OUT(2), O=>UMI_IN(2), IO=>umi(2));
  iUMI3 : iobuf port map (T=>UMI_EN(3), I=>UMI_OUT(3), O=>UMI_IN(3), IO=>umi(3));

  -- Digital I/O
  iDIO0 : iobuf port map (T=>DIO_EN(0), I=>DIO_OUT(0), O=>DIO_IN(0), IO=>digital_io(0));
  iDIO1 : iobuf port map (T=>DIO_EN(1), I=>DIO_OUT(1), O=>DIO_IN(1), IO=>digital_io(1));
  iDIO2 : iobuf port map (T=>DIO_EN(2), I=>DIO_OUT(2), O=>DIO_IN(2), IO=>digital_io(2));
  iDIO3 : iobuf port map (T=>DIO_EN(3), I=>DIO_OUT(3), O=>DIO_IN(3), IO=>digital_io(3));
  iDIO4 : iobuf port map (T=>DIO_EN(4), I=>DIO_OUT(4), O=>DIO_IN(4), IO=>digital_io(4));
  iDIO5 : iobuf port map (T=>DIO_EN(5), I=>DIO_OUT(5), O=>DIO_IN(5), IO=>digital_io(5));
  iDIO6 : iobuf port map (T=>DIO_EN(6), I=>DIO_OUT(6), O=>DIO_IN(6), IO=>digital_io(6));
  iDIO7 : iobuf port map (T=>DIO_EN(7), I=>DIO_OUT(7), O=>DIO_IN(7), IO=>digital_io(7));

  -- Oscillator inputs ('oscx' ports are not assigned to clock pads in the UCF file !)
  iOSC0 : IBUF port map (I=>osc0_pin, O=>OSC0);
  iOSC1 : IBUF port map (I=>osc1_pin, O=>OSC1);
  iOSC2 : IBUF port map (I=>osc2_pin, O=>OSC2);
  iOSC3 : IBUF port map (I=>osc3_pin, O=>OSC3);

  -------------------------------------------------------------
  -- General Purpose GCLKs

  iGCKA : IBUFG port map (I=>gck2, O=>GCLK_A);
  iGCKB : IBUFG port map (I=>gck3, O=>GCLK_B);

  -------------------------------------------------------------
  -- FIFO clocks

  iDICLK : IBUFG port map (I=>diclk, O=>xDICLK);
  oF1 : OBUF_F_24 port map (I=>xF1, O=>f1);

  iDOCLK : IBUFG port map (I=>doclk, O=>xDOCLK);
  oF0 : OBUF_F_24 port map (I=>xF0, O=>f0);

  -- Spartan 2 & production Virtex 2
  -- ===============================
  gNV2ES_FIFO : if (NOT VIRTEX2_ES) generate

    -- same clock for both FIFO interfaces
    -- ===================================
    gFCKG : if (FCLK_G_DOMAIN) generate

      -- read clock
      -- ==========
      iGCLK : HE_RWCLK
        generic map (HFreq => HIGH_FCLK_G)
        port map (
          DCLK => xDICLK,
          FCLK => xF1,
          --
          RST  => RESET,
          CLK  => SRC_FCLK_G,
          GCLK => xFCLK_G );

      -- write clock
      -- ===========
      xF0 <= SRC_FCLK_G;

      -- USER_AP clocks
      FCLK_RD <= xFCLK_G;
      FCLK_WR <= xFCLK_G;
      FCLK_G  <= xFCLK_G;

    end generate gFCKG;

    -- separate clocks for RD/WR FIFOs
    -- ===============================
    gNFCKG : if (NOT FCLK_G_DOMAIN) generate

      -- read clock
      -- ==========
      iRDCLK : HE_RWCLK
        generic map (HFreq => HIGH_FCLK_RD)
        port map (
          DCLK => xDICLK,
          FCLK => xF1,
          --
          RST  => RESET,
          CLK  => SRC_FCLK_RD,
          GCLK => FCLK_RD );

      -- write clock
      -- ===========
      iWRCLK : HE_RWCLK
        generic map (HFreq => HIGH_FCLK_WR)
        port map (
          DCLK => xDOCLK,
          FCLK => xF0,
          --
          RST  => RESET,
          CLK  => SRC_FCLK_WR,
          GCLK => FCLK_WR );

      -- unused clock
      FCLK_G  <= '0';

    end generate gNFCKG;

  end generate gNV2ES_FIFO;

  --  Virtex 2 Engineering Sample
  -- ============================
  gV2ES_FIFO : if (VIRTEX2_ES) generate

    -- same clock for both FIFO interfaces
    -- ===================================
    gFCKG : if (FCLK_G_DOMAIN) generate

      -- read clock
      -- ==========
      -- LOW frequency
      g_G_LF : if (NOT HIGH_FCLK_G) generate
        iGCLK : ES_RD_LF
          port map (
            DCLK => xDICLK,
            FCLK => xF1,
            --
            RST  => RESET,
            CLK  => SRC_FCLK_G,
            GCLK => xFCLK_G );
      end generate;
      -- HIGH frequency
      g_G_HF : if (HIGH_FCLK_G) generate
        iGCLK : ES_RD_HF
          port map (
            DCLK => xDICLK,
            FCLK => xF1,
            --
            RST  => RESET,
            CLK  => SRC_FCLK_G,
            GCLK => xFCLK_G );
      end generate;

      -- write clock
      -- ===========
      xF0 <= SRC_FCLK_G;

      -- USER_AP clocks
      FCLK_RD <= xFCLK_G;
      FCLK_WR <= xFCLK_G;
      FCLK_G  <= xFCLK_G;

    end generate gFCKG;

    -- separate clocks for RD/WR FIFOs
    -- ===============================
    gNFCKG : if (NOT FCLK_G_DOMAIN) generate

      -- read clock
      -- ==========
      -- LOW frequency
      g_RD_LF : if (NOT HIGH_FCLK_RD) generate
        iGCLK : ES_RD_LF
          port map (
            DCLK => xDICLK,
            FCLK => xF1,
            --
            RST  => RESET,
            CLK  => SRC_FCLK_RD,
            GCLK => FCLK_RD );
      end generate g_RD_LF;
      -- HIGH frequency
      g_RD_HF : if (HIGH_FCLK_RD) generate
        iGCLK : ES_RD_HF
          port map (
            DCLK => xDICLK,
            FCLK => xF1,
            --
            RST  => RESET,
            CLK  => SRC_FCLK_RD,
            GCLK => FCLK_RD );
      end generate;

      -- write clock
      -- ===========
      -- LOW frequency
      g_WR_LF : if (NOT HIGH_FCLK_WR) generate
        iWRCLK : ES_WR_LF
          port map (
            DCLK => xDOCLK,
            FCLK => xF0,
            --
            RST  => RESET,
            CLK  => SRC_FCLK_WR,
            GCLK => FCLK_WR );
      end generate;
      -- HIGH frequency
      g_WR_HF : if (HIGH_FCLK_WR) generate
        iWRCLK : ES_WR_HF
          port map (
            DCLK => xDOCLK,
            FCLK => xF0,
            --
            RST  => RESET,
            CLK  => SRC_FCLK_WR,
            GCLK => FCLK_WR );
      end generate;

      -- unused clock
      FCLK_G  <= '0';

    end generate gNFCKG;

  end generate gV2ES_FIFO;

  -------------------------------------------------------------
  -- FIFO input

  iRD : HE_RD_6F
    port map (
      DIF_EF          => dif_ef,
      DIF_AE          => dif_ae,
      DIF_REN         => xDIF_REN,
      DIF_OEN         => xDIF_OEN,
      DI              => di,
      --
      RST             => RESET,
      CLK             => FCLK_RD,
      INFIFO_READ_REQ => INFIFO_READ_REQ,
      INFIFO_DVALID   => INFIFO_DVALID,
      INFIFO_SINGLE   => INFIFO_SINGLE,
      INFIFO_BURST    => INFIFO_BURST,
      INFIFO0_D       => INFIFO0_D,
      INFIFO1_D       => INFIFO1_D,
      INFIFO2_D       => INFIFO2_D,
      INFIFO3_D       => INFIFO3_D,
      INFIFO4_D       => INFIFO4_D,
      INFIFO5_D       => INFIFO5_D );

  gREN : for I in 0 to 5 generate
    oREN : OBUF_F_8 port map (I=>xDIF_REN(I), O=>dif_ren(I));
    oOEN : OBUF_F_8 port map (I=>xDIF_OEN(I), O=>dif_oen(I));
  end generate gREN;

  -------------------------------------------------------------
  -- FIFO output

  iWR : HE_WR_6F
    port map (
      DOF_FF        => dof_ff,
      DOF_AF        => dof_af,
      DOF_WEN       => xDOF_WEN,
      DO            => do,
      --
      RST           => RESET,
      CLK           => FCLK_WR,
      OUTFIFO_WRITE => OUTFIFO_WRITE,
      OUTFIFO_D     => OUTFIFO_D,
      OUTFIFO_READY => OUTFIFO_READY );

  gWEN : for I in 0 to 5 generate
    oWEN : OBUF_F_8 port map (I=>xDOF_WEN(I), O=>dof_wen(I));
  end generate gWEN;

  -------------------------------------------------------------
  -- Serial Bus Interface

  iUSR : HE_USER
    port map (
      VPD       => vpd,
      VINIT     => vinit,
      VCS       => vcs,
      VWRITE    => vwrite,
      VBUSY     => vbusy,
      --
      RST       => RESET,
      CLK       => MSG_CLK,
      READY     => MSG_READY,
      SEND_MSG  => MSG_SEND_MSG,
      CE        => MSG_CE,
      DOUT      => MSG_DOUT,
      CID       => cid,
      MID       => mid(2 downto 0),
      SEND_ID   => MSG_SEND_ID,
      LAST_BYTE => MSG_LAST_BYTE,
      DIN       => MSG_DIN,
      ADDR      => MSG_ADDR,
      WEN       => MSG_WEN,
      REN       => MSG_REN,
      DONE      => MSG_DONE,
      COUNT     => MSG_COUNT,
      CLEAR     => MSG_CLEAR );

  -------------------------------------------------------------
  -- ADC clock

  iENC : OBUFTDS port map (I=>SRC_SCLK, T=>SCLK_OEN, O=>enc_p, OB=>enc_n);

  iSCLK : HE_SCLK
    generic map (DriveClock => INTERNAL_SCLK)
    port map(
      DRDY => drdy,
      --
      OEN  => SCLK_OEN,
      SCLK => SCLK );

  -------------------------------------------------------------
  -- ADC

  iADC : HE_ADC
    port map (
      ADC_DATA => adc_data,
      ADC_OVR  => adc_ovr,
      --
      RST      => RESET,
      SCLK     => SCLK,
      ADC      => ADC,
      OVR      => OVR );

  -------------------------------------------------------------
  -- DAC

  iDACA : HE_DAC
    port map (
      WRT  => xWRT0,
      CLK  => xCLK0,
      DAC  => daa,
      --
      SCLK => SCLK_DAC_A,
      DATA => DAC_A );

  oWRT0 : OBUF_F_8 port map (I=>xWRT0, O=>wrt0);
  oSCLK0 : OBUF_F_12 port map (I=>xCLK0, O=>trig0);

  iDACB : HE_DAC
    port map (
      WRT  => xWRT1,
      CLK  => xCLK1,
      DAC  => dab,
      --
      SCLK => SCLK_DAC_B,
      DATA => DAC_B );

  oWRT1 : OBUF_F_8 port map (I=>xWRT1, O=>wrt1);
  oSCLK1 : OBUF_F_12 port map (I=>xCLK1, O=>trig1);

  -------------------------------------------------------------
  -- USER_AP

  iUSER_AP : USER_AP
    port map (
      RESET           => RESET,
      CONFIG          => config,
      --
      OSC0            => OSC0,
      OSC1            => OSC1,
      OSC2            => OSC2,
      OSC3            => OSC3,
      --
      CLKIN0          => clkin0,
      CLKIN1          => clkin1,
      CLKI2           => clki2,
      CLKI3           => clki3,
      CLKOUT          => clkout,
      --
      GCLK_A          => GCLK_A,
      SRC_GCLK_A      => f2,
      GCLK_B          => GCLK_B,
      SRC_GCLK_B      => f3,
      --
      UDPRES          => udpres,
      LED             => led,
      --
      ADDR_FLAGSEL    => addr_flagsel,
      BOOTEN          => booten,
      --
      CID             => cid,
      MID             => mid,
      UMI_IN          => UMI_IN,
      UMI_OUT         => UMI_OUT,
      UMI_EN          => UMI_EN,
      --
      DIO_IN          => DIO_IN,
      DIO_OUT         => DIO_OUT,
      DIO_EN          => DIO_EN,
      --
      QTTL            => qttl,
      DTTL            => dttl,
      --
      R1OUT           => r1out,
      R2OUT           => r2out,
      T1IN            => t1in,
      T2IN            => t2in,
      RS485_232       => rs485_232,
      HDPLX           => hdplx,
      FAST            => fast,
      --
      FCLK_RD         => FCLK_RD,
      SRC_FCLK_RD     => SRC_FCLK_RD,
      --
      FCLK_WR         => FCLK_WR,
      SRC_FCLK_WR     => SRC_FCLK_WR,
      --
      FCLK_G          => FCLK_G,
      SRC_FCLK_G      => SRC_FCLK_G,
      --
      INFIFO_READ_REQ => INFIFO_READ_REQ,
      INFIFO_DVALID   => INFIFO_DVALID,
      INFIFO_SINGLE   => INFIFO_SINGLE,
      INFIFO_BURST    => INFIFO_BURST,
      INFIFO0_D       => INFIFO0_D,
      INFIFO1_D       => INFIFO1_D,
      INFIFO2_D       => INFIFO2_D,
      INFIFO3_D       => INFIFO3_D,
      INFIFO4_D       => INFIFO4_D,
      INFIFO5_D       => INFIFO5_D,
      --
      OUTFIFO_READY   => OUTFIFO_READY,
      OUTFIFO_WRITE   => OUTFIFO_WRITE,
      OUTFIFO_D       => OUTFIFO_D,
      --
      MSG_CLK         => MSG_CLK,
      MSG_DIN         => MSG_DIN,
      MSG_ADDR        => MSG_ADDR,
      MSG_WEN         => MSG_WEN,
      MSG_REN         => MSG_REN,
      MSG_DONE        => MSG_DONE,
      MSG_COUNT       => MSG_COUNT,
      MSG_CLEAR       => MSG_CLEAR,
      MSG_READY       => MSG_READY,
      MSG_SEND_MSG    => MSG_SEND_MSG,
      MSG_CE          => MSG_CE,
      MSG_DOUT        => MSG_DOUT,
      MSG_SEND_ID     => MSG_SEND_ID,
      MSG_LAST_BYTE   => MSG_LAST_BYTE,
      --
      SCLK            => SCLK,
      SRC_SCLK        => SRC_SCLK,
      --
      ADC             => ADC,
      OVR             => OVR,
      --
      SCLK_DAC_A      => SCLK_DAC_A,
      DAC_A           => DAC_A,
      --
      SCLK_DAC_B      => SCLK_DAC_B,
      DAC_B           => DAC_B );

end RTL;

