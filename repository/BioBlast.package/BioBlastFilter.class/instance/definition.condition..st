private
definition: aString condition: cmpSymbol
	" Answer a filtered result with the receiver's definition nodes begins with the strings in aStringCollection (ignoring case) "
	
	| collection |
	
	collection := self hits select: [: node | 
			node hitDefinition blastValue asLowercase 
				perform: cmpSymbol 
				with: aString asLowercase ].
	^ self addFilteredResultsFrom: collection