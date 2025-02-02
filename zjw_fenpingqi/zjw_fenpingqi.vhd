library ieee;
use ieee.std_logic_1164.all;
use ieee.std_logic_arith.all;
use ieee.std_logic_unsigned.all;
entity zjw_fenpingqi is
port(cp_32m,res: in std_logic;
sec: out std_logic);
end zjw_fenpingqi;
architecture ART of zjw_fenpingqi is
begin
process(cp_32m,res) ---1 Hz��Ƶ
variable cnt:integer range 0 to 13000000;
begin
if res='0' then
cnt:=0;
elsif cp_32m'event and cp_32m='1' then
if cnt=12000000 then
cnt:=0;
sec<='1';
else cnt:=cnt+1;
sec<='0';
end if;
end if;
end process;
end ART;