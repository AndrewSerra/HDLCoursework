--*****************************************************************************
--***************************  VHDL Source Code  ******************************
--*****************************************************************************
--
--  DESIGNER NAME:  Andrew Serra
--
--       LAB NAME:  Homework 2
--
--      FILE NAME:  and_n.vhd
--
-------------------------------------------------------------------------------
--
--  DESCRIPTION
--
--    This design will produce an AND gate for n inputs. 
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

PACKAGE and_n_pkg IS
    COMPONENT and_n IS
        GENERIC (
	        -- create the signal that has varying size
	    	width : positive := 2
	    );
	
	    PORT (
	        input  : IN std_logic_vector(width-1 DOWNTO 0);
	    	output : OUT std_logic
	    );
	END COMPONENT;
END PACKAGE and_n_pkg;

------------------------------------------------------------------------------
-- |||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||
-- |||| 
-- |||| COMPONENT DESCRIPTION 
-- |||| 
-- |||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||
------------------------------------------------------------------------------

LIBRARY ieee;
USE ieee.STD_LOGIC_1164.ALL;

ENTITY and_n IS
	GENERIC (
	    width : positive := 2
    );
	
	PORT (
	    input  : IN std_logic_vector(width-1 DOWNTO 0);
		output : OUT std_logic
	);
END ENTITY and_n;

ARCHITECTURE behavior OF and_n IS
BEGIN

    and_gate : PROCESS (input)
	    VARIABLE temp : std_logic;
	BEGIN
	    
		temp := '1';
		
		and_loop : FOR i IN 0 TO (width-1) LOOP
		    temp := temp AND input(i);
		END LOOP;
		
		output <= temp;
	END PROCESS and_gate;

END ARCHITECTURE behavior;