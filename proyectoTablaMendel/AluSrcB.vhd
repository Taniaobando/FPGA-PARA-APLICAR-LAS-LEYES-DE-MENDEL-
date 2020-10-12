-----------------------------
--Actividad: Multiplexor de la caja B
--Autor(as): Laura Arango,Andres Salazar, Tania Obando, Verónica Tofiño.
--Fecha:15/11/2018
--Curso:Arquitectura del computador II
--
--archivo: muxAluSrcB.vhd
-----------------------------
--Descripcion: Multiplexor que elige entre el dato del RF y la constante 
-----------------------------
--Cambios: Se añadió esta entrada.
-----------------------------
library ieee;
use ieee.std_logic_1164.all;

entity muxAluSrcB IS
	generic (
		NAluB: natural := 8 --Bus de datos
	);
	PORT(
	
		  DataB : IN std_logic_vector(NAluB DOWNTO 0);  --Dato del RF
        Cte : IN std_logic_vector(NAluB DOWNTO 0); -- Constante del IR
		  AluSrcB : IN std_logic; --Señal del Mux
        salidamuxAluSrcB : OUT std_logic_vector(NAluB DOWNTO 0) --Salida del Mux
		  
		  );
END entity;
ARCHITECTURE muxAluSrcB_arch OF muxAluSrcB IS
BEGIN

	PROCESS (AluSrcB) IS
   BEGIN
         CASE AluSrcB IS
           WHEN '0' => 
			  salidamuxAluSrcB <= DataB;
           WHEN '1' => 
			  salidamuxAluSrcB <= Cte;
         END CASE;
   END PROCESS;
END muxAluSrcB_arch;