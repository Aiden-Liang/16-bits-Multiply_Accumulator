library ieee;
use ieee.std_logic_1164.all;
use ieee.NUMERIC_BIT.all;
library D_FF_unit_1_bit;
use D_FF_unit_1_bit.all;
library D_FF_unit_8_bits;
use D_FF_unit_8_bits.all;
library D_FF_unit_16_bits;
use D_FF_unit_16_bits.all;

entity Multiply_Accumulator_16_BITS is
port( A: in UNSIGNED(7 downto 0);
	  B: in UNSIGNED(7 downto 0);
	  CLK, En, RST: in std_logic;
	  input_valid: in std_logic;
	  C: out UNSIGNED(15 downto 0);
	  output_valid: out std_logic );
end Multiply_Accumulator_16_BITS;
	  
architecture Structural_Model of Multiply_Accumulator_16_BITS is
signal Reg_1_Q: UNSIGNED(7 downto 0);
signal Reg_2_Q: UNSIGNED(7 downto 0);
signal Reg_3_Q: std_logic;
signal Reg_4_Q: UNSIGNED(15 downto 0);
signal Reg_5_Q: std_logic;
signal Reg_6_Q: UNSIGNED(15 downto 0);

signal multiplier_RESULT: UNSIGNED(15 downto 0);
signal adder_RESULT: UNSIGNED(15 downto 0);

component D_FF_unit_1_bit
port( D, En, CLK: in std_logic; 
	  Q: out std_logic );
end component;

component D_FF_unit_8_bits
port( En, CLK: in std_logic; 
	  D: in UNSIGNED(7 downto 0);
	  Q: out UNSIGNED(7 downto 0) );
end component;

component D_FF_unit_16_bits
port( En, CLK: in std_logic; 
	  D: in UNSIGNED(15 downto 0);
	  Q: out UNSIGNED(15 downto 0) );
end component;

component D_FF_unit_with_RST_16_bits
port( En, CLK, RST: in std_logic; 
	  D: in UNSIGNED(15 downto 0);
	  Q: out UNSIGNED(15 downto 0) );
end component;

begin
multiplier_RESULT <= Reg_1_Q * Reg_2_Q;
adder_RESULT <= Reg_4_Q + Reg_6_Q;
C <= Reg_6_Q;

Reg_1: D_FF_unit_8_bits port map( En=>En, CLK=>CLK, D=>A, Q=>Reg_1_Q );
Reg_2: D_FF_unit_8_bits port map( En=>En, CLK=>CLK, D=>B, Q=>Reg_2_Q );
Reg_3: D_FF_unit_1_bit port map( En=>En, CLK=>CLK, D=>input_valid, Q=>Reg_3_Q );
Reg_5: D_FF_unit_1_bit port map( En=>En, CLK=>CLK, D=>Reg_3_Q, Q=>Reg_5_Q );
Reg_7: D_FF_unit_1_bit port map( En=>En, CLK=>CLK, D=>Reg_5_Q, Q=>output_valid );
Reg_4: D_FF_unit_16_bits port map( En=>En, CLK=>CLK, D=>multiplier_RESULT, Q=>Reg_4_Q );
Reg_6: D_FF_unit_with_RST_16_bits port map( En=>Reg_5_Q, CLK=>CLK, RST=>RST, D=>adder_RESULT, Q=>Reg_6_Q );

end Structural_Model;


