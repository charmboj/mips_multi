library verilog;
use verilog.vl_types.all;
entity alu is
    port(
        src_a           : in     vl_logic_vector(31 downto 0);
        src_b           : in     vl_logic_vector(31 downto 0);
        alu_control     : in     vl_logic_vector(2 downto 0);
        zero            : out    vl_logic;
        alu_result      : out    vl_logic_vector(31 downto 0)
    );
end alu;
