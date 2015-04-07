filesystem
outputToFile: fileName
	" Outputs the receiver's contents to a file "

	self 
		outputToFile: fileName 
		contents: self reader contents