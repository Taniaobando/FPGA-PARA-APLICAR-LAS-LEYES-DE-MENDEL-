-----------------------------
--Actividad: multiplexor del PC
--Autor(as): Laura Arango,Andres Salazar, Tania Obando, Verónica Tofiño.
--Fecha:15/11/2018
--Curso:Arquitectura del computador II
--
--archivo: muxPCSource.vhd
-----------------------------
--Descripcion: Multiplexor que elige entre el PC+1 y la constante para actualizar el PC
-----------------------------
--Cambios: Se añadió esta entrada.
-----------------------------
library ieee;
use ieee.std_logic_1164.all;

entity muxPCSource IS
	generic (
		NmuxPC: natural := 8 --Bus de direcciones
	);
	PORT(
		  address : IN std_logic_vector(NmuxPC DOWNTO 0); --Constante 
        pc_a : IN std_logic_vector(NmuxPC DOWNTO 0);  --Dirección del PC +1
        sel : IN std_logic;  --Señal del mux
        salidaMuxPCSource : OUT std_logic_vector(NmuxPC DOWNTO 0) --Salida del Mux
		  );
END entity;
ARCHITECTURE muxPCSource_arch OF muxPCSource IS
BEGIN

	PROCESS (sel) IS
   BEGIN
         CASE sel IS
           WHEN '0' => 
			  salidaMuxPCSource <= pc_a;
           WHEN '1' => 
			  salidaMuxPCSource <= address;
         END CASE;
   END PROCESS;
END muxPCSource_arch;