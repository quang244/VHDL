library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity giaimaled is
  Port (    number_in : integer;
            output    : out std_logic_vector(7 downto 0)
   );
end giaimaled;

architecture Behavioral of giaimaled is

begin
    process (number_in)
    begin
        case number_in is
            when 0 => output <= "11000000"; 
            when 1 => output <= "11111001"; 
            when 2 => output <= "10100100";
            when 3 => output <= "10110000";
            when 4 => output <= "10011001";
            when 5 => output <= "10010010";
            when 6 => output <= "10000010";
            when 7 => output <= "11111000";
            when 8 => output <= "10000000";
            when 9 => output <= "10010000";
            when others => NULL;
         end case;
     end process;
end Behavioral;
