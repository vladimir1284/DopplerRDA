-- ======================================================
--   Message Interface Behavioral (Simulation) model
-- ======================================================
--
--  Module      : SIM_MSG
--  Date        : 07/02/2002
--  Author      : L. Bacquart - ALSE
--
-- ==============================================================
--
--  Ver     Modified By      Date      Changes
--  ---     -----------      ----      -------
--  1.0     L. Bacquart    07-02-02    First Written
--  1.1     R. Williams    08-05-02    Syntax change made to all
--                                     instanciated components,
--                                     (changed '0' to GND)
--                                     for compatibility with
--                                     ModelSim5.5b.
--
-- ==============================================================


library IEEE;
  use IEEE.std_logic_1164.all;
  use IEEE.numeric_std.all;

-- pragma translate_off
  use std.textio.all;
  use IEEE.std_logic_textio.all;
-- pragma translate_on

entity SIM_MSG is
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
end SIM_MSG;


-- pragma translate_off

architecture Behave of SIM_MSG is

begin

process
  variable L : line;
  variable DATA : std_logic_vector(7 downto 0);
begin
  VINIT <= 'H';
  VCS <= 'H';
  VWRITE <= 'H';
  VPD <= (others=>'Z');
  VBUSY <= 'H';

  wait on START'transaction;
  READY <= FALSE;

  if OP='1' then
    -- READ operation

    VINIT <= '1';
    VCS <= '1';
    VWRITE <= '1';
    wait for 67 ns;
    -- write address
    VINIT <= '0';
    VPD <= ADDR;
    wait for 67 ns;
    VINIT <= '1';
    wait for 67 ns;
    VWRITE <= '1';
    wait for 67 ns;
    -- read data
    VCS <= '0';
    VPD <= (others=>'Z');
    wait for 67 ns;
    DATA := VPD;
    VCS <= '1';
    wait for 67 ns;
    VWRITE <= '1';
    wait for 67 ns;
    -- report
    write(L, string'("READ on HSB"));
    write(L, string'("- address "));
    hwrite(L, ADDR);
    write(L, string'("- data "));
    hwrite(L, DATA);
    writeline(output, L);
  else
    -- WRITE operation

    VINIT <= '1';
    VCS <= '1';
    VWRITE <= '1';
    wait for 67 ns;
    -- write address
    VINIT <= '0';
    VPD <= ADDR;
    wait for 67 ns;
    VINIT <= '1';
    wait for 67 ns;
    VWRITE <= '0';
    VPD <= DIN;
    wait for 67 ns;
    -- write data
    VCS <= '0';
    wait for 67 ns;
    VCS <= '1';
    wait for 67 ns;
    VWRITE <= '1';
    wait for 67 ns;
    -- report
    write(L, string'("WRITE on HSB"));
    write(L, string'("- address "));
    hwrite(L, ADDR);
    write(L, string'("- data "));
    hwrite(L, DIN);
    writeline(output, L);
  end if;

  READY <= TRUE;
end process;

end Behave;

-- pragma translate_on

