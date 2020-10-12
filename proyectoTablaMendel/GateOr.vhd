-----------------------------
--Actividad: Gate OR entre los ANDs
--Autor(as): Laura Arango,Andres Salazar, Tania Obando, Verónica Tofiño.
--Fecha:15/11/2018
--Curso:Arquitectura del computador II
--
--archivo: GateOr.vhd
-----------------------------
--Descripcion: Compuerta OR para las salidas de los ANDs.
-----------------------------
--Cambios: Se añadió esta entrada.
-----------------------------
library ieee;
use ieee.numeric_std.all;
use ieee.std_logic_1164.all;
use ieee.std_logic_unsigned.all;

entity GateOr is
port (
	OpOr: out std_logic; --Salida del OR
	OpAndEq: in std_logic; -- Entrada del AND del Equal
	OpAndSt : in std_logic --Emtrada del AND del Smaller Than 
);
end entity;

architecture GateOr_arch of GateOr is
begin
	OpOr <= OpAndEq or OpAndSt;
end architecture;