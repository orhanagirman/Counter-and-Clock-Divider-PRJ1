----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    17:02:19 08/09/2020 
-- Design Name: 
-- Module Name:    homework14c - Behavioral 
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

entity homework14c is
    Port ( clock : in  STD_LOGIC;
           reset : in  STD_LOGIC;
           slck : in  STD_LOGIC;
           button : in  STD_LOGIC;
           output : out  STD_LOGIC_VECTOR (3 downto 0));
end homework14c;

architecture Behavioral of homework14c is

component clock_divider
    Port ( clk : in  STD_LOGIC;
           rst : in  STD_LOGIC;
			  value: in integer;
           output : out  STD_LOGIC);
end component;

component debouncer
    generic (
	          sr_depth : integer:=16
	 ); 
    Port ( clk : in  STD_LOGIC;
           rst : in  STD_LOGIC;
			  button_in : in  STD_LOGIC;
			  tmp_out : out STD_LOGIC);
end component;


signal araport1 : STD_LOGIC;
signal araport2 : STD_LOGIC;
signal temp : STD_LOGIC;
signal count : STD_LOGIC_VECTOR (3 downto 0);

begin

CLK1 : clock_divider port map (clk => clock, rst => reset, value => 500000, output => araport1);
CLK2 : clock_divider port map (clk => clock, rst => reset, value => 50000000, output => araport2);
DB : debouncer port map (clk => clock, rst => reset, button_in => button, tmp_out => temp);

    process(araport1,araport2,temp,reset,slck)
	 begin
	      if (reset = '1') then
             count <= "0000";
			elsif (slck = '1') then
             if rising_edge(araport1) then
                if (temp = '0') then
                    count <= count + 1;
                elsif (temp = '1') then
                    count <= count - 1;
                end if;
             end if;					 
         elsif (slck = '0') then	
             if rising_edge(araport2) then
                if (temp = '0') then
                    count <= count + 1;
                elsif (temp = '1') then
                    count <= count - 1;
                end if;
             end if;
         end if;
     end process;
     output <= count;	  
end Behavioral;

