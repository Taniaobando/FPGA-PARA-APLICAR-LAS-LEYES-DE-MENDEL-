----------------------------
--Actividad: Temporal A
--Autor(as): Laura Arango,Andres Salazar, Tania Obando, Verónica Tofiño.
--Fecha:15/11/2018
---Curso:Arquitectura del computador II
--
--archivo: boxA.vhd
-----------------------------
--Descripcion: Temporal para guardar el registro A
-----------------------------
--Cambios: Se añadió esta entrada.
-----------------------------
library ieee;
use ieee.std_logic_1164.all;
use IEEE.numeric_std.all;
use IEEE.std_logic_unsigned.all;

entity boxA is
	generic(
		NA: natural := 8 --Bus de datos
	);

	port( 
		clk : in std_logic;
		RsData: in unsigned(NA downto 0); --Dato Rs del RF
		ExitA: out std_logic_Vector(NA downto 0) --Salida del Rs
	);
end entity;

architecture boxA_arch of boxA is
begin
	process(clk) is
	begin
		if rising_edge(clk) then
			ExitA<= std_logic_vector(RsData);
		end if;
	end process;
end architecture; 