library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity counter_and_split is
  Port (    clk: in std_logic;
            nghin_counter,tram_counter,chuc_counter,donvi_counter : out integer
   );
end counter_and_split;

architecture Behavioral of counter_and_split is
signal count: integer := 0;
begin
    process(clk)
    begin
        if rising_edge(clk) then
            donvi_counter   <= count mod 10;
            chuc_counter    <=(count/10) mod 10;
            tram_counter    <=(count/100) mod 10;
            nghin_counter   <=(count/1000) mod 10;
            
            count <= count + 1;
            
            if count = 9999 then
                count <= 0;
            end if;
        end if;
    end process;
end Behavioral;
