--*****************************************************************************
--***************************  VHDL Source Code  ******************************
--*****************************************************************************
--
--  DESIGNER NAME:  Andrew Serra
--
--       LAB NAME:  Final - Q3 - Paralell-in Paralell-out 4-bit Shift Register
--
--      FILE NAME:  pipo_4bit.vhd
--
-------------------------------------------------------------------------------
--
--  DESCRIPTION
--
--    This design will implements a 4-bit paralell-in paralell-out shift register.
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

PACKAGE pipo_4bit_pkg IS
  COMPONENT pipo_4bit IS
    PORT (
      reset_n   : in std_logic;
      clk       : in std_logic;
      data_in   : in std_logic_vector(3 downto 0);
      mode      : in std_logic_vector(1 downto 0);
      inp_left  : in std_logic;
      inp_right : in std_logic;
      data_out  : out std_logic_vector(3 downto 0)
    );
  END COMPONENT;
END PACKAGE pipo_4bit_pkg;



------------------------------------------------------------------------------
-- |||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||
-- |||| 
-- |||| COMPONENT DESCRIPTION 
-- |||| 
-- |||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||
------------------------------------------------------------------------------
LIBRARY ieee;
USE ieee.std_logic_1164.ALL;

library work;
use work.dff_shift_pkg.ALL;

ENTITY pipo_4bit IS
  PORT (
      reset_n   : in std_logic;
      clk       : in std_logic;
      data_in   : in std_logic_vector(3 downto 0);
      mode      : in std_logic_vector(1 downto 0);
      inp_left  : in std_logic;
      inp_right : in std_logic;
      data_out  : out std_logic_vector(3 downto 0)
    );
END ENTITY pipo_4bit;

ARCHITECTURE behave OF pipo_4bit IS

  signal data   : std_logic_vector(3 downto 0);
  signal q      : std_logic_vector(3 downto 0);
 
BEGIN

  data_decision : process(clk, reset_n)
  begin
    if(reset_n = '0') then
      data <= (others => '0');
    elsif(falling_edge(clk)) then
      case(mode) is 
        when "00" =>
          data <= data;
        when "01" =>
          data <= inp_right & data(3 downto 1);
        when "10" =>
          data <= data(2 downto 0) & inp_left;
        when "11" =>
          data <= data_in;
        when others => 
          data <= data;
      end case;
    end if;
  end process data_decision;
    
  REG0: dff_shift
    port map (
      reset_n => reset_n,
      clk => clk,
      input => data(0),
      output => q(0)
    );
    
  REG1: dff_shift
    port map (
      reset_n => reset_n,
      clk => clk,
      input => data(1),
      output => q(1)
    );
  
  REG2: dff_shift
    port map (
      reset_n => reset_n,
      clk => clk,
      input => data(2),
      output => q(2)
    );
  
  REG3: dff_shift
    port map (
      reset_n => reset_n,
      clk => clk,
      input => data(3),
      output => q(3)
    );
  
  data_out <= q;
  
END ARCHITECTURE behave;
