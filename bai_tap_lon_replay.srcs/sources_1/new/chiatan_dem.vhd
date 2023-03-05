library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity chiatan is
  generic (hesochia: integer);
  Port ( clk_in_div: in std_logic;
         clk_out_div: out std_logic
  );
end chiatan;

architecture Behavioral of chiatan is
signal tmp: std_logic :='0';
signal count: integer := 1;
begin
    process (clk_in_div)
        begin
            if rising_edge(clk_in_div) then
            
                if count = (hesochia/2) then
                    tmp <= not tmp;
                    count <= 1;
                else count <= count + 1 ;
                end if;
            end if;
    end process;
    clk_out_div <= tmp;
end Behavioral;
