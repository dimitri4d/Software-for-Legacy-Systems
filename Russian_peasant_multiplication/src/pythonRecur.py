#
# Dimitri Frederick
# Cis3190 A4
#
# python
# Recursive russian peasant Multiplication
#
#

def peasantMult(m,n):
	if(m ==1 ):
		return n
	elif ((m > 1) and ((m % 2)==0 )):
		return peasantMult((m/2),(n*2))
	elif ((m > 1) and (m % 2)==1 ):
		return (peasantMult((m/2),(n*2)) + n)
	else:
		return 0

def main():
	print("enter 2 numbers to multiply")
	m =input() 
	n =input()
	p=peasantMult(m,n)
	print(p)
	return 0

if __name__ == '__main__':
	main()
