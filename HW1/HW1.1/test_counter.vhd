--------------------------------------------------------------------------------
-- Company: 
-- Engineer:
--
-- Create Date:   14:25:19 08/03/2020
-- Design Name:   
-- Module Name:   C:/Users/orhan/Desktop/three_bit_bicounter/three_bit_bicounter/test_counter.vhd
-- Project Name:  three_bit_bicounter
-- Target Device:  
-- Tool versions:  
-- Description:   
-- 
-- VHDL Test Bench Created by ISE for module: three_bit_bicounter
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
 
ENTITY test_counter IS
END test_counter;
 
ARCHITECTURE behavior OF test_counter IS 
 
    -- Component Declaration for the Unit Under Test (UUT)
 
    COMPONENT three_bit_bicounter
    PORT(
         clk : IN  std_logic;
         rst : IN  std_logic;
         x : IN  std_logic;
         output : OUT  std_logic_vector(2 downto 0)
        );
    END COMPONENT;
    

   --Inputs
   signal clk : std_logic := '0';
   signal rst : std_logic := '0';
   signal x : std_logic := '0';

 	--Outputs
   signal output : std_logic_vector(2 downto 0);

   -- Clock period definitions
   constant clk_period : time := 10 ns;
 
BEGIN
 
	-- Instantiate the Unit Under Test (UUT)
   uut: three_bit_bicounter PORT MAP (
          clk => clk,
          rst => rst,
          x => x,
          output => output
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
		x<='0';
      wait for 10 ns;
		rst<='0';
		x<='1';
		wait for 80 ns;
		rst<='0';
		x<='0';
		wait for 80 ns;
		rst<='1';
		x<='0';
		
      wait for clk_period*5;

      -- insert stimulus here 

      wait;
   end process;

END;
