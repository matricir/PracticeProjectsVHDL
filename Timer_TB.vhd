----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 29.03.2023 14:59:05
-- Design Name: 
-- Module Name: Clk_And_Gate_wrTB - Behavioral
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

entity Timer_TB is
end entity;

architecture sim of Timer_TB is
    constant ClockFrequencyHz   :   integer := 10;
    constant ClockPeriod        :   time := 1000ms / ClockFrequencyHz;
    
    signal Clk      : std_logic := '1';
    signal nRst     : std_logic := '0';
    signal Seconds  :  integer;
    signal i_switch_1  : std_logic := '0';
    signal i_switch_2  : std_logic := '0';
    signal o_led_1     :   std_logic;
    signal o_led_2     :   std_logic;
    signal o_led_3     :   std_logic;
    signal o_led_4     :   std_logic;
    signal o_led_5     :   std_logic;
    signal o_led_6     :   std_logic;
    signal o_led_7     :   std_logic;
    signal o_led_8     :   std_logic;
begin
    i_Timer :   entity  work.Timer(rtl)
    generic map(ClockFrequencyHz => ClockFrequencyHz)
    port map(
        Clk     =>  Clk,
        nRst    =>  nRst,
        Seconds =>  Seconds,
        i_switch_1 => i_switch_1,
        i_switch_2 => i_switch_2,
        o_led_1 => o_led_1,
        o_led_2 => o_led_2,
        o_led_3 => o_led_3,
        o_led_4 => o_led_4,
        o_led_5 => o_led_5,
        o_led_6 => o_led_6,
        o_led_7 => o_led_7,
        o_led_8 => o_led_8
    );
    
    Clk <= not Clk after ClockPeriod / 2;
    
    process is 
    begin
        i_switch_1 <= '1';
        i_switch_2 <= '1';
        wait until rising_edge(Clk);
        wait until rising_edge(Clk);
        
        nRst <= '1';
        wait;
    end process;
    
end architecture;
