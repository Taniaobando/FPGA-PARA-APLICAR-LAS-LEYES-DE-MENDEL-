-----------------------------
--Actividad: Sumador del Program Counter
--Autor(as): Laura Arango,Andres Salazar, Tania Obando, Verónica Tofiño.
--Fecha:15/11/2018
--Curso:Arquitectura del computador II
--
--archivo: sumadorPC.vhd
-----------------------------
--Descripcion: Suma uno al PC para pasar a la instrucción siguiente a leer en la ROM
-----------------------------
--Cambios: Se añadió esta entrada.
-----------------------------
library IEEE;
use IEEE.STD_LOGIC_1164.all;
use IEEE.NUMERIC_STD.all;

ENTITY sumadorPC IS
PORT(pc : IN std_logic_vector(8 DOWNTO 0);  --Dirección del PC
     suma : out std_logic_vector(8 DOWNTO 0) --PC + 1 
     
     );
END sumadorPC;

 ARCHITECTURE arc_sumadorPC OF sumadorPC IS
     BEGIN
       PROCESS (pc) IS
       BEGIN
         suma <= std_logic_vector(UNSIGNED(pc) + 000000001);
       END PROCESS;
END arc_sumadorPC;