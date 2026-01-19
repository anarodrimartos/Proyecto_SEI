----------------------------------------------------------------------------------
-- Company:
-- Engineer:
-- 
-- Create Date: 14.10.2025 19:24:25
-- Design Name:
-- Module Name: Counter_top - Behavioral
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

entity Counter_top is
    generic(
        G_DIVISOR_2HZ : integer := 62500000
        --G_DIVISOR_2HZ : integer := 10
    );
    port(
        clk_125MHz      : in  std_logic;
        boton_reset     : in  std_logic;
        contador_enable : in  std_logic;
        leds            : out std_logic_vector(3 downto 0)
    );
end Counter_top;

architecture Behavioral of Counter_top is
    signal clk_2Hz : std_logic;
    signal s_boton_reset : std_logic;
    signal s_contador_enable : std_logic;
    
    attribute mark_debug : string;
    attribute mark_debug of clk_2Hz: signal is "true";
    attribute mark_debug of s_boton_reset : signal is "true";
    attribute mark_debug of s_contador_enable: signal is "true";
    
 begin

s_boton_reset <= boton_reset;
s_contador_enable <= contador_enable;
    
    Frequency_top_inst: entity work.Frequency_top
        generic map( divisor_reloj_2Hz => G_DIVISOR_2HZ )
        port map(
            clk_in  => clk_125MHz,
            reset   => boton_reset,
            clk_out => clk_2Hz
        );

    Counter_10b_inst: entity work.Counter_10b
        port map(
            clk           => clk_2Hz,
            reset         => boton_reset,
            stop_contador => contador_enable,
            count         => leds
        );
end Behavioral;