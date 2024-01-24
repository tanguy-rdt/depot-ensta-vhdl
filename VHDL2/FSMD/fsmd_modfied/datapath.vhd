library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

entity datapath is 
port(
    clk, resset_n: in std_logic;
    alpha, beta, gama: in std_logic;
    cmd_0, cmd_1, cmd_2, cmd_3, cmd_4, cmd_5: in unsigned(3 downto 0);  
    res: out unsigned(7 downto 0);
);

architecture arch of datapath is 
    signal reg_0, reg_1, reg_2 : unsigned(7 downto 0);
    signal add, add_op1, add_op2: unsigned(7 downto 0);
    signal mul, mul_op1, mul_op2: unsigned(7 downto 0);
begin
    r0: process(reset_n, clk, alpha)
        if reset_n = '0' then 
            reg_0 <= '0';
            reg_1 <= '0';
            reg_2 <= '0';
        elsif rising_edge(clk) then 
            case cmd_0 is 
                when 0 => 
                    reg_0 <= reg_0;
                when 1 => 
                    reg_0 <= add;
                when 2 => 
                    reg_0 <= alpha;
                when others => 
                    null
            end case;
        end if;
    end process;

    r1: process(reset_n, clk, beta)
        if reset_n = '0' then 
            reg_1 <= '0';
            reg_1 <= '0';
            reg_1 <= '0';
        elsif rising_edge(clk) then 
            case cmd_1 is 
                when 0 => 
                    reg_1 <= beta;
                when 1 => 
                    reg_1 <= add;
                when 2 => 
                    reg_1 <= reg_1;
                when others => 
                    null
            end case;
        end if;
    end process;


    r2: process(reset_n, clk, gama)
        if reset_n = '0' then 
            reg_2 <= '0';
            reg_2 <= '0';
        elsif rising_edge(clk) then 
            case cmd_2 is 
                when 0 => 
                    reg_2 <= gama;
                when 1 => 
                    reg_2 <= mul;
                when others => 
                    null
            end case;
        end if;
    end process;

    add: process()
        case cmd_3 is
            when 0 => 
                add_op1 <= reg_2;
            when 1 => 
                add_op1 <= reg_1;
            when 2 => 
                add_op1 w= reg_0;
            when others => 
                null;
        end case; 

        case cmd_4 is 
            when 0 => 
                add_op2 <= reg_2;
            when 1 => 
                add_op2 <= reg_1;
            when others => 
                null;
        end case;

        add <= add_op1 + add_op2;
    end process;

    mul: process()
        case cmd_4 is
            when 0 => 
                mul_op1 <= reg_0;
            when 1 => 
                mul_op1 <= reg_1;
            when others => 
                null;
        end case; 

        case cmd_5 is 
            when 0 => 
                mul_op2 <= reg_2;
            when 1 => 
                mul_op2 <= reg_1;
            when others => 
                null;
        end case;

        mul <= resize(mul_op1 + mul_op2, 32);
    end process;
end arch;
            






        
