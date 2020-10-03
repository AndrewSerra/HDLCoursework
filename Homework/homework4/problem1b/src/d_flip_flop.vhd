--*****************************************************************************
--***************************  VHDL Source Code  ******************************
--*****************************************************************************
--
--  DESIGNER NAME:  Andrew Serra
--
--       LAB NAME:  Homework 4 - Question 1b
--
--      FILE NAME:  d_flip_flop.vhd
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

------------------------------------------------------------------------------
-- |||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||
-- ||||                                                                   ||||
-- ||||                    COMPONENT PACKAGE                              ||||
-- ||||                                                                   ||||
-- |||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||
------------------------------------------------------------------------------
LIBRARY ieee;
USE ieee.std_logic_1164.ALL;

PACKAGE d_flip_flop_pkg IS
  COMPONENT d_flip_flop IS    -- REPLACE <filename> with the name of this file
    PORT (
      clk     : IN std_logic;
      data    : IN std_logic;
      que     : OUT std_logic;
      que_n   : OUT std_logic
    );
  END COMPONENT;
END PACKAGE d_flip_flop_pkg;



------------------------------------------------------------------------------
-- |||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||
-- |||| 
-- |||| COMPONENT DESCRIPTION 
-- |||| 
-- |||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||
------------------------------------------------------------------------------
LIBRARY ieee;
USE ieee.std_logic_1164.ALL;

ENTITY d_flip_flop IS
  PORT (
      clk     : IN std_logic;
      data    : IN std_logic;
      que     : OUT std_logic;
      que_n   : OUT std_logic
    );
END ENTITY d_flip_flop;

ARCHITECTURE behave OF d_flip_flop IS

BEGIN

    dff: PROCESS(clk)
    BEGIN
      IF(falling_edge(clk)) THEN
        que <= data;
        que_n <= NOT data;
      END IF; 
    END PROCESS dff;

END ARCHITECTURE behave;
