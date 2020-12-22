library ieee;
use ieee.std_logic_1164.all;
entity zjw_kongzhiqi is
 port(mova,movb,movc,add,sub,or1,not1,rsr,rsl,jmp,jz,jc,in1,out1,nop,halt,c,z,sm : in std_logic;
      LDIR,DL,CS,XL,LDPC,INPC,FBUS,FLBUS,FRBUS,M,WE,IFIN,IFOUT:out std_logic;
      MADD : out std_logic_vector(1 downto 0)
       );
end zjw_kongzhiqi;

architecture p of zjw_kongzhiqi is
begin
LDIR <= '1' when (sm='0') else '0';
DL <= '1' when (sm='0' or movc='1' or jmp='1' or (jz='1' and z='1') or (jc='1' and c='1')) else '0';
XL <= '1' when (movb='1') else '0';
cs <= '0' when (sm='0' or movb='1' or movc='1' or jmp='1' or (jz='1' and z='1') or (jc='1' and c='1')) else '1';
LDPC <= '1' when (jmp='1' or (jz='1' and z='1') or (jc='1' and c='1')) else '0';
INPC <= '1' when (sm='0' or (jc='1' and c='0') or (jz='1' and z='0')) else '0';
FBUS <= '1' when (mova='1' or movb='1' or add='1' or sub='1' or or1='1' or not1='1' or rsr='1' or rsl='1') else '0' ;
FLBUS<='1' when (rsl='1') else '0';
FRBUS<='1' when (rsr='1') else '0';
M<='1' when (or1='1' or not1='1' or add='1' or sub='1') else '0';
WE<='1' when (sm='0' or movb='1' or out1='1' or nop='1' or halt='1' or jmp='1' or jz='1' or jc='1') else '0';
MADD<="00" when (sm='0' or jmp='1' or jz='1' or jc='1') else
		"01" when (movc='1') else
		"10" when (movb='1');
IFIN <= '1' when (in1='1') else '0';
IFOUT <= '1' when (out1='1') else '0'; 
end p;