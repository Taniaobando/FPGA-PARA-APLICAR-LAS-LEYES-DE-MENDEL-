-----------------------------
--Actividad: Gate AND del Smaller Then
--Autor(as): Laura Arango,Andres Salazar, Tania Obando, Verónica Tofiño.
--Fecha:15/11/2018
--Curso:Arquitectura del computador II
--
--archivo: GateOrPCWrite.vhd
-----------------------------
--Descripcion: Compuerta OR para la Señal del PCWrite
-----------------------------
--Cambios: Se añadió esta entrada.
-----------------------------
library ieee;
use ieee.numeric_std.all;
use ieee.std_logic_1164.all;
use ieee.std_logic_unsigned.all;

entity GateAndSt is
port (
	Jst: in std_logic; --Señal del Jst (Just Smaller Than)
	FlagJst: in std_logic; --Flag de la ALU
	OpAndSt: out std_logic -- Operación del AND 
);
end entity;

architecture GateAndSt_arch of GateAndSt is
begin
		OpAndSt <= Jst and FlagJst;
end architecture;