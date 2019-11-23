library verilog;
use verilog.vl_types.all;
entity controller is
    port(
        clk             : in     vl_logic;
        reset           : in     vl_logic;
        op              : in     vl_logic_vector(5 downto 0);
        funct           : in     vl_logic_vector(5 downto 0);
        zero            : in     vl_logic;
        i_or_d          : out    vl_logic;
        mem_write       : out    vl_logic;
        ir_write        : out    vl_logic;
        reg_dst         : out    vl_logic;
        mem_to_reg      : out    vl_logic;
        reg_write       : out    vl_logic;
        alu_src_a       : out    vl_logic;
        alu_src_b       : out    vl_logic_vector(1 downto 0);
        alu_control     : out    vl_logic_vector(2 downto 0);
        pc_src          : out    vl_logic_vector(1 downto 0);
        pc_en           : out    vl_logic
    );
end controller;
