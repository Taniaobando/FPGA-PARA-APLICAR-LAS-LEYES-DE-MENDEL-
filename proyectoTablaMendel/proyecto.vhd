-----------------------------
--Actividad: RAM
--Autor(as): Laura Arango,Andres Salazar, Tania Obando, Verónica Tofiño.
--Fecha:15/11/2018
--Curso:Arquitectura del computador II
--
--archivo: ram.vhd
-----------------------------
--Descripcion: Memoria para guardar datos. Los dispositivos de Entradas y Salidas guardan y leen de memoria
-----------------------------
--Cambios: Se añadió esta entrada.
-----------------------------
library ieee;
use ieee.numeric_std.all;
use ieee.std_logic_1164.all;
use ieee.std_logic_unsigned.all;

entity ram is 
port (
	clk,memRead,memWrite:in std_logic; --Señales de Clock, Lectura de Memoria y Escritura de Memoria
	data_in:in std_logic_vector(6 downto 0); --Dato a guardar en la RAM
	address_in: in integer; --Dirección de la RAM
	data_out: out std_logic_vector(8 downto 0);	--Dato a sacar de la RAM al bus
	ledSi : out std_logic;
	ledNo : out std_logic
	); 
end entity;

architecture ram_arc of ram is 
type memory is array (0 to 15) of std_logic_vector(6 downto 0);
--signal my_ram: memory;
--attribute ram_style: string;
--attribute ram_style of my_ram: signal is "M4K";
--attribute ram_init_file: string;
--attribute ram_init_file of my_ram: signal is "ram_arch.mif";
signal address: integer range 0 to 15; 
type memoria is array (0 to 15) of std_logic_vector(6 downto 0);
signal ram: memoria := (0 => "0000000",
1 => "0000000",
2 => "0000000",
3 => "0000000",
4 => "0000000",
5 => "0000000",
6 => "0000000",
7 => "0000000",
8 => "0000000",
9 => "0000000",
10 => "0000000",
11 => "0000000",
12 => "0000000",
13 => "0000000",
14 => "0000000",
15 => "0000000",
others => "0000000"
);
begin	
	address <= address_in;
	process (clk) is
	begin	
		if (rising_edge(clk)) then
			if (memRead='1') then
				data_out<= "00"& ram((address));
				ledNo <= '1'; 
			elsif (memWrite='1') then
				ledNo <= '0';
				ram((address)) <= data_in;
				ledSi <= '1';
			else
				ledSi <= '0';
				ledNo <= '0';
			end if;
		end if;
	end process;
end architecture;
  
