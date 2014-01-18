accessing
downloadChr: chrNum
	" Download the chromosome number chrNumber in the current directory "

	self chrNumber: chrNum.
	self connectionSettings serverDirectory: self defaultDirectory.
	self download
