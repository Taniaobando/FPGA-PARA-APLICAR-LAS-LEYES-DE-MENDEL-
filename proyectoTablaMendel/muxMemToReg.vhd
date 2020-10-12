-----------------------------
--Actividad: multiplexor del RF
--Autor(as): Laura Arango,Andres Salazar, Tania Obando, Verónica Tofiño.
--Fecha:15/11/2018
--Curso:Arquitectura del computador II
--
--archivo: muxMemToReg.vhd
-----------------------------
--Descripcion: Multiplexor que elige entre el dato del ALUOut y un dato de la Memoria
-----------------------------
--Cambios: Se añadió esta entrada.
-----------------------------
library ieee;
use ieee.std_logic_1164.all;
entity muxMemToReg IS
	generic (
		NM: natural := 8 --Bus de direcciones
	);
	PORT(
	
		  DataMem : IN std_logic_vector(NM DOWNTO 0);  --Dato de la Memoria
        regmem : IN std_logic_vector(NM DOWNTO 0); --Dato del ALU Out
		  Memtoreg : IN std_logic; -- Señal del Mux
        salidaMuxMemToReg : OUT std_logic_vector(NM DOWNTO 0) --Salida del Mux
		  
		  );
END entity;
ARCHITECTURE muxMemToReg_arch OF muxMemToReg IS
BEGIN

	PROCESS (Memtoreg) IS
   BEGIN
         CASE Memtoreg IS
           WHEN '0' => 
			  salidaMuxMemToReg <= DataMem;
           WHEN '1' => 
			  salidaMuxMemToReg <= regmem;
         END CASE;
   END PROCESS;
END muxMemToReg_arch;