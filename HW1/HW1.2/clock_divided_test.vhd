--------------------------------------------------------------------------------
-- Company: 
-- Engineer:
--
-- Create Date:   18:31:19 08/03/2020
-- Design Name:   
-- Module Name:   C:/Users/orhan/Desktop/clock_divider/clock_divider/clock_divided_test.vhd
-- Project Name:  clock_divider
-- Target Device:  
-- Tool versions:  
-- Description:   
-- 
-- VHDL Test Bench Created by ISE for module: clock_divider
-- 
-- Dependencies:
-- 
-- Revision:
-- Revision 0.01 - File Created
-- Additional Comments:
--
-- Notes: 
-- This testbench has been automatically generated using types std_logic and
-- std_logic_vector for the ports of the unit under test.  Xilinx recommends
-- that these types always be used for the top-level I/O of a design in order
-- to guarantee that the testbench will bind correctly to the post-implementation 
-- simulation model.
--------------------------------------------------------------------------------
LIBRARY ieee;
USE ieee.std_logic_1164.ALL;
 
-- Uncomment the following library declaration if using
-- arithmetic functions with Signed or Unsigned values
--USE ieee.numeric_std.ALL;
 
ENTITY clock_divided_test IS
END clock_divided_test;
 
ARCHITECTURE behavior OF clock_divided_test IS 
 
    -- Component Declaration for the Unit Under Test (UUT)
 
    COMPONENT clock_divider
    PORT(
         clk : IN  std_logic;
         rst : IN  std_logic;
         x : IN  std_logic_vector(1 downto 0);
         output : OUT  std_logic
        -- output2 : OUT  std_logic_vector(3 downto 0)
        );
    END COMPONENT;
    

   --Inputs
   signal clk : std_logic := '0';
   signal rst : std_logic := '0';
   signal x : std_logic_vector(1 downto 0) := (others => '0');

 	--Outputs
   signal output : std_logic;
   --signal output2 : std_logic_vector(3 downto 0);

   -- Clock period definitions
   constant clk_period : time := 10 ns;
 
BEGIN
 
	-- Instantiate the Unit Under Test (UUT)
   uut: clock_divider PORT MAP (
          clk => clk,
          rst => rst,
          x => x,
          output => output
         -- output2 => output2
        );

   -- Clock process definitions
   clk_process :process
   begin
		clk <= '0';
		wait for clk_period/2;
		clk <= '1';
		wait for clk_period/2;
   end process;
 

   -- Stimulus process
   stim_proc: process
   begin		
      -- hold reset state for 10 ns.
		rst<='1';
      wait for 10 ns;	
      rst<='0';
		x<="00";
		wait for 200 ns;	
      rst<='0';
		x<="01";
		wait for 200 ns;	
      rst<='0';
		x<="10";
		wait for 400 ns;	
      rst<='0';
		x<="11";
		wait for 500 ns;
		rst<='1';
      wait for clk_period*100;

      -- insert stimulus here 

      wait;
   end process;

END;
