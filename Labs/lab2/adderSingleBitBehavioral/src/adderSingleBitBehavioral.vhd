--*****************************************************************************
--***************************  VHDL Source Code  ******************************
--*****************************************************************************
--
--  DESIGNER NAME:  Andrew Serra
--
--       LAB NAME:  Lab 2 - Full Adder
--
--      FILE NAME:  adderSingleBitBehavioral.vhd
--
-------------------------------------------------------------------------------
--
--  DESCRIPTION
--
--    This design will implement a full adder using
--    a behavioral architecture. 
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
-- | 09/03/20 | ACS  | 1.0 | Created
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

PACKAGE adderSingleBitBehavioral_pkg IS
  COMPONENT adderSingleBitBehavioral IS
    PORT (
      a     : IN STD_LOGIC;
    b     : IN STD_LOGIC;
    cin   : IN STD_LOGIC;
    sum   : OUT STD_LOGIC;
    cout  : OUT STD_LOGIC
      );
  END COMPONENT;
END PACKAGE adderSingleBitBehavioral_pkg;



------------------------------------------------------------------------------
-- |||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||
-- |||| 
-- |||| COMPONENT DESCRIPTION 
-- |||| 
-- |||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||
------------------------------------------------------------------------------
LIBRARY ieee;
USE ieee.std_logic_1164.ALL;

ENTITY adderSingleBitBehavioral IS
  PORT (
      a     : IN STD_LOGIC;
    b     : IN STD_LOGIC;
    cin   : IN STD_LOGIC;
    sum   : OUT STD_LOGIC;
    cout  : OUT STD_LOGIC
    );
END ENTITY adderSingleBitBehavioral;

ARCHITECTURE behave OF adderSingleBitBehavioral IS

SIGNAL xor_s1_out : STD_LOGIC;
SIGNAL and_s1_out : STD_LOGIC;
SIGNAL and_s2_out : STD_LOGIC;  

BEGIN

    -- Stage 1 gates
    xor_s1_out <= a XOR b;
  and_s1_out <= a AND b;
  
  -- Stage 2 gates
  sum <= xor_s1_out XOR cin;
  and_s2_out <= xor_s1_out AND cin;
  
  -- Final stage cout operation
  cout <= and_s2_out OR and_s1_out;

END ARCHITECTURE behave;
