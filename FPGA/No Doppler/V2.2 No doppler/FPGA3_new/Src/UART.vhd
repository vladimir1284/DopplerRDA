----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    15:25:09 11/14/2016 
-- Design Name: 
-- Module Name:    UART - Behavioral 
-- Project Name: 
-- Target Devices: 
-- Tool versions: 
-- Description: 
--
-- Dependencies: 
--
-- Revision: 
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

entity UART is
  generic(
    --Default setting;
	 -- 19200 baud, 8 data bits, 1 stop bit;
	 DBIT : integer := 8; --# data bits
	 SB_TICK : integer :=16; -- # tics for stop bits
	 DVSR : integer := 163; --baud rate divider = 50M/16* baud rate
	 DVSR_BIT: integer := 8; --# bits of DVSR
	 FIFO_W : integer := 2 --addr bits of FIFO
         );

    Port ( clk : in  STD_LOGIC;
           reset : in  STD_LOGIC;
           rd_uart : in  STD_LOGIC;
           wr_uart : in  STD_LOGIC;
           rx : in  STD_LOGIC;
           w_data : in  STD_LOGIC_VECTOR (7 downto 0);
           tx_full : out  STD_LOGIC;
           rx_empty : out  STD_LOGIC;
           r_data : out  STD_LOGIC_VECTOR (7 downto 0);
           tx : out  STD_LOGIC);
end UART;

architecture Behavioral of UART is

  signal tick : std_logic;
  signal rx_done_tick : std_logic;
  signal tx_fifo_out : std_logic_vector (7 downto 0);
  signal rx_data_out : std_logic_vector(7 downto 0);
  signal tx_empty : std_logic;
  signal tx_fifo_not_empty : std_logic;
  signal tx_done_tick : std_logic;
  

begin
  baud_gen_unit : entity work.mod_m_counter(arch)
    generic map( M => DVSR, 
	              N => DVSR_BIT)
    port map( clk => clk, 
	           reset => reset,
              q => open,
				  max_tick => tick);
  
  uart_rx_unit : entity work.uart_rx(arch)
    generic map (DBIT => DBIT,
	              SB_TICK => SB_TICK
    port map (clk => clk,
	            reset => reset,
               rx => rx,
               s_tick =>tick,
               rx_done_tick => rx_done_tick,
               dout => rx_data_out);

  fifo_rx_unit	: entity work.fifo(arch)
    generic map(B => DBIT,
                W => FIFO_W)
    port map( clk => clk,
              reset => reset,
              rd => rd_uart,
              wr => rx_done_tick,
              w_data => rx_data_out,
				  empty => rx_empty,
				  full => open,
				  r_data = > r_data);
				  
  fifo_tx_unit: entity work.fifo(arch)
 				  
				

end Behavioral;

