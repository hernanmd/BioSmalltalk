instance creation
withSpacedAlleles: aString
	" Answer a new receiver's instance from aString interpreted as two unspaced alleles, e.g.: 'AC' or 'CT' "

	| fmt |	
	fmt := aString = '---' ifTrue: [ '00' ] ifFalse: [ aString ].
	^ self new
		alleleA: fmt first;
		alleleB: fmt last;
		yourself
	