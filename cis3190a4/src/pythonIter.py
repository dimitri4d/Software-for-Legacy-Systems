#
# Dimitri Frederick
# Cis3190 A4
#
# python
# itterative russian peasant Multiplication
#
#

def peasantMult(m,n):
	p = 0
	while(m >= 1):
		# m is even, double n, halve m, no addition to sum
		if ((m > 1) and ((m % 2)==0 )):
			n *= 2
			m //= 2

		# m is odd, add n addition to sum, double n, halve m,
		if ((m > 1) and (m % 2)==1 ):
			p += n
			n *= 2
			m //= 2

		if (m == 1):
			p += n
			break
	return p

def main():
	print("enter 2 numbers to multiply")
	m =input() 
	n =input()
	p=peasantMult(m,n)
	print(p)
	return 0

if __name__ == '__main__':
	main()
