-----------------------------
--Actividad: Tabla de Mendel (MAIN)
--Autor(as): Laura Arango,Andres Salazar, Tania Obando, Verónica Tofiño.
--Fecha:15/11/2018
--Curso:Arquitectura del computador II
--
--archivo: TablaMendel.vhd
-----------------------------
--Descripcion: Se diseñó el main donde se hace el port map de todos los componentes.
-----------------------------
--Cambios: Se añadió esta entrada.
-----------------------------

library ieee;
use ieee.numeric_std.all;
use ieee.std_logic_1164.all;
use ieee.std_logic_unsigned.all;

entity main is 
generic (
	BusDatos:natural:=8; -- Ancho de bloque
	BusRegister:natural:=4; -- Largo de memoria
	BusRam: natural:= 6 --Ancho de la RAM 
);

port (
	Clock: in std_logic;
	dataOutA: out unsigned (8 downto 0);
	dataOutB: out unsigned (8 downto 0);
	cajaA: out std_logic_vector (8 downto 0);
	cajaB: out std_logic_vector (8 downto 0);
	inmediato: out std_logic_vector (8 downto 0);
	ResultadoAlu: out std_logic_vector (8 downto 0);
	salidaMultiplexorB: out std_logic_vector (8 downto 0);
	salidaAluOut: out std_logic_vector (8 downto 0);
	salidaMultiplexorReg: out std_logic_vector (8 downto 0);
	dirRd : out std_logic_Vector (4 downto 0);
	dirRs : out std_logic_Vector (4 downto 0);
	salidaRom: out std_logic_vector (21 downto 0);
	SignalLedSi: out std_logic;
	SignalLedNo: out std_logic;
	dirRam : out std_logic_vector (3 downto 0);
	datoInRam: out std_logic_vector (6 downto 0);
	salidaRam : out std_logic_vector (8 downto 0);
	sw1: in std_logic;
	sw2: in std_logic;
	botonEnter: in std_logic;
	signalLedIn: out std_logic;
	signalLedOut: out std_logic;
	seg0: out std_logic_vector (6 downto 0) := "0000000";
	seg1: out std_logic_vector (6 downto 0);
	seg2: out std_logic_vector (6 downto 0);
	seg3: out std_logic_vector (6 downto 0);
	SignalLedWaitIn: out std_logic;
	SignalReset: out std_logic;
	estadoActualSist: out std_logic_vector (3 downto 0)
);
end entity;

architecture main_arch of main is

component UnidadControl is
port ( 
		Clk: in std_logic; --Clock del sistema
		Rst: in std_logic; --Botón de Reset para reiniciar el sistema
		Opcode: in std_logic_vector(2 downto 0); --Opcode de las instrucciones 
		PCWrite,PCSource: out std_logic; -- Señales del PC
		IRWrite: out std_logic; --Señal del IR
		MemRead,MemWrite,MemSource,MemtoReg,RegWrite: out std_logic; --Señales de la memoria y los multiplexores relacionados con Memoria
		AluSrcB,Jst,Jeq: out std_logic; --Señal del multiplexor de registro y de las señales de salto
		Aluop : out std_logic_vector(1 downto 0); --AluOp para realizar las operaciones (sumar, mayor que, igual que)
		InS,OutS: out std_logic; --Señales de entradas y salidas
		pulsador: in std_logic;
		led2: out std_logic;
		led3: out std_logic;
		estadoActual : out std_logic_vector(3 downto 0);
		enAlu: out std_logic
);     
 end component;  


component GateOrPCWrite is
port (
	OpOr: in std_logic; --Salida del OR
	PCWrite: in std_logic; -- Señal del PcWriteSig 
	PCWriteSignal : out std_logic -- Señal del PcWrite 
);
end component;

component GateOr is
port (
	OpOr: out std_logic; --Salida del OR
	OpAndEq: in std_logic; -- Entrada del AND del Equal
	OpAndSt : in std_logic --Emtrada del AND del Smaller Than 
);
end component;

component GateAndSt is
port (
	Jst: in std_logic; --Señal del Jst (Just Smaller Than)
	FlagJst: in std_logic; --Flag de la ALU
	OpAndSt: out std_logic -- Operación del AND 
);
end component;

component GateAndEq is
port (
	Jeq: in std_logic;
	FlagJeq: in std_logic;
	OpAndEq: out std_logic
);
end component;

component muxPCSource is
	generic (
		NmuxPC: natural := 8 --Bus de direcciones
	);
	PORT(
		  address : IN std_logic_vector(NmuxPC DOWNTO 0); --Constante 
        pc_a : IN std_logic_vector(NmuxPC DOWNTO 0);  --Dirección del PC +1
        sel : IN std_logic;  --Señal del mux
        salidaMuxPCSource : OUT std_logic_vector(NmuxPC DOWNTO 0) --Salida del Mux
		  );
end component;

component sumadorPC is
port(pc : IN std_logic_vector(8 DOWNTO 0);  --Dirección del PC
     suma : out std_logic_vector(8 DOWNTO 0) --PC + 1      
);
end component;

component RF is
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
end component;

component boxA is
	generic(
		NA: natural := 8 --Bus de datos
	);

	port( 
		clk : in std_logic;
		RsData: in unsigned(NA downto 0); --Dato Rs del RF
		ExitA: out std_logic_Vector(NA downto 0) --Salida del Rs
	);
end component;

component BoxB is
	generic(
		NB: natural := 8 --Bus de datos
	);

	port( 
		clk : in std_logic;
		RdData: in unsigned(NB downto 0); --Dato Rd del RF
		ExitB: out std_logic_vector(NB downto 0) -- Salida del Tmp
	);
end component;

component muxAluSrcB is
	generic (
		NAluB: natural := 8 --Bus de datos
	);
	PORT(
		  DataB : IN std_logic_vector(NAluB downto 0);  --Dato del RF
        Cte : IN std_logic_vector(NAluB downto 0); -- Constante del IR
		  AluSrcB : IN std_logic; --Señal del Mux
        salidamuxAluSrcB : OUT std_logic_vector(NAluB downto 0) --Salida del Mux
		  );
end component;

component ALU is
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
end component;

component AluOut is
	generic(
		NAlu: natural := 8 --Bus de Datos
	);

	port( 
		AluOutOp: in std_logic_vector(NAlu downto 0); -- Resultado de la ALU
		ExitAluOut: out std_logic_Vector(NAlu downto 0); --Salida del dato guardado
		EnableAlu : in std_logic;
		Clk : in std_logic
	);
end component;

component muxMemToReg is 
	generic (
		NM: natural := 8 --Bus de direcciones
	);
	PORT(
		  DataMem : in std_logic_vector(NM downto 0);  --Dato de la Memoria
        regmem : in std_logic_vector(NM downto 0); --Dato del ALU Out
		  Memtoreg : in std_logic; -- Señal del Mux
        salidaMuxMemToReg : out std_logic_vector(NM downto 0) --Salida del Mux	  
	);
end component;

component ir is
	port (
		clock : in std_logic; --Clock del Sistema
		instruccion: in std_logic_vector(21 downto 0); --Instrucción a separar
		irWriteSignal: in std_logic; -- Señal del IR
		opcode: out std_logic_vector(2 downto 0); --Opcode
		Rd: out std_logic_vector(4 downto 0); -- Rd
		Rs: out std_logic_vector(4 downto 0); -- Rs
		inmediato: out std_logic_vector(8 downto 0) -- Constante
	);
end component;

component programCounter  is
port(
	clk: in std_logic; --Clock del sistema
	salidamux : in std_logic_vector(8 downto 0); --Dirección que le entra al PC
	pcwrite : in std_logic; --Señal de escritura en PC
	pcout : out std_logic_vector(8 downto 0); --Dirección que sale del PC al bus
	rst : in std_logic
);
end component;

component rom is
port(
	address: in integer range 0 to 511; -- Direcciones posibles
	data_out: out std_logic_vector (21 downto 0) -- Instrucción guardada en la ROM
);
end component;

component ram is 
port(
	clk,memRead,memWrite:in std_logic; --Señales de Clock, Lectura de Memoria y Escritura de Memoria
	data_in:in std_logic_vector(6 downto 0); --Dato a guardar en la RAM
	address_in: in integer range 0 to 15; --Dirección de la RAM
	data_out: out std_logic_vector(8 downto 0);	--Dato a sacar de la RAM al bus
	ledSi : out std_logic;
	ledNo : out std_logic
	); 
end component;

component muxMemSource is
generic (
		NMemS: natural  := 6 -- Bus de direcciones de la RAM
	);
port (
	Entry : IN std_logic_vector(NMemS DOWNTO 0);  -- Dato de la caja IN
   DataB : IN std_logic_vector(NMemS DOWNTO 0); -- Dato de la caja B
	MemSource : IN std_logic; --Señal del Mux
   salidaMuxMemSource : OUT std_logic_vector(NMemS DOWNTO 0) --Salida del Mux
);
end component;	

component inUnity is 
port(
	--El switch 1 concatenado con el switch 2 dan el genotipo con el que se va a calcular la probabilidad. Ej: Aa, BB, cc, dD
	switch1 : in std_logic; --Genotipo de la izquierda
	switch2 : in std_logic; --Genotipo de la derecha
	dataToMem : out std_logic_vector(6 downto 0); -- Genotipo a guardar en memoria
	InS: in std_logic; -- Señal del IN
	Enter : in std_logic; --Botón del Enter
	led1 : out std_logic
);
end component;	  

component outUnity is
	port(
		Data : in std_logic_vector(6 downto 0); --Probabilidad
		seg1 : out std_logic_vector(6 downto 0); --Primer siete segmentos
		seg2 : out std_logic_vector(6 downto 0);--Segundo siete segmentos
		seg3: out std_logic_vector(6 downto 0); --Tercer siete segmentos
		OutS: in std_logic; --Señal del Out
		EnterOut : in std_logic;
		ledOut: out std_logic
		);
end component;
---------------Señales-----------------------
signal DatoRs: unsigned(8 downto 0);
signal DatoRd: unsigned (8 downto 0);
signal exA: std_logic_vector (8 downto 0);
signal exB: std_logic_vector (8 downto 0);
signal salidaMuxB: std_logic_vector (8 downto 0);
signal SalidaAlu: std_logic_vector (8 downto 0);
signal FlagJst: std_logic;
signal FlagJeq: std_logic;
signal AluOutSalida: std_logic_vector (8 downto 0);
signal salidaMuxReg: std_logic_vector (8 downto 0);
signal DatoRF: std_logic_vector (8 downto 0);
signal direccionRd: std_logic_vector (4 downto 0);
signal direccionRs: std_logic_vector (4 downto 0);
signal inm: std_logic_vector (8 downto 0);
signal SignalOpcode: std_logic_vector (2 downto 0);
signal instrROM : std_logic_vector (21 downto 0);
signal Address: std_logic_vector(8 downto 0);
signal reset: std_logic := '1';
signal salidaMuxPc: std_logic_Vector(8 downto 0) := "000000000";
signal salidaSumador: std_logic_Vector(8 downto 0);
signal salidaAndEq: std_logic;
signal salidaAndSt: std_logic;
signal salidaOr: std_logic;
signal SignalPcWrite: std_logic;
signal datoRAM: std_logic_vector (8 downto 0);
signal salidaMuxMemSource: std_logic_vector (6 downto 0);
signal salidaIn: std_logic_vector (6 downto 0);
-----------------Unidad de Control-------------------------
signal AluOp: std_logic_vector (1 downto 0);	
signal SignalMuxpc: std_logic;
signal SignalPCWriteSig: std_logic;
signal SignalJeq: std_logic;
signal SignalJst: std_logic;
signal SignalmemRead: std_logic;
signal SignalmemWrite: std_logic;
signal SignalAluSrcB : std_logic;
signal signalRFWrite: std_logic;
signal SignalEnAlu: std_logic;
signal SignalMemToReg: std_logic;
signal SignalirWrite: std_logic;
signal signalMemSource: std_logic;
signal signalIn: std_logic;
signal signalOut: std_logic;
			


begin
MapUnidadControl: UnidadControl port map (
	Clk => Clock,
	Rst => reset,
	Opcode => SignalOpcode,
	PCWrite => SignalPCWriteSig,
	PCSource => SignalMuxpc,
	IRWrite => SignalirWrite,
	MemRead => SignalmemRead,
	MemWrite => SignalmemWrite,
	MemSource => signalMemSource,
	MemtoReg => SignalMemToReg,
	RegWrite => SignalRFWrite,
	AluSrcB => SignalAluSrcB,
	Jst => SignalJst,
	Jeq => SignalJeq,
	Aluop => AluOp,
	InS => signalIn,
	OutS => signalOut,
	pulsador => botonEnter,
	led2 => SignalLedWaitIn,
	led3 => SignalReset,
	estadoActual => estadoActualSist,
	enAlu => SignalEnAlu
);

MapOrPc : GateOrPCWrite 
port map(
	OpOr => salidaOr,
	PCWrite=> SignalPCWriteSig,
	PCWriteSignal=> SignalPcWrite
);
MapAndJeq: GateAndEq 
port map( 
	Jeq => SignalJeq,
	FlagJeq=>FlagJeq,
	OpAndEq=> salidaAndEq
);

MapAndJst: GateAndSt 
port map(
	Jst=> SignalJst,
	FlagJst=> FlagJst,
	OpAndSt=> salidaAndSt
);

MapOr: GateOr 
port map(
	OpOr=> salidaOr,
	OpAndEq=> salidaAndEq,
	OpAndSt=> salidaAndSt
);


MapMuxpcsource: muxPCSource generic map(
	NmuxPC => BusDatos
)
 port map(
	address=>inm,
	pc_a=>salidaSumador,
	sel=>SignalMuxpc,
   salidaMuxPCSource=>salidaMuxPc 
);


MapSumador: sumadorPC
port map(
	pc => Address,
   suma => salidaSumador
);

MapPc: programCounter
port map(
	clk => Clock,
	salidamux => salidaMuxPc,
	pcwrite => SignalPcWrite,
	pcout => Address,
	rst => reset
);
MapRom: rom 
port map(
	data_out => instrROM,
	address => to_integer(unsigned(Address))
);

MapRF: RF generic map (
	BusRF => BusRegister,
	BusE => BusDatos
	)
	port map (
		RdD => direccionRd,
		RsD => direccionRs,
		Clk => Clock,
		DataToSave => datoRF,
		DataOutA => DatoRs,
		DataOutB => DatoRd,
		RegWrite => signalRFWrite
	);

MapboxA : boxA generic map (
	NA => BusDatos
	)
	port map (
		clk => Clock,
		RsData => DatoRs,
		ExitA => exA
	);

MapboxB : boxB generic map (
	NB => BusDatos
	)
	port map (
		clk => Clock,
		RdData => DatoRd,
		ExitB => exB
	);

MapAluSrcB: muxAluSrcB generic map (
	NAluB =>  BusDatos
	)
	port map (
		DataB => exB,
		Cte => inm,
		AluSrcB =>SignalAluSrcB,
		salidamuxAluSrcB => salidaMuxB
	);

MapALU : ALU generic map (
	wBus => BusDatos
	)
	port map (
	ALU_OP =>AluOp,
	A => exA,
	B => salidaMuxB,
	result => SalidaAlu,
	stFlag => FlagJst,
	eqFlag => FlagJeq
	);
	
MapAluOut: AluOut generic map (
	NAlu => BusDatos
	)
	port map (
	AluOutOp => salidaAlu,
	ExitAluOut => AluOutSalida,
	EnableAlu => SignalEnAlu,
	Clk => Clock
	);

MapMemToReg: muxMemToReg generic map (
	NM => BusDatos
	)
	port map (
	DataMem => DatoRAM,
   regmem => AluOutSalida,
	Memtoreg =>SignalMemToReg,
	salidaMuxMemToReg =>datoRF
	);

MapIR: ir port map (
	clock => Clock,
	instruccion => instrROM,
	irWriteSignal => SignalirWrite,
	opcode => SignalOpcode,
	Rd => direccionRd,
	Rs => direccionRs,
	inmediato => inm
	);

MapRam: ram port map (
	clk => Clock,
	memRead => SignalmemRead,
	memWrite => SignalmemWrite,
	data_in => salidaMuxMemSource,
	address_in => to_integer(unsigned(SalidaAlu(3 downto 0))),
	data_out => DatoRAM,
	ledSi => signalLedSi,
	ledNo => signalLedNo
	);

MapmuxRam: muxMemSource generic map (
	NMemS => BusRam
)

 port map (
	Entry => salidaIn,
   DataB => exB (6 downto 0),
	MemSource => signalMemSource,
   salidaMuxMemSource => salidaMuxMemSource
);

MapIn: inUnity port map (
	switch1 => sw1,
	switch2 => sw2,
	dataToMem => salidaIn,
	InS => signalIn,
	Enter => botonEnter,
	led1 => signalLedIn
);

MapOut: outUnity port map (
	Data => DatoRAM (6 downto 0),
	seg1 => seg1,
	seg2 => seg2,
	seg3 => seg3,
	OutS => signalOut,
	EnterOut => botonEnter,
	ledOut => signalLedOut
);


	salidaRam <= DatoRAM;
	dirRam <= SalidaAlu(3 downto 0);
	datoInRam <= salidaMuxMemSource;
	--datoInRam <= exB(6 downto 0);
	dirRd <= direccionRd;
	dirRs <= direccionRs;
	dataOutA <= DatoRs;
	dataOutB <= DatoRd;
	cajaA <= exA;
	cajaB <= exB;
	salidaMultiplexorB <= salidaMuxB;
	resultadoAlu <= SalidaAlu;
	salidaAluOut <= AluOutSalida;
	salidaMultiplexorReg <= datoRF;
	inmediato <= inm;
	salidaRom <= instrROM;

end architecture;