--*****************************************************************************
--***************************  VHDL Source Code  ******************************
--*****************************************************************************
--
--  DESIGNER NAME:  Andrew Serra
--
--       LAB NAME:  Homework 2
--
--      FILE NAME:  nand_8.vhd
--
-------------------------------------------------------------------------------
--
--  DESCRIPTION
--
--    This design will produce an NAND gate for eight inputs. 
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

PACKAGE or_2_pkg IS
    COMPONENT or_2 IS
	    PORT (
	        inputs : IN std_logic_vector(1 DOWNTO 0);
		    output : OUT std_logic
	    );
	END COMPONENT:
END PACKAGE or_2_pkg;

------------------------------------------------------------------------------
-- |||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||
-- |||| 
-- |||| COMPONENT DESCRIPTION 
-- |||| 
-- |||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||
------------------------------------------------------------------------------

LIBRARY ieee;
USE ieee.std_logic_1164.ALL;

ENTITY or_2 IS
    PORT (
		inputs    : IN std_logic_vector(1 DOWNTO 0);
		output    : OUT std_logic
	);
END ENTITY or_2;

ARCHITECTURE behavior OF or_2 IS

BEGIN

    output <= '0' WHEN inputs = "00" ELSE '1';

END ARCHITECTURE behavior;