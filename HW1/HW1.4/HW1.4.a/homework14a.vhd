----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    16:05:37 08/09/2020 
-- Design Name: 
-- Module Name:    homework14a - Behavioral 
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

entity homework14a is
    Port ( clock : in  STD_LOGIC;
           reset : in  STD_LOGIC;
           slck : in  STD_LOGIC;
           output : out  STD_LOGIC_VECTOR (3 downto 0));
end homework14a;

architecture Behavioral of homework14a is

component clock_divider
    Port ( clk : in  STD_LOGIC;
           rst : in  STD_LOGIC;
			  value: in integer;
           output : out  STD_LOGIC);
end component;

signal araport1 : STD_LOGIC;
signal araport2 : STD_LOGIC;
signal sw : STD_LOGIC := '0';
signal count : STD_LOGIC_VECTOR (3 downto 0) ;
signal count2 : STD_LOGIC_VECTOR (3 downto 0) ;
begin

CLK1 : clock_divider port map (clk => clock, rst => reset, value => 500000, output => araport1);
CLK2 : clock_divider port map (clk => clock, rst => reset, value => 50000000, output => araport2);


     process(araport1,araport2,reset,slck,sw)
	  begin
	       if (reset = '1') then
			     count <= "0000";
				  count2 <= "0000";
				  sw <= '0';
			 elsif (slck = '1') then
              if rising_edge (araport1) then
				     if(sw = '0') then
					     count2 <= count;
					     count <= count + 1;
						  if (count = "1110") and (count2 = "1101") then
						      sw <= not sw;
						  end if;
                  elsif (sw = '1') then
						   count2 <= count;
                     count <= count - 1;
                     if (count = "0001") and (count2 = "0010") then
						      sw <= not sw;
						  end if;							
					   end if;	
					end if;
           elsif (slck = '0') then
              if rising_edge (araport2) then
				     if(sw = '0') then
					     count2 <= count;
					     count <= count + 1;
						  if (count = "1110") and (count2 = "1101") then
						      sw <= not sw;
						  end if;
                  elsif (sw = '1') then
						   count2 <= count;
                     count <= count - 1;
                     if (count = "0001") and (count2 = "0010") then
						      sw <= not sw;
						  end if;							
					   end if;	
					end if;				  
           end if;
			  
		end process;
      output <= count;		
        					

end Behavioral;

