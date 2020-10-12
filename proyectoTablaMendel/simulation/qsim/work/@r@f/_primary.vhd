library verilog;
use verilog.vl_types.all;
entity RF is
    port(
        RdD             : in     vl_logic_vector(4 downto 0);
        RsD             : in     vl_logic_vector(4 downto 0);
        Clk             : in     vl_logic;
        DataToSave      : in     vl_logic_vector(8 downto 0);
        DataOutA        : out    vl_logic_vector(8 downto 0);
        DataOutB        : out    vl_logic_vector(8 downto 0);
        RegWrite        : in     vl_logic
    );
end RF;
