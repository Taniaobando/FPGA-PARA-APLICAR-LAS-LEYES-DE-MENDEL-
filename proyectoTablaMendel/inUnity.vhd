-----------------------------
--Actividad: Entrada
--Autor(as): Laura Arango,Andres Salazar, Tania Obando, Verónica Tofiño.
--Fecha:15/11/2018
--Curso:Arquitectura del computador II
--
--archivo: inUnity.vhd
-----------------------------
--Descripcion: 
-----------------------------
--Cambios: Se añadió esta entrada.
-----------------------------
library ieee;
use ieee.std_logic_1164.all;
use ieee.std_logic_unsigned.all;
entity inUnity is 
port(
	--El switch 1 concatenado con el switch 2 dan el genotipo con el que se va a calcular la probabilidad. Ej: Aa, BB, cc, dD
	switch1 : in std_logic; --Genotipo de la izquierda
	switch2 : in std_logic; --Genotipo de la derecha
	dataToMem : out std_logic_vector(6 downto 0); -- Genotipo a guardar en memoria
	InS: in std_logic; -- Señal del IN
	Enter : in std_logic; --Botón del Enter
	led1 : out std_logic
);
end entity;

architecture inUnity_arc of inUnity is
begin

	process(InS,Enter) is
	begin
		case Enter is
		when '0' =>
			if (InS = '1') then 
				dataToMem <= "00000"&switch1&switch2; 
				led1 <= '1';
			else 
				dataToMem <= "0000000";
				led1 <= '0';
			end if;
		when others => 
			dataToMem <= "0000000";
			led1 <= '0';
		end case;
	end process;
	
end architecture;
