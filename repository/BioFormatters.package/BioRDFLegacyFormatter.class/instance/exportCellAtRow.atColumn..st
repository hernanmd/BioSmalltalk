exporting
exportCellAtRow: rIndex atColumn: cIndex

	| contents |
	
	contents := (matrix at: rIndex at: cIndex) ifNil: [ ' ' ].
	self outputFileStream nextPutAll: contents asString.