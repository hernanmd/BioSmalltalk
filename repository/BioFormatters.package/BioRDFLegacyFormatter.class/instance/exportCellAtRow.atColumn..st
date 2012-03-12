exporting
exportCellAtRow: rIndex atColumn: cIndex

	| contents |
	
	contents := ( matrix at: rIndex at: cIndex ) ifNil: [ ' ' ].
	self outputFile
		nextPutAll: contents asString.