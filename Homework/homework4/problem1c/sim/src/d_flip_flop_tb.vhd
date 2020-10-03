--*****************************************************************************
--***************************  VHDL Source Code  ******************************
--*****************************************************************************
--
--  DESIGNER NAME:  Andrew Serra
--
--       LAB NAME:  Homework 4 - Question 1c; testbench
--
--      FILE NAME:  d_flip_flop_tb.vhd
--
-------------------------------------------------------------------------------
--
--  DESCRIPTION
--
--    This design will <insert detailed description of design>. 
--
--
-------------------------------------------------------------------------------
--
--  REVISION HISTORY
--
--  _______________________________________________________________________
-- |  DATE    | USER | Ver |  Description                                  |
-- |==========+======+=====+================================================
-- |          |      |     |
-- | 09/22/20 | ACS  | 1.0 | Created
-- |          |      |     |
--
--*****************************************************************************
--*****************************************************************************

-- include ieee packages here
LIBRARY ieee;
USE ieee.std_logic_1164.ALL;

-- include your packages here
LIBRARY work;
USE work.d_flip_flop_pkg.ALL;


ENTITY d_flip_flop_tb IS

END ENTITY d_flip_flop_tb;

-------------------------------------------------------------------------------

ARCHITECTURE test OF d_flip_flop_tb IS

  SIGNAL clk_tb     : std_logic := '0';
  SIGNAL data_tb    : std_logic := '0';
  SIGNAL reset_n_tb : std_logic := '1'; 
  SIGNAL que_tb     : std_logic := '0';
  SIGNAL que_n_tb   : std_logic := '1';
  SIGNAL sim_done   : boolean   := false;
  
  CONSTANT PERIOD_C : time := 20 ns;  
 
BEGIN  -- test

    clk_tb <= NOT clk_tb AFTER (PERIOD_C / 2) WHEN (NOT sim_done) ELSE '0';
    
    ---------------------------------------------------------------------------
    -- instantiate the unit under test (UUT)
    ---------------------------------------------------------------------------
    UUT : d_flip_flop 
    PORT MAP (
      data => data_tb,
      clk => clk_tb,
      reset_n => reset_n_tb,
      que => que_tb,
      que_n => que_n_tb
    );
    
    ---------------------------------------------------------------------------
    -- the process will apply the test vectors to the UUT
    ---------------------------------------------------------------------------
    stimulus : PROCESS
    BEGIN  -- PROCESS stimulus
    
      REPORT "Starting simulation...";
    
      reset_n_tb <= '1';
      data_tb <= '0';
      WAIT FOR PERIOD_C;
      
      -- falling edge trigger
      WAIT UNTIL (clk_tb'event AND clk_tb = '0');
      WAIT FOR 2 ns;
      
      WAIT FOR PERIOD_C;
      
      -- Check que_tb for data = '0'
      ASSERT (data_tb = que_tb)
        REPORT "Failed simulation: Q expected to be 0, received 1"
        SEVERITY failure;
       
      -- Check que_n_tb for data = '0'
      ASSERT (que_n_tb = NOT data_tb)
        REPORT "Failed simulation: Q_n expected to be 1, received 0"
        SEVERITY failure;
        
      -- Wait to get to middle of period
      WAIT FOR PERIOD_C * 3 / 2;
      reset_n_tb <= '0';
      WAIT FOR PERIOD_C / 2;
      
       -- Check que_tb for reset
      ASSERT (que_tb = '0')
        REPORT "Failed simulation: Q expected to be 0, received 1"
        SEVERITY failure;
       
      -- Check que_n_tb for reset
      ASSERT (que_n_tb = '1')
        REPORT "Failed simulation: Q_n expected to be 1, received 0"
        SEVERITY failure;
      
      reset_n_tb <= '1';
      data_tb <= '1';
      WAIT FOR PERIOD_C;
      
      -- falling edge trigger
      WAIT UNTIL (clk_tb'event AND clk_tb = '0');
      WAIT FOR 2 ns;
      
      WAIT FOR PERIOD_C;
      
      -- Check que_tb for data = '1'
      ASSERT (data_tb = que_tb)
        REPORT "Failed simulation: Q expected to be 1, received 0"
        SEVERITY failure;
       
      -- Check que_n_tb for data = '1'
      ASSERT (que_n_tb = NOT data_tb)
        REPORT "Failed simulation: Q_n expected to be 0, received 1"
        SEVERITY failure;
        
      -- Wait to get to middle of period
      WAIT FOR PERIOD_C * 3 / 2;
      reset_n_tb <= '0';
      WAIT FOR 2 ns;
      
       -- Check que_tb for reset
      ASSERT (que_tb = '0')
        REPORT "Failed simulation: Q expected to be 0, received 1"
        SEVERITY warning;
       
      -- Check que_n_tb for reset
      ASSERT (que_n_tb = '1')
        REPORT "Failed simulation: Q_n expected to be 1, received 0"
        SEVERITY warning;
        
      WAIT FOR 2 * PERIOD_C;
      sim_done <= true;
      WAIT FOR  PERIOD_C;
      
      REPORT "Simulation completed successfully...";
      -----------------------------------------------------------------------
      -- stop simulation, wait here forever
      -----------------------------------------------------------------------
      wait;
    END PROCESS stimulus;

END ARCHITECTURE test;

-------------------------------------------------------------------------------
