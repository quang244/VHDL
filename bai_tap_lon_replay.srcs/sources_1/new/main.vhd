--code by Nguyen Huy Quang
-- ai su dung cho xin 5k nha :(((
-- 0352913472 VPBank ^^
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use ieee.std_logic_unsigned.all;

entity main is
  Port (    clk: in std_logic;
            clk_out: inout std_logic;
            clk_scan: inout std_logic;
            hang_nghin,hang_tram,hang_chuc,hang_donvi : inout integer;
            led7 : out std_logic_vector (7 downto 0)
   );
end main;

architecture Behavioral of main is
----------------khai bao khoi chia tan----------------
component chiatan is
    generic(hesochia : integer);
    port(
        clk_in_div :in std_logic;
        clk_out_div:out std_logic
    );
end component;
----------------khai bao khoi dem----------------
component counter_and_split is
    port(   clk : in std_logic;
            nghin_counter,tram_counter,chuc_counter, donvi_counter: out integer
    );
end component;
----------------khai bao khoi giai ma----------------
component giaimaled is
    port(   number_in   : in integer;
            output      : out std_logic_vector(7 downto 0)
    );
end component;
-----------------khai bao tin hieu--------------------
signal sel: std_logic_vector( 1 downto 0) :="00";
signal data: integer;
signal led_EN : std_logic_vector(3 downto 0);

begin
----------------khoi chia tan--------------------
    chiatan_dem : chiatan 
        generic map (hesochia => 50)
        port map(     
            clk_in_div => clk,
            clk_out_div => clk_out
        );
        
     chiatan_scan: chiatan
        generic map(hesochia => 2)
        port map(
            clk_in_div => clk,
            clk_out_div => clk_scan
        );
----------------khoi dem va phan ra--------------------
     khoidemvaphanra: counter_and_split
        port map(   clk => clk_out,
                    nghin_counter => hang_nghin,
                    tram_counter => hang_tram,
                    chuc_counter => hang_chuc,
                    donvi_counter => hang_donvi
        );
----------------khoi giai ma led--------------------
     khoigiaima: giaimaled
        port map(   number_in => data,
                    output => led7
        );
------------------------process--------------------
process (clk_scan)
begin
         if rising_edge(clk_scan) then
            if sel = "00" then
                data <= hang_donvi;
                led_en <= "0001";
                sel <= sel + 1;
            elsif sel = "01" then
                data <= hang_chuc;
                led_en <= "0010";
                sel <= sel + 1;
            elsif sel = "10" then
                data <= hang_tram;
                led_en <= "0100";
                sel <= sel + 1;
            elsif sel = "11" then
                data <= hang_nghin;
                led_en <= "1000";
                sel <= "00";
            end if;
        end if;
    end process;

end Behavioral;
