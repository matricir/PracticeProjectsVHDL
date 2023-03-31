----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 28.03.2023 15:44:24
-- Design Name: 
-- Module Name: And_Gate - Behavioral
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
use ieee.numeric_std.all;

-- Uncomment the following library declaration if using
-- arithmetic functions with Signed or Unsigned values
--use IEEE.NUMERIC_STD.ALL;

-- Uncomment the following library declaration if instantiating
-- any Xilinx leaf cells in this code.
--library UNISIM;
--use UNISIM.VComponents.all;

entity Timer is
    generic(ClockFrequencyHz : integer := 100000000
    );
    port(
        Clk         :   in std_logic;
        nRst        :   in std_logic;
        Seconds     :   inout integer;
        i_switch_1  :   in std_logic;
        i_switch_2  :   in std_logic;
        o_led_1     :   out std_logic;
        o_led_2     :   out std_logic;
        o_led_3     :   out std_logic;
        o_led_4     :   out std_logic;
        o_led_5     :   out std_logic;
        o_led_6     :   out std_logic;
        o_led_7     :   out std_logic;
        o_led_8     :   out std_logic
    );
end Timer;
architecture rtl of Timer is
    signal Ticks: integer;
    signal HalfTick: integer;
    signal counter : integer;
begin
    process(Clk) is 
    begin 
        if rising_edge(Clk) then 
            if nRst = '0' then 
                Ticks   <= 0;
                Seconds <= 0;
                counter <= 0;
             else
             
                if Ticks = ClockFrequencyHz/4 - 1 then
                    Ticks <= 0;
                    if Seconds = 59 then
                        Seconds <= 0;
                     else 
                        Seconds <= Seconds + 1;
                        if counter = 9 then 
                            counter <= 0;
                        else 
                            counter <= counter +1;
                        end if;
                     end if;
                 else
                    Ticks <= Ticks + 1;
                 end if;    
              end if;
          end if;
     end process;
     led_100_HZ : process(Clk) is 
        begin 
            if rising_edge(Clk) then
                if 1 < counter then
                    o_led_1 <= i_switch_1 and i_switch_2;
                else
                    o_led_1 <= '0';
                end if;
                if 2 < counter then
                    o_led_2 <= i_switch_1 and i_switch_2;
                else
                    o_led_2 <= '0';
                end if;
                if 3 < counter then
                    o_led_3 <= i_switch_1 and i_switch_2;
                else
                    o_led_3 <= '0';
                end if;
                if 4 < counter then
                    o_led_4 <= i_switch_1 and i_switch_2;
                else
                    o_led_4 <= '0';
                end if;
                if 5 < counter then
                    o_led_5 <= i_switch_1 and i_switch_2;
                else
                    o_led_5 <= '0';
                end if;
                if 6 < counter then
                    o_led_6 <= i_switch_1 and i_switch_2;
                else
                    o_led_6 <= '0';
                end if;
                if 7 < counter then
                    o_led_7 <= i_switch_1 and i_switch_2;
                else
                    o_led_7 <= '0';
                end if;
                if 8 < counter then
                    o_led_8 <= i_switch_1 and i_switch_2;
                else
                    o_led_8 <= '0';
                end if;
            end if;
        end process led_100_HZ;    
end rtl;
