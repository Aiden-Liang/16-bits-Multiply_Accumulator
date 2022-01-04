library ieee;
use ieee.std_logic_1164.all;
use ieee.NUMERIC_BIT.all;

entity D_FF_unit_1_bit is
port( D: in std_logic;
	  En: in std_logic;
	  CLK: in std_logic;
	  Q: out std_logic );
end D_FF_unit_1_bit;
	  
architecture D_FF_Behavior of D_FF_unit_1_bit is
begin
	process
	begin
		wait until (rising_edge(CLK));
		if En='1' then 
			Q <= D;
		end if;
	end process;
end D_FF_Behavior;


