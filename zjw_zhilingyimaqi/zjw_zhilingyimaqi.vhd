library ieee;
use ieee.std_logic_1164.all;
entity zjw_zhilingyimaqi is
port(
	SM,RWBA1,RWBA0,RAA1,RAA0:in std_logic;
	IR1:in std_logic_vector(3 downto 0);
	MOVA,MOVB,MOVC,ADD,SUB,OR1,NOT1,RSR,RSL,JMP,JZ,JC,IN1,OUT1,NOP,HALT:out std_logic
);
end entity zjw_zhilingyimaqi;

architecture pp of zjw_zhilingyimaqi is
signal R1:std_logic_vector(1 downto 0);
signal R2:std_logic_vector(1 downto 0);
begin
	R1<=RWBA1&RWBA0;
	R2<=RAA1&RAA0;
	process(SM,IR1,R1,R2)
	begin
		MOVA<='0';
		MOVB<='0';
		MOVC<='0';
		ADD<='0';
		SUB<='0';
		OR1<='0';
		NOT1<='0';
		RSR<='0';
		RSL<='0';
		JMP<='0';
		JZ<='0';
		JC<='0';
		IN1<='0';
		OUT1<='0';
		NOP<='0';
		HALT<='0';
		if(SM='1') then
			if(IR1="1111") then
				if(R1="11") then
					MOVB<='1';
				elsif (R2="11") then
					MOVC<='1';
				else
					MOVA<='1';
				end if;
			elsif(IR1="1001") then
				ADD<='1';
			elsif(IR1="0110") then
				SUB<='1';
			elsif(IR1="1011") then
				OR1<='1';
			elsif(IR1="0101") then
				NOT1<='1';
			elsif(IR1="1010") then
				if(R2="00")then
					RSR<='1';
				elsif(R2="11")then
					RSL<='1';
				end if;
			elsif(IR1="0001" and R1="00")then
				if(R2="00") then
					JMP<='1';
				elsif(R2="01") then
					JZ<='1';
				elsif(R2="10") then
					JC<='1';
				end if;
			elsif(IR1="0010") then
				IN1<='1';
			elsif(IR1="0100") then
				OUT1<='1';
			elsif(IR1="0111") then
				NOP<='1';
			elsif(IR1="1000") then
				HALT<='1';
			end if;
		end if;
	end process;
end architecture pp;