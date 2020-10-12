-----------------------------
--Actividad: Gate OR del PCWrite
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

entity GateOrPCWrite is
port (
	OpOr: in std_logic; --Salida del OR
	PCWrite: in std_logic; -- Señal del PcWriteSig 
	PCWriteSignal : out std_logic -- Señal del PcWrite 
);
end entity;

architecture GateOrPCWrite_arch of GateOrPCWrite is
begin
	PCWriteSignal <= OpOr or PCWrite;
end architecture;