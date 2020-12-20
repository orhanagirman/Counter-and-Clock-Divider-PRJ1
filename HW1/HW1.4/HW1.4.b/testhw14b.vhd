--------------------------------------------------------------------------------
-- Company: 
-- Engineer:
--
-- Create Date:   15:53:13 08/05/2020
-- Design Name:   
-- Module Name:   C:/Users/TUTEL-50/Desktop/HW/homework14b/testhw14b.vhd
-- Project Name:  homework14b
-- Target Device:  
-- Tool versions:  
-- Description:   
-- 
-- VHDL Test Bench Created by ISE for module: homework14b
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
 
ENTITY testhw14b IS
END testhw14b;
 
ARCHITECTURE behavior OF testhw14b IS 
 
    -- Component Declaration for the Unit Under Test (UUT)
 
    COMPONENT homework14b
    PORT(
         clock : IN  std_logic;
         reset : IN  std_logic;
         en : IN  std_logic;
         slck : IN  std_logic;
         sw : IN  std_logic;
         output : OUT  std_logic_vector(3 downto 0)
        );
    END COMPONENT;
    

   --Inputs
   signal clock : std_logic := '0';
   signal reset : std_logic := '0';
   signal en : std_logic := '0';
   signal slck : std_logic := '0';
   signal sw : std_logic := '0';

 	--Outputs
   signal output : std_logic_vector(3 downto 0);

   -- Clock period definitions
   constant clock_period : time := 10 ns;
 
BEGIN
 
	-- Instantiate the Unit Under Test (UUT)
   uut: homework14b PORT MAP (
          clock => clock,
          reset => reset,
          en => en,
          slck => slck,
          sw => sw,
          output => output
        );

   -- Clock process definitions
   clock_process :process
   begin
		clock <= '0';
		wait for clock_period/2;
		clock <= '1';
		wait for clock_period/2;
   end process;
 

   -- Stimulus process
   stim_proc: process
   begin		
      -- hold reset state for 100 ns.
		reset <= '1';
      wait for 1 ns;
		reset <= '0';
		slck <= '1';
		en <= '1';
		sw <= '1';
      wait for 125000000 ns;
		reset <= '0';
		slck <= '1';
		en <= '1';
		sw <= '0';
		
      wait for clock_period*10;

      -- insert stimulus here 

      wait;
   end process;

END;
