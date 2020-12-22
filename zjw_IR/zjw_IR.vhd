library ieee;
use ieee.std_logic_1164.all;
entity zjw_IR is
port(
	BUScin:in std_logic_vector(7 downto 0);
	LDIR,clk,reset:in std_logic;
	S:out std_logic_vector(3 downto 0);
	RWBA1,RWBA0,RAA1,RAA0:out std_logic
);
end zjw_IR;
architecture peight of zjw_IR is
signal Q:std_logic_vector(7 downto 0);
begin
	process(LDIR,clk,reset)
	begin
		if(reset='0')then
			Q<="00000000";
		elsif(clk'event and clk='1')then
			if(LDIR='1')then
				Q<=BUScin;
			end if;
		end if;
	end process;
	S<=Q(7 downto 4);
	RWBA1<=Q(3);
	RWBA0<=Q(2);
	RAA1<=Q(1);
	RAA0<=Q(0);
end peight;