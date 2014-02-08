accessing
downloadChr: chrString
	" Download the chromosome number chrNumber in the current directory "

	self chr: chrString.
	self connectionSettings serverDirectory: self defaultDirectory.
	self download
