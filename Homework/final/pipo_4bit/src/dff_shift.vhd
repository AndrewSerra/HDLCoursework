--*****************************************************************************
--***************************  VHDL Source Code  ******************************
--*****************************************************************************
--
--  DESIGNER NAME:  Andrew Serra
--
--       LAB NAME:  Final - Question 3 - Paralell-in Paralell-out 4-bit Shift Register
--
--      FILE NAME:  dff_shift.vhd
--
-------------------------------------------------------------------------------
--
--  DESCRIPTION
--
--    This design will implement one register of a shift register.
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
-- | 12/03/20 | ACS  | 1.0 | Created
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

PACKAGE dff_shift_pkg IS
  COMPONENT dff_shift IS
    PORT (
    reset_n  : in std_logic;
    clk      : in std_logic;
    input    : in std_logic;
    output   : out std_logic
  );
  END COMPONENT;
END PACKAGE dff_shift_pkg;



------------------------------------------------------------------------------
-- |||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||
-- |||| 
-- |||| COMPONENT DESCRIPTION 
-- |||| 
-- |||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||
------------------------------------------------------------------------------
LIBRARY ieee;
USE ieee.std_logic_1164.ALL;

ENTITY dff_shift IS
  PORT (
    reset_n  : in std_logic;
    clk      : in std_logic;
    input    : in std_logic;
    output   : out std_logic
  );
END ENTITY dff_shift;

ARCHITECTURE behave OF dff_shift IS
  
BEGIN
  
  process(clk, reset_n)
  begin
    if(reset_n = '0') then
      output <= '0';
    elsif(falling_edge(clk)) then
      output <= input;
    end if;
  end process;

END ARCHITECTURE behave;
