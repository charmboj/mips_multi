library verilog;
use verilog.vl_types.all;
entity aludec is
    port(
        funct           : in     vl_logic_vector(5 downto 0);
        alu_op          : in     vl_logic_vector(1 downto 0);
        alu_control     : out    vl_logic_vector(2 downto 0)
    );
end aludec;
