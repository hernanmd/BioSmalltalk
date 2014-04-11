*BioPharo3
newFullFileNamed: fileName
	" Answer a FileStream for a new fileName in the receiver's configured folder "
	
	^ fileName asFileReference writeStream