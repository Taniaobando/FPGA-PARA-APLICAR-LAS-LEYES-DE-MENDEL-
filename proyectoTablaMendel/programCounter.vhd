-----------------------------
--Actividad: Program Counter
--Autor(as): Laura Arango,Andres Salazar, Tania Obando, Verónica Tofiño.
--Fecha:15/11/2018
--Curso:Arquitectura del computador II
--
--archivo: progamCounter.vhd
-----------------------------
--Descripcion: Componente que le manda direcciones a la ROM para leer instrucciones
-----------------------------
--Cambios: Se añadió esta entrada.
-----------------------------
library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

entity programCounter is
	port
	(
	clk: in std_logic; --Clock del sistema
	salidamux : in std_logic_vector(8 downto 0); --Dirección que le entra al PC
	pcwrite : in std_logic; --Señal de escritura en PC
	pcout : out std_logic_vector(8 downto 0); --Dirección que sale del PC al bus
	rst : in std_logic
	);
end entity;

architecture programCounter_arch of programCounter is
begin
	process(clk) is
	begin
		if rising_edge(clk) then
			if(pcwrite='1') then
				pcout<= salidamux;
			end if;
			if (rst = '0') then	
				pcout <= "000000000";
			end if;
		end if;
	end process;
end programCounter_arch;