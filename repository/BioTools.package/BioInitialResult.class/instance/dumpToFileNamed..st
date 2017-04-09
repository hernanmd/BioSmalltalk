convenience-filesystem
dumpToFileNamed: fileName
	" Outputs the receiver's contents to a file named fileName "

	self 
		dumpToFileNamed: fileName 
		contents: self reader contents