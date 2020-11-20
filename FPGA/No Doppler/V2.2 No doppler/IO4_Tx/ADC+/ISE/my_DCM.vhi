
-- VHDL Instantiation Created from source file my_DCM.vhd -- 11:18:51 09/26/2017
--
-- Notes: 
-- 1) This instantiation template has been automatically generated using types
-- std_logic and std_logic_vector for the ports of the instantiated module
-- 2) To use this template to instantiate this entity, cut-and-paste and then edit

	COMPONENT my_DCM
	PORT(
		CLKFB_IN : IN std_logic;
		CLKIN_IN : IN std_logic;
		RST_IN : IN std_logic;          
		CLKIN_IBUFG_OUT : OUT std_logic;
		CLK0_OUT : OUT std_logic;
		CLK2X_OUT : OUT std_logic;
		LOCKED_OUT : OUT std_logic
		);
	END COMPONENT;

	Inst_my_DCM: my_DCM PORT MAP(
		CLKFB_IN => ,
		CLKIN_IN => ,
		RST_IN => ,
		CLKIN_IBUFG_OUT => ,
		CLK0_OUT => ,
		CLK2X_OUT => ,
		LOCKED_OUT => 
	);


