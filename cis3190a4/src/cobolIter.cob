*>
*> Dimitri Frederick
*> Cis3190 A4
*>
*> COBOL
*> itterative russian peasant Multiplication
*>

identification division.
program-id. multiplication.
data division.
working-storage section.
01 m picture 9(36).
01 n picture 9(36).
01 p picture 9(36).
procedure division.

begin.
	display 'enter first number?'.
	accept m.
	display 'enter second number?'.
	accept n.
	perform peasantMult
		with test after
		until m <= 0.
	display p.
	
peasantMult.
	if ((function mod(m, 2)) = 1) then
		add n to p
	end-if.
	divide 2 into m.
	multiply 2 by n.
