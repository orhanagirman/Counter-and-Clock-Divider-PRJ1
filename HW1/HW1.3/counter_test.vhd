--------------------------------------------------------------------------------
-- Company: 
-- Engineer:
--
-- Create Date:   09:49:42 08/04/2020
-- Design Name:   
-- Module Name:   C:/Users/TUTEL-50/Desktop/HW/hw1.4/counter_test.vhd
-- Project Name:  hw1.4
-- Target Device:  
-- Tool versions:  
-- Description:   
-- 
-- VHDL Test Bench Created by ISE for module: counter
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
 
ENTITY counter_test IS
END counter_test;
 
ARCHITECTURE behavior OF counter_test IS 
 
    -- Component Declaration for the Unit Under Test (UUT)
 
    COMPONENT counter
    PORT(
         clock : IN  std_logic;
         en : IN  std_logic;
         reset : IN  std_logic;
         slc : IN  std_logic;
         output : OUT  std_logic_vector(7 downto 0));
    END COMPONENT;
    

   --Inputs
   signal clock : std_logic := '0';
   signal en : std_logic := '0';
   signal reset : std_logic := '0';
   signal slc : std_logic := '0';

 	--Outputs
   signal output : std_logic_vector(7 downto 0);

   -- Clock period definitions
   constant clock_period : time := 10 ns;
 
BEGIN
 
	-- Instantiate the Unit Under Test (UUT)
   uut: counter PORT MAP (
          clk => clk,
          en => en,
          rst => rst,
          slc => slc,
          output => output,
          output1 => output1
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
      -- hold reset state for 100 ns.
      rst<='1';
      en<='1';
      slc<='1';
     	wait for 400 ns;	
		rst<='0';
		wait for 100 ns;
		rst<='1';
      en<='1';
      slc<='0';
      wait for clk_period*10;

      -- insert stimulus here 

      wait;
   end process;

END;
