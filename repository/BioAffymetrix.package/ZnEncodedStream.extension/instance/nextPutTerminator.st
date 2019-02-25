*BioAffymetrix
nextPutTerminator
	" Append a line ending terminator to the receiver "

	self nextPutAll: (String perform: self platformTerminator)