----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    08:29:22 08/04/2020 
-- Design Name: 
-- Module Name:    counter - Behavioral 
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

entity counter is
    Port ( clock : in  STD_LOGIC;
	        en  : in  STD_LOGIC;
 	        reset : in  STD_LOGIC;
			  slc: in STD_LOGIC;
           output1 : out  STD_LOGIC_VECTOR (7 downto 0));
end counter;

architecture Behavioral of counter is

signal count: STD_LOGIC_VECTOR (7 downto 0);
signal araport1 : STD_LOGIC;
signal araport2 : STD_LOGIC;

component clock_divider
    Port ( clk : in  STD_LOGIC;
           rst : in  STD_LOGIC;
			  value: in integer;
           output : out  STD_LOGIC);
end component;


begin
CLK1 : clock_divider port map (clk => clock, rst => reset, value => 12500000, output => araport1);
CLK2 : clock_divider port map (clk => clock, rst => reset, value => 50000000, output => araport2);

   process(reset,araport1,araport2,slc,en)
   begin
      if (reset = '1') then
          count <= "00000000";
		elsif (slc = '1') then
          if (en = '1') then		
             if rising_edge (araport1) then
                 count <= count + 1;				 
             end if;
	       end if;
		elsif (slc= '0') then
          if (en = '1') then
				 if rising_edge (araport2) then
                 count <= count + 1;				 
             end if;
	       end if;
	   end if;
		
	end process;
		 output1<=count;

end Behavioral;

