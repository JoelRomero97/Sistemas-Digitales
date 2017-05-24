library ieee;
use ieee.std_logic_unsigned.all;
use ieee.std_logic_arith.all;
use ieee.std_logic_1164.all;

entity GAL2 is port (

	selector: out std_logic_vector ( 2 downto 0 );--anillo
	display : out std_logic_vector ( 6 downto 0 );--display
	E0 : in std_logic_vector ( 3 downto 0 );--mux
	E1 : in std_logic_vector ( 2 downto 0 );--mux
	clk, clr : in std_logic--anillo
);

attribute PIN_NUMBERS of GAL2 : entity is (
"clk:1 clr:13 E0(3):2 E0(2):3 E0(1):4 E0(0):5 E1(2):6 E1(1):7 E1(0):8 "& 
"display(6):21 display(5):20 display(4):19 display(3):18 display(2):17 display(1):16 display(0):15" );

end entity;

architecture AGAL2 of GAL2 is

constant Q0 : std_logic_vector ( 2 downto 0 ) := "011";
constant Q1 : std_logic_vector ( 2 downto 0 ) := "101";
constant Q2 : std_logic_vector ( 2 downto 0 ) := "110";
constant E2 : std_logic_vector ( 3 downto 0 ) := "0000";--ANILLO
signal Ring : std_logic_vector ( 2 downto 0 );--ANILLO
signal BCD : std_logic_vector ( 3 downto 0 );--ANILLO SALIDA

begin

	ContadorAnillo : process ( clr, clk ) 
	begin
		if ( clr = '1' ) then
			Ring <= Q0;
		elsif ( clk'event and clk = '1' ) then
			case Ring is
				when Q0 => Ring <= Q1;
				when Q1 => Ring <= Q2;
				when Q2 => Ring <= Q0;
				when others => Ring <= ( others => '-' );
			end case;
		end if;
	end process;

	Multiplexor : process ( BCD, E0, E1, E2, Ring )
	begin
		if ( Ring = "011" ) then
			BCD <= E2;
		elsif ( Ring = "101" ) then
			BCD <= '0'&E1;
		elsif ( Ring = "110" ) then
			BCD <= E0;
		else 
			BCD <= ( others => '-' );
		end if;
	end process;

	Convertidor : process ( BCD )
	begin
		case BCD is
			when "0000" => display <= "0000001";
			when "0001" => display <= "1001111";
			when "0010" => display <= "0010010";
			when "0011" => display <= "0000110";
			when "0100" => display <= "1001100";
			when "0101" => display <= "0100100";
			when "0110" => display <= "0100000";
			when "0111" => display <= "0001111";
			when "1000" => display <= "0000000";
			when "1001" => display <= "0000100";
			when others => display <= ( others => '-' );
		end case;
	end process;

	selector <= Ring;

end architecture;
