exporting
exportFirstCellColumnAt: rowIndex
	" Write contents for the first column(s) at rowIndex position "

	| headerPosition |
	headerPosition := self positionCiphers + 2.

	" Header - Fill with empty spaces "	
	( rowIndex < headerPosition and: [ rowIndex < self matrix numberOfRows ] )
		ifTrue: [ self outputFileStream nextPutAll: ( BioObject generateJoin: String space repeat: 7 ) ].
	
	" Body - Fill with sequences 'names' "
	( rowIndex >= headerPosition and: [ rowIndex <= self matrix numberOfRows ] )
		ifTrue: [
			self outputFileStream 
				nextPutAll: self rowIdentifier;
				space ].