-- ======================================================
--   Complete functionnal simulation for Example 2
-- ======================================================
--
--  Module      : TB_EXAMPLE2
--  Date        : 05/03/2002
--  Author      : R. Williams - HUNT ENGINEERING
--
-- ==============================================================
--
--  Ver     Modified By      Date      Changes
--  ---     -----------      ----      -------
--  1.0     R. Williams    05-03-02    First Written
--
-- ==============================================================


library IEEE;
  use IEEE.std_logic_1164.all;

entity TB_EXAMPLE2 is
end TB_EXAMPLE2;

architecture BENCH of TB_EXAMPLE2 is

  component TOP
    port (
      -- PADS - HE_WCLK
      doclk          : in  std_logic;
      f0             : out std_logic;
      -- PADS - HE_WR_1F
      dof_ff         : in  std_logic_vector(5 downto 0);
      dof_af         : in  std_logic_vector(5 downto 0);
      dof_wen        : out std_logic_vector(5 downto 0);
      do             : out std_logic_vector(31 downto 0);
      -- PADS - HE_RCLK
      diclk          : in  std_logic;
      f1             : out std_logic;
      -- PADS - HE_RD_1F
      dif_ef         : in  std_logic_vector(5 downto 0);
      dif_ae         : in  std_logic_vector(5 downto 0);
      dif_ren        : out std_logic_vector(5 downto 0);
      dif_oen        : out std_logic_vector(5 downto 0);
      di             : in  std_logic_vector(31 downto 0);
      -- PADS - HSB
      vpd            : inout std_logic_vector(7 downto 0);
      vinit          : inout std_logic;
      vcs            : inout std_logic;
      vwrite         : inout std_logic;
      vbusy          : inout std_logic;
      -- PADS - HE_ADC
      drdy           : in  std_logic;
      enc_p          : out std_logic;
      enc_n          : out std_logic;
      adc_data       : in  std_logic_vector(13 downto 0);
      adc_ovr        : in  std_logic;
      -- PADS - HE_DAA
      wrt0           : out std_logic;
      trig0          : out std_logic;
      daa            : out std_logic_vector(13 downto 0);
      -- PADS - HE_DAB
      wrt1           : out std_logic;
      trig1          : out std_logic;
      dab            : out std_logic_vector(13 downto 0);
      -- CONTROL signals
      config         : in  std_logic;
      reset_pin      : in  std_logic;
      udpres         : out std_logic;
      -- OSC/CLOCKS
      osc0_pin       : in  std_logic;
      osc1_pin       : in  std_logic;
      osc2_pin       : in  std_logic;
      osc3_pin       : in  std_logic;
      clkin0         : in  std_logic;
      clkin1         : in  std_logic;
      clki2          : in  std_logic;
      clki3          : in  std_logic;
      clkout         : out std_logic;
      -- GENERAL PURPOSE GCLKs
      gck2           : in  std_logic;
      f2             : out std_logic;
      gck3           : in  std_logic;
      f3             : out std_logic;
      -- MISC I/O
      led            : out std_logic_vector(4 downto 0);
      digital_io     : inout std_logic_vector(7 downto 0);
      cid            : in std_logic_vector(3 downto 0);
      mid            : in std_logic_vector(3 downto 0);
      umi            : inout std_logic_vector(3 downto 0);
      addr_flagsel   : in  std_logic;
      booten         : out std_logic;
      -- SERIAL I/O
      r1out          : in  std_logic;
      r2out          : in  std_logic;
      t1in           : out std_logic;
      t2in           : out std_logic;
      rs485_232      : out std_logic;
      hdplx          : out std_logic;
      fast           : out std_logic;
      qttl           : in  std_logic;
      dttl           : out std_logic
  );
  end component;

  component SIM_RD_1F
    generic (
      FIFO_ID : std_logic_vector(5 downto 0);
      FILE_IN : string
    );
    port (
      GO      : in  boolean;                       -- start module activity
      CLK     : in  std_logic;                     -- FIFO clock
      DIF_REN : in  std_logic_vector(5 downto 0);  -- read enable
      DIF_OEN : in  std_logic_vector(5 downto 0);  -- output enable
      ENDF    : out boolean;                       -- end of file
      DIF_EF  : out std_logic_vector(5 downto 0);  -- empty flag
      DIF_AE  : out std_logic_vector(5 downto 0);  -- almost empty flag
      DI      : out std_logic_vector(31 downto 0)  -- read data
    );
  end component;

  component SIM_WR_1F
    generic (
      FIFO_ID  : std_logic_vector(5 downto 0);
      FILE_OUT : string
    );
    port (
      CLK     : in  std_logic;                      -- FIFO clock
      DOF_WEN : in  std_logic_vector(5 downto 0);   -- write enable
      DO      : in  std_logic_vector(31 downto 0);  -- write data
      DOF_FF  : out std_logic_vector(5 downto 0);   -- full flag
      DOF_AF  : out std_logic_vector(5 downto 0)    -- almost full flag
    );
  end component;

  component SIM_MSG
    port (
      VPD    : inout std_logic_vector(7 downto 0);  -- data
      VINIT  : inout std_logic;                     -- address strobe
      VCS    : inout std_logic;                     -- data strobe
      VWRITE : inout std_logic;                     -- read/nwrite
      VBUSY  : inout std_logic;                     -- ready/nbusy
      --
      START  : in  boolean;                         -- transaction -> start operation
      OP     : in  std_logic;                       -- 1/read - 0/write
      ADDR   : in  std_logic_vector(7 downto 0);    -- address
      DIN    : in  std_logic_vector(7 downto 0);    -- write data
      DOUT   : out std_logic_vector(7 downto 0);    -- read data
      READY  : out boolean                          -- 0/busy - 1/finished
    );
  end component;

  -- TOP I/Os
  signal DOCLK          : std_logic;
  signal F0             : std_logic;
  signal DOF_FF         : std_logic_vector(5 downto 0);
  signal DOF_AF         : std_logic_vector(5 downto 0);
  signal DOF_WEN        : std_logic_vector(5 downto 0);
  signal DO             : std_logic_vector(31 downto 0);
  signal DICLK          : std_logic;
  signal F1             : std_logic;
  signal DIF_EF         : std_logic_vector(5 downto 0);
  signal DIF_AE         : std_logic_vector(5 downto 0);
  signal DIF_REN        : std_logic_vector(5 downto 0);
  signal DIF_OEN        : std_logic_vector(5 downto 0);
  signal DI             : std_logic_vector(31 downto 0);
  signal VPD            : std_logic_vector(7 downto 0);
  signal VINIT          : std_logic;
  signal VCS            : std_logic;
  signal VWRITE         : std_logic;
  signal VBUSY          : std_logic;
  signal DRDY           : std_logic;
  signal ENC_P          : std_logic;
  signal ENC_N          : std_logic;
  signal ADC_DATA       : std_logic_vector(13 downto 0);
  signal ADC_OVR        : std_logic;
  signal WRT0           : std_logic;
  signal TRIG0          : std_logic;
  signal DAA            : std_logic_vector(13 downto 0);
  signal WRT1           : std_logic;
  signal TRIG1          : std_logic;
  signal DAB            : std_logic_vector(13 downto 0);
  signal CONFIG         : std_logic;
  signal RESET_PIN      : std_logic;
  signal UDPRES         : std_logic;
  signal OSC0_PIN       : std_logic;
  signal OSC1_PIN       : std_logic;
  signal OSC2_PIN       : std_logic;
  signal OSC3_PIN       : std_logic := '0';
  signal CLKIN0         : std_logic;
  signal CLKIN1         : std_logic;
  signal CLKI2          : std_logic;
  signal CLKI3          : std_logic;
  signal CLKOUT         : std_logic;
  signal GCK2           : std_logic;
  signal F2             : std_logic;
  signal GCK3           : std_logic;
  signal F3             : std_logic;
  signal LED            : std_logic_vector(4 downto 0);
  signal DIGITAL_IO     : std_logic_vector(7 downto 0);
  signal CID            : std_logic_vector(3 downto 0);
  signal MID            : std_logic_vector(3 downto 0);
  signal UMI            : std_logic_vector(3 downto 0);
  signal ADDR_FLAGSEL   : std_logic;
  signal BOOTEN         : std_logic;
  signal R1OUT          : std_logic;
  signal R2OUT          : std_logic;
  signal T1IN           : std_logic;
  signal T2IN           : std_logic;
  signal RS485_232      : std_logic;
  signal HDPLX          : std_logic;
  signal FAST           : std_logic;
  signal QTTL           : std_logic;
  signal DTTL           : std_logic;

  -- oscillator period
  constant period  : time := 10 ns;
  -- input FIFO ID
  constant FIFO_IN  : std_logic_vector(5 downto 0) := "000001";
  -- output FIFO ID
  constant FIFO_OUT : std_logic_vector(5 downto 0) := "000010";

  signal GO        : boolean;
  signal ENDF      : boolean;
  signal MSG_START : boolean;
  signal MSG_OP    : std_logic := '1';
  signal MSG_ADDR  : std_logic_vector(7 downto 0);
  signal MSG_DIN   : std_logic_vector(7 downto 0);
  signal MSG_DOUT  : std_logic_vector(7 downto 0);
  signal MSG_READY : boolean;

  signal CHANNEL_A : std_logic_vector(13 downto 0);
  signal CHANNEL_B : std_logic_vector(13 downto 0);

begin

  OSC3_PIN <= NOT OSC3_PIN after (period/2);

-- ----------------------------------------
--  FPGA
-- ----------------------------------------

  UUT: TOP
    port map (
      -- PADS - HE_WCLK
      doclk    => DOCLK,
      f0       => F0,
      -- PADS - HE_WR_1F
      dof_ff   => DOF_FF,
      dof_af   => DOF_AF,
      dof_wen  => DOF_WEN,
      do       => DO,
      -- PADS - HE_RCLK
      diclk    => DICLK,
      f1       => F1,
      -- PADS - HE_RD_1F
      dif_ef   => DIF_EF,
      dif_ae   => DIF_AE,
      dif_ren  => DIF_REN,
      dif_oen  => DIF_OEN,
      di       => DI,
      -- PADS - HSB
      vpd      => VPD,
      vinit    => VINIT,
      vcs      => VCS,
      vwrite   => VWRITE,
      vbusy    => VBUSY,
      -- PADS - HE_ADC
      drdy     => DRDY,
      enc_p    => ENC_P,
      enc_n    => ENC_N,
      adc_data => ADC_DATA,
      adc_ovr  => ADC_OVR,
      -- PADS - HE_DAA
      wrt0     => WRT0,
      trig0    => TRIG0,
      daa      => DAA,
      -- PADS - HE_DAB
      wrt1     => WRT1,
      trig1    => TRIG1,
      dab      => DAB,
      -- CONTROL signals
      config   => CONFIG,
      reset_pin=> RESET_PIN,
      udpres   => UDPRES,
      -- OSC/CLOCKS
      osc0_pin => OSC0_PIN,
      osc1_pin => OSC1_PIN,
      osc2_pin => OSC2_PIN,
      osc3_pin => OSC3_PIN,
      clkin0   => CLKIN0,
      clkin1   => CLKIN1,
      clki2    => CLKI2,
      clki3    => CLKI3,
      clkout   => CLKOUT,
      -- GENERAL PURPOSE GCLKs
      gck2     => GCK2,
      f2       => F2,
      gck3     => GCK3,
      f3       => F3,
      -- MISC I/O
      led         => LED,
      digital_io  => DIGITAL_IO,
      cid         => CID,
      mid         => MID,
      umi         => UMI,
      addr_flagsel=> ADDR_FLAGSEL,
      booten      => BOOTEN,
      -- SERIAL I/O
      r1out       => R1OUT,
      r2out       => R2OUT,
      t1in        => T1IN,
      t2in        => T2IN,
      rs485_232   => RS485_232,
      hdplx       => HDPLX,
      fast        => FAST,
      qttl        => QTTL,
      dttl        => DTTL );

-- ----------------------------------------
--  OUTPUT FIFO
-- ----------------------------------------
-- TOP outputs : F0, DOF_WEN, DO
-- TOP inputs  : DOCLK, DOF_FF, DOF_AF

  DOCLK <= F0;

  iWR1F : SIM_WR_1F
    generic map(
      FIFO_ID  => FIFO_OUT,
      FILE_OUT => "FIFO_ADC.TXT" )
    port map (
      CLK     => F0,
      DOF_WEN => DOF_WEN,
      DO      => DO,
      DOF_FF  => DOF_FF,
      DOF_AF  => DOF_AF );

-- ----------------------------------------
--  INPUT FIFO
-- ----------------------------------------
-- TOP outputs : F1, DIF_REN, DIF_OEN
-- TOP inputs  : DICLK, DIF_EF, DIF_AE, DI

  DICLK <= F1;

  iRDF1 : SIM_RD_1F
    generic map (
      FIFO_ID => FIFO_IN,
      FILE_IN => "FIFO_DAC.TXT" )
    port map (
      GO      => GO,
      CLK     => F1,
      DIF_REN => DIF_REN,
      DIF_OEN => DIF_OEN,
      ENDF    => ENDF,
      DIF_EF  => DIF_EF,
      DIF_AE  => DIF_AE,
      DI      => DI );

-- ----------------------------------------
--  HSB MESSAGE INTERFACE
-- ----------------------------------------
-- TOP inouts : VPD, VINIT, VCS, VWRITE, VBUSY

  iMSG : SIM_MSG
    port map (
      VPD    => VPD,
      VINIT  => VINIT,
      VCS    => VCS,
      VWRITE => VWRITE,
      VBUSY  => VBUSY,
      --
      START  => MSG_START,
      OP     => MSG_OP,
      ADDR   => MSG_ADDR,
      DIN    => MSG_DIN,
      DOUT   => MSG_DOUT,
      READY  => MSG_READY );

-- ----------------------------------------
--  ADC
-- ----------------------------------------
-- TOP outputs : ENC_P, ENC_N
-- TOP inputs  : DRDY, ADC_DATA, ADC_OVR

  DRDY <= ENC_P;

  process(ENC_P)
  begin
    if rising_edge(ENC_P) then
      ADC_DATA <= CHANNEL_A after 1 ns;
    end if;
  end process;

  ADC_OVR <= '0';

-- ----------------------------------------
--  Channel A - DAC
-- ----------------------------------------
-- TOP outputs : WRT0, TRIG0, DAA
  process(TRIG0)
  begin
    if rising_edge(TRIG0) then
      CHANNEL_A <= DAA after 1 ns;
    end if;
  end process;

-- ----------------------------------------
--  Channel B - DAC
-- ----------------------------------------
-- TOP outputs : WRT1, TRIG1, DAB
  process(TRIG1)
  begin
    if rising_edge(TRIG1) then
      CHANNEL_B <= DAB after 1 ns;
    end if;
  end process;

-- ----------------------------------------
--  STIMULI
-- ----------------------------------------

  process
  begin
    GO <= false;

    RESET_PIN <= '0';
    wait for (period*5);
    RESET_PIN <= '1';
    wait for (period*20);

    -- configure input FIFO number
    MSG_OP   <= '0';
    MSG_ADDR <= X"00";
    MSG_DIN  <= "00" & FIFO_IN;
    MSG_START <= true;
    wait until MSG_READY;
    -- configure output FIFO number
    MSG_OP   <= '0';
    MSG_ADDR <= X"01";
    MSG_DIN  <= "00" & FIFO_OUT;
    MSG_START <= true;
    wait until MSG_READY;

    -- read back input FIFO number
    MSG_OP   <= '1';
    MSG_ADDR <= X"00";
    MSG_START <= true;
    wait until MSG_READY;
    -- read back output FIFO number
    MSG_OP   <= '1';
    MSG_ADDR <= X"01";
    MSG_START <= true;
    wait until MSG_READY;

    -- SW reset
    wait for (period*20);
    RESET_PIN <= '0';
    wait for (period*5);
    RESET_PIN <= '1';
    wait for (period*20);

    -- launch FIFO read
    GO <= true;

    -- end of download
    wait until ENDF;
    wait for (period*200);

    -- launch an acquisition
    -- write sample LSB
    MSG_OP   <= '0';
    MSG_ADDR <= X"02";
    MSG_DIN  <= X"FF";
    MSG_START <= true;
    wait until MSG_READY;
    -- write sample MSB
    MSG_OP   <= '0';
    MSG_ADDR <= X"03";
    MSG_DIN  <= X"01";
    MSG_START <= true;
    wait until MSG_READY;

    wait for (period*2000);

    assert false report "End of simulation" severity failure;
  end process;

end BENCH;

