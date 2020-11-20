----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    16:24:45 09/16/2015 
-- Design Name: 
-- Module Name:    sumador - Behavioral 
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

entity sum is
    Port ( InA : in  STD_LOGIC_VECTOR (12 downto 0);
           InB : in  STD_LOGIC_VECTOR (12 downto 0);
           salida : out  STD_LOGIC_VECTOR (12 downto 0));
end sum;

architecture Behavioral of sum is

begin
  PROCESS (InA, InB) IS
       BEGIN
         salida <= std_logic_vector(UNSIGNED(InA) + UNSIGNED(InB));
       END PROCESS;

end Behavioral;

