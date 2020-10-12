library verilog;
use verilog.vl_types.all;
entity main is
    port(
        Clock           : in     vl_logic;
        dataOutA        : out    vl_logic_vector(8 downto 0);
        dataOutB        : out    vl_logic_vector(8 downto 0);
        cajaA           : out    vl_logic_vector(8 downto 0);
        cajaB           : out    vl_logic_vector(8 downto 0);
        inmediato       : out    vl_logic_vector(8 downto 0);
        ResultadoAlu    : out    vl_logic_vector(8 downto 0);
        salidaMultiplexorB: out    vl_logic_vector(8 downto 0);
        salidaAluOut    : out    vl_logic_vector(8 downto 0);
        salidaMultiplexorReg: out    vl_logic_vector(8 downto 0);
        dirRd           : out    vl_logic_vector(4 downto 0);
        dirRs           : out    vl_logic_vector(4 downto 0);
        salidaRom       : out    vl_logic_vector(21 downto 0);
        SignalLedSi     : out    vl_logic;
        SignalLedNo     : out    vl_logic;
        dirRam          : out    vl_logic_vector(3 downto 0);
        datoInRam       : out    vl_logic_vector(6 downto 0);
        salidaRam       : out    vl_logic_vector(8 downto 0);
        sw1             : in     vl_logic;
        sw2             : in     vl_logic;
        botonEnter      : in     vl_logic;
        signalLedIn     : out    vl_logic;
        signalLedOut    : out    vl_logic;
        seg0            : out    vl_logic_vector(6 downto 0);
        seg1            : out    vl_logic_vector(6 downto 0);
        seg2            : out    vl_logic_vector(6 downto 0);
        seg3            : out    vl_logic_vector(6 downto 0);
        SignalLedWaitIn : out    vl_logic;
        SignalReset     : out    vl_logic;
        estadoActualSist: out    vl_logic_vector(3 downto 0)
    );
end main;
