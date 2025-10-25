library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use ieee.std_logic_unsigned.all;
entity top_module is
	GENERIC (N : INTEGER :=16; m : INTEGER :=14; S : INTEGER :=4);
	PORT( clk : in std_logic;
			en: inout std_LOGIC_VECTOR(0 downto 0);
			key: inout STD_LOGIC;
			r: inout std_logic
	);
end top_module;
 
architecture Behav of top_module is
--------------------------------------------------- Component definitions -------------------------------------------
component ande port(i1,i2 : in std_logic; o1: out std_logic);
end component;

component inverse Port ( i1 : in  std_logic; o1 : out std_logic);
end component;

component mux GENERIC (N : INTEGER :=8; S : INTEGER :=3);
PORT (Sel : IN STD_LOGIC_Vector(S-1 downto 0); din : IN STD_LOGIC_Vector(0 to n-1);dout : OUT STD_LOGIC );
END component;

component my_COMPARE GENERIC (m : INTEGER :=12; s : INTEGER :=3);
port( clk : in STD_LOGIC; A, B : in STD_LOGIC_VECTOR(m-1 downto 0); t_valid : out STD_LOGIC; rsp_key: out STD_LOGIC; rsp : out std_logic);
end component;

component my_counter GENERIC (m : INTEGER :=12; s : INTEGER :=3);
port ( enable : in STD_LOGIC; reset : in STD_LOGIC; Clk : in STD_LOGIC; qout :out  STD_LOGIC_VECTOR(m-1 downto 0);valid : out STD_LOGIC );
end component;

component sbox16_0 port ( din  : in  std_logic_vector(0 to 55); dout : out std_logic_vector(0 to 47));
end component;

component sbox16_1 port ( din  : in  std_logic_vector(0 to 71); dout : out std_logic_vector(0 to 71));
end component;

component sbox16_2 port ( din  : in  std_logic_vector(0 to 47); dout : out std_logic_vector(0 to 55));
end component;

component input port (en : in STD_LOGIC;clk : in STD_LOGIC;t_valid : in STD_LOGIC;cin: out STD_LOGIC_VECTOR(7 downto 0);t_validq_d : out STD_LOGIC);
end component;

component icon_1 port ( CONTROL0 : INOUT std_logic_vector(35 downto 0); CONTROL1 : INOUT std_logic_vector(35 downto 0));
end component;

component vi0 port ( CONTROL : INOUT std_logic_vector(35 downto 0); ASYNC_IN : in  std_logic_vector(29 downto 0); ASYNC_OUT : out STD_LOGIC_VECTOR(0 downto 0));
end component;

component ILA port(CONTROL:INOUT std_logic_vector(35 downto 0);CLK :in  std_logic;TRIG0: in  std_logic_vector(0 downto 0);TRIG1: in  std_logic_vector(0 downto 0);TRIG2: in  std_logic_vector(13 downto 0);TRIG3: in  std_logic_vector(13 downto 0);TRIG4: in  std_logic_vector(7 downto 0);TRIG5: in  std_logic_vector(0 downto 0));
end component;

--------------------------------------------------- attribute definitions -------------------------------------------
attribute LOC : string;
attribute LOC of mux0 : label is "SLICE_X6Y8";
attribute LOC of mux1 : label is "SLICE_X6Y10";
attribute LOC of v0 : label is "SLICE_X8Y8 SLICE_X8Y10";
attribute LOC of cnt0 : label is "SLICE_X20Y6 SLICE_X20Y7 SLICE_X20Y8 SLICE_X20Y9 SLICE_X20Y10 SLICE_X20Y11 SLICE_X20Y12 SLICE_X20Y13 SLICE_X20Y14 SLICE_X20Y15 SLICE_X20Y16";
attribute LOC of cnt1 : label is "SLICE_X22Y6 SLICE_X22Y7 SLICE_X22Y8 SLICE_X22Y9 SLICE_X22Y10 SLICE_X22Y11 SLICE_X22Y12 SLICE_X22Y13 SLICE_X22Y14 SLICE_X22Y15 SLICE_X22Y16";

attribute LOC of i0 : label is "SLICE_X1Y5";		attribute LOC of i5 : label is "SLICE_X1Y5";		attribute LOC of i10 : label is "SLICE_X1Y5";	attribute LOC of i15 : label is "SLICE_X1Y5";
attribute LOC of i20 : label is "SLICE_X0Y5";	attribute LOC of i25 : label is "SLICE_X0Y5";	attribute LOC of i30 : label is "SLICE_X0Y5";   attribute LOC of i35 : label is "SLICE_X0Y5";
attribute LOC of i1 : label is "SLICE_X4Y5";    attribute LOC of i2 : label is "SLICE_X4Y5";    attribute LOC of i3 : label is "SLICE_X4Y5";    attribute LOC of i4 : label is "SLICE_X4Y5";
attribute LOC of i6 : label is "SLICE_X5Y5";    attribute LOC of i7 : label is "SLICE_X5Y5";    attribute LOC of i8 : label is "SLICE_X5Y5";    attribute LOC of i9 : label is "SLICE_X5Y5";
attribute LOC of i11 : label is "SLICE_X4Y4";   attribute LOC of i12 : label is "SLICE_X4Y4";   attribute LOC of i13 : label is "SLICE_X4Y4";   attribute LOC of i14 : label is "SLICE_X4Y4";
attribute LOC of i16 : label is "SLICE_X5Y4";   attribute LOC of i17 : label is "SLICE_X5Y4";   attribute LOC of i18 : label is "SLICE_X5Y4";   attribute LOC of i19 : label is "SLICE_X5Y4";
attribute LOC of i21 : label is "SLICE_X6Y5";	attribute LOC of i22 : label is "SLICE_X6Y5";	attribute LOC of i23 : label is "SLICE_X6Y5";	attribute LOC of i24 : label is "SLICE_X6Y5";
attribute LOC of i26 : label is "SLICE_X7Y5";	attribute LOC of i27 : label is "SLICE_X7Y5";	attribute LOC of i28 : label is "SLICE_X7Y5";	attribute LOC of i29 : label is "SLICE_X7Y5";
attribute LOC of i31 : label is "SLICE_X6Y4";	attribute LOC of i32 : label is "SLICE_X6Y4";	attribute LOC of i33 : label is "SLICE_X6Y4";	attribute LOC of i34 : label is "SLICE_X6Y4";
attribute LOC of i36 : label is "SLICE_X7Y4";	attribute LOC of i37 : label is "SLICE_X7Y4";	attribute LOC of i38 : label is "SLICE_X7Y4";	attribute LOC of i39 : label is "SLICE_X7Y4";

attribute LOC of i40 : label is "SLICE_X0Y2";	attribute LOC of i45 : label is "SLICE_X0Y2";	attribute LOC of i50 : label is "SLICE_X0Y2";	attribute LOC of i55 : label is "SLICE_X0Y2";
attribute LOC of i60 : label is "SLICE_X1Y2";	attribute LOC of i65 : label is "SLICE_X1Y2";	attribute LOC of i70 : label is "SLICE_X1Y2";   attribute LOC of i75 : label is "SLICE_X1Y2";
attribute LOC of i41 : label is "SLICE_X4Y2";   attribute LOC of i42 : label is "SLICE_X4Y2";   attribute LOC of i43 : label is "SLICE_X4Y2";   attribute LOC of i44 : label is "SLICE_X4Y2";
attribute LOC of i46 : label is "SLICE_X5Y2";   attribute LOC of i47 : label is "SLICE_X5Y2";   attribute LOC of i48 : label is "SLICE_X5Y2";   attribute LOC of i49 : label is "SLICE_X5Y2";
attribute LOC of i51 : label is "SLICE_X4Y3";   attribute LOC of i52 : label is "SLICE_X4Y3";   attribute LOC of i53 : label is "SLICE_X4Y3";   attribute LOC of i54 : label is "SLICE_X4Y3";
attribute LOC of i56 : label is "SLICE_X5Y3";   attribute LOC of i57 : label is "SLICE_X5Y3";   attribute LOC of i58 : label is "SLICE_X5Y3";   attribute LOC of i59 : label is "SLICE_X5Y3";
attribute LOC of i61 : label is "SLICE_X6Y2";	attribute LOC of i62 : label is "SLICE_X6Y2";	attribute LOC of i63 : label is "SLICE_X6Y2";	attribute LOC of i64 : label is "SLICE_X6Y2";
attribute LOC of i66 : label is "SLICE_X7Y2";	attribute LOC of i67 : label is "SLICE_X7Y2";	attribute LOC of i68 : label is "SLICE_X7Y2";	attribute LOC of i69 : label is "SLICE_X7Y2";
attribute LOC of i71 : label is "SLICE_X6Y3";	attribute LOC of i72 : label is "SLICE_X6Y3";	attribute LOC of i73 : label is "SLICE_X6Y3";	attribute LOC of i74 : label is "SLICE_X6Y3";
attribute LOC of i76 : label is "SLICE_X7Y3";	attribute LOC of i77 : label is "SLICE_X7Y3";	attribute LOC of i78 : label is "SLICE_X7Y3";	attribute LOC of i79 : label is "SLICE_X7Y3";

--------------------------------------------------- Signal definitions -------------------------------------------
signal v : std_logic_vector(0 to 79);
signal k : std_logic_vector(0 to 79);
signal f : std_logic_vector(0 to 15);
signal c1,c2 : std_logic;
signal p1,p2 : STD_LOGIC_VECTOR(m-1 downto 0);
signal w1 : std_logic_vector(0 to 15);
signal w2 : std_logic_vector(0 to 15);
signal w3 : std_logic_vector(0 to 23);
signal w4 : std_logic_vector(0 to 23);
signal w5 : std_logic_vector(0 to 15);

signal reset1 :std_logic ;
signal reset2 :std_logic ;
signal valid1 :std_logic ;
signal valid2 :std_logic ;
signal t_validq_dd :std_logic ;
signal t_valid :std_logic ;
signal cin : std_logic_vector(7 downto 0);

signal CONTROL0 : std_logic_vector(35 downto 0);
signal CONTROL1 : std_logic_vector(35 downto 0);
signal rr :std_logic_vector(0 downto 0) ;
signal rrr :std_logic_vector(29 downto 0);
signal rst :std_logic_vector(0 downto 0) ;
signal key_y :std_logic_vector(0 downto 0) ;

begin
reset1 <= t_validq_dd ;
reset2 <= t_validq_dd ;
rrr <=key&r&p2&p1;

i0 : inverse Port map  (v(0), k(0));      i1 : inverse Port map (v(1), k(1));       i2 : inverse Port map (v(2), k(2));       i3 : inverse Port map (v(3), k(3));       i4 : inverse Port map (v(4), k(4));       i5 : inverse Port map (v(5), k(5));       i6 : inverse Port map (v(6), k(6));       i7 : inverse Port map (v(7), k(7));
i8 : inverse Port map  (v(8), k(8));      i9 : inverse Port map (v(9), k(9));       i10 : inverse Port map (v(10), k(10));    i11 : inverse Port map (v(11), k(11));    i12 : inverse Port map (v(12), k(12));    i13 : inverse Port map (v(13), k(13));    i14 : inverse Port map (v(14), k(14));    i15 : inverse Port map (v(15), k(15));
i16 : inverse Port map (v(16), k(16));	   i17 : inverse Port map (v(17), k(17));		i18 : inverse Port map (v(18), k(18));	   i19 : inverse Port map (v(19), k(19));	   i20 : inverse Port map (v(20), k(20));	   i21 : inverse Port map (v(21), k(21));	   i22 : inverse Port map (v(22), k(22));	   i23 : inverse Port map (v(23), k(23));  
i24 : inverse Port map (v(24), k(24));	   i25 : inverse Port map (v(25), k(25));	   i26 : inverse Port map (v(26), k(26));	   i27 : inverse Port map (v(27), k(27));	   i28 : inverse Port map (v(28), k(28));	   i29 : inverse Port map (v(29), k(29));	   i30 : inverse Port map (v(30), k(30));	   i31 : inverse Port map (v(31), k(31));
i32 : inverse Port map (v(32), k(32));	   i33 : inverse Port map (v(33), k(33));	   i34 : inverse Port map (v(34), k(34));	   i35 : inverse Port map (v(35), k(35));	   i36 : inverse Port map (v(36), k(36));	   i37 : inverse Port map (v(37), k(37));	   i38 : inverse Port map (v(38), k(38));	   i39 : inverse Port map (v(39), k(39));

i40 : inverse Port map  (v(40), k(40));   i41 : inverse Port map (v(41), k(41));    i42 : inverse Port map (v(42), k(42));    i43 : inverse Port map (v(43), k(43));    i44 : inverse Port map (v(44), k(44));    i45 : inverse Port map (v(45), k(45));    i46 : inverse Port map (v(46), k(46));    i47 : inverse Port map (v(47), k(47));
i48 : inverse Port map  (v(48), k(48));   i49 : inverse Port map (v(49), k(49));    i50 : inverse Port map (v(50), k(50));    i51 : inverse Port map (v(51), k(51));    i52 : inverse Port map (v(52), k(52));    i53 : inverse Port map (v(53), k(53));    i54 : inverse Port map (v(54), k(54));    i55 : inverse Port map (v(55), k(55));
i56 : inverse Port map (v(56), k(56));	   i57 : inverse Port map (v(57), k(57));		i58 : inverse Port map (v(58), k(58));	   i59 : inverse Port map (v(59), k(59));	   i60 : inverse Port map (v(60), k(60));	   i61 : inverse Port map (v(61), k(61));	   i62 : inverse Port map (v(62), k(62));	   i63 : inverse Port map (v(63), k(63));  
i64 : inverse Port map (v(64), k(64));	   i65 : inverse Port map (v(65), k(65));	   i66 : inverse Port map (v(66), k(66));	   i67 : inverse Port map (v(67), k(67));	   i68 : inverse Port map (v(68), k(68));	   i69 : inverse Port map (v(69), k(69));	   i70 : inverse Port map (v(70), k(70));	   i71 : inverse Port map (v(71), k(71));
i72 : inverse Port map (v(72), k(72));	   i73 : inverse Port map (v(73), k(73));	   i74 : inverse Port map (v(74), k(74));	   i75 : inverse Port map (v(75), k(75));	   i76 : inverse Port map (v(76), k(76));	   i77 : inverse Port map (v(77), k(77));	   i78 : inverse Port map (v(78), k(78));	   i79 : inverse Port map (v(79), k(79));


s0: 	sbox16_0 port map (din(0)=> k(0),din(1)=>k(5),din(2)=>k(10),din(3)=>k(15),din(4)=>k(20),din(5)=>k(25),din(6)=>k(30),din(7)=>k(35),din(8)=> k(40),din(9)=>k(45),din(10)=>k(50),din(11)=>k(55),din(12)=>k(60),din(13)=>k(65),din(14)=>k(70),din(15)=>k(75),din(16 to 39)=>w3(0 to 23),din(40 to 55)=>w5(0 to 15),
								 dout(0)=>v(1),dout(1)=>v(2),dout(2)=>v(3),dout(3)=>v(4),dout(4)=>v(6),dout(5)=>v(7),dout(6)=>v(8),dout(7)=>v(9),dout(8)=>v(11),dout(9)=>v(12),dout(10)=>v(13),dout(11)=>v(14),dout(12)=>v(16),dout(13)=>v(17),dout(14)=>v(18),dout(15)=>v(19),
								 dout(16)=>v(41),dout(17)=>v(42),dout(18)=>v(43),dout(19)=>v(44),dout(20)=>v(46),dout(21)=>v(47),dout(22)=>v(48),dout(23)=>v(49),dout(24)=>v(51),dout(25)=>v(52),dout(26)=>v(53),dout(27)=>v(54),dout(28)=>v(56),dout(29)=>v(57),dout(30)=>v(58),dout(31)=>v(59),dout(32 to 47)=> w1(0 to 15));
								 
s1: 	sbox16_1 port map (din(0)=>k(1),din(1)=>k(2),din(2)=>k(3),din(3)=>k(4),din(4)=>k(6),din(5)=>k(7),din(6)=>k(8),din(7)=>k(9),din(8)=>k(11),din(9)=>k(12),din(10)=>k(13),din(11)=>k(14),din(12)=>k(16),din(13)=>k(17),din(14)=>k(18),din(15)=>k(19),
								 din(16)=>k(41),din(17)=>k(42),din(18)=>k(43),din(19)=>k(44),din(20)=>k(46),din(21)=>k(47),din(22)=>k(48),din(23)=>k(49),din(24)=>k(51),din(25)=>k(52),din(26)=>k(53),din(27)=>k(54),din(28)=>k(56),din(29)=>k(57),din(30)=>k(58),din(31)=>k(59),din(32 to 47)=>w1(0 to 15),din(48 to 71)=>w4(0 to 23),
								 dout(0)=>v(21),dout(1)=>v(22),dout(2)=>v(23),dout(3)=>v(24),dout(4)=>v(26),dout(5)=>v(27),dout(6)=>v(28),dout(7)=>v(29),dout(8)=>v(31),dout(9)=>v(32),dout(10)=>v(33),dout(11)=>v(34),dout(12)=>v(36),dout(13)=>v(37),dout(14)=>v(38),dout(15)=>v(39),
								 dout(16)=>v(61),dout(17)=>v(62),dout(18)=>v(63),dout(19)=>v(64),dout(20)=>v(66),dout(21)=>v(67),dout(22)=>v(68),dout(23)=>v(69),dout(24)=>v(71),dout(25)=>v(72),dout(26)=>v(73),dout(27)=>v(74),dout(28)=>v(76),dout(29)=>v(77),dout(30)=>v(78),dout(31)=>v(79),dout(32 to 47)=> w2(0 to 15),dout(48 to 71)=> w3(0 to 23));
								 
s2: 	sbox16_2 port map (din(0)=>k(21),din(1)=>k(22),din(2)=>k(23),din(3)=>k(24),din(4)=>k(26),din(5)=>k(27),din(6)=>k(28),din(7)=>k(29),din(8)=>k(31),din(9)=>k(32),din(10)=>k(33),din(11)=>k(34),din(12)=>k(36),din(13)=>k(37),din(14)=>k(38),din(15)=>k(39),
								 din(16)=>k(61),din(17)=>k(62),din(18)=>k(63),din(19)=>k(64),din(20)=>k(66),din(21)=>k(67),din(22)=>k(68),din(23)=>k(69),din(24)=>k(71),din(25)=>k(72),din(26)=>k(73),din(27)=>k(74),din(28)=>k(76),din(29)=>k(77),din(30)=>k(78),din(31)=>k(79),din(32 to 47)=>w2(0 to 15),
								 dout(0 to 15)=>f(0 to 15),dout(16 to 39)=>w4(0 to 23),dout(40 to 55)=>w5(0 to 15));


a0to7: for u in 0 to 7 generate
		 attribute LOC of a : label is "SLICE_X2Y5";
				begin
				a: ande port map (en(0),f(u),v(u*5)); 
		 end generate;
		 
a8to15: for u in 8 to 15 generate
		 attribute LOC of a : label is "SLICE_X3Y2";
				begin
				a: ande port map (en(0),f(u),v(u*5)); 
		 end generate;		 

mux0: mux GENERIC map (N, S) PORT map (cin(3 downto 0), f(0 to 15),c1);
mux1: mux GENERIC map (N, S) PORT map (cin(7 downto 4), f(0 to 15),c2);

cnt0: my_counter GENERIC map (m, s) port map (c1,reset1,clk,p1,valid1);
cnt1: my_counter GENERIC map (m, s) port map (c2,reset2,clk,p2,valid2);

cm0: my_COMPARE GENERIC map (m,s) port map ( clk, p1, p2,t_valid,key,r);

v0: input port map(en(0),clk,t_valid,cin,t_validq_dd);

ic0: icon_1 port map (CONTROL0,CONTROL1);
vi00: vi0 port map ( CONTROL0 , rrr ,en );
rst(0) <= t_valid;
rr(0) <= r;
key_y(0) <= key;
IL0: ILA port map(CONTROL1,clk,rr,rst,p1,p2,cin,key_y);

end Behav;