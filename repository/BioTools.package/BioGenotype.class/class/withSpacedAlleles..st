instance creation
withSpacedAlleles: aString
	" Answer a new receiver's instance from aString formatter as two spaced alleles, e.g.: 'A C' or 'C T' "
	
	^ self new
		alleleA: aString first;
		alleleB: aString last;
		yourself
	