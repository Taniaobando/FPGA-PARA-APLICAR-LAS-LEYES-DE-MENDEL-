library ieee;
use ieee.numeric_std.all;
use ieee.std_logic_1164.all;
use ieee.std_logic_unsigned.all;

entity GateAndEq is
port (
	Jeq: in std_logic;
	FlagJeq: in std_logic;
	OpAndEq: out std_logic
);
end entity;

architecture GateAndEq_arch of GateAndEq is
begin
	OpAndEq <= Jeq and FlagJeq;
end architecture;

