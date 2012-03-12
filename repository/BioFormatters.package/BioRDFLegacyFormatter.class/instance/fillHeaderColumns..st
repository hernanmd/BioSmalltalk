populating
fillHeaderColumns: columns
	" Private - columns is a Collection where differences were found "
	
	columns doWithIndex: [: colIndex : index |
		colIndex numberOfDigits < positionCiphers
			ifTrue: [ 
				| position |
				position := self fillPosition: colIndex for: self positionCiphers.
				self atColumn: index fillWith: position contents ]
			ifFalse: [ 
				self atColumn: index fillWith: colIndex asString ]
		]