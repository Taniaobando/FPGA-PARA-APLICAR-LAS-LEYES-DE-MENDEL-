library verilog;
use verilog.vl_types.all;
entity RF_vlg_sample_tst is
    port(
        Clk             : in     vl_logic;
        DataToSave      : in     vl_logic_vector(8 downto 0);
        RdD             : in     vl_logic_vector(4 downto 0);
        RegWrite        : in     vl_logic;
        RsD             : in     vl_logic_vector(4 downto 0);
        sampler_tx      : out    vl_logic
    );
end RF_vlg_sample_tst;
