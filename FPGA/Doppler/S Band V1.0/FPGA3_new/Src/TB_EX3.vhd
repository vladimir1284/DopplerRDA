-- ======================================================
--   Complete functional simulation for Example 3
-- ======================================================
--
--  Module      : TB_EXAMPLE3
--  Date        : 04/12/2002
--  Author      : R. Williams - HUNT ENGINEERING
--
-- ==============================================================
--
--  Ver     Modified By      Date      Changes
--  ---     -----------      ----      -------
--  1.0     R. Williams    04-12-02    First Written
--  2.0     R. Williams    04-12-02    Modified for use with 6 FIFO
--                                     interface components.
--
-- ==============================================================


library IEEE;
  use IEEE.std_logic_1164.all;

library sim_lib;
  use sim_lib.all;


entity TESTBENCH is
end TESTBENCH;

architecture BENCH of TESTBENCH is

  component TOP
    port (
      -- PADS - HE_WCLK
      doclk        : in  std_logic;
      f0           : out std_logic;
      -- PADS - HE_WR_6F
      dof_ff       : in  std_logic_vector(5 downto 0);
      dof_af       : in  std_logic_vector(5 downto 0);
      dof_wen      : out std_logic_vector(5 downto 0);
      do           : out std_logic_vector(31 downto 0);
      -- PADS - HE_RCLK
      diclk        : in  std_logic;
      f1           : out std_logic;
      -- PADS - HE_RD_6F
      dif_ef       : in  std_logic_vector(5 downto 0);
      dif_ae       : in  std_logic_vector(5 downto 0);
      dif_ren      : out std_logic_vector(5 downto 0);
      dif_oen      : out std_logic_vector(5 downto 0);
      di           : in  std_logic_vector(31 downto 0);
      -- PADS - HSB
      vpd          : inout std_logic_vector(7 downto 0);
      vinit        : inout std_logic;
      vcs          : inout std_logic;
      vwrite       : inout std_logic;
      vbusy        : inout std_logic;
      -- PADS - Connector Digital I/O
      dio_a        : inout std_logic_vector(14 downto 0);
      dio_b        : inout std_logic_vector(14 downto 0);
      dio_c        : inout std_logic_vector(14 downto 0);
      dio_d        : inout std_logic_vector(14 downto 0);
      dio_e        : inout std_logic_vector(14 downto 0);
      dio_f        : inout std_logic_vector(14 downto 0);
      -- CONTROL signals
      config       : in  std_logic;
      reset_pin    : in  std_logic;
      udpres       : out std_logic;
      -- OSC/CLOCKS
      osc0_pin     : in  std_logic;
      osc1_pin     : in  std_logic;
      osc2_pin     : in  std_logic;
      osc3_pin     : in  std_logic;
      clkin0       : in  std_logic;
      clkin1       : in  std_logic;
      clki2        : in  std_logic;
      clki3        : in  std_logic;
      clkout       : out std_logic;
      -- MISC I/O
      led          : out std_logic_vector(4 downto 0);
      cid          : in std_logic_vector(3 downto 0);
      mid          : in std_logic_vector(3 downto 0);
      umi          : inout std_logic_vector(3 downto 0);
      addr_flagsel : in  std_logic;
      booten       : out std_logic;
      -- SERIAL I/O
      r1out_a      : in  std_logic;
      r2out_a      : in  std_logic;
      t1in_a       : out std_logic;
      t2in_a       : out std_logic;
      rs485_232_a  : out std_logic;
      hdplx_a      : out std_logic;
      fast_a       : out std_logic;
      r1out_b      : in  std_logic;
      r2out_b      : in  std_logic;
      t1in_b       : out std_logic;
      t2in_b       : out std_logic;
      rs485_232_b  : out std_logic;
      hdplx_b      : out std_logic;
      fast_b       : out std_logic;
      qttl         : in  std_logic;
      dttl         : out std_logic
    );
  end component;

  component SIM_RD_6F
    generic (
      FILE_IN0 : string;
      FILE_IN1 : string;
      FILE_IN2 : string;
      FILE_IN3 : string;
      FILE_IN4 : string;
      FILE_IN5 : string
    );
    port (
      GO      : in  boolean;                       -- start module activity
      CLK     : in  std_logic;                     -- FIFO clock
      DIF_REN : in  std_logic_vector(5 downto 0);  -- read enables
      DIF_OEN : in  std_logic_vector(5 downto 0);  -- output enable
      ENDF0   : out boolean;                       -- end of file 0
      ENDF1   : out boolean;                       -- end of file 1
      ENDF2   : out boolean;                       -- end of file 2
      ENDF3   : out boolean;                       -- end of file 3
      ENDF4   : out boolean;                       -- end of file 4
      ENDF5   : out boolean;                       -- end of file 5
      DIF_EF  : out std_logic_vector(5 downto 0);  -- empty flags
      DIF_AE  : out std_logic_vector(5 downto 0);  -- almost empty flags
      DI      : out std_logic_vector(31 downto 0)  -- read data
    );
  end component;

  component SIM_WR_6F
    generic (
      FILE_OUT0 : string;
      FILE_OUT1 : string;
      FILE_OUT2 : string;
      FILE_OUT3 : string;
      FILE_OUT4 : string;
      FILE_OUT5 : string
    );
    port (
      CLK     : in  std_logic;                      -- FIFO clock
      DOF_WEN : in  std_logic_vector(5 downto 0);   -- write enables
      DO      : in  std_logic_vector(31 downto 0);  -- write data
      DOF_FF  : out std_logic_vector(5 downto 0);   -- full flags
      DOF_AF  : out std_logic_vector(5 downto 0)    -- almost full flags
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
  signal DOCLK        : std_logic;
  signal F0           : std_logic;
  signal DOF_FF       : std_logic_vector(5 downto 0);
  signal DOF_AF       : std_logic_vector(5 downto 0);
  signal DOF_WEN      : std_logic_vector(5 downto 0);
  signal DO           : std_logic_vector(31 downto 0);
  signal DICLK        : std_logic;
  signal F1           : std_logic;
  signal DIF_EF       : std_logic_vector(5 downto 0);
  signal DIF_AE       : std_logic_vector(5 downto 0);
  signal DIF_REN      : std_logic_vector(5 downto 0);
  signal DIF_OEN      : std_logic_vector(5 downto 0);
  signal DI           : std_logic_vector(31 downto 0);
  signal VPD          : std_logic_vector(7 downto 0);
  signal VINIT        : std_logic;
  signal VCS          : std_logic;
  signal VWRITE       : std_logic;
  signal VBUSY        : std_logic;
  signal DIO_A        : std_logic_vector(14 downto 0);
  signal DIO_B        : std_logic_vector(14 downto 0);
  signal DIO_C        : std_logic_vector(14 downto 0);
  signal DIO_D        : std_logic_vector(14 downto 0);
  signal DIO_E        : std_logic_vector(14 downto 0);
  signal DIO_F        : std_logic_vector(14 downto 0);
  signal CONFIG       : std_logic;
  signal RESET_PIN    : std_logic;
  signal UDPRES       : std_logic;
  signal OSC0_PIN     : std_logic;
  signal OSC1_PIN     : std_logic;
  signal OSC2_PIN     : std_logic;
  signal OSC3_PIN     : std_logic := '0';
  signal CLKIN0       : std_logic;
  signal CLKIN1       : std_logic;
  signal CLKI2        : std_logic;
  signal CLKI3        : std_logic;
  signal CLKOUT       : std_logic;
  signal LED          : std_logic_vector(4 downto 0);
  signal CID          : std_logic_vector(3 downto 0);
  signal MID          : std_logic_vector(3 downto 0);
  signal UMI          : std_logic_vector(3 downto 0);
  signal ADDR_FLAGSEL : std_logic;
  signal BOOTEN       : std_logic;
  signal R1OUT_A      : std_logic;
  signal R2OUT_A      : std_logic;
  signal T1IN_A       : std_logic;
  signal T2IN_A       : std_logic;
  signal RS485_232_A  : std_logic;
  signal HDPLX_A      : std_logic;
  signal FAST_A       : std_logic;
  signal R1OUT_B      : std_logic;
  signal R2OUT_B      : std_logic;
  signal T1IN_B       : std_logic;
  signal T2IN_B       : std_logic;
  signal RS485_232_B  : std_logic;
  signal HDPLX_B      : std_logic;
  signal FAST_B       : std_logic;
  signal QTTL         : std_logic;
  signal DTTL         : std_logic;

  -- oscillator period
  constant period  : time := 10 ns;
  -- input FIFO ID
  constant FIFO_IN  : std_logic_vector(5 downto 0) := "000001";
  -- output FIFO ID
  constant FIFO_OUT : std_logic_vector(5 downto 0) := "000010";

  signal GO        : boolean;
  signal ENDF0     : boolean;
  signal ENDF1     : boolean;
  signal ENDF2     : boolean;
  signal ENDF3     : boolean;
  signal ENDF4     : boolean;
  signal ENDF5     : boolean;
  signal MSG_START : boolean;
  signal MSG_OP    : std_logic := '1';
  signal MSG_ADDR  : std_logic_vector(7 downto 0);
  signal MSG_DIN   : std_logic_vector(7 downto 0);
  signal MSG_DOUT  : std_logic_vector(7 downto 0);
  signal MSG_READY : boolean;

begin

  OSC3_PIN <= NOT OSC3_PIN after (period/2);

-- ----------------------------------------
--  FPGA
-- ----------------------------------------

  UUT: TOP
    port map (
      -- PADS - HE_WCLK
      doclk        => DOCLK,
      f0           => F0,
      -- PADS - HE_WR_6F
      dof_ff       => DOF_FF,
      dof_af       => DOF_AF,
      dof_wen      => DOF_WEN,
      do           => DO,
      -- PADS - HE_RCLK
      diclk        => DICLK,
      f1           => F1,
      -- PADS - HE_RD_6F
      dif_ef       => DIF_EF,
      dif_ae       => DIF_AE,
      dif_ren      => DIF_REN,
      dif_oen      => DIF_OEN,
      di           => DI,
      -- PADS - HSB
      vpd          => VPD,
      vinit        => VINIT,
      vcs          => VCS,
      vwrite       => VWRITE,
      vbusy        => VBUSY,
      -- PADS - Connector Digital I/O
      dio_a        => DIO_A,
      dio_b        => DIO_B,
      dio_c        => DIO_C,
      dio_d        => DIO_D,
      dio_e        => DIO_E,
      dio_f        => DIO_F,
      -- CONTROL signals
      config       => CONFIG,
      reset_pin    => RESET_PIN,
      udpres       => UDPRES,
      -- OSC/CLOCKS
      osc0_pin     => OSC0_PIN,
      osc1_pin     => OSC1_PIN,
      osc2_pin     => OSC2_PIN,
      osc3_pin     => OSC3_PIN,
      clkin0       => CLKIN0,
      clkin1       => CLKIN1,
      clki2        => CLKI2,
      clki3        => CLKI3,
      clkout       => CLKOUT,
      -- MISC I/O
      led          => LED,
      cid          => CID,
      mid          => MID,
      umi          => UMI,
      addr_flagsel => ADDR_FLAGSEL,
      booten       => BOOTEN,
      -- SERIAL I/O
      r1out_a      => R1OUT_A,
      r2out_a      => R2OUT_A,
      t1in_a       => T1IN_A,
      t2in_a       => T2IN_A,
      rs485_232_a  => RS485_232_A,
      hdplx_a      => HDPLX_A,
      fast_a       => FAST_A,
      r1out_b      => R1OUT_B,
      r2out_b      => R2OUT_B,
      t1in_b       => T1IN_B,
      t2in_b       => T2IN_B,
      rs485_232_b  => RS485_232_B,
      hdplx_b      => HDPLX_B,
      fast_b       => FAST_B,
      qttl         => QTTL,
      dttl         => DTTL );

-- ----------------------------------------
--  OUTPUT FIFO
-- ----------------------------------------
-- TOP outputs : F0, DOF_WEN, DO
-- TOP inputs  : DOCLK, DOF_FF, DOF_AF

  DOCLK <= F0;

  iWR6F : SIM_WR_6F
    generic map(
      FILE_OUT0 => "..\Sim\Fifo_Out0.TXT",
      FILE_OUT1 => "..\Sim\Fifo_Out1.TXT",
      FILE_OUT2 => "..\Sim\Fifo_Out2.TXT",
      FILE_OUT3 => "..\Sim\Fifo_Out3.TXT",
      FILE_OUT4 => "..\Sim\Fifo_Out4.TXT",
      FILE_OUT5 => "..\Sim\Fifo_Out5.TXT" )
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

  iRD6F : SIM_RD_6F
    generic map (
      FILE_IN0 => "..\Sim\Outputs.txt",
      FILE_IN1 => "..\Sim\Outputs.txt",
      FILE_IN2 => "..\Sim\Outputs.txt",
      FILE_IN3 => "..\Sim\Outputs.txt",
      FILE_IN4 => "..\Sim\Outputs.txt",
      FILE_IN5 => "..\Sim\Outputs.txt" )
    port map (
      GO      => GO,
      CLK     => F1,
      DIF_REN => DIF_REN,
      DIF_OEN => DIF_OEN,
      ENDF0   => ENDF0,
      ENDF1   => ENDF1,
      ENDF2   => ENDF2,
      ENDF3   => ENDF3,
      ENDF4   => ENDF4,
      ENDF5   => ENDF5,
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
--  RS232
-- ----------------------------------------

  r1out_a <= 'H';
  r2out_a <= 'H';

  r1out_b <= 'H';
  r2out_b <= 'H';

-- ----------------------------------------
--  STIMULI
-- ----------------------------------------

  process
  begin

    DIO_A <= (others=>'Z');
    DIO_B <= (others=>'Z');
    DIO_C <= (others=>'Z');
    DIO_D <= (others=>'0');
    DIO_E <= (others=>'0');
    DIO_F <= (others=>'0');

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

    -- Input four words on Connector D
    DIO_D <= "000000000000000";
    wait for (period*5);
    DIO_D <= "100000000000000";
    wait for (period*5);
    DIO_D <= "000000000000001";
    wait for (period*5);
    DIO_D <= "100000000000001";
    wait for (period*5);
    DIO_D <= "000000000000010";
    wait for (period*5);
    DIO_D <= "100000000000010";
    wait for (period*5);
    DIO_D <= "000000000000011";
    wait for (period*5);
    DIO_D <= "100000000000011";
    wait for (period*5);

    -- Input four words on Connector E
    DIO_E <= "000000000000000";
    wait for (period*5);
    DIO_E <= "100000000000000";
    wait for (period*5);
    DIO_E <= "000000000000001";
    wait for (period*5);
    DIO_E <= "100000000000001";
    wait for (period*5);
    DIO_E <= "000000000000010";
    wait for (period*5);
    DIO_E <= "100000000000010";
    wait for (period*5);
    DIO_E <= "000000000000011";
    wait for (period*5);
    DIO_E <= "100000000000011";
    wait for (period*5);

    -- Input four words on Connector F
    DIO_F <= "000000000000000";
    wait for (period*5);
    DIO_F <= "100000000000000";
    wait for (period*5);
    DIO_F <= "000000000000001";
    wait for (period*5);
    DIO_F <= "100000000000001";
    wait for (period*5);
    DIO_F <= "000000000000010";
    wait for (period*5);
    DIO_F <= "100000000000010";
    wait for (period*5);
    DIO_F <= "000000000000011";
    wait for (period*5);
    DIO_F <= "100000000000011";
    wait for (period*50);

    -- Input words on connectors D, E & F simultaneously
    DIO_D <= "000000100000000";
    DIO_E <= "000010000000000";
    DIO_F <= "001000000000000";
    wait for (period*5);
    DIO_D <= "100000100000000";
    DIO_E <= "100010000000000";
    DIO_F <= "101000000000000";
    wait for (period*5);
    DIO_D <= "000001000000000";
    DIO_E <= "000100000000000";
    DIO_F <= "010000000000000";
    wait for (period*5);
    DIO_D <= "100001000000000";
    DIO_E <= "100100000000000";
    DIO_F <= "110000000000000";
    wait for (period*5);
    DIO_D <= "000001100000000";
    DIO_E <= "000110000000000";
    DIO_F <= "011000000000000";
    wait for (period*5);
    DIO_D <= "100001100000000";
    DIO_E <= "100110000000000";
    DIO_F <= "111000000000000";
    wait for (period*5);
    DIO_D <= "000010000000000";
    DIO_E <= "001000000000000";
    DIO_F <= "000000000000001";
    wait for (period*5);
    DIO_D <= "100010000000000";
    DIO_E <= "101000000000000";
    DIO_F <= "100000000000001";
    wait for (period*5);

    -- end of simulation
    wait until ENDF0;
    wait until ENDF1;
    wait until ENDF2;
    wait until ENDF3;
    wait until ENDF4;
    wait until ENDF5;

    wait for (period*500);
    assert false report "End of simulation" severity failure;
  end process;

end BENCH;
