----------------------------------------------------------------------------------
-- Company:
-- Engineer:
-- 
-- Create Date: 14.10.2025 19:24:25
-- Design Name:
-- Module Name: Counter_10b - Behavioral
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

entity Counter_10b is
        port(
        clk                  : in  std_logic;
        reset                : in  std_logic;
        stop_contador        : in  std_logic;
        count                : out std_logic_vector(3 downto 0)
    );
end Counter_10b;

architecture Behavioral of Counter_10b is
    signal s_count : natural range 0 to 9 := 0;
    
    
    attribute mark_debug : string;
    attribute mark_debug of s_count: signal is "true";

begin

    process(clk, reset)
    begin
    if reset = '1' then
        s_count <= 0;  
    elsif rising_edge(clk) then
        if stop_contador = '1' then
            if s_count = 9 then
                s_count <= 0;  
            else
                s_count <= s_count + 1;
             end if;
        else
            s_count <= s_count;
         end if;
    end if;
    end process;
   
count <= std_logic_vector(to_unsigned(s_count, 4));

end Behavioral;