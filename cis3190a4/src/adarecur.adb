--
-- Dimitri Frederick
-- Cis3190 A4
-- 
-- ADA
-- Recursive russian peasant Multiplication

with Ada.Text_IO; use Ada.Text_IO;
with ada.Integer_Text_IO; use Ada.Integer_Text_IO;
with ada.strings.unbounded; use ada.strings.unbounded;
with ada.strings.unbounded.Text_IO; use ada.strings.unbounded.Text_IO;
with Ada.Long_Long_Integer_Text_IO; use Ada.Long_Long_Integer_Text_IO;



procedure adarecur is 
	m  : Long_Long_Integer ;
	n  : Long_Long_Integer ;
	p  : Long_Long_Integer ;


	-- m is even, double n, halve m, no addition to sum
	-- m is odd, add n addition to sum, double n, halve m,
	function peasantMult(m , n : Long_Long_Integer ) return Long_Long_Integer  is
	p   : Long_Long_Integer := 0;
	
	begin
		if m = 1 then
			return  n;
		elsif  (((m > 1) and ((m rem 2)=0 ))) then
			return peasantMult((m/2),(n*2));
		elsif (((m > 1) and (m rem 2) /= 0 )) then
			return (peasantMult((m/2),(n*2)) + n);
		else
			return 0;
		end if;
   end peasantMult;

begin
	put("enter first number ");
	get(m);
	put("enter second number ");
	get(n);
	
	p := peasantMult(m,n);
	put(Long_Long_Integer'Image(p));	
end adarecur;
