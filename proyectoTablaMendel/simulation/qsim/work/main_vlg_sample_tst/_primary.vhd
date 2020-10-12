library verilog;
use verilog.vl_types.all;
entity main_vlg_sample_tst is
    port(
        botonEnter      : in     vl_logic;
        Clock           : in     vl_logic;
        sw1             : in     vl_logic;
        sw2             : in     vl_logic;
        sampler_tx      : out    vl_logic
    );
end main_vlg_sample_tst;
