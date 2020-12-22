library ieee;
use ieee.std_logic_1164.all;
entity zjw_SM is
port(
	clk,reset:in std_logic;
	SM:out std_logic
);
end zjw_SM;
architecture pfour of zjw_SM is
signal Q1:std_logic;
begin
	process(clk,reset)
	begin
		if(reset='0')then
			Q1<='0';
		elsif(clk'event and clk='0')then
			if(Q1='0')then
				Q1<='1';
			else
				Q1<='0';
			end if;
		end if;
	end process;
	SM<=Q1;
end pfour;