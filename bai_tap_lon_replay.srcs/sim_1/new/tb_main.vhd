library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity tb_main is
end tb_main;

architecture Behavioral of tb_main is
component main is
    Port (      clk: in std_logic;
                clk_out: inout std_logic;
                clk_scan: inout std_logic;
                hang_nghin,hang_tram,hang_chuc,hang_donvi : inout integer;
                led7 : out std_logic_vector (7 downto 0)
       );
end component;
    signal clk : std_logic := '0';
    signal clk_out:  std_logic:= '0';
    signal clk_scan:  std_logic:= '0';
    signal hang_nghin,hang_tram,hang_chuc,hang_donvi : integer;
    signal led7 :  std_logic_vector (7 downto 0);
begin
    testbench: main 
    port map(   clk => clk,
                clk_out => clk_out,
                clk_scan =>clk_scan,
                hang_nghin =>hang_nghin,
                hang_tram => hang_tram,
                hang_chuc => hang_chuc,
                hang_donvi => hang_donvi,
                led7 => led7        
    );
    process
    begin
        clk <= '0';
        wait for 1ns;
        clk <= '1';
        wait for 1ns;
    end process;
end Behavioral;
