library ieee;
use ieee.std_logic_1164.all;

entity zjw_erjiguan is
 port(cin : in std_logic_vector(7 downto 0);
      IFOUT : in std_logic;
      eout : out std_logic_vector(7 downto 0));
end zjw_erjiguan;

architecture peleven of zjw_erjiguan is
begin
process(IFOUT)
begin
if(IFout='1') then
eout<=cin;
else 
eout<="ZZZZZZZZ";
end if;
end process;
end peleven;