-----------------------------
--Actividad: Register File
--Autor(as): Laura Arango,Andres Salazar, Tania Obando, Verónica Tofiño.
--Fecha:15/11/2018
--Curso:Arquitectura del computador II
--
--archivo: RF.vhd
-----------------------------
--Descripcion: Componente que guarda datos.
-----------------------------
--Cambios: Se añadió esta entrada.
-----------------------------
library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;
use ieee.std_logic_unsigned.all;

entity RF is
generic(
	BusE:natural:=8; -- Ancho de bloque
	BusRF:natural:=4 -- Largo de memoria
	);
	
	port (
		RdD: in std_logic_vector(BusRF downto 0); -- Registro RD
		RsD: in std_logic_vector(BusRF downto 0); -- Registro RS
		Clk: in std_logic; --Clock del sistema
		DataToSave: in std_logic_vector(BusE downto 0); --Dato a guardar en el RF
		DataOutA: out unsigned (BusE downto 0); --Dato de salida A Rs
		DataOutB: out unsigned (BusE downto 0); -- Dato de salida B Rd
		RegWrite: in std_logic	--Señal de escritura en RF
		--DatoAf : out std_logic_vector (4 downto 0)

	);
end entity;

architecture RF_arch of RF is
	
	signal REGISTER_0 : unsigned(8 downto 0) := to_unsigned(0,9);
	signal REGISTER_1 : unsigned(8 downto 0) := to_unsigned(0,9);
	signal REGISTER_2 : unsigned(8 downto 0) := to_unsigned(0,9);
	signal REGISTER_3 : unsigned(8 downto 0) := to_unsigned(0,9);
	signal REGISTER_4 : unsigned(8 downto 0) := to_unsigned(0,9);
	signal REGISTER_5 : unsigned(8 downto 0) := to_unsigned(0,9);
	signal REGISTER_6 : unsigned(8 downto 0) := to_unsigned(0,9);
	signal REGISTER_7 : unsigned(8 downto 0) := to_unsigned(0,9);
	signal REGISTER_8 : unsigned(8 downto 0) := to_unsigned(0,9);
	signal REGISTER_9 : unsigned(8 downto 0) := to_unsigned(0,9);
	signal REGISTER_10 : unsigned(8 downto 0) := to_unsigned(0,9);
	signal REGISTER_11 : unsigned(8 downto 0) := to_unsigned(0,9);
	signal REGISTER_12 : unsigned(8 downto 0) := to_unsigned(0,9);
	signal REGISTER_13 : unsigned(8 downto 0) := to_unsigned(0,9);
	signal REGISTER_14 : unsigned(8 downto 0) := to_unsigned(0,9);
	signal REGISTER_15 : unsigned(8 downto 0) := to_unsigned(0,9);
	signal REGISTER_16 : unsigned(8 downto 0) := to_unsigned(0,9);
	signal REGISTER_17 : unsigned(8 downto 0) := to_unsigned(0,9);
	signal REGISTER_18 : unsigned(8 downto 0) := to_unsigned(0,9);
	signal REGISTER_19 : unsigned(8 downto 0) := to_unsigned(0,9);
	signal REGISTER_20 : unsigned(8 downto 0) := to_unsigned(0,9);
	signal REGISTER_21 : unsigned(8 downto 0) := to_unsigned(0,9);
	signal REGISTER_22 : unsigned(8 downto 0) := to_unsigned(0,9);
	signal REGISTER_23 : unsigned(8 downto 0) := to_unsigned(0,9);
	signal REGISTER_24 : unsigned(8 downto 0) := to_unsigned(0,9);
	signal REGISTER_25 : unsigned(8 downto 0) := to_unsigned(0,9);
	signal REGISTER_26 : unsigned(8 downto 0) := to_unsigned(0,9);
	signal REGISTER_27 : unsigned(8 downto 0) := to_unsigned(0,9);
	signal REGISTER_28 : unsigned(8 downto 0) := to_unsigned(0,9);
	signal REGISTER_29 : unsigned(8 downto 0) := to_unsigned(0,9);
	signal REGISTER_30 : unsigned(8 downto 0) := to_unsigned(0,9);
	signal REGISTER_31 : unsigned(8 downto 0) := to_unsigned(0,9);
	
begin
	process(Clk) is
		begin		
					if(falling_edge(Clk)) then
							if RegWrite = '1' then
							--Escritura
							case RdD is
									when "00000" =>
										REGISTER_0 <= unsigned(DataToSave);
									when "00001" =>
										REGISTER_1 <= unsigned(DataToSave);
									when "00010" =>
										REGISTER_2 <= unsigned(DataToSave);
									when "00011" =>
										REGISTER_3 <= unsigned(DataToSave);
									when "00100" =>
										REGISTER_4 <= unsigned(DataToSave);
									when "00101" =>
										REGISTER_5 <= unsigned(DataToSave);
									when "00110" =>
										REGISTER_6 <= unsigned(DataToSave);
									when "00111" =>
										REGISTER_7 <= unsigned(DataToSave);
									when "01000" =>
										REGISTER_8 <= unsigned(DataToSave);
									when "01001" =>
										REGISTER_9 <= unsigned(DataToSave);
									when "01010" =>
										REGISTER_10 <= unsigned(DataToSave);
									when "01011" =>
										REGISTER_11 <= unsigned(DataToSave);
									when "01100" =>
										REGISTER_12 <= unsigned(DataToSave);
									when "01101" =>
										REGISTER_13 <= unsigned(DataToSave);
									when "01110" =>
										REGISTER_14 <= unsigned(DataToSave);
									when "01111" =>
										REGISTER_15 <= unsigned(DataToSave);
									when "10000" =>
										REGISTER_16 <= unsigned(DataToSave);
									when "10001" =>
										REGISTER_17 <= unsigned(DataToSave);
									when "10010" =>
										REGISTER_18 <= unsigned(DataToSave);
									when "10011" =>
										REGISTER_19 <= unsigned(DataToSave);
									when "10100" =>
										REGISTER_20 <= unsigned(DataToSave);
									when "10101" =>
										REGISTER_21 <= unsigned(DataToSave);
									when "10110" =>
										REGISTER_22 <= unsigned(DataToSave);
									when "10111" =>
										REGISTER_23 <= unsigned(DataToSave);
									when "11000" =>
										REGISTER_24 <= unsigned(DataToSave);
									when "11001" =>
										REGISTER_25 <= unsigned(DataToSave);
									when "11010" =>
										REGISTER_26 <= unsigned(DataToSave);
									when "11011" =>
										REGISTER_27 <= unsigned(DataToSave);
									when "11100" =>
										REGISTER_28 <= unsigned(DataToSave);
									when "11101" =>
										REGISTER_29 <= unsigned(DataToSave);
									when "11110" =>
										REGISTER_30 <= unsigned(DataToSave);
									when "11111" =>
										REGISTER_31 <= unsigned(DataToSave);
							end case;
							end if;
  
					end if;	
						--DATAS OUT
						--DATA 1 OUTd
						
						case RsD is
									when "00000" =>
										DataOutA <= REGISTER_0;
									when "00001" =>
										DataOutA <= REGISTER_1;
									when "00010" =>
										DataOutA <= REGISTER_2;
									when "00011" =>
										DataOutA <= REGISTER_3;
									when "00100" =>
										DataOutA <= REGISTER_4;
									when "00101" =>
										DataOutA <= REGISTER_5;
									when "00110" =>
										DataOutA <= REGISTER_6;
									when "00111" =>
										DataOutA <= REGISTER_7;
									when "01000" =>
										DataOutA <= REGISTER_8;
									when "01001" =>
										DataOutA <= REGISTER_9;
									when "01010" =>
										DataOutA <= REGISTER_10;
									when "01011" =>
										DataOutA <= REGISTER_11;
									when "01100" =>
										DataOutA <= REGISTER_12;
									when "01101" =>
										DataOutA <= REGISTER_13;
									when "01110" =>
										DataOutA <= REGISTER_14;
									when "01111" =>
										DataOutA <= REGISTER_15;
									when "10000" =>
										DataOutA <= REGISTER_16;
									when "10001" =>
										DataOutA <= REGISTER_17;
									when "10010" =>
										DataOutA <= REGISTER_18;
									when "10011" =>
										DataOutA <= REGISTER_19;
									when "10100" =>
										DataOutA <= REGISTER_20;
									when "10101" =>
										DataOutA <= REGISTER_21;
									when "10110" =>
										DataOutA <= REGISTER_22;
									when "10111" =>
										DataOutA <= REGISTER_23;
									when "11000" =>
										DataOutA <= REGISTER_24;
									when "11001" =>
										DataOutA <= REGISTER_25;
									when "11010" =>
										DataOutA <= REGISTER_26;
									when "11011" =>
										DataOutA <= REGISTER_27;
									when "11100" =>
										DataOutA <= REGISTER_28;
									when "11101" =>
										DataOutA <= REGISTER_29;
									when "11110" =>
										DataOutA <= REGISTER_30;
									when "11111" =>
										DataOutA <= REGISTER_31;
						end case;				
						--DATA 2 OUT
							
						case RdD is
									when "00000" =>
										DataOutB <= REGISTER_0;
									when "00001" =>
										DataOutB <= REGISTER_1;
									when "00010" =>
										DataOutB <= REGISTER_2;
									when "00011" =>
										DataOutB <= REGISTER_3;
									when "00100" =>
										DataOutB <= REGISTER_4;
									when "00101" =>
										DataOutB <= REGISTER_5;
									when "00110" =>
										DataOutB <= REGISTER_6;
									when "00111" =>
										DataOutB <= REGISTER_7;
									when "01000" =>
										DataOutB <= REGISTER_8;
									when "01001" =>
										DataOutB <= REGISTER_9;
									when "01010" =>
										DataOutB <= REGISTER_10;
									when "01011" =>
										DataOutB <= REGISTER_11;
									when "01100" =>
										DataOutB <= REGISTER_12;
									when "01101" =>
										DataOutB <= REGISTER_13;
									when "01110" =>
										DataOutB <= REGISTER_14;
									when "01111" =>
										DataOutB <= REGISTER_15;
									when "10000" =>
										DataOutB <= REGISTER_16;
									when "10001" =>
										DataOutB <= REGISTER_17;
									when "10010" =>
										DataOutB <= REGISTER_18;
									when "10011" =>
										DataOutB <= REGISTER_19;
									when "10100" =>
										DataOutB <= REGISTER_20;
									when "10101" =>
										DataOutB <= REGISTER_21;
									when "10110" =>
										DataOutB <= REGISTER_22;
									when "10111" =>
										DataOutB <= REGISTER_23;
									when "11000" =>
										DataOutB <= REGISTER_24;
									when "11001" =>
										DataOutB <= REGISTER_25;
									when "11010" =>
										DataOutB <= REGISTER_26;
									when "11011" =>
										DataOutB <= REGISTER_27;
									when "11100" =>
										DataOutB <= REGISTER_28;
									when "11101" =>
										DataOutB <= REGISTER_29;
									when "11110" =>
										DataOutB <= REGISTER_30;
									when "11111" =>
										DataOutB <= REGISTER_31;
						end case;
	end process OutRf;
		
--DataOutA <= tmp;
--DataOutB <= tmp2;
	
end architecture;
