exporting
exportCellAtRow: rIndex atColumn: cIndex
	" Write the receiver's matrix cell content at rIndex and cIndex position "
	
	self outputFileStream 
			nextPutAll: (matrix at: rIndex at: cIndex) asString; 
			tab