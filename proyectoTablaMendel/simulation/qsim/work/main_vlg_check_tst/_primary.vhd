library verilog;
use verilog.vl_types.all;
entity main_vlg_check_tst is
    port(
        cajaA           : in     vl_logic_vector(8 downto 0);
        cajaB           : in     vl_logic_vector(8 downto 0);
        dataOutA        : in     vl_logic_vector(8 downto 0);
        dataOutB        : in     vl_logic_vector(8 downto 0);
        datoInRam       : in     vl_logic_vector(6 downto 0);
        dirRam          : in     vl_logic_vector(3 downto 0);
        dirRd           : in     vl_logic_vector(4 downto 0);
        dirRs           : in     vl_logic_vector(4 downto 0);
        estadoActualSist: in     vl_logic_vector(3 downto 0);
        inmediato       : in     vl_logic_vector(8 downto 0);
        ResultadoAlu    : in     vl_logic_vector(8 downto 0);
        salidaAluOut    : in     vl_logic_vector(8 downto 0);
        salidaMultiplexorB: in     vl_logic_vector(8 downto 0);
        salidaMultiplexorReg: in     vl_logic_vector(8 downto 0);
        salidaRam       : in     vl_logic_vector(8 downto 0);
        salidaRom       : in     vl_logic_vector(21 downto 0);
        seg0            : in     vl_logic_vector(6 downto 0);
        seg1            : in     vl_logic_vector(6 downto 0);
        seg2            : in     vl_logic_vector(6 downto 0);
        seg3            : in     vl_logic_vector(6 downto 0);
        signalLedIn     : in     vl_logic;
        SignalLedNo     : in     vl_logic;
        signalLedOut    : in     vl_logic;
        SignalLedSi     : in     vl_logic;
        SignalLedWaitIn : in     vl_logic;
        SignalReset     : in     vl_logic;
        sampler_rx      : in     vl_logic
    );
end main_vlg_check_tst;
