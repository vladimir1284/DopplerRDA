
-- VHDL Instantiation Created from source file HSB1.vhd -- 16:45:49 07/31/2012
--
-- Notes: 
-- 1) This instantiation template has been automatically generated using types
-- std_logic and std_logic_vector for the ports of the instantiated module
-- 2) To use this template to instantiate this entity, cut-and-paste and then edit

	COMPONENT HSB1
	PORT(
		RST : IN std_logic;
		CLK : IN std_logic;
		DIN : IN std_logic_vector(7 downto 0);
		ADDR : IN std_logic_vector(7 downto 0);
		AEN : IN std_logic;
		WEN : IN std_logic;
		REN : IN std_logic;
		DONE : IN std_logic;
		COUNT : IN std_logic;
		CLEAR : IN std_logic;          
		READY : OUT std_logic;
		SEND_MSG : OUT std_logic;
		CE : OUT std_logic;
		DOUT : OUT std_logic_vector(7 downto 0);
		SEND_ID : OUT std_logic;
		LAST_BYTE : OUT std_logic;
		INFIFO_SEL : OUT std_logic_vector(5 downto 0);
		OUTFIFO_SEL : OUT std_logic_vector(5 downto 0)
		);
	END COMPONENT;

	Inst_HSB1: HSB1 PORT MAP(
		RST => ,
		CLK => ,
		DIN => ,
		ADDR => ,
		AEN => ,
		WEN => ,
		REN => ,
		DONE => ,
		COUNT => ,
		CLEAR => ,
		READY => ,
		SEND_MSG => ,
		CE => ,
		DOUT => ,
		SEND_ID => ,
		LAST_BYTE => ,
		INFIFO_SEL => ,
		OUTFIFO_SEL => 
	);


