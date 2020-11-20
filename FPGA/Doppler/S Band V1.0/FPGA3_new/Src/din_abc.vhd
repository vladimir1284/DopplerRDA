-- ==============================================================
-- FILE : DIN_ABC.VHD  -  for modification by the USER
-- ==============================================================
--
-- This file is part of Example 2, for the HERON-FPGA3 module.
--
-- This file should be modified by the users to implement their
-- own logic.
--
-- ==============================================================
--
--  Module      : DIN_ABC
--  Date        : 03/12/2002
--  Author      : R. Williams - HUNT ENGINEERING
--  Description : Digital input from connectors A, B & C
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


entity DIN_ABC is
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
    FIFO_C    : out std_logic_vector(15 downto 0)
  );
end DIN_ABC;


architecture RTL of DIN_ABC is

  component fifo15x16
    port (
      din    : in  std_logic_vector(15 downto 0);
      wr_en  : in  std_logic;
      wr_clk : in  std_logic;
      rd_en  : in  std_logic;
      rd_clk : in  std_logic;
      ainit  : in  std_logic;
      dout   : out std_logic_vector(15 downto 0);
      full   : out std_logic;
      empty  : out std_logic );
  end component;

  component CONN_A_INPUT
    port (
      RESET     : in  std_logic;
      CLOCK     : in  std_logic;
      FF_A      : in  std_logic;
      CONN_A_IN : in  std_logic_vector(14 downto 0);
      WR_EN_A   : out std_logic;
      DIN_A     : out std_logic_vector(15 downto 0) );
  end component;

  component CONN_B_INPUT
    port (
      RESET     : in  std_logic;
      CLOCK     : in  std_logic;
      FF_B      : in  std_logic;
      CONN_B_IN : in  std_logic_vector(14 downto 0);
      WR_EN_B   : out std_logic;
      DIN_B     : out std_logic_vector(15 downto 0) );
  end component;

  component CONN_C_INPUT
    port (
      RESET     : in  std_logic;
      CLOCK     : in  std_logic;
      FF_C      : in  std_logic;
      CONN_C_IN : in  std_logic_vector(14 downto 0);
      WR_EN_C   : out std_logic;
      DIN_C     : out std_logic_vector(15 downto 0) );
  end component;

  signal FF_A_int : std_logic;
  signal WR_EN_A  : std_logic;
  signal DIN_A    : std_logic_vector(15 downto 0);

  signal FF_B_int : std_logic;
  signal WR_EN_B  : std_logic;
  signal DIN_B    : std_logic_vector(15 downto 0);

  signal FF_C_int : std_logic;
  signal WR_EN_C  : std_logic;
  signal DIN_C    : std_logic_vector(15 downto 0);

begin

  FF_A <= FF_A_int;

  iConn_A : CONN_A_INPUT
    port map (
      RESET     => RESET,
      CLOCK     => CLOCK,
      FF_A      => FF_A_int,
      CONN_A_IN => CONN_A_IN,
      WR_EN_A   => WR_EN_A,
      DIN_A     => DIN_A );

  iFifo_A : fifo15x16
    port map (
      din    => DIN_A,
      wr_en  => WR_EN_A,
      wr_clk => CLOCK,
      rd_en  => RD_EN_A,
      rd_clk => CLOCK,
      ainit  => RESET,
      dout   => FIFO_A,
      full   => FF_A_int,
      empty  => EF_A );

  FF_B <= FF_B_int;

  iConn_B : CONN_B_INPUT
    port map (
      RESET     => RESET,
      CLOCK     => CLOCK,
      FF_B      => FF_B_int,
      CONN_B_IN => CONN_B_IN,
      WR_EN_B   => WR_EN_B,
      DIN_B     => DIN_B );

  iFifo_B : fifo15x16
    port map (
      din    => DIN_B,
      wr_en  => WR_EN_B,
      wr_clk => CLOCK,
      rd_en  => RD_EN_B,
      rd_clk => CLOCK,
      ainit  => RESET,
      dout   => FIFO_B,
      full   => FF_B_int,
      empty  => EF_B );

  FF_C <= FF_C_int;

  iConn_C : CONN_C_INPUT
    port map (
      RESET     => RESET,
      CLOCK     => CLOCK,
      FF_C      => FF_C_int,
      CONN_C_IN => CONN_C_IN,
      WR_EN_C   => WR_EN_C,
      DIN_C     => DIN_C );

  iFifo_C : fifo15x16
    port map (
      din    => DIN_C,
      wr_en  => WR_EN_C,
      wr_clk => CLOCK,
      rd_en  => RD_EN_C,
      rd_clk => CLOCK,
      ainit  => RESET,
      dout   => FIFO_C,
      full   => FF_C_int,
      empty  => EF_C );

end RTL;
