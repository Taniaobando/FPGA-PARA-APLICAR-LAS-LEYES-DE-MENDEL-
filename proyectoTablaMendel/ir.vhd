-----------------------------
--Actividad: Instruction Register
--Autor(as): Laura Arango,Andres Salazar, Tania Obando, Verónica Tofiño.
--Fecha:15/11/2018
--Curso:Arquitectura del computador II
--
--archivo: ir.vhd
-----------------------------
--Descripcion: Componente que separa la instrucción en Opcode, registros (Rd y Rs) y Constante.
-----------------------------
--Cambios: Se añadió esta entrada.
-----------------------------
library ieee;
use ieee.std_logic_1164.all;
use ieee.std_logic_unsigned.all;


entity ir is 
port (
		clock : in std_logic; --Clock del Sistema
		instruccion: in std_logic_vector(21 downto 0); --Instrucción a separar
		irWriteSignal: in std_logic; -- Señal del IR
		opcode: out std_logic_vector(2 downto 0); --Opcode
		Rd: out std_logic_vector(4 downto 0); -- Rd
		Rs: out std_logic_vector(4 downto 0); -- Rs
		inmediato: out std_logic_vector(8 downto 0) -- Constante
	);
end entity;

architecture ir_arc of ir is
	begin
		process(clock) is
			begin
				if rising_edge(clock) then
					if irWriteSignal = '1' then 
						opcode<=instruccion(21 downto 19);
						Rd<=instruccion(18 downto 14);
						Rs<=instruccion(13 downto 9);
						inmediato<=instruccion(8 downto 0);

					end if;
				end if;
		end process;
	end architecture; 

