exporting
exportCellDelimiter
	" Private - See superimplementor's comment "
	
	self delimiter isNil 
		ifFalse: [ self outputFileStream nextPut: Character tab ].