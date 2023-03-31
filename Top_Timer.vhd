--Copyright 1986-2022 Xilinx, Inc. All Rights Reserved.
----------------------------------------------------------------------------------
--Tool Version: Vivado v.2022.2 (win64) Build 3671981 Fri Oct 14 05:00:03 MDT 2022
--Date        : Thu Mar 30 14:29:41 2023
--Host        : ASDS2097 running 64-bit major release  (build 9200)
--Command     : generate_target design_1.bd
--Design      : design_1
--Purpose     : IP block netlist
----------------------------------------------------------------------------------
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
library UNISIM;
use UNISIM.VCOMPONENTS.ALL;
entity Top_Timer is
  port (
    Clkn        : in STD_LOGIC;
    Clkp        : in STD_LOGIC;
    Led1        : out STD_LOGIC;
    Led2        : out STD_LOGIC;
    Led3        : out STD_LOGIC;
    Led4        : out STD_LOGIC;
    Led5        : out STD_LOGIC;
    Led6        : out STD_LOGIC;
    Led7        : out STD_LOGIC;
    Led8        : out STD_LOGIC;
    Switch1     : in STD_LOGIC;
    Switch2     : in STD_LOGIC;
    SwitchRst   : in STD_LOGIC;
    reset       : in STD_LOGIC
  );
end Top_Timer;

architecture rtl of Top_Timer is
  component clk_wiz_0 is
  port (
    clk_in1_p : in STD_LOGIC;
    clk_in1_n : in STD_LOGIC;
    reset : in STD_LOGIC;
    clk_out1 : out STD_LOGIC;
    locked : out STD_LOGIC
  );
  end component clk_wiz_0;
  component Timer is
  port (
    Clk : in STD_LOGIC;
    nRst : in STD_LOGIC;
    i_switch_1 : in STD_LOGIC;
    i_switch_2 : in STD_LOGIC;
    o_led_1 : out STD_LOGIC;
    o_led_2 : out STD_LOGIC;
    o_led_3 : out STD_LOGIC;
    o_led_4 : out STD_LOGIC;
    o_led_5 : out STD_LOGIC;
    o_led_6 : out STD_LOGIC;
    o_led_7 : out STD_LOGIC;
    o_led_8 : out STD_LOGIC
  );
  end component Timer;
  signal clk_to_timer : std_logic := '0';
begin
Timer_1 : component Timer
     port map (
     Clk        => clk_to_timer,
     nRst       => SwitchRst,
     i_switch_1 => Switch1,
     i_switch_2 => Switch2,
     o_led_1    => Led1,
     o_led_2    => Led2,
     o_led_3    => Led3,
     o_led_4    => Led4,
     o_led_5    => Led5,
     o_led_6    => Led6,
     o_led_7    => Led7,
     o_led_8    => Led8
    );
clk_wiz_1: component clk_wiz_0
     port map (
      clk_in1_n => Clkn,    
      clk_in1_p => Clkp,
      clk_out1 => clk_to_timer,
      reset => reset
    );
end rtl;

