----------------------------------------------------------------------------------
-- Engineer: EFE ACER
-- Project Name: Pong Game
-- Brief: The top module of the project, receives its input from the board, generates
--        the outputs using its submodules and sends them to the monitor from the board. 
----------------------------------------------------------------------------------

library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity VGAController is
  Port (clock, BTNC, BTNU, BTNL, BTNR, BTND: in std_logic;
        difficultyControl: in std_logic_vector(1 downto 0);
        VGA_HS, VGA_VS: out std_logic;
        VGA_R, VGA_G, VGA_B: out std_logic_vector(3 downto 0));
end VGAController;

architecture Behavioral of VGAController is
--Decleration of the components
component ClockDivider is
    Port (clockIn: in std_logic;
          clockOut: out std_logic);
end component;  
component Sync is
    Port (clock, left, right, start: in std_logic;
          difficultyControl: in std_logic_vector(1 downto 0);
          VGA_HS, VGA_VS: out std_logic; 
          r, g, b: out std_logic_vector(3 downto 0));
end component;
--Intermediate carrier signal   
signal VGAClock: std_logic;   
begin
    --port-mappings
    Component1: ClockDivider 
                    port map(clockIn => clock,
                             clockOut => VGAClock);
    Component2: Sync
                    port map(clock => VGAClock,
                             left => BTNL,
                             right => BTNR,
                             start => BTNC,
                             difficultyControl => difficultyControl,
                             VGA_HS => VGA_HS,
                             VGA_VS => VGA_VS,
                             r => VGA_R,
                             g => VGA_G,
                             b => VGA_B);
end Behavioral;
