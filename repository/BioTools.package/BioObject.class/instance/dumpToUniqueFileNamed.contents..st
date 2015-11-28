convenience-filesystem
dumpToUniqueFileNamed: fileName contents: contentsString
	" Outputs contentsString to a file named fileName "

	self class 
		dumpToFileNamed: self currentSeconds , '_' , fileName
		contents: contentsString