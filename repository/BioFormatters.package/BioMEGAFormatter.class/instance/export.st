exporting
export
	" Write the contents to receiver's file name "

	self exportHeader.
	self exportStatementTitle.
	self exportStatementDescription.
	self exportStatementFormat.
"	self exportFromAlignment: self samplesCollection."
	self 
		outputToFullFile: self outputFilename
		contents: self stream contents.

