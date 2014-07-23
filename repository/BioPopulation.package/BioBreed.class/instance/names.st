accessing
names
	" Answer a <Collection> of receiver's names. If a name is divided by a $- delimiter, then add a copy
	of that name with replacing the minus character with blanks "

	| answer cNames normalizedName |
	
	answer := (cNames := super names)
				detect: [: aName | aName includes: $- ]
				ifNone: [ nil ].
	^ answer
		ifNil: [ cNames ]
		ifNotNil: [ 
			(names includes: ( normalizedName := answer copyReplaceAll: '-' with: ' '))
				ifFalse: [			
					cNames 
						add: normalizedName ;
						yourself ]
				ifTrue: [ cNames ] ]
		