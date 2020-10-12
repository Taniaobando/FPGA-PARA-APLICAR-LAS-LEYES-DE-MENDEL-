-----------------------------
--Actividad: ALU
--Autor(as): Laura Arango,Andres Salazar, Tania Obando, Verónica Tofiño.
--Fecha:15/11/2018
--Curso:Arquitectura del computador II
--
--archivo: ALU.vhd
-----------------------------
--Descripcion: Componente que realiza tres operaciones (Suma, Igual y Menor que)
-----------------------------
--Cambios: Se añadió esta entrada.
-----------------------------
--ALU NGLVTA

Library IEEE;
use IEEE.std_logic_1164.all;
use IEEE.numeric_std.all;
use IEEE.std_logic_unsigned.all;

entity ALU is 

generic(
	wBus:natural:=8 --Bus de Datos
	);
	
port(
	ALU_OP: in std_logic_vector(1 downto 0); --ALU OP para hacer una de las tres operaciones 
	A,B: in std_logic_vector(wBus downto 0); --Cajas con los datos a operar
	result: out std_logic_vector(wBus downto 0); -- Resultado de la operación
	stFlag: out std_logic; -- Flag del Menor que
	eqFlag: out std_logic --Flag del Igual 
);
end entity;

architecture alu_arc of ALU is
	begin
		
		result <=  A + B when ALU_OP = "00" else "000000000";
		
		eqFlag <= '1' when ((ALU_OP = "01") and (A = B)) else 
					 '0';
		
		stFlag <= '1' when ((ALU_OP = "10") and (A > B)) else 
					 '0';	
		
			
		
end architecture;