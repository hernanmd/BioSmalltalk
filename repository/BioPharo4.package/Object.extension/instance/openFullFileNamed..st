*BioPharo4
openFullFileNamed: fileName
	" Answer a FileStream for fileName in the image directory. Assume the file exists "
	
	^ BioObject openFullFileNamed: fileName