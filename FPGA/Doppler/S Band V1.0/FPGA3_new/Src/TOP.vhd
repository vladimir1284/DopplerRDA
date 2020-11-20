-- ==============================================================
-- FILE : TOP.VHD - may be modified by the ADVANCED USER
-- ==============================================================
--
-- This file is the top level of your project when using your
-- HERON-FPGA3 module.
--
-- This file could be modified by ADVANCED users.
--
-- ==============================================================
--
--  Module      : TOP
--  Date        : 28/02/2002
--  Author      : R. Williams - HUNT ENGINEERING
--  Description : TOP level
--
-- ==============================================================
--
--  Ver     Modified By      Date      Changes
--  ---     -----------      ----      -------
--  1.0     R. Williams    28-02-02    First Written
--  1.1     R. Williams    08-05-02    Syntax change made to all
--                                     instanciated components,
--                                     (changed '0' to GND)
--                                     for compatibility with
--                                     ModelSim5.5b.
--  1.2     R. Williams    11-06-02    Added 1ns delay on paths
--                                     from inferred flip-flops
--                                     to instantiated flip-flops
--                                     to prevent setup violations
--                                     in functional simulation.
--  2.0     R. Williams    10-10-02    New components added for
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
    -- PADS - Connector Digital I/O
    dio_a        : inout std_logic_vector(14 downto 0);-- Connector A IO
    dio_b        : inout std_logic_vector(14 downto 0);-- Connector B IO
    dio_c        : inout std_logic_vector(14 downto 0);-- Connector C IO
    dio_d        : inout std_logic_vector(14 downto 0);-- Connector D IO
    dio_e        : inout std_logic_vector(14 downto 0);-- Connector E IO
    dio_f        : inout std_logic_vector(14 downto 0);-- Connector F IO
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
    -- MISC I/O
    led          : out std_logic_vector(4 downto 0);   -- LEDs
    cid          : in  std_logic_vector(3 downto 0);   -- Carrier ID
    mid          : in  std_logic_vector(3 downto 0);   -- Module ID
    umi          : inout std_logic_vector(3 downto 0); -- Uncommitted UMI interconnects
    addr_flagsel : in  std_logic;                      -- Carrier Addr/Flagsel signal
    booten       : out std_logic;                      -- Carrier Boot Enable signal
    -- SERIAL I/O
    r1out_a      : in  std_logic;                      -- input serial data (connected to MAX3160 A)
    r2out_a      : in  std_logic;                      -- input serial data (connected to MAX3160 A)
    t1in_a       : out std_logic;                      -- output serial data (connected to MAX3160 A)
    t2in_a       : out std_logic;                      -- output serial data (connected to MAX3160 A)
    rs485_232_a  : out std_logic;                      -- control MAX3160 A
    hdplx_a      : out std_logic;                      -- control MAX3160 A
    fast_a       : out std_logic;                      -- control MAX3160 A
    r1out_b      : in  std_logic;                      -- input serial data (connected to MAX3160 B)
    r2out_b      : in  std_logic;                      -- input serial data (connected to MAX3160 B)
    t1in_b       : out std_logic;                      -- output serial data (connected to MAX3160 B)
    t2in_b       : out std_logic;                      -- output serial data (connected to MAX3160 B)
    rs485_232_b  : out std_logic;                      -- control MAX3160 B
    hdplx_b      : out std_logic;                      -- control MAX3160 B
    fast_b       : out std_logic;                      -- control MAX3160 B
    qttl         : in  std_logic;                      -- differential ECL receiver
    dttl         : out std_logic                       -- differential ECL driver
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

  component OBUF_F_24
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
  -- CONNECTOR DIGITAL IO
      CONN_A_IN       : in  std_logic_vector(14 downto 0);
      CONN_A_OUT      : out std_logic_vector(14 downto 0);
      CONN_A_EN       : out std_logic_vector(14 downto 0);
      CONN_B_IN       : in  std_logic_vector(14 downto 0);
      CONN_B_OUT      : out std_logic_vector(14 downto 0);
      CONN_B_EN       : out std_logic_vector(14 downto 0);
      CONN_C_IN       : in  std_logic_vector(14 downto 0);
      CONN_C_OUT      : out std_logic_vector(14 downto 0);
      CONN_C_EN       : out std_logic_vector(14 downto 0);
      CONN_D_IN       : in  std_logic_vector(14 downto 0);
      CONN_D_OUT      : out std_logic_vector(14 downto 0);
      CONN_D_EN       : out std_logic_vector(14 downto 0);
      CONN_E_IN       : in  std_logic_vector(14 downto 0);
      CONN_E_OUT      : out std_logic_vector(14 downto 0);
      CONN_E_EN       : out std_logic_vector(14 downto 0);
      CONN_F_IN       : in  std_logic_vector(14 downto 0);
      CONN_F_OUT      : out std_logic_vector(14 downto 0);
      CONN_F_EN       : out std_logic_vector(14 downto 0)
    );
  end component;

  signal RESET           : std_logic;

  signal OSC0            : std_logic;
  signal OSC1            : std_logic;
  signal OSC2            : std_logic;
  signal OSC3            : std_logic;

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

  signal UMI_IN          : std_logic_vector(3 downto 0);
  signal UMI_OUT         : std_logic_vector(3 downto 0);
  signal UMI_EN          : std_logic_vector(3 downto 0);

  signal CONN_A_IN       : std_logic_vector(14 downto 0);
  signal CONN_A_OUT      : std_logic_vector(14 downto 0);
  signal CONN_A_EN       : std_logic_vector(14 downto 0);

  signal CONN_B_IN       : std_logic_vector(14 downto 0);
  signal CONN_B_OUT      : std_logic_vector(14 downto 0);
  signal CONN_B_EN       : std_logic_vector(14 downto 0);

  signal CONN_C_IN       : std_logic_vector(14 downto 0);
  signal CONN_C_OUT      : std_logic_vector(14 downto 0);
  signal CONN_C_EN       : std_logic_vector(14 downto 0);

  signal CONN_D_IN       : std_logic_vector(14 downto 0);
  signal CONN_D_OUT      : std_logic_vector(14 downto 0);
  signal CONN_D_EN       : std_logic_vector(14 downto 0);

  signal CONN_E_IN       : std_logic_vector(14 downto 0);
  signal CONN_E_OUT      : std_logic_vector(14 downto 0);
  signal CONN_E_EN       : std_logic_vector(14 downto 0);

  signal CONN_F_IN       : std_logic_vector(14 downto 0);
  signal CONN_F_OUT      : std_logic_vector(14 downto 0);
  signal CONN_F_EN       : std_logic_vector(14 downto 0);

begin

  -- RESET active low
  RESET <= NOT reset_pin;

  -- UMIs
  iUMI0 : iobuf port map (T=>UMI_EN(0), I=>UMI_OUT(0), O=>UMI_IN(0), IO=>umi(0));
  iUMI1 : iobuf port map (T=>UMI_EN(1), I=>UMI_OUT(1), O=>UMI_IN(1), IO=>umi(1));
  iUMI2 : iobuf port map (T=>UMI_EN(2), I=>UMI_OUT(2), O=>UMI_IN(2), IO=>umi(2));
  iUMI3 : iobuf port map (T=>UMI_EN(3), I=>UMI_OUT(3), O=>UMI_IN(3), IO=>umi(3));

  -- Oscillator inputs ('oscx' ports are not assigned to clock pads in the UCF file !)
  iOSC0 : IBUF port map (I=>osc0_pin, O=>OSC0);
  iOSC1 : IBUF port map (I=>osc1_pin, O=>OSC1);
  iOSC2 : IBUF port map (I=>osc2_pin, O=>OSC2);
  iOSC3 : IBUF port map (I=>osc3_pin, O=>OSC3);

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
  -- Connector Digital IO

  iDIOA0  : iobuf port map (T=>CONN_A_EN(0),  I=>CONN_A_OUT(0),  O=>CONN_A_IN(0),  IO=>dio_a(0) );
  iDIOA1  : iobuf port map (T=>CONN_A_EN(1),  I=>CONN_A_OUT(1),  O=>CONN_A_IN(1),  IO=>dio_a(1) );
  iDIOA2  : iobuf port map (T=>CONN_A_EN(2),  I=>CONN_A_OUT(2),  O=>CONN_A_IN(2),  IO=>dio_a(2) );
  iDIOA3  : iobuf port map (T=>CONN_A_EN(3),  I=>CONN_A_OUT(3),  O=>CONN_A_IN(3),  IO=>dio_a(3) );
  iDIOA4  : iobuf port map (T=>CONN_A_EN(4),  I=>CONN_A_OUT(4),  O=>CONN_A_IN(4),  IO=>dio_a(4) );
  iDIOA5  : iobuf port map (T=>CONN_A_EN(5),  I=>CONN_A_OUT(5),  O=>CONN_A_IN(5),  IO=>dio_a(5) );
  iDIOA6  : iobuf port map (T=>CONN_A_EN(6),  I=>CONN_A_OUT(6),  O=>CONN_A_IN(6),  IO=>dio_a(6) );
  iDIOA7  : iobuf port map (T=>CONN_A_EN(7),  I=>CONN_A_OUT(7),  O=>CONN_A_IN(7),  IO=>dio_a(7) );
  iDIOA8  : iobuf port map (T=>CONN_A_EN(8),  I=>CONN_A_OUT(8),  O=>CONN_A_IN(8),  IO=>dio_a(8) );
  iDIOA9  : iobuf port map (T=>CONN_A_EN(9),  I=>CONN_A_OUT(9),  O=>CONN_A_IN(9),  IO=>dio_a(9) );
  iDIOA10 : iobuf port map (T=>CONN_A_EN(10), I=>CONN_A_OUT(10), O=>CONN_A_IN(10), IO=>dio_a(10));
  iDIOA11 : iobuf port map (T=>CONN_A_EN(11), I=>CONN_A_OUT(11), O=>CONN_A_IN(11), IO=>dio_a(11));
  iDIOA12 : iobuf port map (T=>CONN_A_EN(12), I=>CONN_A_OUT(12), O=>CONN_A_IN(12), IO=>dio_a(12));
  iDIOA13 : iobuf port map (T=>CONN_A_EN(13), I=>CONN_A_OUT(13), O=>CONN_A_IN(13), IO=>dio_a(13));
  iDIOA14 : iobuf port map (T=>CONN_A_EN(14), I=>CONN_A_OUT(14), O=>CONN_A_IN(14), IO=>dio_a(14));

  iDIOB0  : iobuf port map (T=>CONN_B_EN(0),  I=>CONN_B_OUT(0),  O=>CONN_B_IN(0),  IO=>dio_b(0) );
  iDIOB1  : iobuf port map (T=>CONN_B_EN(1),  I=>CONN_B_OUT(1),  O=>CONN_B_IN(1),  IO=>dio_b(1) );
  iDIOB2  : iobuf port map (T=>CONN_B_EN(2),  I=>CONN_B_OUT(2),  O=>CONN_B_IN(2),  IO=>dio_b(2) );
  iDIOB3  : iobuf port map (T=>CONN_B_EN(3),  I=>CONN_B_OUT(3),  O=>CONN_B_IN(3),  IO=>dio_b(3) );
  iDIOB4  : iobuf port map (T=>CONN_B_EN(4),  I=>CONN_B_OUT(4),  O=>CONN_B_IN(4),  IO=>dio_b(4) );
  iDIOB5  : iobuf port map (T=>CONN_B_EN(5),  I=>CONN_B_OUT(5),  O=>CONN_B_IN(5),  IO=>dio_b(5) );
  iDIOB6  : iobuf port map (T=>CONN_B_EN(6),  I=>CONN_B_OUT(6),  O=>CONN_B_IN(6),  IO=>dio_b(6) );
  iDIOB7  : iobuf port map (T=>CONN_B_EN(7),  I=>CONN_B_OUT(7),  O=>CONN_B_IN(7),  IO=>dio_b(7) );
  iDIOB8  : iobuf port map (T=>CONN_B_EN(8),  I=>CONN_B_OUT(8),  O=>CONN_B_IN(8),  IO=>dio_b(8) );
  iDIOB9  : iobuf port map (T=>CONN_B_EN(9),  I=>CONN_B_OUT(9),  O=>CONN_B_IN(9),  IO=>dio_b(9) );
  iDIOB10 : iobuf port map (T=>CONN_B_EN(10), I=>CONN_B_OUT(10), O=>CONN_B_IN(10), IO=>dio_b(10));
  iDIOB11 : iobuf port map (T=>CONN_B_EN(11), I=>CONN_B_OUT(11), O=>CONN_B_IN(11), IO=>dio_b(11));
  iDIOB12 : iobuf port map (T=>CONN_B_EN(12), I=>CONN_B_OUT(12), O=>CONN_B_IN(12), IO=>dio_b(12));
  iDIOB13 : iobuf port map (T=>CONN_B_EN(13), I=>CONN_B_OUT(13), O=>CONN_B_IN(13), IO=>dio_b(13));
  iDIOB14 : iobuf port map (T=>CONN_B_EN(14), I=>CONN_B_OUT(14), O=>CONN_B_IN(14), IO=>dio_b(14));

  iDIOC0  : iobuf port map (T=>CONN_C_EN(0),  I=>CONN_C_OUT(0),  O=>CONN_C_IN(0),  IO=>dio_c(0) );
  iDIOC1  : iobuf port map (T=>CONN_C_EN(1),  I=>CONN_C_OUT(1),  O=>CONN_C_IN(1),  IO=>dio_c(1) );
  iDIOC2  : iobuf port map (T=>CONN_C_EN(2),  I=>CONN_C_OUT(2),  O=>CONN_C_IN(2),  IO=>dio_c(2) );
  iDIOC3  : iobuf port map (T=>CONN_C_EN(3),  I=>CONN_C_OUT(3),  O=>CONN_C_IN(3),  IO=>dio_c(3) );
  iDIOC4  : iobuf port map (T=>CONN_C_EN(4),  I=>CONN_C_OUT(4),  O=>CONN_C_IN(4),  IO=>dio_c(4) );
  iDIOC5  : iobuf port map (T=>CONN_C_EN(5),  I=>CONN_C_OUT(5),  O=>CONN_C_IN(5),  IO=>dio_c(5) );
  iDIOC6  : iobuf port map (T=>CONN_C_EN(6),  I=>CONN_C_OUT(6),  O=>CONN_C_IN(6),  IO=>dio_c(6) );
  iDIOC7  : iobuf port map (T=>CONN_C_EN(7),  I=>CONN_C_OUT(7),  O=>CONN_C_IN(7),  IO=>dio_c(7) );
  iDIOC8  : iobuf port map (T=>CONN_C_EN(8),  I=>CONN_C_OUT(8),  O=>CONN_C_IN(8),  IO=>dio_c(8) );
  iDIOC9  : iobuf port map (T=>CONN_C_EN(9),  I=>CONN_C_OUT(9),  O=>CONN_C_IN(9),  IO=>dio_c(9) );
  iDIOC10 : iobuf port map (T=>CONN_C_EN(10), I=>CONN_C_OUT(10), O=>CONN_C_IN(10), IO=>dio_c(10));
  iDIOC11 : iobuf port map (T=>CONN_C_EN(11), I=>CONN_C_OUT(11), O=>CONN_C_IN(11), IO=>dio_c(11));
  iDIOC12 : iobuf port map (T=>CONN_C_EN(12), I=>CONN_C_OUT(12), O=>CONN_C_IN(12), IO=>dio_c(12));
  iDIOC13 : iobuf port map (T=>CONN_C_EN(13), I=>CONN_C_OUT(13), O=>CONN_C_IN(13), IO=>dio_c(13));
  iDIOC14 : iobuf port map (T=>CONN_C_EN(14), I=>CONN_C_OUT(14), O=>CONN_C_IN(14), IO=>dio_c(14));

  iDIOD0  : iobuf port map (T=>CONN_D_EN(0),  I=>CONN_D_OUT(0),  O=>CONN_D_IN(0),  IO=>dio_d(0) );
  iDIOD1  : iobuf port map (T=>CONN_D_EN(1),  I=>CONN_D_OUT(1),  O=>CONN_D_IN(1),  IO=>dio_d(1) );
  iDIOD2  : iobuf port map (T=>CONN_D_EN(2),  I=>CONN_D_OUT(2),  O=>CONN_D_IN(2),  IO=>dio_d(2) );
  iDIOD3  : iobuf port map (T=>CONN_D_EN(3),  I=>CONN_D_OUT(3),  O=>CONN_D_IN(3),  IO=>dio_d(3) );
  iDIOD4  : iobuf port map (T=>CONN_D_EN(4),  I=>CONN_D_OUT(4),  O=>CONN_D_IN(4),  IO=>dio_d(4) );
  iDIOD5  : iobuf port map (T=>CONN_D_EN(5),  I=>CONN_D_OUT(5),  O=>CONN_D_IN(5),  IO=>dio_d(5) );
  iDIOD6  : iobuf port map (T=>CONN_D_EN(6),  I=>CONN_D_OUT(6),  O=>CONN_D_IN(6),  IO=>dio_d(6) );
  iDIOD7  : iobuf port map (T=>CONN_D_EN(7),  I=>CONN_D_OUT(7),  O=>CONN_D_IN(7),  IO=>dio_d(7) );
  iDIOD8  : iobuf port map (T=>CONN_D_EN(8),  I=>CONN_D_OUT(8),  O=>CONN_D_IN(8),  IO=>dio_d(8) );
  iDIOD9  : iobuf port map (T=>CONN_D_EN(9),  I=>CONN_D_OUT(9),  O=>CONN_D_IN(9),  IO=>dio_d(9) );
  iDIOD10 : iobuf port map (T=>CONN_D_EN(10), I=>CONN_D_OUT(10), O=>CONN_D_IN(10), IO=>dio_d(10));
  iDIOD11 : iobuf port map (T=>CONN_D_EN(11), I=>CONN_D_OUT(11), O=>CONN_D_IN(11), IO=>dio_d(11));
  iDIOD12 : iobuf port map (T=>CONN_D_EN(12), I=>CONN_D_OUT(12), O=>CONN_D_IN(12), IO=>dio_d(12));
  iDIOD13 : iobuf port map (T=>CONN_D_EN(13), I=>CONN_D_OUT(13), O=>CONN_D_IN(13), IO=>dio_d(13));
  iDIOD14 : iobuf port map (T=>CONN_D_EN(14), I=>CONN_D_OUT(14), O=>CONN_D_IN(14), IO=>dio_d(14));

  iDIOE0  : iobuf port map (T=>CONN_E_EN(0),  I=>CONN_E_OUT(0),  O=>CONN_E_IN(0),  IO=>dio_e(0) );
  iDIOE1  : iobuf port map (T=>CONN_E_EN(1),  I=>CONN_E_OUT(1),  O=>CONN_E_IN(1),  IO=>dio_e(1) );
  iDIOE2  : iobuf port map (T=>CONN_E_EN(2),  I=>CONN_E_OUT(2),  O=>CONN_E_IN(2),  IO=>dio_e(2) );
  iDIOE3  : iobuf port map (T=>CONN_E_EN(3),  I=>CONN_E_OUT(3),  O=>CONN_E_IN(3),  IO=>dio_e(3) );
  iDIOE4  : iobuf port map (T=>CONN_E_EN(4),  I=>CONN_E_OUT(4),  O=>CONN_E_IN(4),  IO=>dio_e(4) );
  iDIOE5  : iobuf port map (T=>CONN_E_EN(5),  I=>CONN_E_OUT(5),  O=>CONN_E_IN(5),  IO=>dio_e(5) );
  iDIOE6  : iobuf port map (T=>CONN_E_EN(6),  I=>CONN_E_OUT(6),  O=>CONN_E_IN(6),  IO=>dio_e(6) );
  iDIOE7  : iobuf port map (T=>CONN_E_EN(7),  I=>CONN_E_OUT(7),  O=>CONN_E_IN(7),  IO=>dio_e(7) );
  iDIOE8  : iobuf port map (T=>CONN_E_EN(8),  I=>CONN_E_OUT(8),  O=>CONN_E_IN(8),  IO=>dio_e(8) );
  iDIOE9  : iobuf port map (T=>CONN_E_EN(9),  I=>CONN_E_OUT(9),  O=>CONN_E_IN(9),  IO=>dio_e(9) );
  iDIOE10 : iobuf port map (T=>CONN_E_EN(10), I=>CONN_E_OUT(10), O=>CONN_E_IN(10), IO=>dio_e(10));
  iDIOE11 : iobuf port map (T=>CONN_E_EN(11), I=>CONN_E_OUT(11), O=>CONN_E_IN(11), IO=>dio_e(11));
  iDIOE12 : iobuf port map (T=>CONN_E_EN(12), I=>CONN_E_OUT(12), O=>CONN_E_IN(12), IO=>dio_e(12));
  iDIOE13 : iobuf port map (T=>CONN_E_EN(13), I=>CONN_E_OUT(13), O=>CONN_E_IN(13), IO=>dio_e(13));
  iDIOE14 : iobuf port map (T=>CONN_E_EN(14), I=>CONN_E_OUT(14), O=>CONN_E_IN(14), IO=>dio_e(14));

  iDIOF0  : iobuf port map (T=>CONN_F_EN(0),  I=>CONN_F_OUT(0),  O=>CONN_F_IN(0),  IO=>dio_f(0) );
  iDIOF1  : iobuf port map (T=>CONN_F_EN(1),  I=>CONN_F_OUT(1),  O=>CONN_F_IN(1),  IO=>dio_f(1) );
  iDIOF2  : iobuf port map (T=>CONN_F_EN(2),  I=>CONN_F_OUT(2),  O=>CONN_F_IN(2),  IO=>dio_f(2) );
  iDIOF3  : iobuf port map (T=>CONN_F_EN(3),  I=>CONN_F_OUT(3),  O=>CONN_F_IN(3),  IO=>dio_f(3) );
  iDIOF4  : iobuf port map (T=>CONN_F_EN(4),  I=>CONN_F_OUT(4),  O=>CONN_F_IN(4),  IO=>dio_f(4) );
  iDIOF5  : iobuf port map (T=>CONN_F_EN(5),  I=>CONN_F_OUT(5),  O=>CONN_F_IN(5),  IO=>dio_f(5) );
  iDIOF6  : iobuf port map (T=>CONN_F_EN(6),  I=>CONN_F_OUT(6),  O=>CONN_F_IN(6),  IO=>dio_f(6) );
  iDIOF7  : iobuf port map (T=>CONN_F_EN(7),  I=>CONN_F_OUT(7),  O=>CONN_F_IN(7),  IO=>dio_f(7) );
  iDIOF8  : iobuf port map (T=>CONN_F_EN(8),  I=>CONN_F_OUT(8),  O=>CONN_F_IN(8),  IO=>dio_f(8) );
  iDIOF9  : iobuf port map (T=>CONN_F_EN(9),  I=>CONN_F_OUT(9),  O=>CONN_F_IN(9),  IO=>dio_f(9) );
  iDIOF10 : iobuf port map (T=>CONN_F_EN(10), I=>CONN_F_OUT(10), O=>CONN_F_IN(10), IO=>dio_f(10));
  iDIOF11 : iobuf port map (T=>CONN_F_EN(11), I=>CONN_F_OUT(11), O=>CONN_F_IN(11), IO=>dio_f(11));
  iDIOF12 : iobuf port map (T=>CONN_F_EN(12), I=>CONN_F_OUT(12), O=>CONN_F_IN(12), IO=>dio_f(12));
  iDIOF13 : iobuf port map (T=>CONN_F_EN(13), I=>CONN_F_OUT(13), O=>CONN_F_IN(13), IO=>dio_f(13));
  iDIOF14 : iobuf port map (T=>CONN_F_EN(14), I=>CONN_F_OUT(14), O=>CONN_F_IN(14), IO=>dio_f(14));

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
      QTTL            => qttl,
      DTTL            => dttl,
      --
      R1OUT_A         => r1out_a,
      R2OUT_A         => r2out_a,
      T1IN_A          => t1in_a,
      T2IN_A          => t2in_a,
      RS485_232_A     => rs485_232_a,
      HDPLX_A         => hdplx_a,
      FAST_A          => fast_a,
      --
      R1OUT_B         => r1out_b,
      R2OUT_B         => r2out_b,
      T1IN_B          => t1in_b,
      T2IN_B          => t2in_b,
      RS485_232_B     => rs485_232_b,
      HDPLX_B         => hdplx_b,
      FAST_B          => fast_b,
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
      CONN_A_IN       => CONN_A_IN,
      CONN_A_OUT      => CONN_A_OUT,
      CONN_A_EN       => CONN_A_EN,
      CONN_B_IN       => CONN_B_IN,
      CONN_B_OUT      => CONN_B_OUT,
      CONN_B_EN       => CONN_B_EN,
      CONN_C_IN       => CONN_C_IN,
      CONN_C_OUT      => CONN_C_OUT,
      CONN_C_EN       => CONN_C_EN,
      CONN_D_IN       => CONN_D_IN,
      CONN_D_OUT      => CONN_D_OUT,
      CONN_D_EN       => CONN_D_EN,
      CONN_E_IN       => CONN_E_IN,
      CONN_E_OUT      => CONN_E_OUT,
      CONN_E_EN       => CONN_E_EN,
      CONN_F_IN       => CONN_F_IN,
      CONN_F_OUT      => CONN_F_OUT,
      CONN_F_EN       => CONN_F_EN );

end RTL;
