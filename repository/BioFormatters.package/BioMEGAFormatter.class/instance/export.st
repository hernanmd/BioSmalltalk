exporting
export
	" Write the contents to receiver's file name "

	self exportHeader.
	self exportStatementTitle.
	self exportStatementDescription.
	self exportStatementFormat.
	self stream cr.
	self exportFromAlignment: self alignments.
	self 
		dumpToFileNamedFullPath: self outputFilename
		contents: self stream contents.

