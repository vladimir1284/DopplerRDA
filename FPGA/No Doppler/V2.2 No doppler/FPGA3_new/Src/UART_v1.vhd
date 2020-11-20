
+----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    10:30:50 11/15/2016 
-- Design Name:    UART v1.0
-- Module Name:    UART_v1 - Behavioral 
-- Project Name:   
-- Target Devices: 
-- Tool versions: 
-- Description: 
--
-- Dependencies: 
--
-- Revision: Ing Roberto Naranjo Ponce
-- Revision 0.01 - File Created
-- Additional Comments: 
--
----------------------------------------------------------------------------------
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.STD_LOGIC_ARITH.ALL;
use IEEE.STD_LOGIC_UNSIGNED.ALL;

---- Uncomment the following library declaration if instantiating
---- any Xilinx primitives in this code.
--library UNISIM;
--use UNISIM.VComponents.all;

entity UART_v1 is
    Port ( clk : in  STD_LOGIC;
           reset : in  STD_LOGIC;
           rx : in  STD_LOGIC;
			  baud : in STD_LOGIC_VECTOR(2 downto 0);
           tx : out  STD_LOGIC;
			  LoadData : STD_LOGIC;
           Din : in  STD_LOGIC_VECTOR (7 downto 0);
           Dout : out  STD_LOGIC_VECTOR (7 downto 0);
           Rx_RDY : out  STD_LOGIC;
           TxBusy : out  STD_LOGIC;
           RxErr : out  STD_LOGIC;
			  sTop16 : out  STD_LOGIC;
			  sTopTx : out  STD_LOGIC;
			  sTopRx : out  STD_LOGIC
			  );
end UART_v1;

architecture Behavioral of UART_v1 is

signal divisor :integer:=0;
signal Div16 :integer:= 0;
signal Top16 : std_logic;
signal TopTx : std_logic;
signal ClkDiv : unsigned(11 downto 0);
signal TopRx :std_logic;
signal RxDiv : integer;
signal ClrDiv : std_logic;

type TxFSM_type is(
                    idle,
						  Load_Tx,
						  Shift_Tx,
						  Stop_Tx);
						  
type 	RxFSM_type is(
                     idle,
                     Start_Rx,
 							Edge_Rx,
							Shift_Rx,
							Stop_Rx,
							RxOVF);
							
						  
signal TxFSM : TxFSM_type;
signal RxFSM : RxFSM_type;

signal Tx_Reg : std_logic_vector(8 downto 0);
signal TxBitCnt:integer;
signal RegDin : std_logic_vector(7 downto 0);
signal NDBits :integer := 8;
signal Rx_Reg : std_logic_vector(7 downto 0);
signal RxBitCnt : integer;
signal RxRdyi : std_logic;

begin
-- --------------------------
-- Baud rate selection
-- --------------------------
process (reset, clk)
   begin
     if reset='1' then
       Divisor <= 0;
     elsif rising_edge(clk) then
       case Baud is
         when "000" => Divisor <= 54; -- 115.200
         when "001" => Divisor <= 109; -- 57.600
         when "010" => Divisor <= 163; -- 38.400
         when "011" => Divisor <= 325; -- 19.200
         when "100" => Divisor <= 651; -- 9.600
         when "101" => Divisor <= 191; -- 4.800
         when "110" => Divisor <= 1302; -- 2.400
         when "111" => Divisor <= 5208; -- 1.200
         when others => Divisor <= 651; -- n.u.
      end case;
    end if;
end process;

-- --------------------------
-- Clk16 Clock Generation
-- --------------------------
process (reset, clk)
  begin
    if reset='1' then
      Top16 <= '0';
      Div16 <= 0;
    elsif rising_edge(clk) then
      Top16 <= '0';
      if Div16 = Divisor then
        Div16 <= 0;
        Top16 <= '1';
      else
        Div16 <= Div16 + 1;
      end if;
    end if;
end process;

-- --------------------------
-- Tx Clock Generation
-- --------------------------
process (reset, clk)
  begin
    if reset='1' then
      TopTx <= '0';
      ClkDiv <= (others=>'0');
    elsif rising_edge(clk) then
      TopTx <= '0';
      if Top16='1' then
        ClkDiv <= ClkDiv + 1;
        if ClkDiv = 15 then
          TopTx <= '1';
        end if;
      end if;
    end if;
end process;
-- ------------------------------


-- ------------------------------
-- Rx Sampling Clock Generation
-- ------------------------------
process (reset, clk)
  begin
    if reset='1' then
      TopRx <= '0';
      RxDiv <= 0;
    elsif rising_edge(CLK) then
      TopRx <= '0';
      if ClrDiv='1' then
        RxDiv <= 0;
      elsif Top16='1' then
        if RxDiv = 7 then
          RxDiv <= 0;
          TopRx <= '1';
        else
          RxDiv <= RxDiv + 1;
        end if;
      end if;
    end if;
end process;


-- --------------------------
-- Transmit State Machine
-- --------------------------
  TX <= Tx_Reg(0);
Tx_FSM: process (reset, clk)
  begin
    if reset='1' then
      Tx_Reg <= (others => '1');
      TxBitCnt <= 0;
      TxFSM <= idle;
      TxBusy <= '0';
      RegDin <= (others=>'0');
    elsif rising_edge(CLK) then
      TxBusy <= '1'; -- except when explicitly '0'
      case TxFSM is
        when Idle =>
          if LoadData ='1' then
          -- latch the input data immediately.
            RegDin <= Din;
            TxBusy <= '1';
            TxFSM <= Load_Tx;
          else
            TxBusy <= '0';
          end if;
        
		  when Load_Tx =>
          if TopTx='1' then
            TxFSM <= Shift_Tx;
            --if parity then
            -- start + data + parity
              --TxBitCnt <= (NDBits + 2);
             -- Tx_Reg <= make_parity(RegDin,even) & Din & '0';
            --else
              TxBitCnt <= (NDBits + 1); -- start + data
              Tx_reg <=  RegDin &'0';
            --end if;
          end if;
        
		  when Shift_Tx =>
          if TopTx='1' then
            TxBitCnt <= TxBitCnt - 1;
            Tx_reg <= '1' & Tx_reg (Tx_reg 'high downto 1);
            if TxBitCnt=1 then
              TxFSM <= Stop_Tx;
            end if;
          end if;

        when Stop_Tx =>
          if TopTx='1' then
            TxFSM <= Idle;
          end if;
      
		  when others =>
          TxFSM <= Idle;
      end case;
    end if;
end process;

-- ------------------------
-- RECEIVE State Machine
-- ------------------------
Rx_FSM: process (reset, clk)
  begin
    if reset='1' then
      Rx_Reg <= (others => '0');
      Dout <= (others => '0');
      RxBitCnt <= 0;
      RxFSM <= Idle;
      RxRdyi <= '0';
      ClrDiv <= '0';
      RxErr <= '0';
    elsif rising_edge(clk) then
      ClrDiv <= '0'; -- default value
       -- reset error when a word has been received Ok:
      if RxRdyi= '1' then
        RxErr <= '0';
        RxRdyi <= '0';
      end if;
      case RxFSM is
        when Idle => -- wait on start bit
          RxBitCnt <= 0;
            if Top16='1' then
              if Rx='0' then
                RxFSM <= Start_Rx;
                ClrDiv <='1'; -- Synchronize the divisor
              end if; -- else false start, stay in Idle
            end if;
         
		  when Start_Rx => -- wait on first data bit
          if TopRx = '1' then
            if Rx='1' then -- framing error
              RxFSM <= RxOVF;
              report "Start bit error." severity note;
            else
              RxFSM <= Edge_Rx;
            end if;
          end if;

        when Edge_Rx => -- should be near Rx edge
          if TopRx = '1' then
            RxFSM <= Shift_Rx;
            if RxBitCnt = NDbits then
              RxFSM <= Stop_Rx;
            else
              RxFSM <= Shift_Rx;
            end if;
          end if;

        when Shift_Rx => -- Sample data !
          if TopRx = '1' then
            RxBitCnt <= RxBitCnt + 1;
            -- shift right :
            Rx_Reg <= Rx & Rx_Reg (Rx_Reg'high downto 1);
            RxFSM <= Edge_Rx;
          end if;

        when Stop_Rx => -- during Stop bit
          if TopRx = '1' then
            Dout <= Rx_reg;
            RxRdyi <='1';
            RxFSM <= Idle;
           -- assert (debug < 1)
            --report "Character received in decimal is : "
           -- & integer'image(to_integer(unsigned(Rx_Reg)))
           -- severity note;
          end if;

        when RxOVF => -- Overflow / Error
          RxErr <= '1';
          if Rx='1' then
            RxFSM <= Idle;
          end if;
      end case;
    end if;
end process;
sTop16 <= Top16;
sTopTx <= TopTx;
sTopRx <= TopRx;
end Behavioral;

