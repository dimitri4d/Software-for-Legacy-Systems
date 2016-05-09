--
-- Dimitri Frederick
-- Cis3190 A4
-- 
-- ADA
-- itterative russian peasant Multiplication

with Ada.Text_IO; use Ada.Text_IO;
with ada.Integer_Text_IO; use Ada.Integer_Text_IO;
with ada.strings.unbounded; use ada.strings.unbounded;
with ada.strings.unbounded.Text_IO; use ada.strings.unbounded.Text_IO;
with Ada.Long_Long_Integer_Text_IO; use Ada.Long_Long_Integer_Text_IO;



procedure adaiter is 


	-- m is even, double n, halve m, no addition to sum
	-- m is odd, add n addition to sum, double n, halve m,
	function peasantMult(a , b : Long_Long_Integer ) return Long_Long_Integer  is
	m  : Long_Long_Integer := a;
	n : Long_Long_Integer := b;
	p   : Long_Long_Integer:=0;
	
	begin
		while(m >= 1) loop

			if  (((m > 1) and ((m mod 2)=0 ))) then
				n := n * 2;
				m := m / 2;
				end if;
				
			if (((m > 1) and (m mod 2)/= 0 )) then
				p := p + n;
				n := n * 2;
				m := m / 2;
			end if;

			if m = 1 then
				 p := p + n;
				 exit;
			end if;
		end loop;	

		return p;
   end peasantMult;

	a  : Long_Long_Integer ;
	b  : Long_Long_Integer ;
	p  : Long_Long_Integer := 0;

begin
	put("enter first number ");
	get(a);
	put("enter second number ");
	get(b);
	
	p := peasantMult(a,b);
	put(Long_Long_Integer'Image(p));
end adaiter;
