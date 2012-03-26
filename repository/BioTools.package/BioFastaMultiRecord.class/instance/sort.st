converting
sort
	" Sort records by sequence name. Answer a new instance of the receiver "
	
	| newFastaCollection |
	
	newFastaCollection := self class basicNew.
	newFastaCollection sequences: ( self sequences asSortedCollection: [: a : b | a name < b name ] ).
	^ newFastaCollection