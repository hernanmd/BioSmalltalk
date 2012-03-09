accessing
atCodonTable: anInteger
	" Select and answer a Codon Table by number anInteger "
	
	| cTable |
	
	cTable := self codonTables 
			detect: [: codonTable | codonTable tableId = anInteger ]
			ifNone: [ self signalNotFound: anInteger asString , ' codon table not found' ].
	self currentCodonTable: cTable.
	^ cTable