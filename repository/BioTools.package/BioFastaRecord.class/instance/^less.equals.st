comparing
<= aBioFastaRecord
	" Answer whether the receivers's sequence name sorts before aString.
	The collation order is simple ascii (with case differences). "
	
	^ self name <= aBioFastaRecord name