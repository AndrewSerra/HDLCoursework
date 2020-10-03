--*****************************************************************************
--***************************  VHDL Source Code  ******************************
--*****************************************************************************
--
--  DESIGNER NAME:  Andrew Serra
--
--       LAB NAME:  Lab 5 - 3-Bit Hardware Add and Subtract
--
--      FILE NAME:  add_sub.vhd
--
-------------------------------------------------------------------------------
--
--  DESCRIPTION
--
--    This design will choose between the add or subtract operation 
--    according to an input signal. After receiving two 3-bit inputs
--    the operation will be applied and returned in 4-bits.
--
-------------------------------------------------------------------------------
--
--  REVISION HISTORY
--
--  _______________________________________________________________________
-- |  DATE    | USER | Ver |  Description                                  |
-- |==========+======+=====+================================================
-- |          |      |     |
-- | 10/01/20 | ACS  | 1.0 | Created
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

PACKAGE add_sub_pkg IS
  COMPONENT add_sub IS
    GENERIC (
      inp_width : integer  := 3
    );

    PORT (
      op_code     : IN  std_logic_vector(1 downto 0);           -- 2 bits due to states of both pressed/released keys
      inp_a       : IN  std_logic_vector(inp_width-1 downto 0);
      inp_b       : IN  std_logic_vector(inp_width-1 downto 0);
      --
      op_enabled  : OUT std_logic;                              -- used to show if the given op_code is valid
      result      : OUT std_logic_vector(inp_width downto 0)    -- not inp_width-1 to have padding for result
    );
  END COMPONENT;
END PACKAGE add_sub_pkg;



------------------------------------------------------------------------------
-- |||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||
-- |||| 
-- |||| COMPONENT DESCRIPTION 
-- |||| 
-- |||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||
------------------------------------------------------------------------------
LIBRARY ieee;
USE ieee.std_logic_1164.ALL;
USE ieee.numeric_std.ALL;

ENTITY add_sub IS
  GENERIC (
    inp_width : integer  := 3
  );
  
  PORT (
    op_code     : IN  std_logic_vector(1 downto 0);           -- 2 bits due to states of both pressed/released keys
    inp_a       : IN  std_logic_vector(inp_width-1 downto 0);
    inp_b       : IN  std_logic_vector(inp_width-1 downto 0);
    --
    op_enabled  : OUT std_logic;                              -- used to show if the given op_code is valid
    result      : OUT std_logic_vector(inp_width downto 0)    -- not inp_width-1 to have padding for result
  );
END ENTITY add_sub;

ARCHITECTURE behave OF add_sub IS

BEGIN

  PROCESS(op_code, inp_a, inp_b) IS
  BEGIN
    -- The MSB of op_code is addition
    IF(op_code = "10") THEN
      op_enabled <= '1';
      result <= std_logic_vector(unsigned('0' & inp_a) + unsigned('0' & inp_b));
    -- The MSB of op_code is subtraction
    ELSIF(op_code = "01") THEN
      op_enabled <= '1';
      result <= std_logic_vector(unsigned('0' & inp_a) - unsigned('0' & inp_b));
    -- op_code "00" and "11" are for both pressed/released conditions
    ELSE
      op_enabled <= '0';
      result <= (others => '0');
    END IF;
  END PROCESS;

END ARCHITECTURE behave;
