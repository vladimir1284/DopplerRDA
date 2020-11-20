-- ======================================================
--   INPUT FIFO Behavioral (Simulation) model
-- ======================================================
--
--  Module      : SIM_RD_6F
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

entity SIM_RD_6F is
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
end SIM_RD_6F;


-- pragma translate_off

architecture Behave of SIM_RD_6F is

  -- FIFO Read Enables
  signal REN      : std_logic_vector(5 downto 0);
  signal WEN      : std_logic_vector(5 downto 0);

  -- FIFO Output Enables
  signal OEN      : std_logic_vector(5 downto 0);
  signal OEN_ERR  : std_logic;

  -- FIFO Flags
  signal EF       : std_logic_vector(5 downto 0);
  signal AE       : std_logic_vector(5 downto 0);

  -- FIFO length
  constant LENGTH : integer := 8;

  -- Read data
  signal REG0     : std_logic_vector(31 downto 0);
  signal REG1     : std_logic_vector(31 downto 0);
  signal REG2     : std_logic_vector(31 downto 0);
  signal REG3     : std_logic_vector(31 downto 0);
  signal REG4     : std_logic_vector(31 downto 0);
  signal REG5     : std_logic_vector(31 downto 0);
  signal DATA     : std_logic_vector(31 downto 0);

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

  type TAB is array(0 to 7) of std_logic_vector(31 downto 0);

  -- FIFO 0 Signals
  signal V0       : TAB;
  signal RD_ADDR0 : integer range 0 to 7 := 0;
  signal WR_ADDR0 : integer range 0 to 7 := 0;
  -- FIFO 1 Signals
  signal V1       : TAB;
  signal RD_ADDR1 : integer range 0 to 7 := 0;
  signal WR_ADDR1 : integer range 0 to 7 := 0;
  -- FIFO 2 Signals
  signal V2       : TAB;
  signal RD_ADDR2 : integer range 0 to 7 := 0;
  signal WR_ADDR2 : integer range 0 to 7 := 0;
  -- FIFO 3 Signals
  signal V3       : TAB;
  signal RD_ADDR3 : integer range 0 to 7 := 0;
  signal WR_ADDR3 : integer range 0 to 7 := 0;
  -- FIFO 4 Signals
  signal V4       : TAB;
  signal RD_ADDR4 : integer range 0 to 7 := 0;
  signal WR_ADDR4 : integer range 0 to 7 := 0;
  -- FIFO 5 Signals
  signal V5       : TAB;
  signal RD_ADDR5 : integer range 0 to 7 := 0;
  signal WR_ADDR5 : integer range 0 to 7 := 0;

  signal WRITE_OK : std_logic_vector(5 downto 0);

begin

  REN <= DIF_REN;
  OEN <= DIF_OEN;

  -- Full Flags
  EF(0) <= '0' when (CounterA = 0) else '1';
  EF(1) <= '0' when (CounterB = 0) else '1';
  EF(2) <= '0' when (CounterC = 0) else '1';
  EF(3) <= '0' when (CounterD = 0) else '1';
  EF(4) <= '0' when (CounterE = 0) else '1';
  EF(5) <= '0' when (CounterF = 0) else '1';

  -- Almost Full Flags
  AE(0) <= '0' when (CounterA < 4) else '1';
  AE(1) <= '0' when (CounterB < 4) else '1';
  AE(2) <= '0' when (CounterC < 4) else '1';
  AE(3) <= '0' when (CounterD < 4) else '1';
  AE(4) <= '0' when (CounterE < 4) else '1';
  AE(5) <= '0' when (CounterF < 4) else '1';

  -- Read data from "FIFO_IN0" file
  process
    file     F0      : text;
    variable L0      : line;
    variable V       : std_logic_vector(31 downto 0);
    variable Status0 : file_open_status;
  begin
    ENDF0 <= false;
    WRITE_OK(0) <= '0';

    -- open file
    file_open(Status0, F0, FILE_IN0, read_mode);
    -- exit on error
    if Status0/=OPEN_OK then
      assert false report "Error opening file " & FILE_IN0 severity failure;
      ENDF0 <= true;
      wait;
    end if;

    -- trigger
    wait until GO;
    WRITE_OK(0) <= '1';

    while NOT endfile(F0) loop
      wait until CLK='1';
      if CounterA<LENGTH then
        readline(F0, L0);
        hread(L0, V);
        V0(WR_ADDR0) <= V;
        if WR_ADDR0=(LENGTH-1) then
          WR_ADDR0 <= 0;
        else
          WR_ADDR0 <= WR_ADDR0 + 1;
        end if;
      end if;
    end loop;

    WRITE_OK(0) <= '0';
    ENDF0 <= true;
    wait;
  end process;

  WEN(0) <= '1' when ((CounterA < LENGTH) and WRITE_OK(0)='1') else '0';

  process
  begin
    wait until CLK='1';
    if REN(0)='1' then
      if CounterA=0 then
        assert false report "Error: Read performed from HERON FIFO 0 when empty" severity failure;
      end if;
      if WEN(0)='0' then
        CounterA <= CounterA - 1;
      end if;
      REG0 <= V0(RD_ADDR0);
      if RD_ADDR0=(LENGTH-1) then
        RD_ADDR0 <= 0;
      else
        RD_ADDR0 <= RD_ADDR0 + 1;
      end if;
    else
      if WEN(0)='1' then
        if CounterA<LENGTH then
          CounterA <= CounterA + 1;
        end if;
      end if;
    end if;
  end process;

  -- Read data from "FIFO_IN1" file
  process
    file     F1      : text;
    variable L1      : line;
    variable V       : std_logic_vector(31 downto 0);
    variable Status1 : file_open_status;
  begin
    ENDF1 <= false;
    WRITE_OK(1) <= '0';

    -- open file
    file_open(Status1, F1, FILE_IN1, read_mode);
    -- exit on error
    if Status1/=OPEN_OK then
      assert false report "Error opening file " & FILE_IN1 severity failure;
      ENDF1 <= true;
      wait;
    end if;

    -- trigger
    wait until GO;
    WRITE_OK(1) <= '1';

    while NOT endfile(F1) loop
      wait until CLK='1';
      if CounterB<LENGTH then
        readline(F1, L1);
        hread(L1, V);
        V1(WR_ADDR1) <= V;
        if WR_ADDR1=(LENGTH-1) then
          WR_ADDR1 <= 0;
        else
          WR_ADDR1 <= WR_ADDR1 + 1;
        end if;
      end if;
    end loop;

    WRITE_OK(1) <= '0';
    ENDF1 <= true;
    wait;
  end process;

  WEN(1) <= '1' when ((CounterB < LENGTH) and WRITE_OK(1)='1') else '0';

  process
  begin
    wait until CLK='1';
    if REN(1)='1' then
      if CounterB=0 then
        assert false report "Error: Read performed from HERON FIFO 1 when empty" severity failure;
      end if;
      if WEN(1)='0' then
        CounterB <= CounterB - 1;
      end if;
      REG1 <= V1(RD_ADDR1);
      if RD_ADDR1=(LENGTH-1) then
        RD_ADDR1 <= 0;
      else
        RD_ADDR1 <= RD_ADDR1 + 1;
      end if;
    else
      if WEN(1)='1' then
        if CounterB<LENGTH then
          CounterB <= CounterB + 1;
        end if;
      end if;
    end if;
  end process;

  -- Read data from "FIFO_IN2" file
  process
    file     F2      : text;
    variable L2      : line;
    variable V       : std_logic_vector(31 downto 0);
    variable Status2 : file_open_status;
  begin
    ENDF2 <= false;
    WRITE_OK(2) <= '0';

    -- open file
    file_open(Status2, F2, FILE_IN2, read_mode);
    -- exit on error
    if Status2/=OPEN_OK then
      assert false report "Error opening file " & FILE_IN2 severity failure;
      ENDF2 <= true;
      wait;
    end if;

    -- trigger
    wait until GO;
    WRITE_OK(2) <= '1';

    while NOT endfile(F2) loop
      wait until CLK='1';
      if CounterC<LENGTH then
        readline(F2, L2);
        hread(L2, V);
        V2(WR_ADDR2) <= V;
        if WR_ADDR2=(LENGTH-1) then
          WR_ADDR2 <= 0;
        else
          WR_ADDR2 <= WR_ADDR2 + 1;
        end if;
      end if;
    end loop;

    WRITE_OK(2) <= '0';
    ENDF2 <= true;
    wait;
  end process;

  WEN(2) <= '1' when ((CounterC < LENGTH) and WRITE_OK(2)='1') else '0';

  process
  begin
    wait until CLK='1';
    if REN(2)='1' then
      if CounterC=0 then
        assert false report "Error: Read performed from HERON FIFO 2 when empty" severity failure;
      end if;
      if WEN(2)='0' then
        CounterC <= CounterC - 1;
      end if;
      REG2 <= V2(RD_ADDR2);
      if RD_ADDR2=(LENGTH-1) then
        RD_ADDR2 <= 0;
      else
        RD_ADDR2 <= RD_ADDR2 + 1;
      end if;
    else
      if WEN(2)='1' then
        if CounterC<LENGTH then
          CounterC <= CounterC + 1;
        end if;
      end if;
    end if;
  end process;

  -- Read data from "FIFO_IN3" file
  process
    file     F3      : text;
    variable L3      : line;
    variable V       : std_logic_vector(31 downto 0);
    variable Status3 : file_open_status;
  begin
    ENDF3 <= false;
    WRITE_OK(3) <= '0';

    -- open file
    file_open(Status3, F3, FILE_IN3, read_mode);
    -- exit on error
    if Status3/=OPEN_OK then
      assert false report "Error opening file " & FILE_IN3 severity failure;
      ENDF3 <= true;
      wait;
    end if;

    -- trigger
    wait until GO;
    WRITE_OK(3) <= '1';

    while NOT endfile(F3) loop
      wait until CLK='1';
      if CounterD<LENGTH then
        readline(F3, L3);
        hread(L3, V);
        V3(WR_ADDR3) <= V;
        if WR_ADDR3=(LENGTH-1) then
          WR_ADDR3 <= 0;
        else
          WR_ADDR3 <= WR_ADDR3 + 1;
        end if;
      end if;
    end loop;

    WRITE_OK(3) <= '0';
    ENDF3 <= true;
    wait;
  end process;

  WEN(3) <= '1' when ((CounterD < LENGTH) and WRITE_OK(3)='1') else '0';

  process
  begin
    wait until CLK='1';
    if REN(3)='1' then
      if CounterD=0 then
        assert false report "Error: Read performed from HERON FIFO 3 when empty" severity failure;
      end if;
      if WEN(3)='0' then
        CounterD <= CounterD - 1;
      end if;
      REG3 <= V3(RD_ADDR3);
      if RD_ADDR3=(LENGTH-1) then
        RD_ADDR3 <= 0;
      else
        RD_ADDR3 <= RD_ADDR3 + 1;
      end if;
    else
      if WEN(3)='1' then
        if CounterD<LENGTH then
          CounterD <= CounterD + 1;
        end if;
      end if;
    end if;
  end process;
  
  -- Read data from "FIFO_IN4" file
  process
    file     F4      : text;
    variable L4      : line;
    variable V       : std_logic_vector(31 downto 0);
    variable Status4 : file_open_status;
  begin
    ENDF4 <= false;
    WRITE_OK(4) <= '0';

    -- open file
    file_open(Status4, F4, FILE_IN4, read_mode);
    -- exit on error
    if Status4/=OPEN_OK then
      assert false report "Error opening file " & FILE_IN4 severity failure;
      ENDF4 <= true;
      wait;
    end if;

    -- trigger
    wait until GO;
    WRITE_OK(4) <= '1';

    while NOT endfile(F4) loop
      wait until CLK='1';
      if CounterE<LENGTH then
        readline(F4, L4);
        hread(L4, V);
        V4(WR_ADDR4) <= V;
        if WR_ADDR4=(LENGTH-1) then
          WR_ADDR4 <= 0;
        else
          WR_ADDR4 <= WR_ADDR4 + 1;
        end if;
      end if;
    end loop;

    WRITE_OK(4) <= '0';
    ENDF4 <= true;
    wait;
  end process;

  WEN(4) <= '1' when ((CounterE < LENGTH) and WRITE_OK(4)='1') else '0';

  process
  begin
    wait until CLK='1';
    if REN(4)='1' then
      if CounterE=0 then
        assert false report "Error: Read performed from HERON FIFO 4 when empty" severity failure;
      end if;
      if WEN(4)='0' then
        CounterE <= CounterE - 1;
      end if;
      REG4 <= V4(RD_ADDR4);
      if RD_ADDR4=(LENGTH-1) then
        RD_ADDR4 <= 0;
      else
        RD_ADDR4 <= RD_ADDR4 + 1;
      end if;
    else
      if WEN(4)='1' then
        if CounterE<LENGTH then
          CounterE <= CounterE + 1;
        end if;
      end if;
    end if;
  end process;

  -- Read data from "FIFO_IN5" file
  process
    file     F5      : text;
    variable L5      : line;
    variable V       : std_logic_vector(31 downto 0);
    variable Status5 : file_open_status;
  begin
    ENDF5 <= false;
    WRITE_OK(5) <= '0';

    -- open file
    file_open(Status5, F5, FILE_IN5, read_mode);
    -- exit on error
    if Status5/=OPEN_OK then
      assert false report "Error opening file " & FILE_IN5 severity failure;
      ENDF5 <= true;
      wait;
    end if;

    -- trigger
    wait until GO;
    WRITE_OK(5) <= '1';

    while NOT endfile(F5) loop
      wait until CLK='1';
      if CounterF<LENGTH then
        readline(F5, L5);
        hread(L5, V);
        V5(WR_ADDR5) <= V;
        if WR_ADDR5=(LENGTH-1) then
          WR_ADDR5 <= 0;
        else
          WR_ADDR5 <= WR_ADDR5 + 1;
        end if;
      end if;
    end loop;

    WRITE_OK(5) <= '0';
    ENDF5 <= true;
    wait;
  end process;

  WEN(5) <= '1' when ((CounterF < LENGTH) and WRITE_OK(5)='1') else '0';

  process
  begin
    wait until CLK='1';
    if REN(5)='1' then
      if CounterF=0 then
        assert false report "Error: Read performed from HERON FIFO 5 when empty" severity failure;
      end if;
      if WEN(5)='0' then
        CounterF <= CounterF - 1;
      end if;
      REG5 <= V5(RD_ADDR5);
      if RD_ADDR5=(LENGTH-1) then
        RD_ADDR5 <= 0;
      else
        RD_ADDR5 <= RD_ADDR5 + 1;
      end if;
    else
      if WEN(5)='1' then
        if CounterF<LENGTH then
          CounterF <= CounterF + 1;
        end if;
      end if;
    end if;
  end process;

  -- Output DATA
  process (OEN, REG0, REG1, REG2, REG3, REG4, REG5)
  begin
    case OEN is
      when "111110" => DATA <= REG0; OEN_ERR <= '0';
      when "111101" => DATA <= REG1; OEN_ERR <= '0';
      when "111011" => DATA <= REG2; OEN_ERR <= '0';
      when "110111" => DATA <= REG3; OEN_ERR <= '0';
      when "101111" => DATA <= REG4; OEN_ERR <= '0';
      when "011111" => DATA <= REG5; OEN_ERR <= '0';
      when "111111" => DATA <= (others=>'Z'); OEN_ERR <= '0';
      when others   => DATA <= (others=>'U'); OEN_ERR <= '1';
    end case;
  end process;

  process
  begin
    wait until CLK='1';
    if GO and OEN_ERR='1' then
      assert false report "Error: more than one HERON FIFO output enable asserted" severity failure;
    end if;
  end process;

  -- Output propagation delay (compulsory for simulation)
  DI <= DATA after 1 ns;

  -- Output propagation delay (compulsory for simulation)
  DIF_EF <= EF after 1 ns;
  DIF_AE <= AE after 1 ns;

end Behave;

-- pragma translate_on

