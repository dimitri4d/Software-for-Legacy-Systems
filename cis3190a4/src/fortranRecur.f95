!
! Dimitri Frederick
! Cis3190 A4
! 
! Fortran
! Recursive russian peasant Multiplication


program main
    implicit none
    integer(kind=8) :: m, n,p

    write (*,*) 'enter two numbers'
    read (*,*) m,n
    p=0
    call peasantMult(m,n,p)
    print *, p
   
end program main


recursive subroutine peasantMult(m, n, p)
	integer*8, intent(in) :: m, n
	integer*8, intent(inout) ::  p
	
	if(m ==1 )then
		p = p + n
	else if ((m > 1) .and. (mod(m,2)==0 ))then
		call peasantMult((m/2),(n*2),p)
	else if ((m > 1) .and. (mod(m,2)==1 ))then
		p=p+n
		call peasantMult((m/2),(n*2),p)
	else
		p= 0
	end if
	
	return
end subroutine peasantMult
