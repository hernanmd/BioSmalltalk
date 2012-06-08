private
definitions: aStringCollection condition: cmpSymbol
	" Answer a filtered result with the receiver's definition nodes begins with the strings in aStringCollection (ignoring case) "
	
	| collection |
	collection := 
		aStringCollection collect: [ : srchStr |
			self hits select: [: node | node hitDefinition blastValue perform: cmpSymbol with: srchStr ] ].
	^ self addFilteredResultsFrom: collection