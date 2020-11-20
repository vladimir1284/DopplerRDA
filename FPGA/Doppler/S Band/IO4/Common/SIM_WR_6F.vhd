-- ======================================================
--   OUTPUT FIFO Behavioral (Simulation) model
-- ======================================================
--
--  Module      : SIM_WR_6F
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
--  2.0     R. Williams    14-10-02    Modified for use with 6 FIFO
--                                     interface components.
--
-- ==============================================================


library IEEE;
  use IEEE.std_logic_1164.all;
  use IEEE.numeric_std.all;

-- pragma translate_off
  use std.textio.all;
  use IEEE.std_logic_textio.all;
-- pragma translate_on

entity SIM_WR_6F is
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
end SIM_WR_6F;


-- pragma translate_off

architecture Behave of SIM_WR_6F is

  -- FIFO Write Enables
  signal WEN      : std_logic_vector(5 downto 0);

  -- FIFO Read Enables
  signal REN      : std_logic_vector(5 downto 0);

  -- FIFO Flags
  signal FF       : std_logic_vector(5 downto 0);
  signal AF       : std_logic_vector(5 downto 0);

  -- FIFO length
  constant LENGTH : integer := 16;

  -- Number of words in FIFO 0
  signal CounterA : integer range 0 to LENGTH := 0;
  -- Number of words in FIFO 1
  signal CounterB : integer range 0 to LENGTH := 0;
  -- Number of words in FIFO 2
  signal CounterC : integer range 0 to LENGTH := 0;
  -- Number of words in FIFO 3
  signal CounterD : integer range 0 to LENGTH := 0;
  -- Number of words in FIFO 4
  signal CounterE : integer range 0 to LENGTH := 0;
  -- Number of words in FIFO 5
  signal CounterF : integer range 0 to LENGTH := 0;

begin

  process
  begin
    REN(0) <= '0';
    wait until CLK='1';
    wait until CLK='1';
    wait until CLK='1';
    wait until CLK='1';
    wait until CLK='1';
    wait until CLK='1';
    wait until CLK='1';
    REN(0) <= '1';
    wait until CLK='1';
  end process;

  process
  begin
    REN(1) <= '0';
    wait until CLK='1';
    wait until CLK='1';
    wait until CLK='1';
    wait until CLK='1';
    wait until CLK='1';
    wait until CLK='1';
    wait until CLK='1';
    REN(1) <= '1';
    wait until CLK='1';
  end process;

  process
  begin
    REN(2) <= '0';
    wait until CLK='1';
    wait until CLK='1';
    wait until CLK='1';
    wait until CLK='1';
    wait until CLK='1';
    wait until CLK='1';
    wait until CLK='1';
    REN(2) <= '1';
    wait until CLK='1';
  end process;

  process
  begin
    REN(3) <= '0';
    wait until CLK='1';
    wait until CLK='1';
    wait until CLK='1';
    wait until CLK='1';
    wait until CLK='1';
    wait until CLK='1';
    wait until CLK='1';
    REN(3) <= '1';
    wait until CLK='1';
  end process;

  process
  begin
    REN(4) <= '0';
    wait until CLK='1';
    wait until CLK='1';
    wait until CLK='1';
    wait until CLK='1';
    wait until CLK='1';
    wait until CLK='1';
    wait until CLK='1';
    REN(4) <= '1';
    wait until CLK='1';
  end process;

  process
  begin
    REN(5) <= '0';
    wait until CLK='1';
    wait until CLK='1';
    wait until CLK='1';
    wait until CLK='1';
    wait until CLK='1';
    wait until CLK='1';
    wait until CLK='1';
    REN(5) <= '1';
    wait until CLK='1';
  end process;

  WEN <= DOF_WEN;

  -- HERON FIFO 0
  process
  begin
    wait until CLK='1';
    if WEN(0)='1' then
      if CounterA=LENGTH then
        assert false report "Error: Write performed to HERON FIFO 0 when full" severity failure;
      end if;
      if REN(0)='0' then
        if CounterA<LENGTH then
          CounterA <= CounterA + 1;
        end if;
      else
        if CounterA=0 then
          CounterA <= CounterA + 1;
        end if;
      end if;
    else
      if REN(0)='1' then
        if CounterA>0 then
          CounterA <= CounterA - 1;
        end if;
      end if;
    end if;
  end process;

  -- HERON FIFO 1
  process
  begin
    wait until CLK='1';
    if WEN(1)='1' then
      if CounterB=LENGTH then
        assert false report "Error: Write performed to HERON FIFO 1 when full" severity failure;
      end if;
      if REN(1)='0' then
        if CounterB<LENGTH then
          CounterB <= CounterB + 1;
        end if;
      else
        if CounterB=0 then
          CounterB <= CounterB + 1;
        end if;
      end if;
    else
      if REN(1)='1' then
        if CounterB>0 then
          CounterB <= CounterB - 1;
        end if;
      end if;
    end if;
  end process;

  -- HERON FIFO 2
  process
  begin
    wait until CLK='1';
    if WEN(2)='1' then
      if CounterC=LENGTH then
        assert false report "Error: Write performed to HERON FIFO 2 when full" severity failure;
      end if;
      if REN(2)='0' then
        if CounterC<LENGTH then
          CounterC <= CounterC + 1;
        end if;
      else
        if CounterC=0 then
          CounterC <= CounterC + 1;
        end if;
      end if;
    else
      if REN(2)='1' then
        if CounterC>0 then
          CounterC <= CounterC - 1;
        end if;
      end if;
    end if;
  end process;

  -- HERON FIFO 3
  process
  begin
    wait until CLK='1';
    if WEN(3)='1' then
      if CounterD=LENGTH then
        assert false report "Error: Write performed to HERON FIFO 3 when full" severity failure;
      end if;
      if REN(3)='0' then
        if CounterD<LENGTH then
          CounterD <= CounterD + 1;
        end if;
      else
        if CounterD=0 then
          CounterD <= CounterD + 1;
        end if;
      end if;
    else
      if REN(3)='1' then
        if CounterD>0 then
          CounterD <= CounterD - 1;
        end if;
      end if;
    end if;
  end process;

  -- HERON FIFO 4
  process
  begin
    wait until CLK='1';
    if WEN(4)='1' then
      if CounterE=LENGTH then
        assert false report "Error: Write performed to HERON FIFO 4 when full" severity failure;
      end if;
      if REN(4)='0' then
        if CounterE<LENGTH then
          CounterE <= CounterE + 1;
        end if;
      else
        if CounterE=0 then
          CounterE <= CounterE + 1;
        end if;
      end if;
    else
      if REN(4)='1' then
        if CounterE>0 then
          CounterE <= CounterE - 1;
        end if;
      end if;
    end if;
  end process;

  -- HERON FIFO 5
  process
  begin
    wait until CLK='1';
    if WEN(5)='1' then
      if CounterF=LENGTH then
        assert false report "Error: Write performed to HERON FIFO 5 when full" severity failure;
      end if;
      if REN(5)='0' then
        if CounterF<LENGTH then
          CounterF <= CounterF + 1;
        end if;
      else
        if CounterF=0 then
          CounterF <= CounterF + 1;
        end if;
      end if;
    else
      if REN(5)='1' then
        if CounterF>0 then
          CounterF <= CounterF - 1;
        end if;
      end if;
    end if;
  end process;

  -- Write data to "FIFO_OUT0" file
  process
    file     F0      : text;
    variable L0      : line;
    variable V0      : std_logic_vector(31 downto 0);
    variable first   : integer range 0 to 1 := 1;
    variable Status0 : file_open_status;
  begin
    -- Open the file for writing or appending
    if first=1 then
      file_open(Status0, F0, FILE_OUT0, write_mode);
      first := 0;
    else
      file_open(Status0, F0, FILE_OUT0, append_mode);
    end if;
    -- Write one data value to the file and close it
    wait until CLK='1';
    if WEN(0)='1' AND CounterA/=LENGTH then
      hwrite(L0, DO);
      writeline(F0, L0);
    end if;
    file_close(F0);
  end process;

  -- Write data to "FIFO_OUT1" file
  process
    file     F1      : text;
    variable L1      : line;
    variable V1      : std_logic_vector(31 downto 0);
    variable first   : integer range 0 to 1 := 1;
    variable Status1 : file_open_status;
  begin
    -- Open the file for writing or appending
    if first=1 then
      file_open(Status1, F1, FILE_OUT1, write_mode);
      first := 0;
    else
      file_open(Status1, F1, FILE_OUT1, append_mode);
    end if;
    -- Write one data value to the file and close it
    wait until CLK='1';
    if WEN(1)='1' AND CounterB/=LENGTH then
      hwrite(L1, DO);
      writeline(F1, L1);
    end if;
    file_close(F1);
  end process;

  -- Write data to "FIFO_OUT2" file
  process
    file     F2      : text;
    variable L2      : line;
    variable V2      : std_logic_vector(31 downto 0);
    variable first   : integer range 0 to 1 := 1;
    variable Status2 : file_open_status;
  begin
    -- Open the file for writing or appending
    if first=1 then
      file_open(Status2, F2, FILE_OUT2, write_mode);
      first := 0;
    else
      file_open(Status2, F2, FILE_OUT2, append_mode);
    end if;
    -- Write one data value to the file and close it
    wait until CLK='1';
    if WEN(2)='1' AND CounterC/=LENGTH then
      hwrite(L2, DO);
      writeline(F2, L2);
    end if;
    file_close(F2);
  end process;

  -- Write data to "FIFO_OUT3" file
  process
    file     F3      : text;
    variable L3      : line;
    variable V3      : std_logic_vector(31 downto 0);
    variable first   : integer range 0 to 1 := 1;
    variable Status3 : file_open_status;
  begin
    -- Open the file for writing or appending
    if first=1 then
      file_open(Status3, F3, FILE_OUT3, write_mode);
      first := 0;
    else
      file_open(Status3, F3, FILE_OUT3, append_mode);
    end if;
    -- Write one data value to the file and close it
    wait until CLK='1';
    if WEN(3)='1' AND CounterD/=LENGTH then
      hwrite(L3, DO);
      writeline(F3, L3);
    end if;
    file_close(F3);
  end process;

  -- Write data to "FIFO_OUT4" file
  process
    file     F4      : text;
    variable L4      : line;
    variable V4      : std_logic_vector(31 downto 0);
    variable first   : integer range 0 to 1 := 1;
    variable Status4 : file_open_status;
  begin
    -- Open the file for writing or appending
    if first=1 then
      file_open(Status4, F4, FILE_OUT4, write_mode);
      first := 0;
    else
      file_open(Status4, F4, FILE_OUT4, append_mode);
    end if;
    -- Write one data value to the file and close it
    wait until CLK='1';
    if WEN(4)='1' AND CounterE/=LENGTH then
      hwrite(L4, DO);
      writeline(F4, L4);
    end if;
    file_close(F4);
  end process;

  -- Write data to "FIFO_OUT5" file
  process
    file     F5      : text;
    variable L5      : line;
    variable V5      : std_logic_vector(31 downto 0);
    variable first   : integer range 0 to 1 := 1;
    variable Status5 : file_open_status;
  begin
    -- Open the file for writing or appending
    if first=1 then
      file_open(Status5, F5, FILE_OUT5, write_mode);
      first := 0;
    else
      file_open(Status5, F5, FILE_OUT5, append_mode);
    end if;
    -- Write one data value to the file and close it
    wait until CLK='1';
    if WEN(5)='1' AND CounterF/=LENGTH then
      hwrite(L5, DO);
      writeline(F5, L5);
    end if;
    file_close(F5);
  end process;

  -- Full Flags
  FF(0) <= '0' when (CounterA = LENGTH) else '1';
  FF(1) <= '0' when (CounterB = LENGTH) else '1';
  FF(2) <= '0' when (CounterC = LENGTH) else '1';
  FF(3) <= '0' when (CounterD = LENGTH) else '1';
  FF(4) <= '0' when (CounterE = LENGTH) else '1';
  FF(5) <= '0' when (CounterF = LENGTH) else '1';

  -- Almost Full Flags
  AF(0) <= '0' when (CounterA >= (LENGTH-4)) else '1';
  AF(1) <= '0' when (CounterB >= (LENGTH-4)) else '1';
  AF(2) <= '0' when (CounterC >= (LENGTH-4)) else '1';
  AF(3) <= '0' when (CounterD >= (LENGTH-4)) else '1';
  AF(4) <= '0' when (CounterE >= (LENGTH-4)) else '1';
  AF(5) <= '0' when (CounterF >= (LENGTH-4)) else '1';

  -- Output propagation delay (compulsory for simulation)
  DOF_FF <= FF after 1 ns;
  DOF_AF <= AF after 1 ns;

end Behave;

-- pragma translate_on

