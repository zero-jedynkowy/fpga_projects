library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity prescaler_vhdl is
    port
    (
        freqIn: in Integer;
        freqOut: in Integer;
        clkIn: in std_logic;
        clkOut: out std_logic;
        enable: in std_logic
    );
end prescaler_vhdl;


architecture Behavioral of prescaler_vhdl is
    signal temp: std_logic := '0';
    signal finalCounterValue : Integer := 0;
    signal currentCounter : Integer := 0;
begin

    clkOut <= temp;
    finalCounterValue <= (freqIn/freqOut)-1;
    
    process(clkIn, enable)
    begin
    
        if(enable = '1') then
            if(rising_edge(clkIn) or falling_edge(clkIn)) then
                if(currentCounter >= finalCounterValue) then
                    currentCounter <= 0;
                    temp <= not temp;
                else    
                    currentCounter <= currentCounter + 1;
                end if;
            end if;
        else 
            temp <= '0';
        end if;
    
    end process;

end Behavioral;