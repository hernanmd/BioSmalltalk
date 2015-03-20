accessing
chrAsString
	" Private - Adapt because NCBI store directories as 01,02,...22 "
	
	(#('X' 'x' 'Y' 'y' 'MT' 'mt' 'Un' 'UN' 'un') includes: self chr) 
		ifTrue: [ ^ self chr asString ].
	^ (self chr between: 1 and: 9)
		ifTrue: [ '0' , self chr asString ]
		ifFalse: [ self chr asString ]