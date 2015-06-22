filesystem
outputToFile: fileName
	" Outputs the receiver's contents to a file "

	self 
		dumpToFileNamed: fileName 
		contents: self reader contents