convenience-filesystem
dumpToUniqueFileNamed: fileName
	" Outputs the receiver's contents to a file named fileName "

	self 
		dumpToFileNamed: self currentSeconds , '_' , fileName 
		contents: self contents