exporting
exportFirstCellColumnAt: rowIndex
	" Write contents for the first column(s) at rowIndex position "

	| headerPosition |
	headerPosition := self positionCiphers + 2.

	" Header - Fill with empty spaces "	
	( rowIndex < headerPosition and: [ rowIndex < self matrix numberOfRows ] )
		ifTrue: [ self outputFile nextPutAll: ( self generateJoin: String space repeat: 7 ) ].
	
	" Body - Fill with sequences 'names' "
	( rowIndex >= headerPosition and: [ rowIndex <= self matrix numberOfRows ] )
		ifTrue: [
			self outputFile 
				nextPutAll: self rowIdentifier;
				space ].