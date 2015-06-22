*BioPharo4
fileExists: fileName
	" Answer <true> if fileName exists in receiver's workingDirectory "
	
	^ fileName asFileReference exists