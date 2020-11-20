----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    16:09:17 11/21/2016 
-- Design Name: 
-- Module Name:    Flag_Buff - Behavioral 
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

entity Flag_Buff is
generic(W: integer := 8);

    Port ( clk : in  STD_LOGIC;
           reset : in  STD_LOGIC;
           clr_flag : in  STD_LOGIC;
           set_flag : in  STD_LOGIC;
           din : in  STD_LOGIC_VECTOR (7 downto 0);
           dout : out  STD_LOGIC_VECTOR (7 downto 0);
           flag : out  STD_LOGIC);
end Flag_Buff;

architecture Behavioral of Flag_Buff is

signal buf_reg, buf_next: std_logic_vector(W-1 downto 0);
signal flag_reg, flag_next: std_logic;

begin
 process(clk, reset)
   begin
     if (reset = '1') then
       buf_reg <= (others =>'0');
       flag_reg <= '0';
     elsif (rising_edge(clk)) then
       buf_reg <= buf_next;
       flag_reg <= flag_next;
     end if;
  end process;
  
  process (buf_reg, flag_reg, set_flag, clr_flag, din)
    begin
      buf_next <= buf_reg;
      flag_next <= flag_reg;
      if (set_flag = '1') then
        buf_next <= din;
        flag_next <= '1';
      elsif (clr_flag = '1') then
        flag_next <= '0';
      end if;
	end process;
	-- output logic
  dout <= buf_reg;
  flag <= flag_reg;
end Behavioral;

