--------------------------------------------------------------------------------
-- Company: 
-- Engineer:
--
-- Create Date:   18:24:21 08/09/2020
-- Design Name:   
-- Module Name:   C:/Users/orhan/Desktop/clock_divider/homework14d/test.vhd
-- Project Name:  homework14d
-- Target Device:  
-- Tool versions:  
-- Description:   
-- 
-- VHDL Test Bench Created by ISE for module: homework14d
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
 
ENTITY test IS
END test;
 
ARCHITECTURE behavior OF test IS 
 
    -- Component Declaration for the Unit Under Test (UUT)
 
    COMPONENT homework14d
    PORT(
         clock : IN  std_logic;
         reset : IN  std_logic;
         slck : IN  std_logic;
         button : IN  std_logic;
         sw : IN  std_logic;
         output : OUT  std_logic_vector(3 downto 0)
        );
    END COMPONENT;
    

   --Inputs
   signal clock : std_logic := '0';
   signal reset : std_logic := '0';
   signal slck : std_logic := '0';
   signal button : std_logic := '0';
   signal sw : std_logic := '0';

 	--Outputs
   signal output : std_logic_vector(3 downto 0);

   -- Clock period definitions
   constant clock_period : time := 10 ns;
 
BEGIN
 
	-- Instantiate the Unit Under Test (UUT)
   uut: homework14d PORT MAP (
          clock => clock,
          reset => reset,
          slck => slck,
          button => button,
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
      reset<='1';
      wait for 10 ns;
		reset<='0';
		slck <= '1';
		sw <= '1';
		button<='0';
		wait for 40 ms;
		reset<='0';
		slck <= '1';
		sw <= '1';
		button<='1';
		wait for 30 ms;
		reset<='0';
		slck <= '1';
		sw <= '1';
		button<='0';
		wait for 20 ms;
		reset<='0';
		slck <= '1';
		sw <= '1';
		button<='1';
		wait for 30 ms;
		reset<='0';
		slck <= '1';
		sw <= '1';
		button<='0';
		wait for 30 ms;
		reset<='0';
		slck <= '1';
		sw <= '0';
		button<='0';
		wait for 50 ms;
		reset<='0';
		slck <= '1';
		sw <= '0';
		button<='1';
		wait for 30 ms;
		reset<='0';
		slck <= '1';
		sw <= '0';
		button<='0';
		wait for 40 ms;
		reset<='0';
		slck <= '1';
		sw <= '0';
		button<='1';
		wait for 40 ms;
		reset<='0';
		slck <= '1';
		sw <= '0';
		button<='0';
		wait for 60 ms;
		reset<='0';
		slck <= '1';
		sw <= '0';
		button<='1';
		wait for 300 ms;
		reset<='0';
		slck <= '1';
		sw <= '0';
		button<='0';
		wait for 160 ms;
		reset<='0';
		slck <= '1';
		sw <= '0';
		button<='1';
		wait for 200 ms;
		reset<='0';
		slck <= '1';
		sw <= '0';
		button<='0';
		wait for 300 ms;	

      wait for clock_period*10;

      -- insert stimulus here 

      wait;
   end process;

END;
