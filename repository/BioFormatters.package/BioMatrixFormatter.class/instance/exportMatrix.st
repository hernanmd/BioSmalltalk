exporting
exportMatrix
	" Write the receiver's matrix to a file "
	
	self bioLog: 'Started writing matrix to file...'.
	self export: self matrix.
	self bioLog: 'Finished writing matrix to file'.