----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    13:44:25 11/21/2016 
-- Design Name: 
-- Module Name:    mod_m_cter - Behavioral 
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

entity mod_m_cter is
generic(
  N: integer := 10;
  M: integer := 54);
    Port ( clk : in  STD_LOGIC;
           reset : in  STD_LOGIC;
           max_tick : out  STD_LOGIC;
           q : out  STD_LOGIC_VECTOR (3 downto 0));
end mod_m_cter;

architecture Behavioral of mod_m_cter is
  
signal r_reg: unsigned(N-1 downto 0);
signal r_next: unsigned(N-1 downto 0);


begin
  process(clk, reset)
    begin
      if (reset = '1') then
        r_reg <= (others => '0');
      elsif (rising_edge (clk)) then
        r_reg <= r_next;
      end if;
  end process;
  -- next state logic
  r_next <= (others => '0') when r_reg=(M-1) else
  r_reg + 1;
  -- output logic
  q <= std_logic_vector(r_reg);
  max_tick <= '1' when r_reg=(M-1) else '0';

end Behavioral;

