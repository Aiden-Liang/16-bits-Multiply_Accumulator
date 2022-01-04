library ieee;
use ieee.std_logic_1164.all;
use ieee.NUMERIC_BIT.all;

entity D_FF_unit_16_bits is
port( D: in UNSIGNED(15 downto 0);
	  En: in std_logic;
	  CLK: in std_logic;
	  Q: out UNSIGNED(15 downto 0) );
end D_FF_unit_16_bits;
	  
architecture D_FF_Behavior of D_FF_unit_16_bits is
begin
	process
	begin
		wait until (rising_edge(CLK));
		if En='1' then 
			Q <= D;
		end if;
	end process;
end D_FF_Behavior;


