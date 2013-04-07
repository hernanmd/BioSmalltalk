*biopharo14
openFullFileNamed: fileName
	" Answer a FileStream for fileName in the image directory. Assume the file exists "
	
	^ fileName 
		ifNotNil: [ self fileStreamClass readOnlyFileNamed: fileName ]
		ifNil: [ self signalInvalidObject: 'Please specify a file' translated ]