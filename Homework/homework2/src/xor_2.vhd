--*****************************************************************************
--***************************  VHDL Source Code  ******************************
--*****************************************************************************
--
--  DESIGNER NAME:  Andrew Serra
--
--       LAB NAME:  Homework 2
--
--      FILE NAME:  xor_2.vhd
--
-------------------------------------------------------------------------------
--
--  DESCRIPTION
--
--    This design will produce an XOR gate for two inputs. 
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
USE ieee.STD_LOGIC_1164.ALL;

PACKAGE xor_2_pkg IS
    COMPONENT xor_2 IS
	   PORT (
	        inputs : IN std_logic_vector(1 DOWNTO 0);
		    output : OUT std_logic
	    );
	END COMPONENT;
END PACKAGE xor_2_pkg;

------------------------------------------------------------------------------
-- |||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||
-- |||| 
-- |||| COMPONENT DESCRIPTION 
-- |||| 
-- |||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||
------------------------------------------------------------------------------

LIBRARY ieee;
USE ieee.std_logic_1164.ALL;

ENTITY xor_2 IS
    PORT (
		inputs    : IN std_logic_vector(1 DOWNTO 0);
		output    : OUT std_logic
	);
END ENTITY xor_2;

ARCHITECTURE behavior OF xor_2 IS

BEGIN

    output <= inputs(1) XOR inputs(0);

END ARCHITECTURE behavior;