accessing
atCodonTable: anInteger
	" Select and answer a Codon Table by number anInteger "
	
	| cTable |
	
	cTable := self codonTables 
			detect: [: codonTable | codonTable tableId = anInteger ]
			ifNone: [ 
				self missingCodonTable: anInteger.
				self error. ].
	self currentCodonTable: cTable.
	^ cTable