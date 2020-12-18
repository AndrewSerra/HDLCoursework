--*****************************************************************************
--***************************  VHDL Source Code  ******************************
--*****************************************************************************
--
--  DESIGNER NAME:  Andrew Serra
--
--       LAB NAME:  Final Q3 - Paralell-in Paralell-out 4-bit Shift Register; test bench
--
--      FILE NAME:  pipo_4bit_tb.vhd
--
-------------------------------------------------------------------------------
--
--  DESCRIPTION
--
--    This design will test the Paralell-in Paralell-out shift register. 
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
-------------------------------------------------------------------------------

-- include ieee packages here
LIBRARY ieee;
USE ieee.std_logic_1164.ALL;

-- include your packages here
LIBRARY work;
USE work.pipo_4bit_pkg.ALL;


ENTITY pipo_4bit_tb IS

END ENTITY pipo_4bit_tb;

-------------------------------------------------------------------------------

ARCHITECTURE test OF pipo_4bit_tb IS

  signal clk_tb          : std_logic := '0';
  signal reset_n_tb      : std_logic;
  signal data_in_tb      : std_logic_vector(3 downto 0);
  signal data_out_tb     : std_logic_vector(3 downto 0);
  signal mode_tb         : std_logic_vector(1 downto 0);
  signal inp_left_tb     : std_logic;
  signal inp_right_tb    : std_logic;
  
  
  signal sim_done       : boolean := false;
  constant PERIOD_c     : time   := 20 ns;
  
BEGIN  -- test

    clk_tb <= (NOT clk_tb) AFTER (PERIOD_c / 2) WHEN (NOT sim_done) ELSE '0';
    
    ---------------------------------------------------------------------------
    -- instantiate the unit under test (UUT)
    ---------------------------------------------------------------------------
    UUT : pipo_4bit 
    PORT MAP (
      reset_n   => reset_n_tb,
      clk       => clk_tb,
      data_in   => data_in_tb,
      mode      => mode_tb,
      inp_left  => inp_left_tb,
      inp_right => inp_right_tb,
      data_out  => data_out_tb
    );


    ---------------------------------------------------------------------------
    -- the process will apply the test vectors to the UUT
    ---------------------------------------------------------------------------
    stimulus : PROCESS
    BEGIN  -- PROCESS stimulus
    
      data_in_tb <= (others => '0');
      inp_left_tb <= '0';
      inp_right_tb <= '0';
      mode_tb <= (others => '0');
      wait for PERIOD_c * 2;
      
      reset_n_tb <= '0';            -- Reset system
      wait for PERIOD_c * 2;
      reset_n_tb <= '1';
      wait for PERIOD_c * 2;
      
      data_in_tb <= "0101";
      mode_tb <= "11";              -- Load new value to the registers
      wait for PERIOD_c;
      mode_tb <= "00";
      wait for PERIOD_c * 2;      
      
      inp_left_tb <= '1';
      mode_tb <= "10";       -- Test left shift with new input '1'
      wait for PERIOD_c;
      mode_tb <= "00";
      wait for PERIOD_c * 2;
      
      inp_left_tb <= '0';
      mode_tb <= "10";       -- Test left shift with new input '0'
      wait for PERIOD_c;
      mode_tb <= "00";
      wait for PERIOD_c * 2;
      
      inp_right_tb <= '1';
      mode_tb <= "01";       -- Test right shift with new input '1'
      wait for PERIOD_c;
      mode_tb <= "00";
      wait for PERIOD_c * 2;
      
      inp_right_tb <= '0';
      mode_tb <= "01";       -- Test right shift with new input '0'
      wait for PERIOD_c;
      mode_tb <= "00";
      wait for PERIOD_c * 2;
      
      data_in_tb <= "1111";
      mode_tb <= "00";              -- hold value in the registers
      wait for PERIOD_c;
      mode_tb <= "00";
      wait for PERIOD_c * 2;
      -----------------------------------------------------------------------
      -- stop simulation, wait here forever
      -----------------------------------------------------------------------
      sim_done <= true;
      wait for PERIOD_c * 2;
      wait;
    END PROCESS stimulus;

END ARCHITECTURE test;

-------------------------------------------------------------------------------
