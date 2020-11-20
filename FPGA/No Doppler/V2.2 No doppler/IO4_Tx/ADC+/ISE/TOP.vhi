
-- VHDL Instantiation Created from source file TOP.vhd -- 16:19:24 09/16/2015
--
-- Notes: 
-- 1) This instantiation template has been automatically generated using types
-- std_logic and std_logic_vector for the ports of the instantiated module
-- 2) To use this template to instantiate this entity, cut-and-paste and then edit

	COMPONENT TOP
	PORT(
		doclk : IN std_logic;
		dof_ff : IN std_logic_vector(5 downto 0);
		dof_af : IN std_logic_vector(5 downto 0);
		diclk : IN std_logic;
		dif_ef : IN std_logic_vector(5 downto 0);
		dif_ae : IN std_logic_vector(5 downto 0);
		di : IN std_logic_vector(31 downto 0);
		drdy : IN std_logic;
		adc_data : IN std_logic_vector(13 downto 0);
		adc_ovr : IN std_logic;
		config : IN std_logic;
		reset_pin : IN std_logic;
		osc0_pin : IN std_logic;
		osc1_pin : IN std_logic;
		osc2_pin : IN std_logic;
		osc3_pin : IN std_logic;
		clkin0 : IN std_logic;
		clkin1 : IN std_logic;
		clki2 : IN std_logic;
		clki3 : IN std_logic;
		gck2 : IN std_logic;
		gck3 : IN std_logic;
		cid : IN std_logic_vector(3 downto 0);
		mid : IN std_logic_vector(3 downto 0);
		addr_flagsel : IN std_logic;
		r1out : IN std_logic;
		r2out : IN std_logic;
		qttl : IN std_logic;    
		vpd : INOUT std_logic_vector(7 downto 0);
		vinit : INOUT std_logic;
		vcs : INOUT std_logic;
		vwrite : INOUT std_logic;
		vbusy : INOUT std_logic;
		digital_io : INOUT std_logic_vector(7 downto 0);
		umi : INOUT std_logic_vector(3 downto 0);      
		f0 : OUT std_logic;
		dof_wen : OUT std_logic_vector(5 downto 0);
		do : OUT std_logic_vector(31 downto 0);
		f1 : OUT std_logic;
		dif_ren : OUT std_logic_vector(5 downto 0);
		dif_oen : OUT std_logic_vector(5 downto 0);
		enc_p : OUT std_logic;
		enc_n : OUT std_logic;
		wrt0 : OUT std_logic;
		trig0 : OUT std_logic;
		daa : OUT std_logic_vector(13 downto 0);
		wrt1 : OUT std_logic;
		trig1 : OUT std_logic;
		dab : OUT std_logic_vector(13 downto 0);
		udpres : OUT std_logic;
		clkout : OUT std_logic;
		f2 : OUT std_logic;
		f3 : OUT std_logic;
		led : OUT std_logic_vector(4 downto 0);
		booten : OUT std_logic;
		t1in : OUT std_logic;
		t2in : OUT std_logic;
		rs485_232 : OUT std_logic;
		hdplx : OUT std_logic;
		fast : OUT std_logic;
		dttl : OUT std_logic
		);
	END COMPONENT;

	Inst_TOP: TOP PORT MAP(
		doclk => ,
		f0 => ,
		dof_ff => ,
		dof_af => ,
		dof_wen => ,
		do => ,
		diclk => ,
		f1 => ,
		dif_ef => ,
		dif_ae => ,
		dif_ren => ,
		dif_oen => ,
		di => ,
		vpd => ,
		vinit => ,
		vcs => ,
		vwrite => ,
		vbusy => ,
		drdy => ,
		enc_p => ,
		enc_n => ,
		adc_data => ,
		adc_ovr => ,
		wrt0 => ,
		trig0 => ,
		daa => ,
		wrt1 => ,
		trig1 => ,
		dab => ,
		config => ,
		reset_pin => ,
		udpres => ,
		osc0_pin => ,
		osc1_pin => ,
		osc2_pin => ,
		osc3_pin => ,
		clkin0 => ,
		clkin1 => ,
		clki2 => ,
		clki3 => ,
		clkout => ,
		gck2 => ,
		f2 => ,
		gck3 => ,
		f3 => ,
		led => ,
		digital_io => ,
		cid => ,
		mid => ,
		umi => ,
		addr_flagsel => ,
		booten => ,
		r1out => ,
		r2out => ,
		t1in => ,
		t2in => ,
		rs485_232 => ,
		hdplx => ,
		fast => ,
		qttl => ,
		dttl => 
	);


