library ieee;
use ieee.std_logic_1164.all;

entity zjw_kaiguan is
 port(buscin,ocin : in std_logic_vector(7 downto 0);
      IFIN : in std_logic;
      BUSOUT : out std_logic_vector(7 downto 0)
       );
end zjw_kaiguan;
architecture ppp of zjw_kaiguan is
begin
     process(IFIN)
     begin
     if(IFIN = '1') then
     BUSOUT<=ocin;
     else 
     BUSOUT<=buscin;
     end if;
     end process;
end ppp;