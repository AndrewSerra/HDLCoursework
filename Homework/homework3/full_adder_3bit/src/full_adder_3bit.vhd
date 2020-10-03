--*****************************************************************************
--***************************  VHDL Source Code  ******************************
--*****************************************************************************
--
--  DESIGNER NAME:  Andrew Serra
--
--       LAB NAME:  Homework 3 - 3-bit Full Adder
--
--      FILE NAME:  full_adder_3bit.vhd
--
-------------------------------------------------------------------------------
--
--  DESCRIPTION
--
--    This design will implement a 3-bit full adder using
--    a structural architecture. 
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
-- | 09/09/20 | ACS  | 1.0 | Created
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

PACKAGE full_adder_3bit_pkg IS
  COMPONENT full_adder_3bit IS
    PORT (
        a     : IN STD_LOGIC_VECTOR(2 DOWNTO 0);
      b     : IN STD_LOGIC_VECTOR(2 DOWNTO 0);
      cin   : IN STD_LOGIC;
      sum   : OUT STD_LOGIC_VECTOR(2 DOWNTO 0);
      cout  : OUT STD_LOGIC
      );
  END COMPONENT;
END PACKAGE full_adder_3bit_pkg;



------------------------------------------------------------------------------
-- |||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||
-- |||| 
-- |||| COMPONENT DESCRIPTION 
-- |||| 
-- |||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||
------------------------------------------------------------------------------
LIBRARY ieee;
USE ieee.std_logic_1164.ALL;

LIBRARY work;
USE work.full_adder_pkg.ALL;

ENTITY full_adder_3bit IS
    PORT (
        a     : IN STD_LOGIC_VECTOR(2 DOWNTO 0);
      b     : IN STD_LOGIC_VECTOR(2 DOWNTO 0);
      cin   : IN STD_LOGIC;
      sum   : OUT STD_LOGIC_VECTOR(2 DOWNTO 0);
      cout  : OUT STD_LOGIC
    );
END ENTITY full_adder_3bit;

ARCHITECTURE fa_3bit_arch OF full_adder_3bit IS

    SIGNAL carry_s1 : STD_LOGIC;
  SIGNAL carry_s2 : STD_LOGIC;
  
BEGIN

    B0 : full_adder
      PORT MAP (
        a => a(0),
        b => b(0),
        cin => cin,
        sum => sum(0),
        cout => carry_s1
    );
    
  B1 : full_adder
      PORT MAP (
        a => a(1),
        b => b(1),
        cin => carry_s1,
        sum => sum(1),
        cout => carry_s2
    );

    B2 : full_adder
      PORT MAP (
        a => a(2),
        b => b(2),
        cin => carry_s2,
        sum => sum(2),
        cout => cout
    );

END ARCHITECTURE fa_3bit_arch;
