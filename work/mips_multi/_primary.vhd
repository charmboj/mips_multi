library verilog;
use verilog.vl_types.all;
entity mips_multi is
    port(
        clk             : in     vl_logic;
        reset           : in     vl_logic;
        pc              : out    vl_logic_vector(31 downto 0);
        instr           : in     vl_logic_vector(31 downto 0);
        mem_write       : out    vl_logic;
        alu_out         : out    vl_logic_vector(31 downto 0);
        write_data      : out    vl_logic_vector(31 downto 0);
        read_data       : in     vl_logic_vector(31 downto 0)
    );
end mips_multi;
