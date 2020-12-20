----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    14:53:35 08/04/2020 
-- Design Name: 
-- Module Name:    homework14b - Behavioral 
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

entity homework14b is
    Port ( clock : in  STD_LOGIC;
           reset : in  STD_LOGIC;
           en : in  STD_LOGIC;
			  slck : in STD_LOGIC;
			  sw : in STD_LOGIC;
           output : out  STD_LOGIC_VECTOR (3 downto 0));
end homework14b;

architecture Behavioral of homework14b is

signal count: STD_LOGIC_VECTOR (3 downto 0);
signal count2: STD_LOGIC_VECTOR (3 downto 0);
signal araport1 : STD_LOGIC;
signal araport2 : STD_LOGIC;

component clock_divider
    Port ( clk : in  STD_LOGIC;
           rst : in  STD_LOGIC;
			  value: in integer;
           output : out  STD_LOGIC);
end component;	


begin

CLK1 : clock_divider port map (clk => clock, rst => reset, value => 500000, output => araport1);
CLK2 : clock_divider port map (clk => clock, rst => reset, value => 50000000, output => araport2);

   process(reset,araport1,en,sw,count2,slck,count)
   begin
      if (reset = '1') then
          count <= "0000";
			 count2 <= "0000";
      elsif (slck = '1') then
		     if (araport1'EVENT) and (araport1 = '1') then
               if (en = '1') then
				       if (sw = '1') then
                       count <= count + 1;
					    elsif (sw = '0') then
					        count <= count - 1;
                   end if;
	            end if;
          end if;
		elsif (slck = '0') then
		     if (araport2'EVENT) and (araport2 = '1') then
               if (en = '1') then
				       if (sw = '1') then
                       count2 <= count2 + 1;
					    elsif (sw = '0') then
					        count2 <= count2 - 1;
                   end if;
	            end if;
          end if;
      end if;
      if (slck = '1') then
          output <= count;
      elsif (slck = '0') then
          output <= count2;
      end if;			 
			 
	end process;	
	

end Behavioral;

