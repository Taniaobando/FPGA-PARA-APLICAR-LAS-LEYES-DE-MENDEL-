-----------------------------
--Actividad: Out
--Autor(as): Laura Arango,Andres Salazar, Tania Obando, Verónica Tofiño.
--Fecha:15/11/2018
--Curso:Arquitectura del computador II
--
--archivo: outUnity.vhd
-----------------------------
--Descripcion: Dispositivo que muestra en los Displays las probabilidades obtenidas.
-----------------------------
--Cambios: Se añadió esta entrada.
-----------------------------
library ieee;
use ieee.std_logic_1164.all;
use ieee.std_logic_unsigned.all;

entity outUnity is
	port(
		Data : in std_logic_vector(6 downto 0); --Probabilidad
		seg1 : out std_logic_vector(6 downto 0); --Primer siete segmentos
		seg2 : out std_logic_vector(6 downto 0);--Segundo siete segmentos
		seg3: out std_logic_vector(6 downto 0); --Tercer siete segmentos
		OutS: in std_logic; --Señal del Out
		EnterOut : in std_logic;
		ledOut: out std_logic
		);
end entity;

architecture outUnity_arc of outUnity is
	signal Dataa: std_logic_vector (6 downto 0);
	begin
	Dataa <= Data;
	Delay:process(Data,EnterOut) 
			begin
				ledOut <= '1';
				if (OutS = '1' and EnterOut= '0') then
					case Data is
						when "1001011" =>
							seg1 <= "0000001";
							seg2 <= "0001101";
							seg3 <= "0100100";
						when "0011001" =>
							seg1 <= "0000001";
							seg2 <= "0010010";
							seg3 <= "0100100";
						when "0000000" =>
							seg1 <= "0000001";
							seg2 <="0000001";
							seg3 <= "0000001";
						when "1100100" =>
							seg1 <= "1001111";
							seg2 <= "0000001";
							seg3 <= "0000001";
						when "0110010" =>
							seg1 <= "0000001";
							seg2 <= "0100100";
							seg3 <= "0000001";
						when others =>
							seg1 <= "1111110";
							seg2 <= "1111110";
							seg3 <= "1111110";
					end case;
				else 
					ledOut <= '0';--Led 3 Verde
					seg1 <= "1111011";
					seg2 <= "1110111";
					seg3 <= "1110111";
				end if;
				--wait until EnterOut = '0';
		end process Delay;
			
end architecture;
