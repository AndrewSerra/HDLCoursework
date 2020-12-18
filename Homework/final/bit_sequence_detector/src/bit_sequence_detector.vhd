--*****************************************************************************
--***************************  VHDL Source Code  ******************************
--*****************************************************************************
--
--  DESIGNER NAME:  Andrew Serra
--
--       LAB NAME:  Final - Q4 - Bit Sequence Detector
--
--      FILE NAME:  bit_sequence_detector.vhd
--
-------------------------------------------------------------------------------
--
--  DESCRIPTION
--
--    This design will look for the sequence "010" that can have overlapping. 
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
-- | 12/04/20 | ACS  | 1.0 | Created
-- |          |      |     |
--
--*****************************************************************************
--*****************************************************************************

------------------------------------------------------------------------------
-- |||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||
-- ||||                                                                   ||||
-- ||||                    COMPONENT PACKAGE                              ||||
-- ||||                                                                   ||||
-- |||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||
------------------------------------------------------------------------------
LIBRARY ieee;
USE ieee.std_logic_1164.ALL;

PACKAGE bit_sequence_detector_pkg IS
  COMPONENT bit_sequence_detector IS
    PORT (
      reset_n        : IN std_logic;
      clk            : IN std_logic;
      serial_bit     : IN std_logic;
      --
      pattern_found  : OUT std_logic
    );
  END COMPONENT;  
END PACKAGE bit_sequence_detector_pkg;



------------------------------------------------------------------------------
-- |||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||
-- |||| 
-- |||| COMPONENT DESCRIPTION 
-- |||| 
-- |||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||
------------------------------------------------------------------------------
LIBRARY ieee;
USE ieee.std_logic_1164.ALL;

library work;
use work.clock_synchronizer_pkg.ALL;

ENTITY bit_sequence_detector IS
  PORT (
    reset_n        : IN std_logic;
    clk            : IN std_logic;
    serial_bit     : IN std_logic;
    --
    pattern_found  : OUT std_logic
  );
END ENTITY bit_sequence_detector;

ARCHITECTURE behave OF bit_sequence_detector IS

  TYPE sm_states_t IS (IDLE_BIT_1, BIT_2, BIT_3);
  
  SIGNAL curr_state : sm_states_t;
  SIGNAL next_state : sm_states_t;
  
  SIGNAL bit_sync   : std_logic;
  
  CONSTANT PATTERN_TO_FOLLOW_c : std_logic_vector(0 to 2) := "010";
  
BEGIN

  sync : clock_synchronizer
    PORT MAP (
      clk => clk,
      reset_n => reset_n,
      async_in => serial_bit,
      sync_out => bit_sync
    );

  state_update : PROCESS(reset_n, clk) IS
  BEGIN
    IF(reset_n = '0') THEN
      curr_state <= IDLE_BIT_1;
    ELSIF(rising_edge(clk)) THEN
      curr_state <= next_state;
    END IF;
  END PROCESS state_update;
  
  main : PROCESS(bit_sync, curr_state) IS
  BEGIN
    CASE(curr_state) IS
      WHEN IDLE_BIT_1 =>
        -- Output the 0 because sequence not complete
        pattern_found <= '0';
      
        -- Check the bit with respective state
        IF(bit_sync = PATTERN_TO_FOLLOW_c(0)) THEN
          next_state <= BIT_2;
        ELSE
          next_state <= IDLE_BIT_1;
        END IF;
      WHEN BIT_2 =>
        -- Output the 0 because sequence not complete
        pattern_found <= '0';
      
        -- Check the bit with respective state
        IF(bit_sync = PATTERN_TO_FOLLOW_c(1)) THEN
          next_state <= BIT_3;
        ELSE
          next_state <= IDLE_BIT_1;
        END IF;
      WHEN BIT_3 =>
        IF(bit_sync = PATTERN_TO_FOLLOW_c(2)) THEN
          -- Output the 1 because sequence complete and serial bit correct
          pattern_found <= '1';
        ELSE 
          -- Serial bit not valid 
          pattern_found <= '0';
        END IF;
        next_state <= IDLE_BIT_1;
    END CASE;
  END PROCESS main;

END ARCHITECTURE behave;
