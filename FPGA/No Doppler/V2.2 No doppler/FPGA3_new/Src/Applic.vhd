----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    09:25:27 11/16/2016 
-- Design Name: 
-- Module Name:    Applic - Behavioral 
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

entity Applic is
    Port ( SDin : in  STD_LOGIC_VECTOR (7 downto 0);
           TxBusy : in  STD_LOGIC;
           RxRDY : in  STD_LOGIC;
           RxErr : in  STD_LOGIC;
			  RTS   : in STD_LOGIC;
           clk : in  STD_LOGIC;
           rst : in  STD_LOGIC;
           SDout : out  STD_LOGIC_VECTOR (7 downto 0);
           LD_SDout : out  STD_LOGIC);
end Applic;

architecture Behavioral of Applic is

type State_Type is (Idle, Get, Send);

signal State : State_Type;
signal RData : std_logic_vector (7 downto 0);
signal SData : std_logic_vector (7 downto 0);

begin

  SDout <= SData;
  
process (clk,rst)
begin
  if RST='1' then
    State <= Idle;
    LD_SDout <= '0';
    SData <= (others=>'0');
    RData <= (others=>'0');
  elsif rising_edge(clk) then
    LD_SDout <= '0';
    case State is
      when Idle =>
        if RxRDY='1' then
          RData <= SDin;
          State <= Get;
        end if;
     
	   when Get =>
        if (TxBusy='0') and (RTS='1') then
          SData <= RData; 
          State <= Send;
        end if;

      when Send =>
        LD_SDout <= '1';
        State <= Idle;

      when others => null;
    end case;
  end if;
end process;


end Behavioral;

