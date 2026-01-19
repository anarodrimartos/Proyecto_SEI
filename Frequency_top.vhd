----------------------------------------------------------------------------------
-- Company:
-- Engineer:
-- 
-- Create Date: 14.10.2025 19:24:25
-- Design Name:
-- Module Name: Frequency_top - Behavioral
-- Project Name:
-- Target Devices:
-- Tool Versions:
-- Description:
-- 
-- Dependencies:
-- 
-- Revision:
-- Revision 0.01 - File Created
-- Additional Comments:
-- 
----------------------------------------------------------------------------------

library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.NUMERIC_STD.ALL;


entity Frequency_top is

GENERIC (
--Para obtener un reloj de 2 Hz a partir de 125 MHz, se divide 125 MHz entre 2 Hz
-- (125000000 Hz/ 2Hz)= 62500000 Hz
        divisor_reloj_2Hz : INTEGER := 62500000
        --divisor_reloj_2Hz : INTEGER := 10 --He puesto un valor bajo para que en la simulacion se me viesen
                                         --los cambios que quería comprobar con el testbench.
    );

PORT (
        clk_in  : IN  STD_LOGIC;
        reset   : IN  STD_LOGIC;
        clk_out : OUT STD_LOGIC
    );

end Frequency_top;

architecture Behavioral of Frequency_top is
  signal counter : integer range 0 to divisor_reloj_2Hz := 0;
  signal s_clk : std_logic := '0';
begin

  process (clk_in, reset)
  begin
    if reset = '1' then
      counter <= 0;
      s_clk   <= '0';

    elsif rising_edge(clk_in) then
      if counter = divisor_reloj_2Hz - 1 then
        counter <= 0;
        s_clk   <= not s_clk;  -- cambia de estado
      else
        counter <= counter + 1;
      end if;
    end if;
  end process;

  clk_out <= s_clk;

end Behavioral;