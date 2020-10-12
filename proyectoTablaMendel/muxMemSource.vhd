-----------------------------
--Actividad: multiplexor de la RAM
--Autor(as): Laura Arango,Andres Salazar, Tania Obando, Verónica Tofiño.
--Fecha:15/11/2018
--Curso:Arquitectura del computador II
--
--archivo: muxMemSource.vhd
-----------------------------
--Descripcion: Multiplexor que elige entre el dato del IN y el dato de la caja temporal B
-----------------------------
--Cambios: Se añadió esta entrada.
-----------------------------
library ieee;
use ieee.std_logic_1164.all;
entity muxMemSource IS
	generic (
		NMemS: natural  := 6 -- Bus de direcciones de la RAM
	); 
	PORT(
	
		  Entry : IN std_logic_vector(NMemS DOWNTO 0);  -- Dato de la caja IN
        DataB : IN std_logic_vector(NMemS DOWNTO 0); -- Dato de la caja B
		  MemSource : IN std_logic; --Señal del Mux
        salidaMuxMemSource : OUT std_logic_vector(NMemS DOWNTO 0) --Salida del Mux
		  
		  );
END entity;

ARCHITECTURE muxMemSource_arch OF muxMemSource IS
BEGIN

	PROCESS (MemSource) IS
   BEGIN
         CASE MemSource IS
           WHEN '0' => 
			  salidaMuxMemSource <= Entry;
           WHEN '1' => 
			  salidaMuxMemSource <= DataB;
         END CASE;
       END PROCESS;
END muxMemSource_arch;