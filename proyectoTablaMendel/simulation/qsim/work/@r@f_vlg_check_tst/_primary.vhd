library verilog;
use verilog.vl_types.all;
entity RF_vlg_check_tst is
    port(
        DataOutA        : in     vl_logic_vector(8 downto 0);
        DataOutB        : in     vl_logic_vector(8 downto 0);
        sampler_rx      : in     vl_logic
    );
end RF_vlg_check_tst;
