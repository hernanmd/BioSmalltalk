*BioPharo3
removeFileNamed: fileName
	" Remove fileName in the receiver's current folder "
	
	^ (self workingDirectory , self slash , fileName) asFileReference delete.