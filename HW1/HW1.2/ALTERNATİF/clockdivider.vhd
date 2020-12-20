----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    13:38:57 08/05/2020 
-- Design Name: 
-- Module Name:    clockdivider - Behavioral 
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
use IEEE.STD_LOGIC_UNSIGNED.ALL;
-- Uncomment the following library declaration if using
-- arithmetic functions with Signed or Unsigned values
--use IEEE.NUMERIC_STD.ALL;

-- Uncomment the following library declaration if instantiating
-- any Xilinx primitives in this code.
--library UNISIM;
--use UNISIM.VComponents.all;

entity clockdivider is
    Port ( clk : in  STD_LOGIC;
           rst : in  STD_LOGIC;
			  count_out : out  integer;
           output : out  STD_LOGIC);
end clockdivider;

architecture Behavioral of clockdivider is
signal count: integer:= 0;
signal tmp: STD_LOGIC:= '0';
begin
process(clk,rst)
begin
	if(rst = '1') then
	count <= 1;
	tmp <= '0';
	elsif rising_edge(clk) then
	count <= count + 1;
	count_out <= count;
		if (count=5) then
		tmp <= not tmp;
		count<=1;
		end if;
	end if;
	output <= tmp;
end process;
end Behavioral;

