--Curso:Arquitectura del computador II
--
--archivo: boxB.vhd
-----------------------------
--Descripcion: Temporal para guardar el registro B
-----------------------------
--Cambios: Se añadió esta entrada.
-----------------------------
library ieee;
use ieee.std_logic_1164.all;
use IEEE.numeric_std.all;
use IEEE.std_logic_unsigned.all;

entity boxB is
	generic(
		NB: natural := 8 --Bus de datos
	);

	port( 
		clk : in std_logic;
		RdData: in unsigned(NB downto 0); --Dato Rd del RF
		ExitB: out std_logic_vector(NB downto 0) -- Salida del Tmp
	);
end entity;

architecture boxB_arch of boxB is
begin
	process(clk) is
	begin
		if rising_edge(clk) then
			ExitB<= std_logic_vector(RdData);
		end if;
	end process;
end architecture; 