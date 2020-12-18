--*****************************************************************************
--***************************  VHDL Source Code  ******************************
--*****************************************************************************
--
--  DESIGNER NAME:  Andrew Serra
--
--       LAB NAME:  Final Q4 - Bit Sequence Detector; test bench
--
--      FILE NAME:  bit_sequence_detector_tb.vhd
--
-------------------------------------------------------------------------------
--
--  DESCRIPTION
--
--    This design will test the Bit sequence detector state machine that 
--    looks for the pattern "010".
--
-------------------------------------------------------------------------------
--
--  REVISION HISTORY
--
--  _______________________________________________________________________
-- |  DATE    | USER | Ver |  Description                                  |
-- |==========+======+=====+================================================
-- |          |      |     |
-- | 12/04/20 | ACS  | 1.0 | Created
-- |          |      |     |
--
--*****************************************************************************
--*****************************************************************************
-------------------------------------------------------------------------------

-- include ieee packages here
LIBRARY ieee;
USE ieee.std_logic_1164.ALL;

-- include your packages here
LIBRARY work;
USE work.bit_sequence_detector_pkg.ALL;


ENTITY bit_sequence_detector_tb IS

END ENTITY bit_sequence_detector_tb;

-------------------------------------------------------------------------------

ARCHITECTURE test OF bit_sequence_detector_tb IS

  signal reset_n_tb     : std_logic;
  signal clk_tb         : std_logic := '0';
  signal serial_bit_tb  : std_logic;
  signal output_tb      : std_logic;
  
  signal sim_done       : boolean := false;
  constant PERIOD_c     : time   := 20 ns;
  
  type test_vect_t is array(0 to 7) of std_logic_vector(2 downto 0); 
 
  -- All test cases have to fail
  -- except for the last one.
  constant TEST_CASES_c : test_vect_t := (
    "000",
    "111",
    "011",
    "100",
    "110",
    "001",
    "101",
    "010"
  );
  
BEGIN  -- test

    clk_tb <= (NOT clk_tb) AFTER (PERIOD_c / 2) WHEN (NOT sim_done) ELSE '0';
    
    ---------------------------------------------------------------------------
    -- instantiate the unit under test (UUT)
    ---------------------------------------------------------------------------
    UUT : bit_sequence_detector
    PORT MAP (
      reset_n => reset_n_tb,
      clk => clk_tb,
      serial_bit => serial_bit_tb,
      pattern_found => output_tb  
    );


    ---------------------------------------------------------------------------
    -- the process will apply the test vectors to the UUT
    ---------------------------------------------------------------------------
    stimulus : PROCESS
      VARIABLE serial_signal_v : std_logic_vector(0 to 2);
    BEGIN  -- PROCESS stimulus

      -- Assign signals
      serial_bit_tb <= '0';

      -- Reset the system before testing
      reset_n_tb <= '0';
      WAIT FOR PERIOD_c * 2;
      reset_n_tb <= '1';
      
      -- Check if reset works
      ASSERT (output_tb = '0')
        REPORT "Reset is not working"
        SEVERITY failure;
      
      test_case_iter : for test_case in 0 to (TEST_CASES_c'length-1) loop
        REPORT "Test case " & integer'image(test_case) & " starting.";
        
        serial_signal_v := TEST_CASES_c(test_case);
        
        -- Assign serial bit one at a time
        ser_bit_iter : FOR s_bit IN 0 TO (serial_signal_v'length-1) LOOP
          -- Assign individual bit
          serial_bit_tb <= serial_signal_v(s_bit);
          
          if(test_case = (TEST_CASES_c'length-1) and s_bit = (serial_signal_v'length-1)) then
            assert(output_tb = '1')
              report "Error in test case #" & integer'image(test_case)
              severity warning;
          elsif(s_bit = (serial_signal_v'length-1)) then
            assert(output_tb = '0')
              report "Error in test case #" & integer'image(test_case)
              severity warning;
          end if;
          
          WAIT FOR PERIOD_c;
        END LOOP ser_bit_iter;
        
      end loop test_case_iter;
      
      -----------------------------------------------------------------------
      -- stop simulation, wait here forever
      -----------------------------------------------------------------------
      sim_done <= true;
      wait for PERIOD_c * 2;
      wait;
    END PROCESS stimulus;

END ARCHITECTURE test;

-------------------------------------------------------------------------------
