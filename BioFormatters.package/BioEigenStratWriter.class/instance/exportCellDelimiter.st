exporting
exportCellDelimiter
	" Private - See superimplementor's comment "
	
	self delimiter isNil 
		ifFalse: [ self outputFile nextPut: Character tab ].