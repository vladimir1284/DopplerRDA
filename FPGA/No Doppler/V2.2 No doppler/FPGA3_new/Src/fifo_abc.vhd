-- ==============================================================
-- FILE : FIFO_ABC.VHD  -  for modification by the USER
-- ==============================================================
--
-- This file is part of Example 2, for the HERON-FPGA3 module.
--
-- This file should be modified by the users to implement their
-- own logic.
--
-- ==============================================================
--
--  Module      : FIFO_ABC
--  Date        : 03/12/2002
--  Author      : R. Williams - HUNT ENGINEERING
--  Description : FIFO for data from A, B & C
--
-- ==============================================================
--
--  Ver     Modified By      Date      Changes
--  ---     -----------      ----      -------
--  1.0     R. Williams    03-12-02    First Written
--  2.0     R. Williams    03-12-02    New components added for
--                                     interfacing to all six HERON
--                                     input FIFOs and all six HERON
--                                     output FIFOs at the same time.
--                                     Added component HE_RD_6F in
--                                     place of component HE_RD_1F.
--                                     Added component HE_WR_6F in
--                                     place of component HE_WR_1F.
--
-- ==============================================================


library IEEE;
  use IEEE.std_logic_1164.all;
  use IEEE.numeric_std.all;

--pragma translate_off
library sim_lib;
  use sim_lib.all;

library UNISIM;
  use UNISIM.vcomponents.all;
--pragma translate_on


entity FIFO_ABC is
  port (
    RESET     : in  std_logic;
    CLOCK     : in  std_logic;
    RD_CLK    : in  std_logic;
    RD_EN_ABC : in  std_logic;
	 PRFin     : in  std_logic;				 -- Added by TD
    CONN_A_IN : in  std_logic_vector(14 downto 0);
    CONN_B_IN : in  std_logic_vector(14 downto 0);
    CONN_C_IN : in  std_logic_vector(14 downto 0);
    FF_A      : out std_logic;
    FF_B      : out std_logic;
    FF_C      : out std_logic;
    EF_ABC    : out std_logic;
    DATA_ABC  : out std_logic_vector(16 downto 0)
  );
end FIFO_ABC;


architecture RTL of FIFO_ABC is

  component DIN_ABC
    port (
      RESET     : in  std_logic;
      CLOCK     : in  std_logic;
      RD_EN_A   : in  std_logic;
      RD_EN_B   : in  std_logic;
      RD_EN_C   : in  std_logic;
      CONN_A_IN : in  std_logic_vector(14 downto 0);
      CONN_B_IN : in  std_logic_vector(14 downto 0);
      CONN_C_IN : in  std_logic_vector(14 downto 0);
      EF_A      : out std_logic;
      EF_B      : out std_logic;
      EF_C      : out std_logic;
      FF_A      : out std_logic;
      FF_B      : out std_logic;
      FF_C      : out std_logic;
      FIFO_A    : out std_logic_vector(15 downto 0);
      FIFO_B    : out std_logic_vector(15 downto 0);
      FIFO_C    : out std_logic_vector(15 downto 0) );
  end component;

  component EN_ABC
    port (
      RESET     : in  std_logic;
      CLOCK     : in  std_logic;
      EF_A      : in  std_logic;
      EF_B      : in  std_logic;
      EF_C      : in  std_logic;
      AF_ABC    : in  std_logic;
      RD_EN_A   : out std_logic;
      RD_EN_B   : out std_logic;
      RD_EN_C   : out std_logic;
      WR_EN_ABC : out std_logic;
      S         : out std_logic_vector(1 downto 0) );
  end component;

  component fifo15x17
    port (
      din          : in  std_logic_vector(16 downto 0);
      wr_en        : in  std_logic;
      wr_clk       : in  std_logic;
      rd_en        : in  std_logic;
      rd_clk       : in  std_logic;
      ainit        : in  std_logic;
      dout         : out std_logic_vector(16 downto 0);
      full         : out std_logic;
      empty        : out std_logic;
      almost_full  : out std_logic;
      almost_empty : out std_logic );
  end component;

  signal EF_A      : std_logic;
  signal EF_B      : std_logic;
  signal EF_C      : std_logic;
  signal AF_ABC    : std_logic;
  signal RD_EN_A   : std_logic;
  signal RD_EN_B   : std_logic;
  signal RD_EN_C   : std_logic;
  signal WR_EN_ABC : std_logic;
  signal S         : std_logic_vector(1 downto 0);
  signal FIFO_A    : std_logic_vector(15 downto 0);
  signal FIFO_B    : std_logic_vector(15 downto 0);
  signal FIFO_C    : std_logic_vector(15 downto 0);
  signal MUX_A     : std_logic_vector(15 downto 0);
  signal MUX_B     : std_logic_vector(15 downto 0);
  signal FIFO_IN   : std_logic_vector(16 downto 0);

begin

  iDIN_ABC : DIN_ABC
    port map (
      RESET     => RESET,
      CLOCK     => CLOCK,
      RD_EN_A   => RD_EN_A,
      RD_EN_B   => RD_EN_B,
      RD_EN_C   => RD_EN_C,
      CONN_A_IN => CONN_A_IN,
      CONN_B_IN => CONN_B_IN,
      CONN_C_IN => CONN_C_IN,
      EF_A      => EF_A,
      EF_B      => EF_B,
      EF_C      => EF_C,
      FF_A      => FF_A,
      FF_B      => FF_B,
      FF_C      => FF_C,
      FIFO_A    => FIFO_A,
      FIFO_B    => FIFO_B,
      FIFO_C    => FIFO_C );

  iEN_ABC : EN_ABC
    port map (
      RESET     => RESET,
      CLOCK     => CLOCK,
      EF_A      => EF_A,
      EF_B      => EF_B,
      EF_C      => EF_C,
      AF_ABC    => AF_ABC,
      RD_EN_A   => RD_EN_A,
      RD_EN_B   => RD_EN_B,
      RD_EN_C   => RD_EN_C,
      WR_EN_ABC => WR_EN_ABC,
      S         => S );

  MUX_A <= FIFO_A when S(0)='0' else FIFO_B;
  MUX_B <= MUX_A  when S(1)='0' else FIFO_C;

  FIFO_IN(15 downto 0) <= MUX_B;

  process(CLOCK)
  begin
    if rising_edge(CLOCK) then
      FIFO_IN(16) <= RD_EN_C;
    end if;
  end process;

  iFifo15x17 : fifo15x17
    port map (
      din          => FIFO_IN,
      wr_en        => WR_EN_ABC,
      wr_clk       => CLOCK,
      rd_en        => RD_EN_ABC,
      rd_clk       => RD_CLK,
      ainit        => RESET,
      dout         => DATA_ABC,
      full         => open,
      empty        => EF_ABC,
      almost_full  => AF_ABC,
      almost_empty => open );

end RTL;
