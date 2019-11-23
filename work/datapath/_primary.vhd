library verilog;
use verilog.vl_types.all;
entity datapath is
    port(
        clk             : in     vl_logic;
        reset           : in     vl_logic;
        pc_en           : in     vl_logic;
        i_or_d          : in     vl_logic;
        ir_write        : in     vl_logic;
        reg_dst         : in     vl_logic;
        mem_to_reg      : in     vl_logic;
        reg_write       : in     vl_logic;
        alu_src_a       : in     vl_logic;
        alu_src_b       : in     vl_logic_vector(1 downto 0);
        alu_control     : in     vl_logic_vector(2 downto 0);
        pc_src          : in     vl_logic_vector(1 downto 0);
        read_data       : in     vl_logic_vector(31 downto 0);
        op              : out    vl_logic_vector(5 downto 0);
        funct           : out    vl_logic_vector(5 downto 0);
        zero            : out    vl_logic;
        adr             : out    vl_logic_vector(5 downto 0);
        write_data      : out    vl_logic_vector(31 downto 0)
    );
end datapath;
