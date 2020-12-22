library ieee;
use ieee.std_logic_1164.all;
use ieee.std_logic_unsigned.all;
entity zjw_PC is
port(
	LDPC,INPC,clk,reset:in std_logic;
	BUScin:in std_logic_vector(7 downto 0);
	PCout:out std_logic_vector(7 downto 0)
);
end zjw_PC;
architecture pfive of zjw_PC is
signal Q:std_logic_vector(7 downto 0);
begin
	process(clk,reset)
	begin
		if(reset='0')then
		Q<="00000000";
		elsif(clk'event and clk='1')then
			if(LDPC='1')then
			Q<=BUScin;
			elsif(INPC='1')then
			Q<=Q+1;
			end if;
		end if;
	end process;
	PCout<=Q;
end pfive;