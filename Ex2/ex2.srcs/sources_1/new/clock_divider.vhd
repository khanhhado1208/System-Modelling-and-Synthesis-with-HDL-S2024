----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 10/02/2024 02:38:35 PM
-- Design Name: 
-- Module Name: clock_divider - Behavioral
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

entity Clock_Divider is
    port ( clk : in std_logic;
           reset : in std_logic;
           clock_out : out std_logic);
end Clock_Divider;

architecture bhv of Clock_Divider is
    -- frequency 100 MHz divide to 1 Hz
    signal count: integer := 0;
    signal tmp : std_logic := '0';
    constant DIVISOR : integer := 100000000 / 2; -- Divide 100 MHz down to 1 Hz
begin
    process(clk, reset)
    begin
        if (reset = '0') then
            count <= 0;
            tmp <= '0';
        elsif (rising_edge(clk)) then
            if (count = DIVISOR - 1) then  
                tmp <= NOT tmp; -- invert clock_out value
                count <= 0; -- reset counting
            else
                count <= count + 1;
            end if;
        end if;
        clock_out <= tmp;
    end process;
end bhv;
