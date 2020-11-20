----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    15:49:58 08/06/2012 
-- Design Name: 
-- Module Name:    SPI_Controller - Behavioral 
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

entity SPI_Controller is
    Port ( clk_sys : in  STD_LOGIC;
           load : in  STD_LOGIC;
           data_width : in  STD_LOGIC_VECTOR (7 downto 0);
           rst : in  STD_LOGIC;
           spi_clk : out  STD_LOGIC;
           busy : out  STD_LOGIC;
           spi_ss : out  STD_LOGIC);
end SPI_Controller;

architecture Behavioral of SPI_Controller is

begin


end Behavioral;

