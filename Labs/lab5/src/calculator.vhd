--*****************************************************************************
--***************************  VHDL Source Code  ******************************
--*****************************************************************************
--
--  DESIGNER NAME:  Andrew Serra
--
--       LAB NAME:  Lab 5 - 3-Bit Hardware Add and Subtract
--
--      FILE NAME:  calculator.vhd
--
-------------------------------------------------------------------------------
--
--  DESCRIPTION
--
--    This design will implement a structural architecture to create a
--    calculator module.
--
-------------------------------------------------------------------------------
--
--  REVISION HISTORY
--
--  _______________________________________________________________________
-- |  DATE    | USER | Ver |  Description                                  |
-- |==========+======+=====+================================================
-- |          |      |     |
-- | 10/02/20 | ACS  | 1.0 | Created
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

PACKAGE calculator_pkg IS
  COMPONENT calculator IS
    PORT (
      reset     : IN std_logic;
      CLOCK_50  : IN std_logic;
      SW        : IN  std_logic_vector(9 downto 0);
      KEY       : IN  std_logic_vector(3 downto 0);
      --
      HEX0      : OUT std_logic_vector(6 downto 0);
      HEX1      : OUT std_logic_vector(6 downto 0);
      HEX2      : OUT std_logic_vector(6 downto 0)
    );
  END COMPONENT;
END PACKAGE calculator_pkg;



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
USE work.add_sub_pkg.ALL;
USE work.seven_seg_pkg.ALL;

ENTITY calculator IS
  PORT (
    reset     : IN std_logic;
    CLOCK_50  : IN std_logic;
    SW        : IN  std_logic_vector(9 downto 0);
    KEY       : IN  std_logic_vector(3 downto 0);
    --
    HEX0      : OUT std_logic_vector(6 downto 0);
    HEX1      : OUT std_logic_vector(6 downto 0);
    HEX2      : OUT std_logic_vector(6 downto 0)
  );
END ENTITY calculator;

ARCHITECTURE structural OF calculator IS

  SIGNAL op_code      : std_logic_vector(1 downto 0);
  SIGNAL op_enabled   : std_logic;
  SIGNAL disp_result  : std_logic;
  SIGNAL result       : std_logic_vector(3 downto 0);
  
  SIGNAL inp_a_bcd    : std_logic_vector(3 downto 0);
  SIGNAL inp_b_bcd    : std_logic_vector(3 downto 0);
  
BEGIN
  
  -- assign the keys to for the operation code
  -- KEY 0 - subtract
  -- KEY 1 - add
  op_code <= KEY(1) & KEY(0);
  
  -- Check if clock is rising edge
  -- and the operation enabled
  -- disp_result <= '1' WHEN (op_enabled = '1' AND rising_edge(CLOCK_50)) ELSE '0';
  
  -- Complete switch inputs to 4-bits
  inp_a_bcd <= '0' & SW(5 downto 3);
  inp_b_bcd <= '0' & SW(2 downto 0);

  add_sub_module : add_sub
    PORT MAP (
      op_code => op_code,
      inp_a => SW(5 downto 3),
      inp_b => SW(2 downto 0),
      --
      op_enabled => op_enabled,
      result => result
    );
  
  -- Connected to switches 3, 4, and 5
  -- displays the value of input a
  inp_a_disp : seven_seg
    PORT MAP (
      enable => '1',
      bcd => inp_a_bcd,
      seven_seg_out => HEX2
    );
  
  -- Connected to switches 0, 1, and 2
  -- displays the value of input b
  inp_b_disp : seven_seg
    PORT MAP (
      enable => '1',
      bcd => inp_b_bcd,
      seven_seg_out => HEX1
    );
  
  -- Display of the result
  -- changes only when one of the operation buttons are active
  result_disp : seven_seg
    PORT MAP (
      enable => op_enabled,
      bcd => result,
      seven_seg_out => HEX0
    );
  
END ARCHITECTURE structural;
