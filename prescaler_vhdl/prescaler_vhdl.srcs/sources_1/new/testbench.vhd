library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity testbench is
end testbench;

architecture Behavioral of testbench is
    signal clk: std_logic := '0';
    signal enable: std_logic := '0';
    signal clkOut: std_logic := '0';
    signal freqIn: integer := 20e6;
    signal freqOut: integer := 5e6;
begin
    clk <= not clk after 25 ns;
    myPrescaler: entity work.prescaler_vhdl
    port map
    (
        freqIn => freqIn,
        freqOut => freqOut,
        clkIn => clk,
        clkOut => clkOut,
        enable => enable
    );

    process begin
    
        wait for 20 ns;
        enable <= '1';
        wait;
    
    end process;

end Behavioral;