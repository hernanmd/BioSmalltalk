running
allTerms

	| bag |
	bag := Terms new.
	[ self atEnd ] whileFalse: [ bag add: self next ].
	^bag