--*****************************************************************************
--***************************  VHDL Source Code  ******************************
--*****************************************************************************
--
--  DESIGNER NAME:  Bruce Link
--
--       LAB NAME:  Lab5: Clock Synchronization
--
--      FILE NAME:  clock_synchronizer.vhd
--
-------------------------------------------------------------------------------
--
--  DESCRIPTION
--    This files contains the code that will take an input as a signal 
--    and a clock reference. The signal will then be registered 2 times 
--    and sent to the output port. This file is helpful in synchronizing 
--    asynchronous inputs (ie: user inputs from switches etc.). A generic
--    is provided to allow buses to be synchronized.
--
--    All variables that end with "_n" are low active.
--
--  REVISION HISTORY
--
--  _______________________________________________________________________
-- |  DATE    | USER | Ver |  Description                                  |
-- |==========+======+=====+================================================
-- |          |      |     |
-- | 03/01/19 | BAL  | 1.0 | Created
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

PACKAGE clock_synchronizer_pkg IS
  COMPONENT clock_synchronizer IS
    PORT (
    clk      : IN  std_logic;
    reset_n  : IN  std_logic;
    async_in : IN  std_logic;
    sync_out : OUT std_logic
    );
  END COMPONENT clock_synchronizer;
  
END PACKAGE clock_synchronizer_pkg;



------------------------------------------------------------------------------
-- |||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||
-- ||||                                                                   ||||
-- ||||                    COMPONENT DESCRIPTION                          ||||
-- ||||                                                                   ||||
-- |||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||
------------------------------------------------------------------------------
LIBRARY ieee;
USE ieee.std_logic_1164.ALL;

ENTITY clock_synchronizer IS
  PORT (
    clk      : IN  std_logic;
    reset_n  : IN  std_logic;
    async_in : IN  std_logic;
    sync_out : OUT std_logic
    );
END clock_synchronizer;

ARCHITECTURE behav OF clock_synchronizer IS


  SIGNAL prev_data_1 : std_logic;
  SIGNAL prev_data_2 : std_logic;

BEGIN

  -----------------------------------------------------------------------------
  -- 
  -----------------------------------------------------------------------------
  double_flop : PROCESS(reset_n, clk)
  BEGIN
    IF (reset_n = '0') THEN
      prev_data_1 <= '0';
      prev_data_2 <= '0';
    ELSIF rising_edge(clk) THEN
      prev_data_1 <= async_in;
      prev_data_2 <= prev_data_1;
    END IF;
  END PROCESS;

  sync_out <= prev_data_2;

END behav;