LIBRARY ieee;
USE ieee.std_logic_1164.all;

ENTITY LAB3 IS
	PORT(
		clock, reset : IN std_logic;
		display1_o : OUT std_logic_vector(7 DOWNTO 0)
	);
END LAB3;

ARCHITECTURE STRUCTURE OF LAB3 IS

	COMPONENT Lab3_sys IS
		PORT (
			clk_clk           : in  std_logic                    := 'X'; -- clk
			reset_reset_n     : in  std_logic                    := 'X'; -- reset_n
			seven_segs_export : out std_logic_vector(3 downto 0)         -- export
		);
	END COMPONENT Lab3_sys;
	
	COMPONENT Display IS
		PORT(
		dsp_i : IN std_logic_vector(3 DOWNTO 0);
		dsp_o : OUT std_logic_vector(7 DOWNTO 0)
	);
	END COMPONENT Display;

		
	--SIGNAL DECLARATION
	signal dataTo7seg : std_logic_vector(3 DOWNTO 0);
	
	--INSTANTIATION AND WIRING	
	BEGIN
		Lab3_sys_inst : Lab3_sys PORT MAP(clock, reset, dataTo7seg) ;
		Display1 : Display PORT MAP(datato7seg, display1_o);
END STRUCTURE;