library ieee;
use ieee.std_logic_1164.all;
use ieee.std_logic_unsigned.all;
use ieee.std_logic_arith.all;
entity zjw_ALU_yiweiluoji is
port(
	R1,R2:in std_logic_vector(7 downto 0);
	S:in std_logic_vector(3 downto 0);
	M,FBUS,FLBUS,FRBUS:in std_logic;
	Q:out std_logic_vector(7 downto 0);
	C,Z:out std_logic
);
end entity zjw_ALU_yiweiluoji;
architecture pten of zjw_ALU_yiweiluoji is
signal ZZ:std_logic_vector(8 downto 0);
begin
	process(S,R1,R2,FBUS)
	begin
		if(M='1')then
			if(S="1011") then--OR
				ZZ<='0'&(R1 or R2);
			elsif(S="0101") then--NOT
				ZZ<='0'&not(R1);
			end if;
			if(S="1001") then--ADD
				ZZ<=('0'&R1)+('0'&R2);
			elsif(S="0110") then--SUB
				ZZ<=('0'&R1)-('0'&R2);
			end if;
		elsif(FBUS='1')then
			if(FRBUS='1')then--RSR
				ZZ<=R1(0)&'0'&R1(7 downto 1);
			elsif(FLBUS='1')then--RSL
				ZZ<=R1&'0';
			end if;
			if(S="1111")then--MOV
				ZZ<='0'&R2;
			end if;
		elsif(FBUS='0')then
			ZZ<="0ZZZZZZZZ";
		end if;
		if(zz(7 downto 0)="00000000")then
			Z<='1';
		else
			Z<='0';
		end if;
	end process;
	Q<=ZZ(7 downto 0);
	C<=ZZ(8);
end architecture pten;