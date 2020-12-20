----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    17:31:02 08/03/2020 
-- Design Name: 
-- Module Name:    clock_divider - Behavioral 
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

entity clock_divider is
    Port ( clk : in  STD_LOGIC;
	        rst: in STD_LOGIC;
           x : in  STD_LOGIC_VECTOR (1 downto 0);
			  output: out STD_LOGIC
			  --output2: out STD_LOGIC_VECTOR (3 downto 0)
			  );
end clock_divider;

architecture Behavioral of clock_divider is
signal count: STD_LOGIC_VECTOR (3 downto 0);

begin
   process(clk,rst)
   begin
	    if (rst='1') then
		    count<="0000";
			 output <='0';
			-- output2 <="0000";
	    elsif rising_edge(clk) then
		     count<=count + '1';    
		 end if;
	    
    	
		 --output2<=count;	 
		 if (x="00") then
				 output<=count(0);
		 elsif (x="01") then
					output<=count(1);
		 elsif (x="10") then
				  output<=count(2);
		 elsif (x="11") then
				  output<=count(3);	
		 end if;			  
   end process;	 

end Behavioral;
